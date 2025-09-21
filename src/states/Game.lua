fancyTypes = {}
require "src.components.Actor"
require "src.components.Anim"
require "src.components.Bubble"
require "src.components.Event"
require "src.components.Physics"
require "src.components.Larp"

require "src.Map"

local PhysicsRenderer = require "src.PhysicsRenderer"

-- Overlap iterator state (iiish it's all global and sad)
local overlappingCheckEntity = nil
local overlappingCheckBody = nil
local overlappingCheckSensor = nil
local overlappingCheckType = nil
local overlappingCheckStartZ = nil
local overlappingCheckEndZ = nil
local overlappingCheckSlop = nil
local overlappingCheckStopOnFirst = false
local overlappingCheckResult = {}

Game = {}

function Game:refresh(force)
    local path = "maps/" .. self.map.name .. ".lua"
    local info = love.filesystem.getInfo(path, "file")
    if force or (timestamps[path] and timestamps[path].modtime < info.modtime) then
        timestamps[path] = info
        StateMachine:change(Game, { map = self.map.name })
    end
end

function Game.entityIterator(entities, i)
    for j = i, #entities do
        local entity = entities[j]
        if not entity.disabled then
            return j + 1, entity
        end
    end
end

function Game:iterEntities()
    return Game.entityIterator, self.entities, 1
end

function Game:enter(args)
    self.physics = love.physics.newWorld(0, 0, true)
    self.physics:setContactFilter(
        function(fix1, fix2)
            if fix1:isSensor() or fix2:isSensor() then
                return true
            end
            local e1 = fix1:getBody():getUserData()
            local e2 = fix2:getBody():getUserData()
            return self:shouldEntitiesContact(e1, e2)
        end)
    self.camera = {
        x = 0,
        y = 0,
        z = 0,
        panFrames = 0,
        target = nil,
        shakeFrames = 0,
        shakeAmplitude = 0,
        offsetX = 0,
        offsetY = 0
    }
    self.input = {
        target = nil
    }
    self.time = 0
    self.endTriggered = false
    self.map = Map.load(args.map)
    self.tilesBatch = love.graphics.newSpriteBatch(textures.tileset)
    self.entities = {}
    self.entitiesByName = {}
    self.event = Event.new()
    self.anim = Anim.new()
    self.vars = { eaten = 0 }

    self.map:getTilesGogogadget(self.physics, self.entities)
    self.map:getEntities(self.entities)
    self:handleCreation()
    for _, entity in self:iterEntities() do
        -- Auto-attaching the input
        if entity.input and not self.input.target then
            self.input.target = entity
        end

        -- Auto-attaching the camera
        if entity.camera and not self.camera.target then
            self.camera.target = entity
        end
    end
end

function Game:exit()
    self.physics:destroy()
    self.physics = nil
end

function Game:handleCreation()
    for _, entity in ipairs(self.entities) do
        -- Create physics
        if not entity.disabled and entity.body and not entity.physics then
            entity.physics = Physics.new(self.physics, entity)

            -- Tiles sorta fucked for floor and ceiling purposes
            if not entity.tileSprites and not entity.velocity then
                self:findFloorAndCeiling(entity)
            end
        end

        if entity.physics and entity.disabled then
            entity.physics:destroy()
            entity.physics = nil

            if entity.water then
                entity.water.sampleSensors = nil
            end
            if entity.fruitStack then
                entity.fruitStack.sensor = nil
            end
            if entity.picnic then
                entity.picnic.sensor = nil
            end
        end

        if entity.physics then
            if entity.water and not entity.water.sampleSensors then
                entity.water.sampleSensors = {}
                for i, sample in ipairs(entity.water.samples) do
                    local shape = love.physics.newCircleShape(unpack(sample))
                    local fixture = entity.physics:newSensor(shape, WATER_SENSOR)
                    entity.water.sampleSensors[i] = fixture
                end
            end

            -- Fruit stack haver
            if entity.fruitStack and not entity.fruitStack.sensor then
                local shape = love.physics.newCircleShape(entity.fruitStack.pickupRange / 2)
                local sensor = entity.physics:newSensor(shape, 0) -- TODO ISH
                sensor:setCategory(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
                entity.fruitStack.sensor = sensor
            end


            if entity.picnic and not entity.picnic.sensor then
                local shape = love.physics.newCircleShape(entity.picnic.dropRange / 2)
                local sensor = entity.physics:newSensor(shape, 0)
                sensor:setCategory(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
                entity.picnic.sensor = sensor
            end
        end

        if entity.name then
            self.entitiesByName[entity.name] = entity
        end
    end
end

function Game:update(dt)
    self.physics:update(dt)
    self:handleCreation()

    self.time = self.time + dt
    local airFrictionForFrame = Game.constants.airFriction ^ dt
    local framePart = dt / (1 / 60)
    self.vars.remainingFruits = 0

    for _, entity in self:iterEntities() do
        if entity.water then
            if entity.water.remainingDrownFrames then
                entity.water.remainingDrownFrames = entity.water.remainingDrownFrames - framePart
                if entity.water.remainingDrownFrames < DELTA then
                    entity.water.remainingDrownFrames = nil
                    entity.anim:release("drown")
                    entity.pos.x = entity.pos.lastGoodX
                    entity.pos.y = entity.pos.lastGoodY
                    entity.pos.z = entity.pos.lastGoodZ
                    entity.physics.body:setPosition(entity.pos.x, entity.pos.y)
                    entity.physics.body:setLinearVelocity(0, 0)
                    entity.velocity.z = entity.water.respawnJumpSpeed
                end
            else
                entity.water.sensorsInWater = 0
                for _, sensor in pairs(entity.water.sampleSensors) do
                    if self:getFirstOverlappingOfType(sensor, WATER_SENSOR, entity.pos) then
                        entity.water.sensorsInWater = entity.water.sensorsInWater + 1
                    end
                end
                if entity.water.sensorsInWater == #entity.water.sampleSensors then
                    entity.water.remainingDrownFrames = entity.water.drownFrames
                    entity.anim:request("drown")
                    entity.physics.body:setLinearVelocity(0, 0)
                end
                if entity.pos.onGround and entity.water.sensorsInWater == 0 then
                    entity.pos.lastGoodX = entity.pos.x
                    entity.pos.lastGoodY = entity.pos.y
                    entity.pos.lastGoodZ = entity.pos.z
                end
            end
        end

        -- Fruit stack haver
        if entity.fruitStack then
            if #entity.fruitStack.fruits > 0 then
                if not entity.fruitStack.cooldown then
                    entity.fruitStack.cooldown = entity.fruitStack.eatCooldown
                elseif entity.fruitStack.cooldown > 0 then
                    entity.fruitStack.cooldown = entity.fruitStack.cooldown - framePart
                end
            end

            if entity.fruitStack.cooldown and
                entity.fruitStack.cooldown <= 0 and
                entity.anim:highestPriority() < Anim.priorities.jump
            then
                entity.anim:request("eat")
                entity.fruitStack.cooldown = BIG_NUMBER
            end

            if entity.anim:isTriggered("throwFruit") then
                for _, fruitEntity in ipairs(entity.fruitStack.fruits) do
                    fruitEntity.velocity.z =
                        entity.fruitStack.pickupJumpSpeed *
                        Game.constants.jumpMultiplier
                end
            end

            if entity.anim:isTriggered("eatFruit") then
                local eaten = entity.fruitStack.fruits[1]
                self.vars.eaten = self.vars.eaten + 1
                entity.anim.baseWiggle.x = entity.anim.baseWiggle.x + entity.fruitStack.sizePerFruit
                entity.anim.baseWiggle.y = entity.anim.baseWiggle.y + entity.fruitStack.sizePerFruit
                entity.actor.mass = entity.actor.mass + (eaten.fruit.mass or 0)
                entity.anim:startWiggle(entity.fruitStack.eatWiggleAmplitude, entity.fruitStack.eatWiggleFrames)
                if eaten then
                    eaten.disabled = true
                    table.remove(entity.fruitStack.fruits, 1)
                    table.insert(entity.fruitStack.eaten, eaten.fruit.type)
                    local nextFruitEntity = entity.fruitStack.fruits[1]
                    if nextFruitEntity then
                        nextFruitEntity.fruit.stackEntity = entity
                        nextFruitEntity.fruit.offset = entity.fruitStack.firstOffset
                    end
                end
            end

            if #entity.fruitStack.fruits == 0 or entity.anim:isTriggered("eat:finished") then
                entity.fruitStack.cooldown = nil
            end

            for _, other in ipairs(self:getAllOverlappingOfType(entity.fruitStack.sensor)) do
                if other.fruit then
                    self:checkFruitPickup(entity, other)
                end
            end

            self.vars.remainingFruits = self.vars.remainingFruits + #entity.fruitStack.fruits
        end

        -- Actor! Shit this is sketch.
        if entity.actor then
            entity.actor:update(framePart, self,
                entity,
                self.input.target == entity and actions or nil)
        end

        -- Picnic at the disco
        if entity.picnic then
            for _, otherEntity in ipairs(self:getAllOverlappingOfType(entity.picnic.sensor)) do
                if otherEntity.fruitStack then
                    if #otherEntity.fruitStack.fruits > 0 then
                        otherEntity.velocity.z = entity.picnic.stackDropJumpSpeed * Game.constants.jumpMultiplier
                        otherEntity.physics.body:setLinearVelocity(0, 0)
                    end
                    local dropPoints = love.physics.sampleShape(
                        entity.physics.shape,
                        #otherEntity.fruitStack.fruits)
                    for i = #otherEntity.fruitStack.fruits, 1, -1 do
                        local fruitEntity = otherEntity.fruitStack.fruits[i]
                        otherEntity.fruitStack.fruits[i] = nil
                        otherEntity.fruitStack.cooldown = nil
                        otherEntity.anim:release("eat")

                        fruitEntity.fruit.stackEntity = entity
                        fruitEntity.fruit.animFrames = entity.picnic.pickupAnimFrames
                        fruitEntity.fruit.offset = {
                            x = dropPoints[(i - 1) * 2 + 1],
                            y = dropPoints[(i - 1) * 2 + 2],
                            z = 0
                        }
                        fruitEntity.fruit.reachedStack = false
                        fruitEntity.fruit.cooldown = nil
                        fruitEntity.velocity.z = entity.picnic.pickupJumpSpeed * Game.constants.jumpMultiplier
                        table.insert(entity.picnic.fruits, fruitEntity)
                    end
                end
            end
        end

        -- Handling physics and the dreaded Z axis
        if entity.physics then
            entity.pos.x, entity.pos.y = entity.physics.body:getPosition()
            if entity.velocity then
                self:findFloorAndCeiling(entity)
                -- Speed! Movement! Wee!
                entity.velocity.z = entity.velocity.z * airFrictionForFrame - Game.constants.g * dt
                entity.pos.z = entity.pos.z + entity.velocity.z * dt

                -- Check ground (squish!)
                local wasOnGround = entity.pos.onGround
                entity.pos.onGround = entity.pos.z < entity.pos.floorZ + DELTA
                if entity.pos.onGround then
                    if not wasOnGround and entity.anim then
                        entity.anim:trigger("land", entity.velocity.z)
                    end
                    entity.pos.z = entity.pos.floorZ
                    entity.velocity.z = 0
                end

                -- Check head (ouch!)
                if entity.pos.z + entity.pos.height > entity.pos.ceilingZ then
                    entity.pos.z = entity.pos.ceilingZ - entity.pos.height - DELTA
                    entity.velocity.z = 0
                end

                entity.physics:updateHeightSlices(entity.pos)
                entity.physics.body:setLinearDamping(
                    entity.pos.onGround and
                        (entity.pos.sliding and Game.constants.slidingDamping or
                        Game.constants.groundDamping) or
                    Game.constants.airDamping)
            end
        end

        -- Fruit being
        if entity.fruit then
            if entity.fruit.animFrames then
                local prevX = entity.pos.x
                local prevY = entity.pos.y
                local prevZ = entity.pos.z

                local parentEntity = entity.fruit.stackEntity
                local stackRootEntity = parentEntity
                while stackRootEntity.fruit and stackRootEntity.fruit.stackEntity do
                    stackRootEntity = stackRootEntity.fruit.stackEntity
                end
                local targetX = parentEntity.pos.x + entity.fruit.offset.x
                local targetY = parentEntity.pos.y + entity.fruit.offset.y
                local offsetZ = entity.fruit.offset.z * (parentEntity.anim and parentEntity.anim.baseWiggle.y or 1)
                local targetZ = parentEntity.pos.z + offsetZ

                if entity.fruit.animFrames > 0 then
                    entity.physics.body:setPosition(
                        math.interp(entity.fruit.animFrames, entity.pos.x, targetX),
                        math.interp(entity.fruit.animFrames, entity.pos.y, targetY))
                    entity.fruit.animFrames = entity.fruit.animFrames - framePart
                    if entity.pos.z > targetZ then
                        entity.fruit.reachedStack = true
                    end
                else
                    local pickupForce = stackRootEntity.fruitStack and stackRootEntity.fruitStack.pickupForce or 1
                    pickupForce = pickupForce ^ dt
                    entity.physics.body:setPosition(
                        entity.pos.x * (1 - pickupForce) + targetX * pickupForce,
                        entity.pos.y * (1 - pickupForce) + targetY * pickupForce)
                end
                if (entity.fruit.animFrames <= 0 or entity.fruit.reachedStack) and entity.pos.z <= targetZ then
                    entity.pos.z = targetZ
                    entity.velocity.z = 0
                    entity.pos.floorZ = targetZ
                    entity.pos.floorEntity = parentEntity
                end

                if stackRootEntity.fruitStack then
                    self:checkFruitDrop(entity, stackRootEntity, parentEntity, prevX, prevY, prevZ)
                end
            else
                self.vars.remainingFruits = self.vars.remainingFruits + 1
            end
            if entity.fruit.cooldown then
                entity.fruit.cooldown = entity.fruit.cooldown - framePart
                if entity.fruit.cooldown < 0 then
                    entity.fruit.cooldown = nil
                end
            end
        end

        -- SOUND!
        if entity.soundEmitter then
            for name, sound in pairs(entity.soundEmitter.playing) do
                local source = sounds[sound.name]
                if source:isPlaying() then
                    if sound.stopOn and entity.anim:isTriggered(sound.stopOn) then
                        source:stop()
                    end
                else
                    entity.soundEmitter.playing[name] = nil
                end
            end
            for trigger, sound in pairs(entity.soundEmitter.triggers) do
                if entity.anim:isTriggered(trigger) then
                    local source = sounds[sound.name]
                    source:setVolume(sound.volumeRange and math.randomRange(sound.volumeRange) or sound.volume or 1)
                    source:setPitch(sound.pitchRange and math.randomRange(sound.pitchRange) or sound.pitch or 1)
                    source:setLooping(sound.loop or false)

                    entity.soundEmitter.playing[sound.name] = sound
                    source:stop()
                    love.audio.play(source)
                end
            end
        end

        if entity.shakeEmitter then
            for trigger, shake in pairs(entity.shakeEmitter.triggers) do
                if (not shake.minimumMass or entity.actor.mass >= shake.minimumMass) and
                    entity.anim:isTriggered(trigger) then
                    self.camera.shakeAmplitude = shake.amplitude
                    self.camera.shakeFrames = shake.frames
                end
            end
        end

        if entity.anim then
            entity.anim:update(dt, entity.sprites)
        end

        if entity.bubble then
            entity.bubble:update(framePart, entity.anim)
        end

        if entity.larp then
            entity.larp:update(framePart, entity)
        end
    end

    -- Sorting! Fun times!
    table.sort(self.entities,
        function (a, b)
            local floorA, ay = self:findFloorY(a)
            local floorB, by = self:findFloorY(b)

            if math.abs(ay - by) < DELTA then
                if math.abs(a.pos.y - b.pos.y) < DELTA then
                    if math.abs(a.pos.z - b.pos.z) < DELTA then
                        return a.id < b.id
                    end
                    return a.pos.z < b.pos.z
                end
                return a.pos.y < b.pos.y
            end

            return ay < by
        end)

    -- Camera
    if self.camera.target then
        if self.camera.panFrames > 0 then
            self.camera.x = math.interp(self.camera.panFrames, self.camera.x, self.camera.target.pos.x)
            self.camera.y = math.interp(self.camera.panFrames, self.camera.y, self.camera.target.pos.y)
            self.camera.z = math.interp(60, self.camera.z, self.camera.target.pos.floorZ or 0)
            self.camera.panFrames = math.max(self.camera.panFrames - framePart, 0)
            if self.camera.panFrames == 0 then
                self.anim:trigger("camera:finished")
            end
        else
            self.camera.x = self.camera.target.pos.x
            self.camera.y = self.camera.target.pos.y
            self.camera.z = math.interp(60, self.camera.z, self.camera.target.pos.floorZ or 0)
        end
        if self.camera.shakeFrames > 0 then
            self.camera.offsetX = (math.random() - 0.5) * self.camera.shakeAmplitude
            self.camera.offsetY = (math.random() - 0.5) * self.camera.shakeAmplitude
            self.camera.shakeFrames = math.max(self.camera.shakeFrames - framePart, 0)
        else
            self.camera.offsetX = 0
            self.camera.offsetY = 0
        end
    end

    -- Event
    self.event:update(framePart, self)
    self.anim:clearTriggers()

    if (self.vars.remainingFruits == 0 or actions.gogogadget) and not self.endTriggered then
        self.endTriggered = true
        self.event:execute(Game.constants.endLevelCutscene)
    end
end

function Game:render(dt)
    -- Camera
    local w, h = love.graphics.getDimensions()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(0.5)
    love.graphics.translate(
        -self.camera.x + self.camera.offsetX,
        -self.camera.y + self.camera.offsetY + self.camera.z)
    love.graphics.clear(0.2, 0.5, 0.4)

    -- Tiles
    love.graphics.setBlendMode("alpha", "premultiplied")
    self.tilesBatch:clear()
    self.map:drawTiles(self.tilesBatch, self.time)
    love.graphics.draw(self.tilesBatch, 0, 0)
    love.graphics.setBlendMode("alpha")

    -- Shadows
    love.graphics.setBlendMode("multiply", "premultiplied")
    for _, entity in self:iterEntities() do
        if entity.shadow then
            if entity.color then
                love.graphics.setColor(unpack(entity.color))
            end
            self:drawEntityShadow(entity)
            love.graphics.setColor(1, 1, 1, 1)
        end
    end
    love.graphics.setBlendMode("alpha")

    -- Entities
    for _, entity in self:iterEntities() do
        if entity.color then
            love.graphics.setColor(unpack(entity.color))
        end
        -- Stacked entities shadows
        if entity.shadow and (entity.pos.floorZ or 0) > 0 then
            love.graphics.stencil(
                function()
                    love.graphics.setShader(MASK_SHADER)
                    overlappingCheckSlop = SHADOW_OVERLAP_SLOP
                    for _, other in ipairs(self:getAllOverlappingOfType(entity.physics.heightSensor)) do
                        if entity.pos.z + DELTA > other.pos.z then
                            self:drawEntity(other)
                        end
                    end
                    love.graphics.setShader()
                end,
                "replace",
                1)
            love.graphics.setStencilTest("greater", 0)
            love.graphics.setBlendMode("multiply", "premultiplied")
            self:drawEntityShadow(entity, entity.pos.floorZ)
            love.graphics.setBlendMode("alpha")
            love.graphics.setStencilTest()
        end
        -- Sprites
        self:drawEntity(entity)
        love.graphics.setColor(1, 1, 1, 1)

        if entity.light then
            local radiusw = entity.light.radiusw or Game.constants.defaultLight.radiusw
            local radiush = entity.light.radiush or Game.constants.defaultLight.radiush
            local alpha = entity.light.alpha or Game.constants.defaultLight.alpha
            local angle = entity.light.angle or Game.constants.defaultLight.angle
            local _, topy = love.graphics.inverseTransformPoint(0, 0)
            local rayHeight = entity.pos.y - topy
            local rayOffset = rayHeight * math.tan(math.pi / 2 - angle)
            local startx, starty = entity.pos.x + rayOffset + radiusw, entity.pos.y - rayHeight
            local endx, endy = entity.pos.x + rayOffset - radiusw, entity.pos.y - rayHeight
            LIGHT_POINTS[1] = startx
            LIGHT_POINTS[2] = starty
            local n = 8
            for i = 1, n do
                local x, y =  math.getEllipsePoint(
                    entity.pos.x, entity.pos.y,
                    radiusw, radiush,
                    ((i - 1) / (n - 1)) * math.pi)
                LIGHT_POINTS[i * 2 + 1] = x
                LIGHT_POINTS[i * 2 + 2] = y
            end
            LIGHT_POINTS[#LIGHT_POINTS - 1] = endx
            LIGHT_POINTS[#LIGHT_POINTS] = endy
            love.graphics.setBlendMode("add")
            love.graphics.setColor(
                Game.constants.lightColor[1],
                Game.constants.lightColor[2],
                Game.constants.lightColor[3],
                alpha)
            love.graphics.polygon("fill", unpack(LIGHT_POINTS))
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.setBlendMode("alpha")
        end
    end

    -- Bubbles
    for _, entity in self:iterEntities() do
        if entity.bubble then
            love.graphics.push()
            love.graphics.translate(entity.pos.x, entity.pos.y - entity.pos.z)
            entity.bubble:draw()
            love.graphics.pop()
        end
    end

    -- Debug
    if debug.physics then
        PhysicsRenderer.draw_camera(self.physics, 0, 0, w, h)
    end

    love.graphics:reset()
end

function Game:checkFruitPickup(fruitStackEntity, fruitEntity)
    if fruitEntity.fruit.stackEntity or fruitEntity.fruit.cooldown then
        return
    end

    local dx = fruitStackEntity.pos.x - fruitEntity.pos.x
    local dy = fruitStackEntity.pos.y - fruitEntity.pos.y
    local dz = fruitStackEntity.pos.z - fruitEntity.pos.z
    local d = math.sqrt(math.pow(dx, 2) + math.pow(dy, 2) + math.pow(dz, 2))
    if d > fruitStackEntity.fruitStack.pickupRange then
        return
    end

    table.insert(fruitStackEntity.fruitStack.fruits, fruitEntity)
    fruitEntity.fruit.stackEntity = #fruitStackEntity.fruitStack.fruits > 1 and
        fruitStackEntity.fruitStack.fruits[#fruitStackEntity.fruitStack.fruits - 1] or
        fruitStackEntity
    fruitEntity.fruit.animFrames = fruitStackEntity.fruitStack.pickupAnimFrames
    fruitEntity.fruit.offset = fruitEntity.fruit.stackEntity == fruitStackEntity and
        fruitStackEntity.fruitStack.firstOffset or
        fruitStackEntity.fruitStack.otherOffset
    fruitEntity.fruit.reachedStack = false
    fruitEntity.physics.body:setType("static")
    fruitEntity.velocity.z =
        math.max(fruitStackEntity.velocity.z, fruitStackEntity.fruitStack.pickupJumpSpeed) *
        math.pow(#fruitStackEntity.fruitStack.fruits, 1/3) *
        Game.constants.jumpMultiplier
end

function Game:checkFruitDrop(entity, stackRootEntity, parentEntity, prevX, prevY, prevZ)
    for _, otherEntity in ipairs(self:getAllOverlappingOfType(
        entity.physics.heightSensor,
        HEIGHT_SENSOR,
        entity.pos))
    do
        if self:shouldEntitiesContact(entity, otherEntity) then
            entity.pos.x = prevX
            entity.pos.y = prevY
            entity.pos.z = prevZ
            entity.physics.body:setPosition(entity.pos.x, entity.pos.y)
            for i = #stackRootEntity.fruitStack.fruits, 1, -1 do
                local fruitEntity = stackRootEntity.fruitStack.fruits[i]
                stackRootEntity.fruitStack.fruits[i] = nil

                local dir = math.random() * math.pi * 2
                local dx = math.cos(dir) * stackRootEntity.fruitStack.dropForce
                local dy = math.sin(dir) * stackRootEntity.fruitStack.dropForce
                fruitEntity.fruit.stackEntity = nil
                fruitEntity.fruit.animFrames = nil
                fruitEntity.fruit.reachedStack = false
                fruitEntity.fruit.cooldown = stackRootEntity.fruitStack.dropCooldown
                fruitEntity.velocity.z = stackRootEntity.fruitStack.dropJumpSpeed * Game.constants.jumpMultiplier
                fruitEntity.physics.body:setType("dynamic")
                fruitEntity.physics.body:setLinearDamping(0)
                fruitEntity.physics.body:applyLinearImpulse(dx, dy)
                fruitEntity.pos.onGround = false
                fruitEntity.pos.floorEntity = nil

                if fruitEntity == entity then
                    return
                end
            end
        end
    end
end

function Game:findFloorAndCeiling(entity)
    local floorEntity = nil
    local floorZ = 0
    local ceilingZ = SKY_LIMIT
    for _, other in ipairs(self:getAllOverlappingOfType(entity.physics.heightSensor)) do
        if (entity.velocity or not other.velocity) and self:shouldEntitiesContact(entity, other) then
            local sz = other.pos.z
            local ez = other.pos.z + other.pos.height
            if other.physics.sliceEnd < entity.physics.sliceStart then
                local consideredEntity = floorEntity or entity
                -- If the floors are close enough, pick the one with most render priority
                if other.pos.y > consideredEntity.pos.y then
                    floorEntity = other
                end
                floorZ = math.max(floorZ, ez)
            end
            if other.physics.sliceStart > entity.physics.sliceEnd then
                ceilingZ = math.min(ceilingZ, sz)
            end
        end
    end
    entity.pos.floorEntity = floorEntity
    entity.pos.floorZ = floorZ
    entity.pos.ceilingZ = ceilingZ
end

function Game:findFloorY(entity)
    local y = entity.pos.y
    for i = 1, 10 do
        if entity.pos.floorEntity then
            entity = entity.pos.floorEntity
            y = math.max(entity.pos.y + DELTA * 3, y)
        else
            return entity, y
        end
    end
    return entity, y
end

function Game:drawEntity(entity)
    if entity.sprites then
        for _, sprite in ipairs(entity.sprites) do
            local animData = sprite.animData
            local frame = sprite.frame
            local spriteWiggleX = sprite.wiggle and sprite.wiggle.x or 0
            local spriteWiggleY = sprite.wiggle and sprite.wiggle.y or 0
            local wiggleX = spriteWiggleX * (entity.anim and entity.anim.wiggle.x or 1)
            local wiggleY = spriteWiggleY * (entity.anim and entity.anim.wiggle.y or 1)
            local scaleX = wiggleX + (1 - spriteWiggleX)
            local scaleY = wiggleY + (1 - spriteWiggleY)
            if animData and frame then
                love.graphics.draw(
                    textures[sprite.name],
                    animData.tiles[frame].quad,
                    entity.pos.x,
                    (entity.pos.y - entity.pos.z),
                    0,
                    (sprite.flipX and - 1 or 1) * (animData.flipX and -1 or 1) * scaleX,
                    (sprite.flipY and - 1 or 1) * (animData.flipY and -1 or 1) * scaleY,
                    sprite.anchor.x,
                    sprite.anchor.y)
            else
                love.graphics.draw(
                    textures[sprite.name],
                    entity.pos.x,
                    (entity.pos.y - entity.pos.z),
                    0,
                    sprite.flipX and -1 or 1,
                    sprite.flipY and -1 or 1,
                    sprite.anchor.x,
                    sprite.anchor.y)
            end
        end
    end
    if entity.tileSprites then
        love.graphics.setBlendMode("alpha", "premultiplied")
        for _, sprite in ipairs(entity.tileSprites) do
            local tileData = tileset.tiles[sprite.tile]
            love.graphics.draw(
                textures.tileset,
                tileData.quad,
                entity.pos.x,
                (entity.pos.y - entity.pos.z),
                0,
                sprite.flipX and -1 or 1,
                sprite.flipY and -1 or 1,
                sprite.anchor.x,
                sprite.anchor.y)
        end
        love.graphics.setBlendMode("alpha")
    end
end

function Game:drawEntityShadow(entity, floorZ)
    floorZ = floorZ or 0
    local zscale = entity.velocity and
        math.pow(1 / math.max((entity.pos.z - floorZ) / METER_SCALE, 1), 1/4) or
        1
    love.graphics.draw(
        textures[entity.shadow.name],
        entity.pos.x,
        entity.pos.y - floorZ,
        0,
        (entity.shadow.flipX and -1 or 1) * zscale,
        (entity.shadow.flipY and -1 or 1) * zscale,
        entity.shadow.anchor.x,
        entity.shadow.anchor.y)
end

function Game:findEntity(designation)
    if not designation then
        return nil
    elseif designation.byName then
        return self.entitiesByName[designation.byName]
    end
end

function Game:findPoint(designation)
    if not designation then
        return nil
    end
    local x, y = nil, nil
    if designation.byName then
        local entity = self:findEntity(designation)
        if entity and entity.pos then
            x, y = entity.pos.x, entity.pos.y
        end
    elseif designation.pos then
        x, y = designation.pos.x, designation.pos.y
    end
    if designation.offset then
        x = x + designation.offset.x or 0
        y = y + designation.offset.y or 0
    end
    return x, y
end

function Game:shouldEntitiesContact(e1, e2)
    return not ((e1.fruit or e1.fruitStack) and (e2.fruit or e2.fruitStack))
end

-- OVERLAPS!

local function onOverlappingEntitiesCheck(fix)
    local otherEntity = fix:getBody():getUserData()

    if otherEntity.disabled then
        return true
    end

    if overlappingCheckEntity.id == otherEntity.id or
        (overlappingCheckType and fix:getUserData().type ~= overlappingCheckType) or
        not (overlappingCheckSlop or love.physics.overlap(overlappingCheckEntity, overlappingCheckSensor, otherEntity, fix))
    then
        return true
    end

    if overlappingCheckStartZ then
        if otherEntity.pos then
            local sz2 = otherEntity.pos.z
            local ez2 = otherEntity.pos.z + otherEntity.pos.height
            if overlappingCheckStartZ < ez2 + DELTA and
                sz2 < overlappingCheckEndZ + DELTA
            then
                table.insert(overlappingCheckResult, otherEntity)
            end
        end
    else
        table.insert(overlappingCheckResult, otherEntity)
    end

    return not overlappingCheckStopOnFirst
end

function Game:getAllOverlappingOfType(sensor, type, pos)
    overlappingCheckSensor = sensor
    overlappingCheckBody = overlappingCheckSensor:getBody()
    overlappingCheckEntity = overlappingCheckBody:getUserData()
    overlappingCheckType = type or HEIGHT_SENSOR
    overlappingCheckStartZ = pos and pos.z
    overlappingCheckEndZ = pos and (pos.z + pos.height)
    local slop = overlappingCheckSlop or 0

    local tlx, tly, brx, bry = sensor:getBoundingBox()
    self.physics:queryBoundingBox(tlx - slop, tly - slop, brx + slop, bry + slop, onOverlappingEntitiesCheck)

    overlappingCheckSensor = nil
    overlappingCheckBody = nil
    overlappingCheckEntity = nil
    overlappingCheckType = nil
    overlappingCheckStartZ = nil
    overlappingCheckEndZ = nil
    overlappingCheckSlop = nil
    local result = overlappingCheckResult
    if #overlappingCheckResult > 0 then
        overlappingCheckResult = {}
    end

    return result
end

function Game:getFirstOverlappingOfType(sensor, type, pos)
    overlappingCheckStopOnFirst = true
    local result = self:getAllOverlappingOfType(sensor, type, pos)[1]
    overlappingCheckStopOnFirst = false
    return result
end

fancyTypes = {}
require "src.components.Actor"
require "src.components.Anim"
require "src.components.Bubble"
require "src.components.Event"
require "src.components.Physics"
require "src.components.Larp"
require "src.components.Water"

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

Game = {
    fadeout = 15,
    fadein = 15
}

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

local iteratorSx, iteratorSy, iteratorEx, iteratorEy
function Game.entitiesAABBIterator(entities, i)
    for j = i, #entities do
        local entity = entities[j]
        if not entity.disabled and
            entity.pos.y >= sy and
            entity.pos.y <= ey and
            entity.pos.x >= sx and
            entity.pos.x <= ex
        then
            return j + 1, entity
        end
    end
end

function Game:iterEntitiesAABB(sx, sy, ex, ey)
    iteratorSx = sx
    iteratorSy = sy
    iteratorEx = ex
    iteratorEy = ey
    return Game.entitiesAABBIterator, self.entities, 1
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
    self.particles = {}
    self.nextFreeParticleIndex = 1
    self.event = Event.new()
    self.anim = Anim.new()
    self.vars = {
        remainingFruits = 0,
        eaten = 0,
        picnicFruits = 0,
        targetFruits = 1,
        currentMap = args.map,
        nextMap = nil
    }
    for key, value in pairs(self.map.vars) do
        self.vars[key] = value
    end

    for i = 1, Game.constants.particleCount do
        local particle = {
            id = #self.entities + 1,
            particleIndex = #self.particles + 1,
            disabled = true,
            sprites = { { anchor = { x = 0, y = 0 } } },
            pos = { x = 0, y = 0, z = 0 },
            velocity = { x = 0, y = 0, z = 0 },
            anim = Anim:new()
        }
        table.insert(self.entities, particle)
        table.insert(self.particles, particle)
    end

    self.map:getTileEntities(self.physics, self.entities)
    self.map:getEntities(self.entities)
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
    self:update(0)
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
                entity.water:clearSensors()
            end
            if entity.fruitStack then
                entity.fruitStack.sensor = nil
            end
            if entity.picnic then
                entity.picnic.sensor = nil
            end
        end

        if entity.physics then
            if entity.water then
                entity.water:createSensors(entity.physics)
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
            entity.water:update(framePart, self, entity.pos, entity.velocity, entity.physics, entity.anim)
        end

        -- Fruit stack haver
        if entity.fruitStack then
            if #entity.fruitStack.fruits > 0 then
                if not entity.fruitStack.cooldown then
                    entity.fruitStack.cooldown = entity.fruitStack.eatCooldown
                elseif entity.fruitStack.cooldown > 0 then
                    local lessThanHalfWay = entity.fruitStack.cooldown > entity.fruitStack.eatCooldown / 2
                    entity.fruitStack.cooldown = math.max(entity.fruitStack.cooldown - framePart, 0)
                    if entity.fruitStack.cooldown <= entity.fruitStack.eatCooldown / 2 and lessThanHalfWay then
                        entity.bubble:show(self, entity.fruitStack.halfEatIndicator, entity.anim)
                    end
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
                if eaten then
                    self.vars.eaten = self.vars.eaten + 1
                    entity.anim.baseWiggle.x = entity.anim.baseWiggle.x + entity.fruitStack.sizePerFruit
                    entity.anim.baseWiggle.y = entity.anim.baseWiggle.y + entity.fruitStack.sizePerFruit
                    if entity.actor then
                        entity.actor.mass = entity.actor.mass + (eaten.fruit.mass or 0)
                    end
                    entity.anim:startWiggle(entity.fruitStack.eatWiggleAmplitude, entity.fruitStack.eatWiggleFrames)
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
            if entity.picnic.dropFrames then
                entity.picnic.dropFrames = math.max(entity.picnic.dropFrames - framePart, 0)
            end

            for _, otherEntity in ipairs(self:getAllOverlappingOfType(entity.picnic.sensor)) do
                if otherEntity.fruitStack then
                    if otherEntity.fruitStack.picnicAction == "drop" and
                        #otherEntity.fruitStack.fruits > 0
                    then
                        otherEntity.velocity.z = entity.picnic.stackDropJumpSpeed * Game.constants.jumpMultiplier
                        otherEntity.physics.body:setLinearVelocity(0, 0)
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
                            self.vars.picnicFruits = #entity.picnic.fruits
                        end
                    elseif otherEntity.fruitStack.picnicAction == "pickup" and
                        #entity.picnic.fruits > 0 and
                        (not entity.picnic.dropFrames or entity.picnic.dropFrames == 0)
                    then
                        entity.picnic.dropFrames = entity.picnic.dropCooldown
                        local i = math.random(#entity.picnic.fruits)
                        local fruitEntity = entity.picnic.fruits[i]
                        table.remove(entity.picnic.fruits, i)
                        self.vars.picnicFruits = #entity.picnic.fruits
                        self:fruitPickup(otherEntity, fruitEntity)
                    end
                end
            end
        end

        -- Handling physics and the dreaded Z axis
        if entity.physics then
            entity.pos.x, entity.pos.y = entity.physics.body:getPosition()
            if entity.anim then
                entity.physics.body:setAngle(entity.anim.angle)
            end
            if entity.velocity then
                self:findFloorAndCeiling(entity)
                -- Speed! Movement! Wee!
                entity.velocity.x, entity.velocity.y = entity.physics.body:getLinearVelocity()
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
        elseif entity.velocity then
            -- Non-physics-backed velocity handling
            entity.pos.x = entity.pos.x + entity.velocity.x * dt
            entity.pos.y = entity.pos.y + entity.velocity.y * dt
            entity.pos.z = entity.pos.z + entity.velocity.z * dt
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

        -- SHAKE
        if entity.shakeEmitter then
            for trigger, shake in pairs(entity.shakeEmitter.triggers) do
                if (not shake.minimumMass or entity.actor.mass >= shake.minimumMass) and
                    entity.anim:isTriggered(trigger) then
                    self.camera.shakeAmplitude = shake.amplitude
                    self.camera.shakeFrames = shake.frames
                end
            end
        end

        -- PARTICLE
        if entity.particleEmitter then
            for trigger, emit in pairs(entity.particleEmitter.triggers or EMPTY) do
                if entity.anim:isTriggered(trigger) then
                    self:emitParticle(framePart, entity, emit)
                end
            end
            if entity.particleEmitter.conditions then
                local drown = entity.particleEmitter.conditions.drown
                if drown and entity.water and entity.water.remainingDrownFrames then
                    self:emitParticle(framePart, entity, drown)
                end

                local light = entity.particleEmitter.conditions.light
                if light and entity.light and entity.light.alpha >= light.minimumLight then
                    self:emitParticle(framePart, entity, light)
                end
            end
            if entity.particleEmitter.always then
                self:emitParticle(framePart, entity, entity.particleEmitter.always)
            end
        end

        if entity.particleDuration then
            entity.particleDuration = math.max(entity.particleDuration - framePart, 0)
            if entity.particleDuration <= 0 then
                self:freeParticle(entity)
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

    -- Camera
    if self.camera.target then
        if self.camera.panFrames > 0 then
            self.camera.x = math.interp(self.camera.panFrames, self.camera.x, self.camera.target.pos.x)
            self.camera.y = math.interp(self.camera.panFrames, self.camera.y, self.camera.target.pos.y)
            self.camera.panFrames = math.max(self.camera.panFrames - framePart, 0)
            if self.camera.panFrames == 0 then
                self.anim:trigger("camera:finished")
            end
        else
            self.camera.x = self.camera.target.pos.x
            self.camera.y = self.camera.target.pos.y
        end
        if (self.camera.z < self.camera.target.pos.floorZ and self.camera.target.pos.z > self.camera.z) or
            (self.camera.z > self.camera.target.pos.floorZ and self.camera.target.pos.z < self.camera.z) then
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

local drawnEntities = {}

function Game:render(dt)
    -- Camera
    local w, h = love.graphics.getDimensions()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(0.5)
    love.graphics.translate(
        -self.camera.x + self.camera.offsetX,
        -self.camera.y + self.camera.offsetY + self.camera.z)
    local sx, sy = love.graphics.inverseTransformPoint(0, 0)
    local ex, ey = love.graphics.inverseTransformPoint(0 + w, 0 + h)
    love.graphics.clear(0.2, 0.5, 0.4)

    local i = 1
    for _, entity in self:iterEntities() do
        local entitysx = entity.pos.x - 800
        local entitysy = entity.pos.y - 800
        local entityex = entity.pos.x + 800
        local entityey = entity.pos.y + 800
        if  entityex >= sx and entityey >= sy and entitysx <= ex and entitysy <= ey then
            drawnEntities[i] = entity
            i = i + 1
        end
    end
    for j = i, #drawnEntities do
        drawnEntities[j] = nil
    end

    -- Sorting! Fun times!
    table.sort(drawnEntities,
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

    -- Tiles
    love.graphics.setBlendMode("alpha", "premultiplied")
    self.tilesBatch:clear()
    self.map:drawTiles(self.tilesBatch, self.time, sx, sy, ex, ey)
    love.graphics.draw(self.tilesBatch, 0, 0)
    love.graphics.setBlendMode("alpha")

    -- Shadows
    love.graphics.setBlendMode("multiply", "premultiplied")
    for _, entity in ipairs(drawnEntities) do
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
    for _, entity in ipairs(drawnEntities) do
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

        if entity.light and entity.light.alpha > DELTA then
            local radiusw = entity.light.radiusw or Game.constants.defaultLight.radiusw
            local radiush = entity.light.radiush or Game.constants.defaultLight.radiush
            local alpha = entity.light.alpha or Game.constants.defaultLight.alpha
            local angle = entity.light.angle or Game.constants.defaultLight.angle
            local rayHeight = entity.pos.y - sy
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
    for _, entity in ipairs(drawnEntities) do
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

    if debug.pointHeights then
        for x = sx, ex, 16 do
            for y = sy, ey, 16 do
                local height = self.map:getPointHeight(x, y) / (SKY_LIMIT / 2)
                local r = height <= 0.33 and height or 0
                local g = height > 0.33 and height <= 0.66 and height or 0
                local b = height > 0.66 and height or 0
                love.graphics.setColor(r, g, b, 0.75)
                love.graphics.rectangle("fill",x, y, 16, 16)
            end
        end
        love.graphics.setColor(1, 1, 1, 1)
    end

    love.graphics:reset()

    if debug.pointHeights then
        local x, y = 0, 0
        if self.input.target then
            x = math.round(self.input.target.pos.x)
            y = math.round(self.input.target.pos.y)
        end
        love.graphics.print(x .. ":" .. y, 50, 0)
        local tx, ty = Map.PosToTileMat:transformPoint(x, y)
        love.graphics.print(tx .. ":" .. ty, 50, 50)
    end
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
    self:fruitPickup(fruitStackEntity, fruitEntity)
end

function Game:fruitPickup(fruitStackEntity, fruitEntity)
    local stackEntityVelocity = fruitStackEntity or EMPTY
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
        math.max(stackEntityVelocity.z or 0, fruitStackEntity.fruitStack.pickupJumpSpeed) *
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
    elseif entity.tileSprites then
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
        not (overlappingCheckSlop or love.physics.overlap(overlappingCheckSensor, fix))
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

function Game:eval(operand)
    if type(operand) == "number" then
        return operand
    end
    local type, name = operand:match"%[(%w+)%.(%w+)%]"
    if type == "vars" then
        return self.vars[name]
    end
end

function Game:emitParticle(framePart, entity, emit)
    if emit.cooldownFrames and emit.cooldownFrames > 0 then
        emit.cooldownFrames = math.max(emit.cooldownFrames - framePart)
        return
    end
    emit.cooldownFrames = math.randomRange(emit.cooldownRange, emit.cooldown or 0)

    local count = emit.countRange and math.random(unpack(emit.countRange)) or emit.count or 1
    local rangePart = 1 / count
    for i = 1, count do
        local particle = self:acquireParticle()
        if particle then
            particle.sprites[1].name = emit.name
            local spriteData = sprites[emit.name]
            local animData = spriteData and spriteData[#spriteData]
            local width = (animData and animData.tileWidth) or (textures[emit.name]:getWidth())
            local height = (animData and animData.tileHeight) or (textures[emit.name]:getHeight())
            particle.sprites[1].anchor.x = width / 2
            particle.sprites[1].anchor.y = height / 2

            local offsetRange = emit.offsetRange or EMPTY
            local offset = emit.offset or EMPTY
            local velocityRange = emit.velocityRange or EMPTY
            local velocity = emit.velocity or EMPTY

            local horizontal = math.randomRange(offsetRange.horizontal, offset.horizontal or 0)
            particle.pos.x = entity.pos.x + math.cos(entity.anim.angle) * horizontal + math.randomRange(offsetRange.x, offset.x or 0)
            particle.pos.y = entity.pos.y + math.sin(entity.anim.angle) * horizontal + math.randomRange(offsetRange.y, offset.y or 0)
            particle.pos.z = entity.pos.z + math.randomRange(offsetRange.z, offset.z or 0)
            particle.pos.floorZ = entity.pos.floorZ
            particle.pos.floorEntity = entity.pos.floorEntity
            particle.pos.ceilingZ = entity.pos.ceilingZ

            particle.velocity.x = math.randomRange(velocityRange.x, velocity.x or 0) * Game.constants.speedMultiplier
            particle.velocity.y = math.randomRange(velocityRange.y, velocity.y or 0) * Game.constants.speedMultiplier
            particle.velocity.z = math.randomRange(velocityRange.z, velocity.z or 0) * Game.constants.speedMultiplier
            if emit.inherit then
                particle.velocity.x = particle.velocity.x + entity.velocity.x * emit.inherit.x
                particle.velocity.y = particle.velocity.y + entity.velocity.y * emit.inherit.y
                particle.velocity.z = particle.velocity.z + entity.velocity.z * emit.inherit.z
            end
            particle.particleDuration = math.randomRange(emit.durationRange, emit.duration or 0)
            local speed = math.randomRange(emit.speedRange, emit.speed or 0)
            local angle = math.randomSplitRange(rangePart, i, emit.angleRange, emit.angle or 0)
            angle = angle + entity.anim.angle
            particle.velocity.x = particle.velocity.x + math.cos(angle) * speed * Game.constants.speedMultiplier
            particle.velocity.y = particle.velocity.y + math.sin(angle) * speed * Game.constants.speedMultiplier

            for _, sprite in pairs(particle.sprites) do
                sprite.animData = nil
                sprite.frame = nil
            end
            particle.anim:clear()
            particle.anim:setAngle(math.atan2(particle.velocity.y, particle.velocity.x))
            particle.anim:update(0, particle.sprites)
        end
    end
end

function Game:acquireParticle()
    if self.nextFreeParticleIndex <= Game.constants.particleCount then
        local particle = self.particles[self.nextFreeParticleIndex]
        self.nextFreeParticleIndex = self.nextFreeParticleIndex + 1
        particle.disabled = false
        return particle
    end
end

function Game:freeParticle(particle)
    particle.disabled = true
    local lastTakenParticleIndex = self.nextFreeParticleIndex - 1
    local lastTakenParticle = self.particles[lastTakenParticleIndex]
    local particleIndex = particle.particleIndex

    -- Move the previously last taken particle into the freed slot
    self.particles[particleIndex] = lastTakenParticle
    lastTakenParticle.particleIndex = particleIndex

    -- Move the newly freed particly into the previously last taken slot
    self.particles[lastTakenParticleIndex] = particle
    particle.particleIndex = lastTakenParticleIndex

    -- Mark the previously last taken slot as free.
    self.nextFreeParticleIndex = lastTakenParticleIndex
end

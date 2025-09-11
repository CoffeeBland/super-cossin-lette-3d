require "src.Map"
require "src.components.Anim"
require "src.components.Physics"

local PhysicsRenderer = require "src.PhysicsRenderer"

local bit = require("bit")
local g = 3 * METER_SCALE
local airFriction = 0.975
local groundDamping = 16
local slidingDamping = 1
local jumpMultiplier = 0.5
local speedMultiplier = 20
--   2
--  1 3
-- 8   4
--  7 5
--   6
local dirs = { "tl", "t", "tr", "r", "br", "b", "bl", "l" }
local v2 = { x = 0, y = 0 }

Game = {}

function Game:refresh(force)
    local path = "maps/" .. self.map.name .. ".lua"
    local info = love.filesystem.getInfo(path, "file")
    if force or (timestamps[path] and timestamps[path].modtime < info.modtime) then
        timestamps[path] = info
        StateMachine:change(Game, { map = self.map.name })
    end
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
    self.camera = { x = 0, y = 0 }
    self.time = 0
    self.map = Map.load(args.map)
    self.tilesBatch = love.graphics.newSpriteBatch(textures.tileset)
    self.entities = {}

    self.map:getEntities(self.entities)
    self.map:getTilesGogogadget(self.physics)
    self:update(0)
end

function Game:exit()
    self.physics:destroy()
    self.physics = nil
end

function Game:update(dt)
    self.physics:update(dt)
    self.time = self.time + dt

    for _, entity in ipairs(self.entities) do
        -- Create physics
        if entity.body and not entity.physics then
            entity.physics = Physics.new(self.physics, entity)
        end

        if entity.water then
            if not entity.water.sampleSensors then
                entity.water.sampleSensors = {}
                for i, sample in ipairs(entity.water.samples) do
                    local shape = love.physics.newCircleShape(unpack(sample))
                    local fixture = entity.physics:newSensor(shape, WATER_SENSOR)
                    entity.water.sampleSensors[i] = fixture
                end
            end
            if entity.water.remainingDrownFrames then
                entity.water.remainingDrownFrames = entity.water.remainingDrownFrames - 1
                if entity.water.remainingDrownFrames <= 0 then
                    entity.water.remainingDrownFrames = nil
                    entity.anim:release("drown")
                    entity.pos.x = entity.pos.lastGoodX
                    entity.pos.y = entity.pos.lastGoodY
                    entity.pos.z = entity.pos.lastGoodZ
                    entity.physics.body:setPosition(entity.pos.x, entity.pos.y)
                    entity.physics.body:setLinearVelocity(0, 0)
                    entity.velocity.z = 100
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

        -- Eat input
        if entity.input then
            entity.actions = actions
        end

        -- Fruit stack haver
        if entity.fruitStack then
            if not entity.fruitStack.sensor and entity.physics then
                local shape = love.physics.newCircleShape(entity.fruitStack.pickupRange / 2)
                local sensor = entity.physics:newSensor(shape, 0) -- TODO ISH
                sensor:setCategory(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
                entity.fruitStack.sensor = sensor
            end

            if #entity.fruitStack.fruits > 0 then
                if not entity.fruitStack.cooldown then
                    entity.fruitStack.cooldown = entity.fruitStack.eatCooldown
                else
                    entity.fruitStack.cooldown = entity.fruitStack.cooldown - 1
                end
            end

            if entity.fruitStack.cooldown == 0 then
                entity.anim:request("eat")
            end

            if entity.anim:isTriggered("throwFruit") then
                for _, fruitEntity in ipairs(entity.fruitStack.fruits) do
                    fruitEntity.velocity.z = entity.fruitStack.pickupJumpSpeed * jumpMultiplier
                end
            end

            if entity.anim:isTriggered("eatFruit") then
                local eaten = entity.fruitStack.fruits[1]
                if eaten then
                    eaten.toRemove = true
                    table.remove(entity.fruitStack.fruits, 1)
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
        end

        -- Actor! Shit this is sketch.
        if entity.actor then
            entity.pos.sliding = false
            if entity.actions.movement.angle then
                -- RIP
                local a = math.floor(entity.actions.movement.angle / math.pi * 4 + 0.5) + 4
                entity.anim.dir = dirs[a];
            end
            if entity.actions.movement.angle and entity.anim:highestPriority() <= Anim.priorities.walk then
                if entity.pos.onGround then
                    local dx = entity.actor.walkSpeed * math.cos(entity.actions.movement.angle) * speedMultiplier
                    local dy = entity.actor.walkSpeed * math.sin(entity.actions.movement.angle) * speedMultiplier
                    entity.physics.body:applyForce(dx, dy)
                end

                entity.anim:release("idle")
                entity.anim:request("walk")
            else
                entity.anim:release("walk")
                entity.anim:request("idle")
            end
            if entity.pos.onGround and entity.anim:highestPriority() <= Anim.priorities.squish then
                if entity.actions.jump then
                    entity.velocity.z = entity.velocity.z + entity.actor.jumpSpeed * jumpMultiplier
                    entity.pos.onGround = false
                end
                entity.pos.sliding = entity.actions.prejump
                entity.anim:toggle("squish", entity.actions.prejump)
            end
            entity.anim:toggle("jump", not entity.pos.onGround)
        end

        -- Picnic at the disco
        if entity.picnic then
            if entity.physics and not entity.picnic.sensor then
                local shape = love.physics.newCircleShape(entity.picnic.dropRange / 2)
                local sensor = entity.physics:newSensor(shape, 0)
                sensor:setCategory(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
                entity.picnic.sensor = sensor
            end

            for _, otherEntity in ipairs(self:getAllOverlappingOfType(entity.picnic.sensor)) do
                if otherEntity.fruitStack then
                    if #otherEntity.fruitStack.fruits > 0 then
                        otherEntity.velocity.z = 60
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
                        fruitEntity.fruit.animFrames = 20
                        fruitEntity.fruit.offset = {
                            x = dropPoints[(i - 1) * 2 + 1],
                            y = dropPoints[(i - 1) * 2 + 2],
                            z = 0
                        }
                        fruitEntity.fruit.reachedStack = false
                        fruitEntity.fruit.cooldown = nil
                        fruitEntity.velocity.z = 150 * jumpMultiplier
                        table.insert(entity.picnic.fruits, fruitEntity)
                    end
                end
            end
        end

        -- Handling physics and the dreaded Z axis
        if entity.physics then
            entity.pos.x, entity.pos.y = entity.physics.body:getPosition()
            if entity.velocity then
                -- Establish floor and ceiling
                local floorEntity = nil
                local ceilingEntity = nil
                local floorZ = 0
                local ceilingZ = SKY_LIMIT
                for _, other in ipairs(self:getAllOverlappingOfType(entity.physics.heightSensor)) do
                    if Game:shouldEntitiesContact(entity, other) then
                        local sz = other.pos.z
                        local ez = other.pos.z + other.pos.height
                        if ez < entity.pos.z + DELTA and ez + DELTA > floorZ then
                            -- If the floors are close enough, pick the one with most render priority
                            if not floorEntity or
                                (math.abs(floorZ - ez) < DELTA and other.pos.y > floorEntity.pos.y)
                            then
                                floorEntity = other
                            end
                            floorZ = math.max(floorZ, ez)
                        end
                        if sz > entity.pos.z + entity.pos.height - DELTA and sz < ceilingZ then
                            ceilingEntity = other
                            ceilingZ = sz
                        end
                    end
                end
                entity.pos.floorEntity = floorEntity
                entity.pos.floorZ = floorZ
                entity.pos.ceilingEntity = ceilingEntity
                entity.pos.ceilingZ = ceilingZ

                -- Speed! Movement! Wee!
                entity.velocity.z = (entity.velocity.z - g * dt) * airFriction
                entity.pos.z = entity.pos.z + entity.velocity.z

                -- Check ground (squish!)
                entity.pos.onGround = entity.pos.z < floorZ + DELTA
                if entity.pos.onGround then
                    entity.pos.z = floorZ
                    entity.velocity.z = 0
                end

                -- Check head (ouch!)
                if entity.pos.z + entity.pos.height > ceilingZ then
                    entity.pos.z = ceilingZ - entity.pos.height - DELTA
                    entity.velocity.z = 0
                end

                entity.physics:updateHeightSlices(entity.pos)
            end
            entity.physics.body:setLinearDamping(entity.pos.onGround and (entity.pos.sliding and slidingDamping or groundDamping) or 0)
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
                local targetZ = parentEntity.pos.z + entity.fruit.offset.z

                if entity.fruit.animFrames > 0 then
                    local p = 1 - 1 / entity.fruit.animFrames
                    entity.physics.body:setPosition(
                        entity.pos.x * p + targetX * (1 - p),
                        entity.pos.y * p + targetY * (1 - p))
                    entity.fruit.animFrames = entity.fruit.animFrames - 1
                    if entity.pos.z > targetZ then
                        entity.fruit.reachedStack = true
                    end
                else
                    local pickupForce = stackRootEntity.fruitStack and stackRootEntity.fruitStack.pickupForce or 0.7
                    entity.physics.body:setPosition(
                        entity.pos.x * (1 - pickupForce) + targetX * pickupForce,
                        entity.pos.y * (1 - pickupForce) + targetY * pickupForce)
                end
                if (entity.fruit.animFrames <= 0 or entity.fruit.reachedStack) and entity.pos.z <= targetZ then
                    entity.pos.z = targetZ
                    entity.velocity.z = 0
                    entity.pos.floorEntity = parentEntity
                    entity.pos.floorZ = targetZ
                end

                if stackRootEntity.fruitStack then
                    self:checkFruitDrop(entity, stackRootEntity, parentEntity, prevX, prevY, prevZ)
                end
            end
            if entity.fruit.cooldown then
                entity.fruit.cooldown = entity.fruit.cooldown - 1
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
                    love.audio.play(source)
                end
            end
        end

        -- Animating things
        if entity.anim then
            for _, request in pairs(entity.anim.requested) do
                request.time = request.time + dt
            end
            entity.anim:clearTriggers()
            for _, sprite in pairs(entity.sprites) do
                local spriteData = sprites[sprite.name]
                if spriteData then
                    local animData, animRequest = self:findAnim(spriteData, entity.anim)

                    -- Moi je trouve que Oui.
                    local frame = math.floor(animData.fps * animRequest.time)
                    if animData.oneShot and frame > #animData.tiles then
                        entity.anim:trigger(animData.name .. ":finished")
                        entity.anim:release(animData.name)
                    end
                    if animData.pingPong then
                        local tileCount = #animData.tiles * 2 - 2
                        frame = frame % tileCount
                        if frame >= #animData.tiles then
                            frame = tileCount - frame
                        end
                    else
                        frame = frame % #animData.tiles
                    end
                    frame = frame + 1

                    local trigger = animData.tiles[frame].trigger
                    if sprite.frame ~= frame and trigger then
                        entity.anim:trigger(trigger)
                    end

                    sprite.animData = animData
                    sprite.frame = frame
                end
            end
        end

        -- Updating the camera
        if entity.camera then
            self.camera.x = entity.pos.x
            self.camera.y = entity.pos.y
        end
    end

    -- Removing dead entities, but we maybe shouldn't!?
    for i = #self.entities, 1, -1 do
        local entity = self.entities[i]
        if entity.toRemove then
            if entity.physics then
                entity.physics.body:destroy()
            end
            table.remove(self.entities, i)
        end
    end

    -- Sorting! Fun times!
    table.sort(self.entities,
        function (a, b)
            local ay = a.y

            local floorA, ay = self:findFloorEntity(a)
            local floorB, by = self:findFloorEntity(b)

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
end

function Game:render(dt)
    -- Camera
    local w, h = love.graphics.getDimensions()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(0.33)
    love.graphics.translate(-self.camera.x, -self.camera.y)
    love.graphics.clear(0.2, 0.5, 0.4)

    -- Tiles
    love.graphics.setBlendMode("alpha", "premultiplied")
    self.tilesBatch:clear()
    self.map:drawTiles(self.tilesBatch, self.time)
    love.graphics.draw(self.tilesBatch, 0, 0)
    love.graphics.setBlendMode("alpha")

    -- Shadows
    love.graphics.setBlendMode("multiply", "premultiplied")
    for _, entity in ipairs(self.entities) do
        if entity.shadow then
            Game:drawEntityShadow(entity)
        end
    end
    love.graphics.setBlendMode("alpha")

    -- Entities
    for _, entity in ipairs(self.entities) do
        -- Stacked entities shadows
        if entity.shadow and entity.pos.floorEntity then
            love.graphics.stencil(
                function()
                    love.graphics.setShader(MASK_SHADER)
                    Game:drawEntitySprites(entity.pos.floorEntity)
                    love.graphics.setShader()
                end,
                "replace",
                1)
            love.graphics.setStencilTest("greater", 0)
            love.graphics.setBlendMode("multiply", "premultiplied")
            Game:drawEntityShadow(entity, entity.pos.floorZ)
            love.graphics.setBlendMode("alpha")
            love.graphics.setStencilTest()
        end
        -- Sprites
        if entity.sprites then
            Game:drawEntitySprites(entity)
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
        jumpMultiplier
end

function Game:checkFruitDrop(entity, stackRootEntity, parentEntity, prevX, prevY, prevZ)
    for _, otherEntity in ipairs(self:getAllOverlappingOfType(
        entity.physics.heightSensor,
        HEIGHT_SENSOR,
        entity.pos))
    do
        if Game:shouldEntitiesContact(entity, otherEntity) then
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
                fruitEntity.velocity.z = stackRootEntity.fruitStack.dropJumpSpeed * jumpMultiplier
                fruitEntity.physics.body:setType("dynamic")
                fruitEntity.physics.body:setLinearDamping(0)
                fruitEntity.physics.body:applyLinearImpulse(dx, dy)
                fruitEntity.pos.onGround = false
                fruitEntity.pos.floorEntity = nil
                fruitEntity.pos.ceilingEntity = nil

                if fruitEntity == entity then
                    return
                end
            end
        end
    end
end

function Game:findAnim(spriteData, entityAnim)
    local foundAnim = nil
    local foundRequest = EMPTY_REQUEST
    for _, anim in ipairs(spriteData) do
        local request = entityAnim:getRequest(anim.name)
        if request and request.priority >= foundRequest.priority then
            if anim.dirs then
                for _, dir in ipairs(anim.dirs) do
                    if dir == entityAnim.dir then
                        foundAnim = anim
                        foundRequest = request
                    end
                end
            else
                foundAnim = anim
                foundRequest = request
            end
        end
    end
    return foundAnim or spriteData[#spriteData], foundRequest or EMPTY_REQUEST
end

function Game:findFloorEntity(entity)
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

function Game:drawEntitySprites(entity)
    for _, sprite in ipairs(entity.sprites) do
        local animData = sprite.animData
        local frame = sprite.frame
        if animData and frame then
            love.graphics.draw(
                textures[sprite.name],
                animData.tiles[frame].quad,
                entity.pos.x,
                (entity.pos.y - entity.pos.z),
                0,
                (sprite.flipX and - 1 or 1) * (animData.flipX and -1 or 1),
                (sprite.flipY and - 1 or 1) * (animData.flipY and -1 or 1),
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

function Game:shouldEntitiesContact(e1, e2)
    return not ((e1.fruit or e1.fruitStack) and (e2.fruit or e2.fruitStack))
end

-- OVERLAPS!

local overlappingCheckSensor = nil
local overlappingCheckType = nil
local overlappingCheckStartZ = nil
local overlappingCheckEndZ = nil
local overlappingCheckStopOnFirst = false
local overlappingCheckResult = {}
local function onOverlappingEntitiesCheck(fix)
    local body = overlappingCheckSensor:getBody()
    local entity = body:getUserData()
    local otherEntity = fix:getBody():getUserData()

    if entity.id == otherEntity.id or
        (overlappingCheckType and fix:getUserData().type ~= overlappingCheckType) or
        (not love.physics.fancyTouchy(body, overlappingCheckSensor, fix) and
            not fix:testPoint(entity.pos.x, entity.pos.y))
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
    overlappingCheckType = type or HEIGHT_SENSOR
    overlappingCheckStartZ = pos and pos.z
    overlappingCheckEndZ = pos and (pos.z + pos.height)

    local tlx, tly, brx, bry = sensor:getBoundingBox()
    self.physics:queryBoundingBox(tlx, tly, brx, bry, onOverlappingEntitiesCheck)

    overlappingCheckSensor = nil
    overlappingCheckType = nil
    overlappingCheckStartZ = nil
    overlappingCheckEndZ = nil
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

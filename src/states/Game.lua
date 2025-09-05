require "src.map"
local PhysicsRenderer = require "src.PhysicsRenderer"

local bit = require("bit")
local g = 3 * METER_SCALE
local airFriction = 0.975
local groundDamping = 16
local slidingDamping = 1
local jumpMultiplier = 0.5
local speedMultiplier = METER_SCALE * 10
local eatCooldown = 600
--   2
--  1 3
-- 8   4
--  7 5
--   6
local dirs = { "tl", "t", "tr", "r", "br", "b", "bl", "l" }
local v2 = { x = 0, y = 0}

Game = {}

function Game:enter()
    self.physics = love.physics.newWorld(0, 0, true)
    self.camera = { x = 0, y = 0 }
    self.time = 0
    self.map = map.load("map_mymp")
    self.tilesBatch = love.graphics.newSpriteBatch(textures.tileset)
    self.entities = {
        {
            id = 1,
            input = true,
            camera = true,
            actor = { walkSpeed = 250, jumpSpeed = 225 },
            pos = { x = 0, y = 0, z = 0, height = HEIGHT_SLICE },
            velocity = { z = 0 },
            body = { shape = "circle", size = 80, type = "dynamic" },
            anim = {
                name = "walk",
                dir = "tr",
                time = 0
            },
            sprites = {
                {
                    name = "cossinPiedBack",
                    anchor = { x = 96, y = 236 }
                },
                {
                    name = "cossinCorps",
                    anchor = { x = 96, y = 236 }
                },
                {
                    name = "cossinPiedFront",
                    anchor = { x = 96, y = 236 }
                }
            },
            shadow = {
                name = "cossinOmbre",
                anchor = { x = 96, y = 46 }
            },
            fruitStack = {
                fruits = {},
                pickupRange = 128,
                pickupForce = 0.7,
                pickupJumpSpeed = 140,
                pickupAnimFrames = 20,
                firstOffset = { x = 0, y = 0, z = 165 },
                otherOffset = { x = 0, y = 0, z = 90 },
                dropCooldown = 60
            }
        }
    }

    self.map:getEntities(self.entities)
end

function Game:exit()
    self.physics:destroy()
    self.physics = nil
end

function Game:updateHeightSlices(entity)
    local startZ = entity.pos.z
    local endZ = startZ + (entity.pos.height)
    local sliceStart = math.clamp(1 + math.ceil(startZ / HEIGHT_SLICE), 1, 16)
    local sliceEnd = math.clamp(1 + math.floor((endZ - 1) / HEIGHT_SLICE), 1, 16)
    sliceEnd = math.max(sliceStart, sliceEnd)
    if sliceStart ~= entity.physics.sliceStart or sliceEnd ~= entity.physics.sliceEnd then
        -- Categories
        local categories = {}
        for i = sliceStart,sliceEnd do
            table.insert(categories, i)
        end
        entity.physics.fixture:setCategory(unpack(categories))

        -- Masks
        local masks = {}
        if sliceStart > 1 then
            for i = 1, sliceStart - 1 do
                table.insert(masks, i)
            end
        end
        if sliceEnd < 16 then
            for i = sliceEnd + 1, 16 do
                table.insert(masks, i)
            end
        end

        entity.physics.fixture:setMask(unpack(masks))

        entity.physics.sliceStart = sliceStart
        entity.physics.sliceEnd = sliceEnd
    end
end

function Game:update(dt)
    self.physics:update(dt)
    self.time = self.time + dt

    for _, entity in ipairs(self.entities) do
        -- Create physics
        if entity.body and not entity.physics then
            local body = love.physics.newBody(self.physics, entity.pos.x, entity.pos.y, entity.body.type)
            body:setUserData(entity)
            local shape
            if entity.body.shape == "circle" then
                shape = love.physics.newCircleShape(entity.body.size / 2)
            elseif entity.body.preshape then
                shape = entity.body.preshape
            end

            local heightSensor = love.physics.newFixture(body, shape, 0)
            heightSensor:setSensor(true)
            heightSensor:setCategory(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)

            local fixture = nil
            if entity.body.trigger then
                fixture = heightSensor
            else
                fixture = love.physics.newFixture(body, shape, 1)
            end

            entity.physics = {
                body = body,
                shape = shape,
                fixture = fixture,
                heightSensor = heightSensor
            }

            self:updateHeightSlices(entity)
        end

        -- Eat input
        if entity.input then
            entity.actions = actions
        end

        -- Fruit stack haver
        if entity.fruitStack then
            if #entity.fruitStack.fruits > 0 then
                if not entity.fruitStack.cooldown then
                    entity.fruitStack.cooldown = eatCooldown
                else
                    entity.fruitStack.cooldown = entity.fruitStack.cooldown - 1
                end

                if entity.fruitStack.cooldown == 0 then
                    entity.fruitStack.eating = 48
                end

                if entity.fruitStack.eating then
                    entity.fruitStack.eating = entity.fruitStack.eating - 1

                    if entity.fruitStack.eating == 30 then
                        for _, fruitEntity in ipairs(entity.fruitStack.fruits) do
                            fruitEntity.velocity.z = entity.fruitStack.pickupJumpSpeed * jumpMultiplier
                        end
                    end

                    if entity.fruitStack.eating == 6 then
                        local eaten = entity.fruitStack.fruits[1]
                        eaten.toRemove = true
                        table.remove(entity.fruitStack.fruits, 1)
                        local nextFruitEntity = entity.fruitStack.fruits[1]
                        if nextFruitEntity then
                            nextFruitEntity.fruit.stackEntity = entity
                        end
                    end

                    if entity.fruitStack.eating == 0 then
                        entity.fruitStack.eating = nil
                        entity.fruitStack.cooldown = nil
                    end
                end
            else
                entity.fruitStack.eating = nil
                entity.fruitStack.cooldown = nil
            end

            for _, contact in pairs(entity.physics.body:getContacts()) do
                local fix1, fix2 = contact:getFixtures()
                local entity1 = fix1:getBody():getUserData()
                local entity2 = fix2:getBody():getUserData()
                local other = entity1.id == entity.id and entity2 or entity1
                if other.fruit then
                    self:checkFruitPickup(entity, other)
                end
            end
        end

        -- Actor! Shit this is sketch.
        if entity.actor then
            entity.pos.sliding = false
            if entity.actions.movement.angle and entity.physics then
                if entity.pos.onGround and not entity.fruitStack.eating and not entity.actions.prejump then
                    local dx = entity.actor.walkSpeed * math.cos(entity.actions.movement.angle) * dt * speedMultiplier
                    local dy = entity.actor.walkSpeed * math.sin(entity.actions.movement.angle) * dt * speedMultiplier
                    entity.physics.body:applyForce(dx, dy)
                end

                -- RIP
                local a = math.floor(entity.actions.movement.angle / math.pi * 4 + 0.5) + 4
                entity.anim.dir = dirs[a];
                entity.anim.name = "walk"
            end
            if entity.fruitStack.eating and entity.pos.onGround then
                entity.anim.name = "eat"
            else
                if entity.actions.jump and entity.pos.onGround then
                    entity.velocity.z = entity.velocity.z + entity.actor.jumpSpeed * jumpMultiplier
                    entity.pos.onGround = false
                end
                if entity.actions.prejump and entity.pos.onGround then
                    entity.pos.sliding = true
                    entity.anim.name = "squish"
                elseif not entity.pos.onGround then
                    entity.anim.name = "jump"
                elseif not entity.actions.movement.angle then
                    entity.anim.name = "idle"
                end
            end
        end

        -- Handling physics and the dread Z axis
        if entity.physics then
            entity.pos.x, entity.pos.y = entity.physics.body:getWorldCenter()
            if entity.velocity then
                local wasOnGround = false
                -- Establish floor and ceiling
                local floorEntity = nil
                local ceilingEntity = nil
                local floorZ = 0
                local ceilingZ = SKY_LIMIT
                for _, otherEntity in pairs(self:getOverlappingEntities(entity)) do
                    if not otherEntity.body.trigger then
                        local sz = otherEntity.pos.z
                        local ez = otherEntity.pos.z + (otherEntity.pos.height)
                        if ez < entity.pos.z + DELTA and ez > floorZ then
                            floorEntity = otherEntity
                            floorZ = ez
                        end
                        if sz > entity.pos.z + entity.pos.height - DELTA and sz < ceilingZ then
                            ceilingEntity = otherEntity
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

                self:updateHeightSlices(entity)
            end
            entity.physics.body:setLinearDamping(entity.pos.onGround and (entity.pos.sliding and slidingDamping or groundDamping) or 0)
        end

        -- Fruit being
        if entity.fruit then
            if entity.fruit.animFrames then
                local parentEntity = entity.fruit.stackEntity
                local stackRootEntity = parentEntity
                while stackRootEntity.fruit and stackRootEntity.fruit.stackEntity do
                    stackRootEntity = stackRootEntity.fruit.stackEntity
                end
                local offset = parentEntity == stackRootEntity and
                    stackRootEntity.fruitStack.firstOffset or
                    stackRootEntity.fruitStack.otherOffset
                local targetX = parentEntity.pos.x + offset.x
                local targetY = parentEntity.pos.y + offset.y
                local targetZ = parentEntity.pos.z + offset.z

                if entity.fruit.animFrames > 0 then
                    local p = entity.fruit.animFrames / stackRootEntity.fruitStack.pickupAnimFrames
                    entity.physics.body:setPosition(
                        entity.pos.x * p + targetX * (1 - p),
                        entity.pos.y * p + targetY * (1 - p))
                    entity.fruit.animFrames = entity.fruit.animFrames - 1
                    if entity.pos.z > targetZ then
                        entity.fruit.reachedStack = true
                    end
                else
                    entity.physics.body:setPosition(
                        entity.pos.x * (1 - stackRootEntity.fruitStack.pickupForce) + targetX * stackRootEntity.fruitStack.pickupForce,
                        entity.pos.y * (1 - stackRootEntity.fruitStack.pickupForce) + targetY * stackRootEntity.fruitStack.pickupForce)
                end
                if (entity.fruit.animFrames <= 0 or entity.fruit.reachedStack) and entity.pos.z <= targetZ then
                    entity.pos.z = targetZ
                    entity.velocity.z = 0
                    entity.pos.floorEntity = parentEntity
                    entity.pos.floorZ = targetZ
                end

                -- TODO fruit drop
                for _, otherEntity in pairs(self:getOverlappingEntities(entity)) do
                    if not otherEntity.fruit and not otherEntity.fruitStack then
                        if entity.pos.z <= otherEntity.pos.z + otherEntity.pos.height and
                            entity.pos.z + entity.pos.height >= otherEntity.pos.z
                        then
                            local i = table.index(stackRootEntity.fruitStack.fruits, entity)
                            local next = stackRootEntity.fruitStack.fruits[i + 1]
                            if next then
                                next.fruit.stackEntity = parentEntity
                            end
                            table.remove(stackRootEntity.fruitStack.fruits, i)
                            entity.fruit.stackEntity = nil
                            entity.fruit.animFrames = nil
                            entity.shadow = { name = "fruitOmbre", anchor = { x = 67, y = 0 } }
                            -- TODO - That's insufficient!
                            entity.velocity.z = stackRootEntity.fruitStack.pickupJumpSpeed * jumpMultiplier
                            entity.fruit.cooldown = stackRootEntity.fruitStack.dropCooldown
                        end
                    end
                end
            end
            if entity.fruit.cooldown then
                entity.fruit.cooldown = entity.fruit.cooldown - 1
                if entity.fruit.cooldown < 0 then
                    entity.fruit.cooldown = nil
                end
            end
        end

        -- Animating things (this is also sketch!)
        if entity.anim then
            entity.anim.time = entity.anim.time + dt
            if entity.anim.name ~= entity.anim.prevName then
                entity.anim.time = 0
                entity.anim.finished = false
                entity.anim.prevName = entity.anim.name
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
            love.graphics.draw(
                textures[entity.shadow.name],
                entity.pos.x,
                entity.pos.y,
                0,
                math.pow(1 / math.max(-(entity.pos.z / METER_SCALE), 1), 1/4),
                math.pow(1 / math.max(-(entity.pos.z / METER_SCALE), 1), 1/4),
                entity.shadow.anchor.x,
                entity.shadow.anchor.y)
        end
    end
    love.graphics.setBlendMode("alpha")

    -- Entities
    for _, entity in ipairs(self.entities) do
        if entity.shadow and entity.pos.floorEntity then
            love.graphics.stencil(
                function()
                    love.graphics.setShader(mask_shader)
                    Game:drawEntitySprites(entity.pos.floorEntity)
                    love.graphics.setShader()
                end,
                "replace",
                1)
            love.graphics.setStencilTest("greater", 0)
            love.graphics.setBlendMode("multiply", "premultiplied")
            love.graphics.draw(
                textures[entity.shadow.name],
                entity.pos.x,
                entity.pos.y - entity.pos.floorZ,
                0,
                math.pow(1 / math.max(-(entity.pos.z / METER_SCALE), 1), 1/4),
                math.pow(1 / math.max(-(entity.pos.z / METER_SCALE), 1), 1/4),
                entity.shadow.anchor.x,
                entity.shadow.anchor.y)
            love.graphics.setBlendMode("alpha")
            love.graphics.setStencilTest()
        end
        if entity.sprites then
            Game:drawEntitySprites(entity)
        end
    end

    -- Debug
    if debug.physics then
        PhysicsRenderer.draw_camera(self.physics, 0, 0, w, h)
    end
end

mask_shader = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        if (Texel(texture, texture_coords).a < 0.5) {
            discard;
        }
        return vec4(1.0);
    }
]]

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
    fruitEntity.shadow = nil
    fruitEntity.velocity.z = math.max(fruitStackEntity.velocity.z, fruitStackEntity.fruitStack.pickupJumpSpeed) * math.pow(#fruitStackEntity.fruitStack.fruits, 1/3) * jumpMultiplier
end

function Game:check(fix1, fix2, contact)
    local body1 = fix1:getBody()
    local body2 = fix2:getBody()

    local otherEntity =
        (body1 ~= entity.physics.body and body1:getUserData()) or
        (body2 ~= entity.physics.body and body2:getUserData()) or
        nil
    if otherEntity and (
        contact:isTouching() or
        otherEntity.physics.fixture:testPoint(entity.pos.x, entity.pos.y))
    then
        local ez = otherEntity.pos.z + (otherEntity.pos.height)
        if ez < entity.pos.z + DELTA and ez > floorZ then
            floorEntity = otherEntity
            floorZ = ez
        end
    end
end

function Game:findAnim(spriteData, entityAnim)
    for _, anim in ipairs(spriteData) do
        if anim.name == entityAnim.name then
            if anim.dirs then
                for _, dir in ipairs(anim.dirs) do
                    if dir == entityAnim.dir then
                        return anim
                    end
                end
            else
                return anim
            end
        end
    end
    return spriteData[#spriteData]
end

function Game:findFloorEntity(entity)
    local y = entity.pos.y
    while entity.pos.floorEntity do
        entity = entity.pos.floorEntity
        y = math.max(entity.pos.y + DELTA * 3, y)
    end
    return entity, y
end

Game.overlappingEntitiesCheckResult = nil
Game.overlappingEntitiesCheckResult = {}
function Game:getOverlappingEntities(entity)
    Game.overlappingEntitiesCheckEntity = entity
    local tlx, tly, brx, bry = entity.physics.heightSensor:getBoundingBox()
    self.physics:queryBoundingBox(
        tlx, tly, brx, bry,
        Game.onOverlappingEntitiesCheck)
    Game.overlappingEntitiesCheckEntity = nil
    local result = Game.overlappingEntitiesCheckResult
    if #Game.overlappingEntitiesCheckResult > 0 then
        Game.overlappingEntitiesCheckResult = {}
    end
    return result
end

function Game.onOverlappingEntitiesCheck(fix)
    local entity = Game.overlappingEntitiesCheckEntity
    local result = Game.overlappingEntitiesCheckResult
    local otherEntity = fix:getBody():getUserData()
    if entity.id == otherEntity.id then
        return true
    end
    if fix:isSensor() and
        (entity.physics.body:isTouching(otherEntity.physics.body) or
            fix:testPoint(entity.pos.x, entity.pos.y))
    then
        table.insert(result, otherEntity)
    end
    return true
end

function Game:drawEntitySprites(entity)
    for _, sprite in ipairs(entity.sprites) do
        local spriteData = sprites[sprite.name]
        if spriteData then
            local animData = self:findAnim(spriteData, entity.anim)

            -- Moi je trouve que Oui.
            local frame = math.floor(animData.fps * entity.anim.time)
            if animData.oneShot and frame >= #animData.tiles then
                entity.anim.finished = true
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

            love.graphics.draw(
                textures[sprite.name],
                animData.tiles[frame + 1],
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

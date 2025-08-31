local bit = require("bit")
local g = 3
local airFriction = 0.975
local groundDamping = 8
local jumpMultiplier = 0.5
local speedMultiplier = 10 / 4
local fruitPickupAnimFrames = 20
local firstFruitOffset = { x = 0, y = 0, z = -1.3 }
local fruitOffset = { x = 0, y = 0, z = -0.7 }
local fruitJumpSpeed = 1
local fruitPickupForce = 0.7
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
    self.physics:setCallbacks(
        function (a, b, c)
            Game:onBeginContact(a, b, c)
        end)
    self.camera = { x = 0, y = 0 }
    self.map = require("maps/map1")
    self.batch = love.graphics.newSpriteBatch(textures.tileset)
    self.entities = {
        {
            id = 1,
            input = true,
            camera = true,
            actor = { walkSpeed = 1, jumpSpeed = 1.6 },
            pos = { x = 0, y = 0, z = 0 },
            velocity = { z = 0 },
            body = { shape = "circle", size = 0.8, type = "dynamic" },
            anim = {
                name = "walk",
                dir = "tr",
                time = 0
            },
            sprites = {
                {
                    name = "cossinPiedBack",
                    anchor = { x = 96, y = 220 }
                },
                {
                    name = "cossinCorps",
                    anchor = { x = 96, y = 220 }
                },
                {
                    name = "cossinPiedFront",
                    anchor = { x = 96, y = 220 }
                }
            },
            shadow = {
                name = "cossinOmbre",
                anchor = { x = 96, y = 32 }
            },
            fruitStack = { fruits = {} }
        }
    }

    local mapObjectsByGid = {}
    self.map.tilesetFirstGid = 0
    for _, data in ipairs(self.map.tilesets) do
        if data.name == "objects" then
            for i, object in pairs(objects.byId) do
                mapObjectsByGid[data.firstgid + i] = object.id
            end
        end
        if data.name == "tileset" then
            self.map.tilesetFirstGid = data.firstgid
        end
    end

    for _, layer in ipairs(self.map.layers) do
        for _, data in ipairs(layer.objects or {}) do
            local gid = data.gid
            local flipX = bit.band(gid, TILE_FLIP_H) ~= 0
            local flipY = bit.band(gid, TILE_FLIP_V) ~= 0
            gid = bit.band(gid, TILE_ID_MASK)
            if mapObjectsByGid[gid] then
                local object = objects.byId[mapObjectsByGid[gid]]

                local tx = data.x / self.map.tileheight
                local ty = data.y / self.map.tileheight
                local x = (tx - ty) * self.map.tilewidth / 2 + object.offsetX
                local y = (tx + ty) * self.map.tileheight / 2 + object.offsetY
                local entity = {
                    pos = {
                        x = x / METER_SCALE,
                        y = y / METER_SCALE,
                        z = 0
                    },
                    sprites = {
                        {
                            name = object.name,
                            anchor = { x = object.offsetX, y = object.offsetY },
                            flipX = flipX,
                            flipY = flipY
                        }
                    }
                }
                if object.properties.fruit then
                    entity.shadow = {
                        name = "fruitOmbre",
                        anchor = { x = 67, y = 0 }
                    }
                    entity.body = object.shape and { preshape = object.shape, type = "static", trigger = true }
                    entity.fruit = {
                        type = object.properties.fruit
                    }
                    entity.velocity = { z = 0 }
                else
                    entity.body = object.shape and { preshape = object.shape, type = "static" }
                end

                table.insert(self.entities, entity)
                entity.id = #self.entities
            else
                print("unknown object gid!", data.gid)
            end
        end
    end
end

function Game:exit()
    self.physics:destroy()
    self.physics = nil
end

function Game:update(dt)
    for _, entity in ipairs(self.entities) do

        self.physics:update(dt)

        if entity.body and not entity.physics then
            local body = love.physics.newBody(self.physics, entity.pos.x, entity.pos.y, entity.body.type)
            body:setLinearDamping(groundDamping)
            body:setUserData(entity)
            local shape
            if entity.body.shape == "circle" then
                shape = love.physics.newCircleShape(entity.body.size / 2)
            elseif entity.body.preshape then
                shape = entity.body.preshape
            end
            local fixture = love.physics.newFixture(body, shape, 1)
            if entity.body.trigger then
                fixture:setSensor(true)
            end

            entity.physics = {
                body = body,
                shape = shape,
                fixture = fixture
            }
        end

        if entity.input then
            entity.actions = actions
        end

        if entity.actor then
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
                                fruitEntity.velocity.z = -fruitJumpSpeed * jumpMultiplier
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
            end
            if entity.actions.movement.angle and entity.physics then
                if not (entity.fruitStack.eating and entity.pos.onGround) and not entity.actions.prejump then
                    local dx = entity.actor.walkSpeed * math.cos(entity.actions.movement.angle) * dt * speedMultiplier
                    local dy = entity.actor.walkSpeed * math.sin(entity.actions.movement.angle) * dt * speedMultiplier
                    entity.physics.body:applyForce(dx, dy)
                    entity.physics.body:setAngle(entity.actions.movement.angle)
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
                    entity.velocity.z = entity.velocity.z - entity.actor.jumpSpeed * jumpMultiplier
                    entity.pos.onGround = false
                end
                if entity.actions.prejump and entity.pos.onGround then
                    entity.anim.name = "squish"
                elseif not entity.pos.onGround then
                    entity.anim.name = "jump"
                elseif not entity.actions.movement.angle then
                    entity.anim.name = "idle"
                end
            end
        end

        if entity.physics then
            entity.pos.x, entity.pos.y = entity.physics.body:getWorldCenter()
            if entity.velocity then
                entity.velocity.z = (entity.velocity.z + g * dt) * airFriction
                entity.pos.z = entity.pos.z + entity.velocity.z
                local wasOnGround = false
                entity.pos.onGround = entity.pos.z >= 0
                if entity.pos.onGround then
                    entity.pos.z = 0
                    entity.velocity.z = 0
                end
            end
        end

        if entity.fruit and entity.fruit.animFrames then
            local offset = entity.fruit.stackEntity.fruitStack and firstFruitOffset or fruitOffset
            local targetX = entity.fruit.stackEntity.pos.x + offset.x
            local targetY = entity.fruit.stackEntity.pos.y + offset.y
            local targetZ = entity.fruit.stackEntity.pos.z + offset.z

            if entity.fruit.animFrames > 0 then
                local p = entity.fruit.animFrames / fruitPickupAnimFrames
                entity.physics.body:setPosition(
                    entity.pos.x * p + targetX * (1 - p),
                    entity.pos.y * p + targetY * (1 - p))
                entity.fruit.animFrames = entity.fruit.animFrames - 1
                if entity.pos.z < targetZ then
                    entity.fruit.reachedStack = true
                end
            else
                entity.physics.body:setPosition(
                    entity.pos.x * (1 - fruitPickupForce) + targetX * fruitPickupForce,
                    entity.pos.y * (1 - fruitPickupForce) + targetY * fruitPickupForce)
            end
            if (entity.fruit.animFrames <= 0 or entity.fruit.reachedStack) and entity.pos.z > targetZ then
                entity.pos.z = targetZ
                entity.velocity.z = 0
            end
        end

        if entity.anim then
            entity.anim.time = entity.anim.time + dt
            if entity.anim.name ~= entity.anim.prevName then
                entity.anim.time = 0
                entity.anim.finished = false
                entity.anim.prevName = entity.anim.name
            end
        end

        if entity.camera then
            self.camera.x = entity.pos.x
            self.camera.y = entity.pos.y
        end
    end

    for i = #self.entities, 1, -1 do
        if self.entities[i].toRemove then
            table.remove(self.entities, i)
        end
    end

    table.sort(self.entities,
        function (a, b)
            if math.abs(a.pos.y - b.pos.y) < 0.1 then
                if math.abs(a.pos.z - b.pos.z) < 0.1 then
                    return a.id < b.id
                end
                return a.pos.z > b.pos.z
            end
            return a.pos.y < b.pos.y
        end)
end

function Game:render()
    local w, h = love.graphics.getDimensions()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(0.33)
    love.graphics.translate(-self.camera.x * METER_SCALE, -self.camera.y * METER_SCALE)
    love.graphics.clear(0.2, 0.5, 0.4)

    self.batch:clear()
    for _, layer in ipairs(self.map.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks) do
                for i, tile in ipairs(chunk.data) do
                    if tile > 0 then
                        local og = tile
                        local flipX = bit.band(tile, TILE_FLIP_H) ~= 0
                        local flipY = bit.band(tile, TILE_FLIP_V) ~= 0
                        tile = bit.band(tile, TILE_ID_MASK) - self.map.tilesetFirstGid
                        local tx = layer.x + chunk.x + ((i - 1) % chunk.width)
                        local ty = layer.y + chunk.y + math.floor((i - 1) / chunk.width)
                        local x = (tx - ty - 1) * self.map.tilewidth / 2
                        local y = (tx + ty) * self.map.tileheight / 2
                        if not tileset.tiles[tile] then
                            print("Unknown tile gid!", tile, og)
                        end
                        self.batch:add(
                            tileset.tiles[tile],
                            x + self.map.tilewidth / 2,
                            y,
                            0,
                            flipX and -1 or 1,
                            flipY and -1 or 1,
                            self.map.tilewidth / 2,
                            self.map.tileheight / 2)
                    end
                end
            end
        end
    end
    love.graphics.draw(self.batch, 0, 0)

    love.graphics.setBlendMode("multiply", "premultiplied")
    for _, entity in ipairs(self.entities) do
         if entity.shadow then
            love.graphics.draw(
                textures[entity.shadow.name],
                entity.pos.x * METER_SCALE,
                entity.pos.y * METER_SCALE,
                0,
                math.pow(1 / math.max(-entity.pos.z, 1), 1/4),
                math.pow(1 / math.max(-entity.pos.z, 1), 1/4),
                entity.shadow.anchor.x,
                entity.shadow.anchor.y)
         end
    end
    love.graphics.setBlendMode("alpha")

    for _, entity in ipairs(self.entities) do
        if entity.sprites then
            for _, sprite in ipairs(entity.sprites) do
                local spriteData = sprites[sprite.name]
                if spriteData then
                    local animData = findAnim(spriteData, entity.anim)

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
                        entity.pos.x * METER_SCALE,
                        (entity.pos.y + entity.pos.z) * METER_SCALE,
                        0,
                        (sprite.flipX and - 1 or 1) * (animData.flipX and -1 or 1),
                        (sprite.flipY and - 1 or 1) * (animData.flipY and -1 or 1),
                        sprite.anchor.x,
                        sprite.anchor.y)
                else
                    love.graphics.draw(
                        textures[sprite.name],
                        entity.pos.x * METER_SCALE,
                        (entity.pos.y + entity.pos.z) * METER_SCALE,
                        0,
                        sprite.flipX and -1 or 1,
                        sprite.flipY and -1 or 1,
                        sprite.anchor.x,
                        sprite.anchor.y)
                end
            end
        end
    end
end

function Game:onBeginContact(fix1, fix2, contact)
    local entity1 = fix1:getBody():getUserData()
    local entity2 = fix2:getBody():getUserData()

    local fruitStackEntity = (entity1.fruitStack and entity1) or (entity2.fruitStack and entity2)
    local fruitEntity = (entity1.fruit and entity1) or (entity2.fruit and entity2)

    if fruitStackEntity and fruitEntity and not fruitEntity.fruit.stackEntity then
        table.insert(fruitStackEntity.fruitStack.fruits, fruitEntity)
        fruitEntity.fruit.stackEntity = #fruitStackEntity.fruitStack.fruits > 1 and
            fruitStackEntity.fruitStack.fruits[#fruitStackEntity.fruitStack.fruits - 1] or
            fruitStackEntity
        fruitEntity.fruit.animFrames = fruitPickupAnimFrames
        fruitEntity.velocity.z = -fruitJumpSpeed * math.pow(#fruitStackEntity.fruitStack.fruits, 1/3) * jumpMultiplier
    end
end

function findAnim(spriteData, entityAnim)
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

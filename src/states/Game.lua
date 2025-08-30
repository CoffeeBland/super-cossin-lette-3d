local g = 3
local airFriction = 0.975
local groundDamping = 64
local jumpMultiplier = 0.5
local speedMultiplier = 64 / 4
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
    self.map = require("maps/map1")
    self.batch = love.graphics.newSpriteBatch(textures.tileset)
    self.entities = {
        {
            input = true,
            camera = true,
            actor = { walkSpeed = 1.5, jumpSpeed = 1.6 },
            pos = { x = 0, y = 0, z = 0 },
            velocity = { z = 0 },
            body = { shape = "circle", size = 1, type = "dynamic" },
            anim = {
                name = "walk",
                dir = "tr",
                time = 0
            },
            sprites = {
                {
                    name = "cossin.corps",
                    anchor = { x = 96, y = 236 }
                }
            },
            shadow = {
                name = "cossinOmbre",
                anchor = { x = -96, y = -32 }
            }
        }
    }

    local mapObjectsByGid = {}
    for _, data in ipairs(self.map.tilesets) do
        if data.name == "objects" then
            for i, object in pairs(objects.byId) do
                mapObjectsByGid[data.firstgid + i] = object.id
            end
        end
    end

    for _, layer in ipairs(self.map.layers) do
        for _, data in ipairs(layer.objects or {}) do
            local object = objects.byId[mapObjectsByGid[data.gid]]

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
                        anchor = { x = object.offsetX, y = object.offsetY }
                    }
                },
                body = object.shape and { preshape = object.shape, type = "static" }
            }
            table.insert(self.entities, entity)
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
            local shape
            if entity.body.shape == "circle" then
                shape = love.physics.newCircleShape(entity.body.size / 2)
            elseif entity.body.preshape then
                shape = entity.body.preshape
            end
            local fixture = love.physics.newFixture(body, shape, 1)

            entity.physics = {
                body = body,
                shape = shape,
                fixture = fixture
            }
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

        if entity.camera then
            self.camera.x = entity.pos.x
            self.camera.y = entity.pos.y
        end

        if entity.anim then
            entity.anim.time = entity.anim.time + dt
        end

        if entity.input then
            entity.actions = actions
        end

        if entity.actor then
            if entity.actions.jump and entity.pos.onGround then
                entity.velocity.z = entity.velocity.z - entity.actor.jumpSpeed * jumpMultiplier
                entity.pos.onGround = false
            end
            if entity.actions.movement.angle and entity.pos.onGround and entity.physics then
                local dx = entity.actor.walkSpeed * math.cos(entity.actions.movement.angle) * dt * speedMultiplier
                local dy = entity.actor.walkSpeed * math.sin(entity.actions.movement.angle) * dt * speedMultiplier
                entity.physics.body:applyForce(dx, dy)
                entity.physics.body:setAngle(entity.actions.movement.angle)

                if entity.anim then
                    -- RIP
                    local a = math.floor(entity.actions.movement.angle / math.pi * 4 + 0.5) + 4
                    entity.anim.dir = dirs[a];
                    entity.anim.name = "walk"
                end
            end
            if not entity.actions.movement.angle and entity.anim then
                entity.anim.name = "walk" -- should be idle.
            end
        end

        if entity.physics then
            entity.physics.body:setLinearDamping(entity.pos.onGround and groundDamping or 0)
        end
    end

    table.sort(self.entities,
        function (a, b)
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
                        local tx = layer.x + chunk.x + ((i - 1) % chunk.width)
                        local ty = layer.y + chunk.y + math.floor((i - 1) / chunk.width)
                        local x = (tx - ty - 1) * self.map.tilewidth / 2
                        local y = (tx + ty) * self.map.tileheight / 2
                        self.batch:add(tileset.tiles[tile], x, y)
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
                entity.pos.x * METER_SCALE + entity.shadow.anchor.x,
                entity.pos.y * METER_SCALE + entity.shadow.anchor.y)
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
                        animData.flipX and -1 or 1,
                        1,
                        sprite.anchor.x,
                        sprite.anchor.y)
                else
                    love.graphics.draw(
                        textures[sprite.name],
                        entity.pos.x * METER_SCALE,
                        (entity.pos.y + entity.pos.z) * METER_SCALE,
                        0,
                        1,
                        1,
                        sprite.anchor.x,
                        sprite.anchor.y)
                end
            end
        end
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

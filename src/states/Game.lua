local g = 3
local airFriction = 0.975
local meterScale = 128
local groundDamping = 64
local jumpMultiplier = 0.5
local speedMultiplier = groundDamping / 4
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
    self.entities = {
        {
            input = true,
            --camera = true,
            actor = { walkSpeed = 1, jumpSpeed = 1 },
            pos = { x = 0, y = 0, z = 0 },
            velocity = { z = 0 },
            body = { shape = "circle", size = 1 },
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
end

function Game:exit()
    self.physics:destroy()
    self.physics = nil
end

function Game:update(dt)
    for _, entity in ipairs(self.entities) do

        self.physics:update(dt)

        if entity.body and not entity.physics then
            local body = love.physics.newBody(self.physics, entity.pos.x, entity.pos.y, "dynamic")
            local shape
            if entity.body.shape == "circle" then
                shape = love.physics.newCircleShape(entity.body.size / 2)
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
            entity.velocity.z = (entity.velocity.z + g * dt) * airFriction
            entity.pos.z = entity.pos.z + entity.velocity.z
            local wasOnGround = false
            entity.pos.onGround = entity.pos.z >= 0
            if entity.pos.onGround then
                entity.pos.z = 0
                entity.velocity.z = 0
            end

            if entity.physics then
                entity.physics.body:setLinearDamping(entity.pos.onGround and groundDamping or 0)
            end
        end

        if entity.camera then
            self.camera.x = entity.pos.x
            self.camera.y = entity.pos.y + entity.pos.z
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
    end

    table.sort(self.entities,
        function (a, b)
            return a.pos.y + a.pos.z > b.pos.y + b.pos.z
        end)
end

function Game:render()
    local w, h = love.graphics.getDimensions()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.translate(-self.camera.x, -self.camera.y)
    love.graphics.scale(0.33)
    love.graphics.clear(0.2, 0.5, 0.4)

    love.graphics.setBlendMode("multiply", "premultiplied")
    for _, entity in ipairs(self.entities) do
         if entity.shadow then
            love.graphics.draw(
                textures[entity.shadow.name],
                entity.pos.x * meterScale + entity.shadow.anchor.x,
                entity.pos.y * meterScale + entity.shadow.anchor.y)
         end
    end
    love.graphics.setBlendMode("alpha")

    for _, entity in ipairs(self.entities) do
        if entity.sprites then
            for _, sprite in ipairs(entity.sprites) do
                local spriteData = sprites[sprite.name]
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
                    entity.pos.x * meterScale,
                    (entity.pos.y + entity.pos.z) * meterScale,
                    0,
                    animData.flipX and -1 or 1,
                    1,
                    sprite.anchor.x,
                    sprite.anchor.y)
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

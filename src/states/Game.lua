local g = 6
local friction = 0.99
local meterScale = 128
local groundDamping = 64

Game = {}

function Game:enter()
    self.physics = love.physics.newWorld(0, 0, true)
    self.camera = { x = 0, y = 0 }
    self.entities = {
        {
            input = true,
            --camera = true,
            pos = { x = 0, y = 0, z = 0 },
            velocity = { z = 0 },
            body = { shape = "circle", size = 1 },
            anim = {
                name = "walkDownRight",
                time = 0
            },
            sprites = {
                {
                    name = "cossin.corps",
                    anchor = { x = -96, y = -160 }
                }
            },
            shadow = {
                name = "vieuxCossinShadow",
                anchor = { x = 0, y = 0 }
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
            entity.velocity.z = (entity.velocity.z + g * dt) * friction
            entity.pos.z = entity.pos.z + entity.velocity.z
            local wasOnGround = false
            entity.pos.onGround = entity.pos.z >= 0
            if entity.pos.onGround then
                entity.pos.z = 0
                if not wasOnGround then
                    entity.velocity.z = entity.velocity.z * -0.5
                else
                    entity.velocity.z = 0
                end
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
            entity.anim.time = entity.anim.time + 1
        end

        if entity.input then
            if actions.jump and entity.pos.onGround then
                entity.velocity.z = entity.velocity.z - 1
            end
            if actions.movement.angle and entity.pos.onGround then
                local dx = math.cos(actions.movement.angle) * dt * groundDamping
                local dy = math.sin(actions.movement.angle) * dt * groundDamping
                entity.physics.body:applyForce(dx, dy)
                entity.physics.body:setAngle(actions.movement.angle)
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

    for _, entity in ipairs(self.entities) do
         if entity.shadow then
            love.graphics.draw(
                textures[entity.shadow.name],
                entity.pos.x * meterScale + entity.shadow.anchor.x,
                entity.pos.y * meterScale + entity.shadow.anchor.y)
         end
    end

    for _, entity in ipairs(self.entities) do
        if entity.sprites then
            for _, sprite in ipairs(entity.sprites) do
                local spriteData = sprites[sprite.name]
                local animData = spriteData[entity.anim.name]

                -- Moi je trouve que Oui.
                local frame = math.floor(entity.anim.time / animData.framesByTile)
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
                    entity.pos.x * meterScale + sprite.anchor.x,
                    (entity.pos.y + entity.pos.z) * meterScale + sprite.anchor.y)
            end
        end
    end
end

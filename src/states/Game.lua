local g = 9.8
local friction = 0.01

Game = {}

function Game:enter()
    self.physics = love.physics.newWorld(0, 0, true)
    self.camera = { x = 0, y = 0 }
    self.entities = {
        {
            input = true,
            camera = true,
            pos = { x = 0, y = 0, z = 0 },
            velocity = { z = 0 },
            body = { shape = "circle", size = 1 },
            anim = {
                name = "idleLeft",
                frame = 1
            },
            sprites = {
                {
                    name = "vieuxCossin.corps",
                    anchor = { x = 0, y = -20 }
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
        if entity.physics then
            entity.pos.x, entity.pos.y = entity.physics:getPosition()
            entity.pos.z = (entity.pos.z + entity.velocity.z + g) / friction
        end
        if entity.camera then
            self.camera.x = entity.pos.x
            self.camera.y = entity.pos.y + entity.pos.z
        end
    end

    table.sort(self.entities,
        function (a, b)
            return a.pos.y + a.pos.z > b.pos.y + b.pos.z
        end)
end

function Game:render()
    love.graphics.translate(-self.camera.x, -self.camera.y)

    for _, entity in ipairs(self.entities) do
         if entity.shadow then
            love.graphics.draw(
                textures[entity.shadow.name],
                entity.pos.x + entity.shadow.anchor.x,
                entity.pos.y + entity.shadow.anchor.y)
         end
    end

    for _, entity in ipairs(self.entities) do
        if entity.sprites then
            for _, sprite in ipairs(entity.sprites) do
                local spriteData = sprites[sprite.name]
                love.graphics.draw(
                    textures[sprite.name],
                    spriteData[entity.anim.name].tiles[entity.anim.frame],
                    entity.pos.x + entity.shadow.anchor.x,
                    entity.pos.y + entity.pos.z + entity.shadow.anchor.y)
            end
        end
    end
end

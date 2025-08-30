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
                name = "walkDownRight",
                time = 0
            },
            sprites = {
                {
                    name = "cossin.corps",
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
        if entity.anim then
            entity.anim.time = entity.anim.time + 1
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
                    entity.pos.x + entity.shadow.anchor.x,
                    entity.pos.y + entity.pos.z + entity.shadow.anchor.y)
            end
        end
    end
end

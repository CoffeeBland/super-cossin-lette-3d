ImageSystem = {}
ImageSystem.__index = ImageSystem

function ImageSystem.new()
    return setmetatable({
        imagesById = {}
    }, ImageSystem)
end

local defaultOffset = { x = 0, y = 0 }
local defaultColor = { 1, 1, 1, 1 }
local defaultScale = { x = 1, y = 1 }

function ImageSystem:setImage(descriptor)
    if not descriptor.name then
        self.imagesById[descriptor.id] = nil
    else
        local offset = descriptor.offset or defaultOffset
        local color = descriptor.color or defaultColor
        local scale = descriptor.scale or defaultScale
        self.imagesById[descriptor.id] = {
            name = descriptor.name,
            offset = { x = offset.x, y = offset.y },
            color = { unpack(color) },
            scale = { x = scale.x, y = scale.y },
            larp = Larp.new()
        }
    end
end

function ImageSystem:update(framePart, dt, game)
    for _, image in pairs(self.imagesById) do
        image.larp:update(framePart, image)
    end
end

function ImageSystem:draw()
    love.graphics.push()
    love.graphics.translate(CURRES[1] / 2, CURRES[2] / 2)
    love.graphics.scale(SCALE_TO_EXPECTED)

    for _, image in pairs(self.imagesById) do
        love.graphics.setColor(unpack(image.color))
        local texture = textures[image.name]
        local tw, th = texture:getDimensions()
        love.graphics.draw(
            texture,
            image.offset.x,
            image.offset.y,
            0,
            image.scale.x,
            image.scale.y,
            tw / 2,
            th / 2)
    end
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.pop()
end

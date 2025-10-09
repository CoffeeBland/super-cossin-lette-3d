ImageSystem = {}
ImageSystem.__index = ImageSystem

function ImageSystem.new()
    return setmetatable({
        imagesById = {}
    }, ImageSystem)
end

function ImageSystem:setImage(descriptor)
    if not descriptor.name then
        self.imagesById[descriptor.id] = nil
    else
        self.imagesById[descriptor.id] = {
            name = descriptor.name,
            offset = descriptor.offset or { x = 0, y = 0 },
            color = descriptor.color or { 1, 1, 1, 1 },
            scale = descriptor.scale or { x = 1, y = 1 },
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
    local w, h = love.graphics.getDimensions()
    love.graphics.push()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(0.5)

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

ImageSystem = {}
ImageSystem.__index = ImageSystem

function ImageSystem.new()
    return setmetatable({
        imagesById = {},
        text = nil
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

function ImageSystem:setText(descriptor)
    self.text = descriptor.text and
        descriptor.text:gsub("\n", " "):gsub("%s%s+", " "):match("^%s*(.*)%s*$") or
        nil
end

function ImageSystem:update(framePart, dt, game)
    for _, image in pairs(self.imagesById) do
        image.larp:update(framePart, image)
    end
end

function ImageSystem:draw()
    local w, h = CURRES[1], CURRES[2]

    love.graphics.push()
    love.graphics.translate(w / 2, h / 2)
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

    if self.text then
        love.graphics.push()
        love.graphics.setFont(fonts.title)
        love.graphics.translate(w / 2, h)
        local fontHeight = fonts.menu:getHeight()
        local hmargin = Game.constants.subtitle.hmargin * SCALE_TO_EXPECTED
        local vmargin = Game.constants.subtitle.vmargin * SCALE_TO_EXPECTED
        local textWidth = w - hmargin * 2
        local textHeight = fontHeight * 3

        love.graphics.setBlendMode("multiply", "premultiplied")
        love.graphics.setColor(Game.constants.pauseColor)
        love.graphics.rectangle("fill",
            -w/2,
            -textHeight - vmargin * 2,
            w,
            textHeight + vmargin * 2)
        love.graphics.setBlendMode("add")
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.printf(self.text,
            -textWidth / 2,
            -textHeight - vmargin,
            textWidth,
            "center")

        love.graphics.setBlendMode("alpha")
        love.graphics.pop()
    end
end

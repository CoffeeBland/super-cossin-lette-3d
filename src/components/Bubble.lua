Bubble = {}
Bubble.__index = Bubble

function Bubble.new(bubble)
    bubble = bubble or {}
    bubble.textFrames = 0
    return setmetatable(bubble, Bubble)
end

function Bubble:draw()
    love.graphics.translate(
        self.anchor.x,
        self.anchor.y)
    love.graphics.draw(
        textures.Bubble,
        Game.constants.bubble.offset.x, Game.constants.bubble.offset.y, -- pos
        0, -- rotation
        1, 1, -- scale
        textures.Bubble:getWidth() / 2,
        textures.Bubble:getHeight() / 2)

    local iconStart = Game.constants.bubble.width / 2
    local iconPart = Game.constants.bubble.width / #(self.text / 2)
    for i = 1, self.textIndex do
        local icon = self.text[i * 2]
        love.graphics.draw(
            textures.Bubble_icons,
            Game.constants.icons.byName[icon],
            i, 0, -- pos,
            0, -- rot,
            1, 1, -- scale,
            Game.constants.icons.size.w / 2, Game.constants.icons.size.h / 2)
    end

    for i, icon in ipairs(self.icons) do
    end
end

function Bubble:show(text)
    self.text = text
    self.textIndex = 0
    self.textFrames = self.text[1]
end

function Bubble:update(framePart)
    if self.textFrames > 0 then
        self.textFrames = math.max(self.textFrames - framePart, 0)
        if self.textFrames == 0 then
        end
    end
end

Bubble = {}
Bubble.__index = Bubble

function Bubble.new(bubble)
    bubble = bubble or {}
    bubble.textIndex = 0
    bubble.textFrames = nil
    return setmetatable(bubble, Bubble)
end

function Bubble:draw()
    if not self.text then
        return
    end

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

    local n = #self.text / 2

    local iconStart = 0
    local iconPart = 0
    local space = Game.constants.bubble.width - Game.constants.icons.size.w * n
    if space < 0 then
        iconStart = (-Game.constants.bubble.width + Game.constants.icons.size.w) / 2
        iconPart = (Game.constants.bubble.width - Game.constants.icons.size.w) / (n - 1)
    end

    for i = 1, self.textIndex or 0 do
        local icon = self.text[i * 2]
        love.graphics.draw(
            textures.Bubble_icons,
            Game.constants.icons.byName[icon],
            iconStart + iconPart * (i - 1), 0, -- pos,
            0, -- rot,
            1, 1, -- scale,
            Game.constants.icons.size.w / 2, Game.constants.icons.size.h / 2)
    end
end

function Bubble:show(text, anim)
    self.text = text
    self.textIndex = 0
    self.textFrames = nil
    anim:trigger("speak:start")
end

function Bubble:update(framePart, anim)
    if not self.text then
        return
    end

    if self.textFrames and self.textFrames > 0 then
        self.textFrames = math.max(self.textFrames - framePart, 0)
        if self.textFrames == 0 then
            if self.textIndex < #self.text / 2 then
                self.textIndex = self.textIndex + 1
                self.textFrames = self.text[self.textIndex * 2 + 1] or Game.constants.bubble.lingerFrames
                anim:trigger("speak")
            else
                self.text = nil
                self.textIndex = 0
                self.textFrames = nil
                anim:trigger("speak:finished")
            end
        end
    elseif self.textIndex < #self.text / 2 then
        self.textFrames = self.text[self.textIndex * 2 + 1]
    end
end

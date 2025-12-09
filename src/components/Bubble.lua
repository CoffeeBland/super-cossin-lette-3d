Bubble = {}
Bubble.__index = Bubble
fancyTypes.bubble = Bubble

local emptyAnchor = { x = 0, y = 0 }

function Bubble.new(params)
    params = params or EMPTY
    local instance = setmetatable({}, Bubble)
    instance.anchor = params.anchor or emptyAnchor
    instance.text = {}
    instance.textIndex = 0
    instance.textLen = 0
    instance.textFrames = nil
    return instance
end

function Bubble:draw(entity)
    if self.textLen == 0 then
        return
    end

    local n = self.textLen

    local iconStart = 0
    local textWidth = 0
    for i = 1, n do
        local icon = self.text[i * 2]
        local iconWidth = Game.constants.icons.byName[icon].width
        if iconStart == 0 then
            iconStart = -iconWidth / 2
        end
        textWidth = textWidth + iconWidth
    end

    local def = Game.constants.bubble
    local iconStart = iconStart - textWidth / 2
    local segments = (textWidth + def.padding) / def.segment.w
    segments = math.ceil(segments)
    local bgWidth = segments * def.segment.w
    local bgHeight = def.segment.h

    local scaleY = (entity.anim and entity.anim.wiggle.y or 1)
    love.graphics.translate(
        self.anchor.x,
        self.anchor.y - entity.pos.height * scaleY)

    love.graphics.draw(
        textures.Bubble,
        def.bg.left.quad,
        0,
        0,
        0, 1, 1,
        bgWidth / 2,
        bgHeight / 2)

    love.graphics.draw(
        textures.Bubble,
        def.bg.right.quad,
        bgWidth - def.segment.w,
        0,
        0, 1, 1,
        bgWidth / 2,
        bgHeight / 2)

    local halfw = def.segment.w / 2
    for i = 2, segments - 1 do
        love.graphics.draw(
            textures.Bubble,
            def.bg.segments.quads[i - 1],
            i * halfw,
            0,
            0, 1, 1,
            bgWidth / 2,
            bgHeight / 2)
        love.graphics.draw(
            textures.Bubble,
            def.bg.segments.quads[#def.bg.segments.quads - i + 2],
            bgWidth - (i + 1) * halfw,
            0,
            0, 1, 1,
            bgWidth / 2,
            bgHeight / 2)
    end

    love.graphics.draw(
        textures.Bubble,
        def.guedille.quad,
        0 + def.guedille.offset.x,
        0 + def.guedille.offset.y,
        0, 1, 1,
        def.segment.w / 2,
        bgHeight / 2)

    local x = -textWidth / 2
    for i = 1, self.textIndex or 0 do
        local icon = self.text[i * 2]
        local iconData = Game.constants.icons.byName[icon]
        x = x + iconData.width / 2
        love.graphics.draw(
            textures.Bubble_icons,
            iconData.quad,
            x, 0, -- pos,
            0, -- rot,
            1, 1, -- scale,
            Game.constants.icons.size.w / 2, Game.constants.icons.size.h / 2)
        x = x + iconData.width / 2
    end
end

local digits = {}

function Bubble:show(game, text, anim)
    if self.textLen ~= 0 then
        self.nextText = text
        return
    end

    local i = 0
    while i < #text / 2 do
        local iconName = text[i * 2 + 2]
        local duration = text[i * 2 + 1]
        local value = game:eval(iconName)
        if value and type(value) == "number" then
            local foundNonZero
            -- Only support up to 3 digits, more is silly.
            -- Also we laaaaaaazy.
            for j = 3, 1, -1 do
                local unit = 10 ^ (j - 1)
                local next = 10 ^ j
                local digit = math.floor((value % next) / unit)
                if digit ~= 0 or foundNonZero or j == 1 then
                    foundNonZero = true
                    i = i + 1
                    self.text[i * 2 - 1] = duration
                    self.text[i * 2] = tostring(digit)
                end
            end
        else
            i = i + 1
            self.text[i * 2 - 1] = duration
            self.text[i * 2] = iconName
        end
    end
    self.textLen = i
    self.textIndex = 0
    self.textFrames = self.text[1]
    anim:trigger("speak:start")
end

function Bubble:update(framePart, game, anim)
    if self.textLen == 0 then
        return
    end

    self.textFrames = math.max(self.textFrames - framePart, 0)
    if self.textFrames == 0 then
        if self.textIndex < self.textLen then
            self.textIndex = self.textIndex + 1
            self.textFrames = self.textIndex < self.textLen and
                self.text[self.textIndex * 2 - 1] or
                Game.constants.bubble.lingerFrames
            anim:trigger("speak")
        else
            self.textLen = 0
            self.textIndex = 0
            self.textFrames = nil
            anim:trigger("speak:finished")
            if self.nextText then
                self:show(game, self.nextText, anim)
            end
            self.nextText = nil
        end
    end
end

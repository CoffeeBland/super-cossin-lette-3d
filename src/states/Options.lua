Options = {
    values = {},
    actionFrames = 0
}

local actionCooldown = 15

local options = {
    {
        name = "fullscreen",
        text = "PLEIN ÉCRAN",
        type = "toggle",
        default = false,
        apply = function(value)
            love.window.setFullscreen(value)
        end
    },
    {
        name = "vsync",
        text = "VSYNC",
        type = "toggle",
        default = true,
        apply = function(value)
            love.window.setVSync(value)
        end
    },
    {
        name = "sound",
        text = "SOUND",
        type = "range",
        default = 100,
        range = { 0, 100, 10 }
    },
    {
        name = "music",
        text = "MUSIC",
        type = "range",
        default = 100,
        range = { 0, 100, 10 }
    },
    {
        name = "ok",
        text = "OK",
        type = "button",
        action = function()
            StateMachine:pop(Options)
        end
    }
}

for i, option in ipairs(options) do
    options[option.name] = option
end

function Options:readini()
    local contents = love.filesystem.read("config.ini")
    contents = contents or ""

    local config = {}
    local lines = str.split(contents, "\n")
    for _, line in ipairs(lines) do
        local key, value = line:match"%s*(%w+)%s*=%s*(%w+)"
        local option = options[key]
        if option then
            if option.type == "range" then
                config[key] = math.clamp(math.parse(value), option.range[1], option.range[2])
            elseif option.type == "toggle" then
                config[key] = value == "true"
            end
        end
    end

    for _, option in ipairs(options) do
        if config[option.name] ~= nil then
            self.values[option.name] = config[option.name]
        else
            self.values[option.name] = option.default
        end
    end
end

function Options:writeini()
    local str = ""
    for _, option in ipairs(options) do
        local value
        if option.type == "toggle" then
            value = self.values[option.name] and "true" or "false"
        elseif option.type == "range" then
            value = self.values[option.name]
        end
        if value ~= nil then
            str = str .. option.name .. " = " .. value .. "\n"
        end
    end
    love.filesystem.write("config.ini", str)
    self.dirty = false
end

function Options:apply()
    for _, option in ipairs(options) do
        if option.apply then
            option.apply(Options.values[option.name])
        end
    end
end

function Options:enter(params)
    self.idx = 1
    if Music.current then
        Music.current:setFilter(Game.constants.music.filters.pause)
    end
end

function Options:exit()
    if self.dirty then
        self:writeini()
    end
    -- This condition is bad and you should feel bad.
    if Music.current and StateMachine.current ~= Game then
        Music.current:setFilter()
    end
end

function Options:update(dt)
    if actions.escape then
        Sound:start(Sound.global.act)
        StateMachine:pop(self)
    end

    local option = options[self.idx]

    if actions.move then
        if actions.menu.y ~= 0 then
            local newOptionIdx = math.wrap(self.idx + actions.menu.y, 1, #options)
            if newOptionIdx ~= self.idx then
                self.idx = newOptionIdx;
                Sound:start(actions.menu.y < 0 and Sound.global.up or Sound.global.down)
            end
        end
    end

    if actions.move or actions.action then
        self.actionFrames = 0
    end

    self.actionFrames = math.max(self.actionFrames - 1, 0)

    if (actions.action or actions.menu.x ~= 0) and self.actionFrames == 0 then
        local dir = actions.menu.x ~= 0 and actions.menu.x or 1
        if option.range then
            self:set(option.name, dir * option.range[3])
        elseif actions.action or actions.move then
            -- No auto-repeat for non-ranges
            self:set(option.name, dir)
        end
        self.actionFrames = actionCooldown
    end
end

function Options:set(name, value)
    Sound:start(Sound.global.act)
    local option = options[name]
    if option.type == "range" then
        value = math.clamp(self.values[name] + value, option.range[1], option.range[2])
    elseif option.type == "toggle" then
        value = not self.values[name]
    elseif option.type == "button" then
        option.action()
        return
    end

    self.values[name] = value
    if option.apply then
        option.apply(value)
    end
    self.dirty = true
end

function Options:render()
    local w, h = CURRES[1], CURRES[2]
    love.graphics.setColor(unpack(Game.constants.pauseColor))
    love.graphics.setBlendMode("multiply", "premultiplied")
    love.graphics.rectangle("fill", 0, 0, w, h)
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.push()
    love.graphics.translate(w / 2, h / 2)

    love.graphics.setFont(fonts.menu)
    love.graphics.setBlendMode("add")


    local hmargin = Game.constants.options.hmargin * SCALE_TO_EXPECTED
    local vmargin = fonts.menu:getHeight() + Game.constants.options.vmargin * SCALE_TO_EXPECTED
    local height = fonts.menu:getHeight() * (#options + 1) + vmargin * #options
    local base = Game.constants.options.base * SCALE_TO_EXPECTED
    local y = (fonts.menu:getHeight() - height) / 2
    love.graphics.printf("OPTIONS", -(base + hmargin / 2), y, base, "right")
    y = y + vmargin
    for i, option in ipairs(options) do
        love.graphics.setColor(unpack(i == self.idx and
            Game.constants.pause.buttonActive or
            Game.constants.pause.buttonInactive))
        love.graphics.printf(option.text, - (base + hmargin / 2), y, base, "right")
        local value
        if option.type == "toggle" then
            value = self.values[option.name] and "OUI" or "NON"
        elseif option.type == "range" then
            value = self.values[option.name] .. ""
            local n = #value + 1
            for i = n, 3 do
                value = "  " .. value
            end
        end
        if value then
            love.graphics.printf(value, hmargin / 2, y, base, "left")
        end
        y = y + vmargin
    end
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.pop()
end

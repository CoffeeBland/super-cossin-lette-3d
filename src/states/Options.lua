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
        end,
        spaceAfter = true
    },
    {
        name = "sound",
        text = "SON",
        type = "range",
        default = 100,
        range = { 0, 100, 10 },
        apply = function(value)
            for name, sound in pairs(Sound.playing) do
                sound.source:setVolume(sound.currentVolume * Game.constants.sound.volume * Options.values.sound / 100)
            end
        end
    },
    {
        name = "music",
        text = "MUSIQUE",
        type = "range",
        default = 100,
        range = { 0, 100, 10 },
        spaceAfter = true
    },
    {
        name = "arcade",
        text = "CONTRÔLES ARCADE",
        type = "toggle",
        default = false,
        apply = function(value)
            setupActions()
            load.loadData("cossin", "data/cossin.lua")
            load.loadData("cossin", "data/gameConstants.lua")
            if StateMachine.current == Game and Game.map then
                Game.pause.active = false
                Game:refresh(true)
            end
            if StateMachine.current == Title then
                StateMachine:change(Title, nil, { fadein = 15, fadeout = 15 })
            end
        end
    },
    {
        name = "brun",
        text = "BRUN",
        type = "toggle",
        default = false,
        apply = function(value)
            if Music.current then
                Music.current:setEffect("brun", value)
            end
        end,
        spaceAfter = true
    },
    {
        name = "debug",
        text = "DEBUG",
        type = "range",
        default = 0,
        range = { 0, 6, 1 },
        getPrintableValue = function(value)
            if value == 0 then
                return "NON"
            elseif value == 1 then
                return "FPS"
            elseif value == 2 then
                return "COLLISIONS"
            elseif value == 3 then
                return "HAUTEUR TUILES"
            elseif value == 4 then
                return "HAUTEUR PIXEL"
            elseif value == 5 then
                return "OMBRES"
            elseif value == 6 then
                return "RÉFLECTIONS"
            end
        end,
        apply = function(value)
            dbg.physics = value == 2
            dbg.pointHeights = value == 3
            dbg.heightMap = value == 4
            dbg.shadowMap = value == 5
            dbg.reflectionMap = value == 6
            dbg.fps = value >= 1
            dbg.autorefresh = value > 0
            love.timer.measure = value > 0 and
                function (startTime, context)
                    if Options.values.debug == 0 then
                        return
                    end
                    local endTime = love.timer.getTime()
                    local ms = tostring(math.round((endTime - startTime) * 1000))
                    while #ms < 4 do
                        ms = " " .. ms
                    end
                    print(ms, context)
                    return endTime
                end or
                function()
                end

            actions.toggleDebug = false
        end,
        spaceAfter = true
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

function Options:getPrintableValue(option)
    if option.getPrintableValue then
        return option.getPrintableValue(self.values[option.name])
    elseif option.type == "toggle" then
        return self.values[option.name] and "OUI" or "NON"
    elseif option.type == "range" then
        value = self.values[option.name] .. ""
        local n = #value + 1
        for i = n, 3 do
            value = "  " .. value
        end
        return value
    end
end

function Options.isOptionItem(item)
    return item.option
end

function Options:enter(params)
    if Music.current then
        Music.current:setFilter(Game.constants.music.filters.pause)
    end

    self.items = {{ text = "OPTIONS", active = true }, {}}
    for i, option in ipairs(options) do
        table.insert(self.items, {
            text = option.text,
            value = self:getPrintableValue(option),
            option = option
        })
        if option.spaceAfter then
            table.insert(self.items, {})
        end
    end

    self.idx = menu.newIdx(0, self.items, 1, Options.isOptionItem)
    self.scroll = 0
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
    if actions.start or actions.back then
        Sound:start(Sound.global.act)
        StateMachine:pop(self)
    end

    local option = self.items[self.idx].option

    if actions.move then
        if actions.menu.y ~= 0 then
            local newIdx = menu.newIdx(self.idx, self.items, actions.menu.y, Options.isOptionItem)
            if newIdx ~= self.idx then
                self.idx = newIdx
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
            Sound:start(Sound.global.act)
            self:set(option.name, dir * option.range[3])
        elseif actions.action or actions.move then
            -- No auto-repeat for non-ranges
            Sound:start(Sound.global.act)
            self:set(option.name, dir)
        end
        self.actionFrames = actionCooldown
    end
end

function Options:set(name, value)
    local option = options[name]
    if option.type == "range" then
        local s = option.range[1]
        local n = option.range[2] - option.range[1] + option.range[3]
        value = (self.values[name] + value - s) % n + s
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

function Options:render(dt)
    for i, item in ipairs(self.items) do
        if item.option then
            item.value = self:getPrintableValue(item.option)
        end
    end

    local w, h = CURRES[1], CURRES[2]
    love.graphics.setColor(unpack(Game.constants.pauseColor))
    love.graphics.setBlendMode("multiply", "premultiplied")
    love.graphics.rectangle("fill", 0, 0, w, h)
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)

    menu.draw(self.idx, self.scroll, self.items, w, h, dt)
end

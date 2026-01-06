PauseSystem = {}
PauseSystem.__index = PauseSystem

function PauseSystem.new(showSkip, showRestart)
    local texture = textures.Pause
    local instance = setmetatable({
        active = false,
        time = 0,
        letters = {},
        btnIdx = 1
    }, PauseSystem)
    for i, letterdef in ipairs(Game.constants.pause.letters) do
        table.insert(instance.letters, {
            quad = love.graphics.newQuad(
                letterdef.quad[1],
                letterdef.quad[2],
                letterdef.quad[3],
                letterdef.quad[4],
                texture
            )
        })
    end

    local buttons = {
        {
            text = "OK",
            menuState = "ok",
            action = function()
                instance.active = false
            end
        },
        showRestart and {
            text = "REPIQUER LE NIQUE",
            menuState = "restart",
            action = function()
                Game:refresh(true)
            end
        },
        showSkip and {
            text = "PASSER",
            menuState = "skip",
            action = function(game)
                StateMachine:change(Game, { map = game.vars.nextMap })
            end
        },
        {
            text = "OPTIONS",
            menuState = "options",
            action = function()
                StateMachine:push(Options)
            end
        },
        {
            text = "SE RECOUCHER",
            menuState = "quit",
            action = function()
                StateMachine:change(Title)
            end
        }
    }

    instance.buttons = {}
    for _, btn in ipairs(buttons) do
        if btn then
            table.insert(instance.buttons, btn)
        end
    end

    return instance
end

function PauseSystem:update(framePart, dt, game)
    local start = false

    if actions ~= EMPTY then
        for _, actions in ipairs(playerActions) do
            start = start or actions.start or (self.active and actions.back)
        end
        if start then
            self.active = not self.active
            Sound:start(Sound.global.act)
            if Music.current then
                local filter = self.active and Game.constants.music.filters.pause or nil
                Music.current:setFilter(filter)
            end
            game.camera.blur = self.active and 3 or 0
            self.btnIdx = 1
        end
    end

    input.playerAddRemoveEnabled = self.active
    if self.active then
        self.time = self.time + framePart

        if actions.move then
            local newBtnIdx = math.wrap(self.btnIdx + actions.menu.any, 1, #self.buttons)
            if newBtnIdx ~= self.btnIdx then
                self.btnIdx = newBtnIdx;
                local button = self.buttons[self.btnIdx]
                Sound:start(actions.menu.any < 0 and Sound.global.up or Sound.global.down)
            end
        end

        if actions.action then
            Sound:start(Sound.global.act)
            local button = self.buttons[self.btnIdx]
            button.action(game)
        end

        Cossins:update(dt)
    end
end

function PauseSystem:draw()
    if not self.active then
        return
    end

    local w, h = CURRES[1], CURRES[2]

    love.graphics.setColor(unpack(Game.constants.pauseColor))
    love.graphics.setBlendMode("multiply", "premultiplied")
    love.graphics.rectangle("fill", 0, 0, w, h)
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)

    Cossins:draw()

    if #StateMachine.stack > 0 then
        return
    end

    love.graphics.push()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(SCALE_TO_EXPECTED)

    local lw = Game.constants.pause.letterWidth
    love.graphics.push()
    love.graphics.translate(
        Game.constants.pause.letterPos.x - lw * #self.letters / 2,
        Game.constants.pause.letterPos.y - Game.constants.pause.wave.amplitude / 2)
    for i, letter in ipairs(self.letters) do
        love.graphics.draw(
            textures.Pause,
            self.letters[i].quad,
            (i - 1) * lw,
            math.trigterp(
                self.time + (i - 1) * Game.constants.pause.wave.letterOffset,
                0,
                Game.constants.pause.wave.dur,
                Game.constants.pause.wave.amplitude),
            0,
            1,
            1,
            0,
            textures.Pause:getHeight())
    end

    love.graphics.pop()
    love.graphics.translate(
        Game.constants.pause.buttonPos.x,
        Game.constants.pause.buttonPos.y)
    love.graphics.scale(1 / SCALE_TO_EXPECTED)

    local margin = Game.constants.pause.buttonMargin * SCALE_TO_EXPECTED
    local buttonsWidth = (#self.buttons - 1) * margin
    for i, button in ipairs(self.buttons) do
        button.width = fonts.menu:getWidth(button.text)
        buttonsWidth = buttonsWidth + button.width
    end

    love.graphics.translate(-buttonsWidth / 2, 0)
    love.graphics.setFont(fonts.menu)
    love.graphics.setBlendMode("add")
    local x = 0
    for i, button in ipairs(self.buttons) do
        love.graphics.setColor(unpack(i == self.btnIdx and
            Game.constants.pause.buttonActive or
            Game.constants.pause.buttonInactive))
        love.graphics.print(button.text, x, 0)
        x = x + button.width + margin
    end
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.pop()
end

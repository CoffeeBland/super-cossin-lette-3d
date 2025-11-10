require "src.states.Intro"
require "src.states.Title"
require "src.states.MapIntro"
require "src.states.Game"
require "src.states.Options"

Exit = { fadein = 1, fadeout = 1 }
function Exit:enter() end
function Exit:exit() end
function Exit:update() love.event.quit() end
function Exit:render() end

StateMachine = {
    fadeOutFrames = 0,
    fadeInFrames = 0,
    fadeColor = { 0, 0, 0 },
    current = nil,
    stack = {}
}

function StateMachine:change(state, params, opts)
    while #self.stack > 0 do
        self:pop(self.stack[#self.stack])
    end
    if self.current then
        self.fadeOutFrames = (opts and opts.fadeout) or self.current.fadeout
        self.fadeInFrames = (opts and opts.fadein) or (state and state.fadein)
        self.fadeColor = (opts and opts.fadeColor) or (state and state.fadeColor) or { 0, 0, 0 }
        if self.fadeOutFrames > 0 or self.fadeInFrames > 0 then
            self.nextParams = params
            self.nextState = state
            return
        end
    end
    if self.current then
        self.current:exit()
    end
    self:slopLoad()
    self.current = state
    DISREGARD_NEXT_UPDATE = true
    self.current:enter(params)
    self.fadeOutFrames = 0
    self.fadeInFrames = 0
    self.nextParams = nil
    self.nextState = nil
end

function StateMachine:push(state, params)
    table.insert(self.stack, state)
    state:enter(params)
end

function StateMachine:pop(state)
    local idx = table.index(self.stack, state)
    if idx then
        state:exit()
        table.remove(self.stack, idx)
    end
end

function StateMachine:slopLoad()
    local time = 100
    while time > 0 do
        local before = love.timer.getTime()
        if not load.crawlFiles(nil, true) then
            time = 0
        end
        local after = love.timer.getTime()
        time = time - (after - before) * 1000
    end
end

function StateMachine:update(dt)
    local framePart = dt / (1 / 60)
    if self.nextState and self.fadeOutFrames == 0 then
        if self.current then
            self.current:exit()
        end
        for _, state in ipairs(self.stack) do
            state:exit()
        end
        self:slopLoad()
        self.current = self.nextState
        DISREGARD_NEXT_UPDATE = true
        self.current:enter(self.nextParams)
        self.nextParams = nil
        self.nextState = nil
    end
    if self.fadeOutFrames == 0 then
        local actualActions = actions
        for i = #self.stack, 1, -1 do
            self.stack[i]:update(dt)
            actions = EMPTY
        end
        if self.current then
            self.current:update(dt)
            actions = EMPTY
        end
        actions = actualActions
    end
    Music:update(dt)
    Sound:update(framePart, dt)
    if self.fadeOutFrames > 0 then
        self.fadeOutFrames = math.max(self.fadeOutFrames - framePart, 0)
        self.fadePart = 1 - self.fadeOutFrames / self.current.fadeout
    elseif self.fadeInFrames > 0 then
        self.fadeInFrames = math.max(self.fadeInFrames - framePart, 0)
        self.fadePart = self.fadeInFrames / self.current.fadein
    else
        self.fadePart = 0
    end
end

function StateMachine:render()
    if self.current then
        self.current:render()
    end
    for _, state in ipairs(self.stack) do
        state:render()
    end
    if self.fadePart ~= 0 then
        love.graphics.setColor(self.fadeColor[1], self.fadeColor[2], self.fadeColor[3], self.fadePart)
        love.graphics.rectangle("fill", 0, 0, CURRES[1], CURRES[2])
        love.graphics.setColor(1, 1, 1, 1)
    end
end

require "src.states.Intro"
require "src.states.Title"
require "src.states.MapIntro"
require "src.states.Game"

Exit = { fadein = 1, fadeout = 1 }
function Exit:enter() end
function Exit:exit() end
function Exit:update() love.event.quit() end
function Exit:render() end

StateMachine = {
    fadeOutFrames = 0,
    fadeInFrames = 0,
    fadeColor = { 0, 0, 0 }
}

function StateMachine:change(state, params)
    if self.current then
        self.fadeOutFrames = self.current.fadeout
        self.fadeInFrames = state and state.fadein
        self.fadeColor = state and state.fadeColor or { 0, 0, 0 }
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

function StateMachine:slopLoad()
    local time = 100
    while time > 0 and load.crawlFiles(nil, true) do
        time = time - love.timer.getTime()
    end
end

function StateMachine:update(dt)
    local framePart = dt / (1 / 60)
    if self.nextState and self.fadeOutFrames == 0 then
        if self.current then
            self.current:exit()
        end
        self:slopLoad()
        self.current = self.nextState
        DISREGARD_NEXT_UPDATE = true
        self.current:enter(self.nextParams)
        self.nextParams = nil
        self.nextState = nil
    end
    if self.current and self.fadeOutFrames == 0 then
        self.current:update(dt)
    end
    Music:update(dt)
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
    if self.fadePart ~= 0 then
        love.graphics.setColor(self.fadeColor[1], self.fadeColor[2], self.fadeColor[3], self.fadePart)
        love.graphics.rectangle("fill", 0, 0, love.graphics.getDimensions())
        love.graphics.setColor(1, 1, 1, 1)
    end
end

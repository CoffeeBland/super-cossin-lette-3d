require "src.states.Intro"
require "src.states.Title"
require "src.states.Game"

StateMachine = {
    fadeOutFrames = 0,
    fadeInFrames = 0
}

function StateMachine:change(state, params)
    if self.current then
        self.fadeOutFrames = self.current.fadeout
        self.fadeInFrames = state.fadein
        if self.fadeOutFrames > 0 or self.fadeInFrames > 0 then
            self.nextParams = params
            self.nextState = state
            return
        end
    end
    if self.current then
        self.current:exit()
    end
    self.current = state
    self.current:enter(params)
    self.fadeOutFrames = 0
    self.fadeInFrames = 0
    self.nextParams = nil
    self.nextState = nil
end

function StateMachine:update(dt)
    local framePart = dt / (1 / 60)
    if self.fadeOutFrames > 0 then
        self.fadeOutFrames = math.max(self.fadeOutFrames - framePart, 0)
    elseif self.fadeInFrames > 0 then
        self.fadeInFrames = math.max(self.fadeInFrames - framePart, 0)
    end
    if self.nextState and self.fadeOutFrames == 0 then
        if self.current then
            self.current:exit()
        end
        self.current = self.nextState
        self.current:enter(self.nextParams)
        self.nextParams = nil
        self.nextState = nil
    end
    if self.current and self.fadeInFrames == 0 and self.fadeOutFrames == 0 then
        self.current:update(dt)
    end
end

function StateMachine:render()
    if self.current then
        self.current:render()
    end
    local fadePart =
        (self.fadeOutFrames > 0 and (1 - self.fadeOutFrames / self.current.fadeout)) or
        (self.fadeInFrames > 0 and self.fadeInFrames / self.current.fadein) or
        0
    if fadePart ~= 0 then
        love.graphics.setColor(0, 0, 0, fadePart)
        love.graphics.rectangle("fill", 0, 0, love.graphics.getDimensions())
        love.graphics.setColor(1, 1, 1, 1)
    end
end

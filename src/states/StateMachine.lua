require "src.states.Intro"
require "src.states.Game"

StateMachine = {}

function StateMachine:init(state)

    self.empty = {
        ["render"] = function() end,
        ["update"] = function() end,
        ["enter"] = function() end,
        ["exit"] = function() end,
    }
    self.state = state or {}
    self.current = self.empty
end

function StateMachine:change(state, params)
    if self.current then
        self.current:exit()
    end
    self.current = state
    self.current:enter(params)
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end

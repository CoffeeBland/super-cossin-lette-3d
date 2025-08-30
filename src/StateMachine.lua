StateMachine = Class{}

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

function StateMachine:change(stateName, params)
    assert(self.state[stateName])
    self.current:exit()
    self.current = self.state[stateName]()
    self.current:enter(params)
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end

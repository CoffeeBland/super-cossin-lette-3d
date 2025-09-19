Event = {}
Event.__index = Event

function Event.new()
    local instance = setmetatable({
        awaiting = {}
    }, Event)

    return instance
end

function Event:execute(list)
    self.index = 0
    self.list = list
end

function Event:update(framePart, game)
    if self.wait then
        if not self:isWaitDone(framePart, game, self.wait) then
            return
        end
    end

    if self.list then
        local nextEvent = self.list[self.index + 1]
        while nextEvent and self:processEvent(framePart, game, nextEvent) do
            self.index = self.index + 1
            nextEvent = self.list[self.index + 1]
        end
        if not nextEvent then
            self.list = nil
            self.index = nil
        end
    end
end

function Event:isWaitDone(framePart, game, wait)
    local type = wait[1]
    if wait.done then
        return true
    elseif type == "waitForTrigger" then
        local entity = self:findEntity(game, wait.entity)
        wait.done = (entity or game).anim:isTriggered(wait.trigger)
    elseif type == "waitForAll" then
        local done = true
        for i = 2, #wait do
            if not self:isWaitDone(framePart, game, wait[i]) then
                print(dump(wait[i]))
                done = false
            end
        end
        wait.done = done
    end
    return wait.done
end

function Event:processEvent(framePart, game, event)
    local type = event[1]
    if type == "waitForTrigger" or type == "waitForAll" then
        self.wait = event
        return self:isWaitDone(0, game, self.wait)
    elseif type == "bubble" then
        local entity = self:findEntity(game, event.entity)
        entity.bubble:show(event.text, entity.anim)
    elseif type == "camera" then
        game.camera.panFrames = event.panFrames
        game.camera.target = self:findEntity(game, event.target)
    elseif type == "input" then
        game.input.target = self:findEntity(game, event.target)
    elseif type == "walkToPoint" then
        local entity = self:findEntity(game, event.entity)
        -- TODO LOL
        entity.actor:walkToPoint(event.point)
    end
    return true
end

function Event:findEntity(game, designation)
    if not designation then
        return nil
    elseif designation.byName then
        return game.entitiesByName[designation.byName]
    end
end

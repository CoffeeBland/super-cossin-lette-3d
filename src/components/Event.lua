Event = {}
Event.__index = Event
fancyTypes.event = Event

function Event.new()
    local instance = setmetatable({
        awaiting = {}
    }, Event)

    return instance
end

function Event:execute(list)
    self.index = 0
    self.list = list
    for _, event in ipairs(self.list) do
        if self:isWait(event) then
            event.done = false
            if event[1] == "waitForAll" then
                for i = 2, #event do
                    event[i].done = false
                end
            end
        end
    end
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

function Event:isWait(event)
    local type = event[1]
    return type == "waitForAll" or
        type == "waitForTrigger" or
        type == "waitForPan" or
        type == "waitForMove" or
        type == "waitForLarp" or
        type == "waitForBubble"
end

function Event:isWaitDone(framePart, game, wait)
    local type = wait[1]
    if wait.done then
        return true
    elseif type == "waitForAll" then
        local done = true
        for i = 2, #wait do
            done = self:isWaitDone(framePart, game, wait[i]) and done
        end
        wait.done = done
    elseif type == "waitForTrigger" then
        local entity = game:findEntity(wait.entity)
        wait.done = (entity or game).anim:isTriggered(wait.trigger)
    elseif type == "waitForPan" then
        wait.done = game.camera.panFrames == 0 or not game.camera.panFrames
    elseif type == "waitForMove" then
        local entity = game:findEntity(wait.entity)
        wait.done = not entity.actor.autoMoveIndex
    elseif type == "waitForLarp" then
        local entity = game:findEntity(wait.entity)
        wait.done = entity.larp:empty()
    elseif type == "waitForBubble" then
        local entity = game:findEntity(wait.entity)
        wait.done = not entity.bubble.text
    end
    return wait.done
end

function Event:processEvent(framePart, game, event)
    local type = event[1]
    if self:isWait(event) then
        self.wait = event
        return self:isWaitDone(0, game, self.wait)
    elseif type == "bubble" then
        local entity = game:findEntity(event.entity)
        entity.bubble:show(event.text, entity.anim)
    elseif type == "camera" then
        game.camera.panFrames = event.panFrames
        game.camera.target = game:findEntity(event.target)
    elseif type == "input" then
        game.input.target = game:findEntity(event.target)
    elseif type == "move" then
        local entity = game:findEntity(event.entity)
        entity.actor:setMoveFromEvent(event)
    elseif type == "components" then
        local entity = game:findEntity(event.entity)
        for key, component in pairs(event) do
            if key ~= "entity" then
                if entity[key] then
                    table.recset(entity, key, component)
                elseif fancyTypes[key] then
                    entity[key] = fancyTypes[key].new(component)
                else
                    entity[key] = component
                end
            end
        end
    else
        print("OHNO", dump(event))
    end
    return true
end

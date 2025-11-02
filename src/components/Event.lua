Event = {}
Event.__index = Event
fancyTypes.event = Event

function Event.new()
    local instance = setmetatable({}, Event)
    instance.awaiting = {}
    return instance
end

function Event:execute(list)
    self.index = 1
    self.depth = 0
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

function Event:update(framePart, dt, game)
    if self.wait then
        if not self:isWaitDone(framePart, game, self.wait) then
            return
        end
    end

    if self.list then
        while self:processEvent(framePart, game, self.index) do end
        if self.index > #self.list then
            self.list = nil
            self.index = nil
        end
    end
end

function Event:isWait(event)
    local type = event[1]
    return type == "waitForAll" or
        type == "waitFrames" or
        type == "waitForTrigger" or
        type == "waitForPan" or
        type == "waitForZoom" or
        type == "waitForMove" or
        type == "waitForLarp" or
        type == "waitForBubble" or
        type == "waitForVar"
end

function Event:isWaitDone(framePart, game, wait)
    local type = wait[1]
    if wait.done then
        return true
    end
    local entity = wait.entity and game:findEntity(wait.entity)
    if entity and entity.disabled then
        wait.done = true
    elseif type == "waitForAll" then
        local done = true
        for i = 2, #wait do
            done = self:isWaitDone(framePart, game, wait[i]) and done
        end
        wait.done = done
    elseif type == "waitFrames" then
        self.waitFrames = self.waitFrames or wait[2]
        if self.waitFrames > 0 then
            self.waitFrames = math.max(self.waitFrames - framePart, 0)
        else
            self.waitFrames = nil
            wait.done = true
        end
    elseif type == "waitForTrigger" then
        wait.done = (entity or game).anim:isTriggered(wait.trigger)
    elseif type == "waitForPan" then
        wait.done = not entity.camera:isPanning()
    elseif type == "waitForZoom" then
        wait.done = not entity.camera:isZooming()
    elseif type == "waitForMove" then
        wait.done = not entity.actor.autoMoveIndex
    elseif type == "waitForLarp" then
        wait.done = entity.larp:empty()
    elseif type == "waitForBubble" then
        wait.done = entity.bubble.textLen == 0
    elseif type == "waitForVar" then
        wait.done = self:eval(framePart, game, wait, 2)
    end
    return wait.done
end

local evalStack = {}
local evalStackLen = 0
local operators = {
    ["<"] = function (a, b) return a < b end,
    ["<="] = function (a, b) return a <= b end,
    [">"] = function (a, b) return a > b end,
    [">="] = function (a, b) return a >= b end,
    ["=="] = function (a, b) return a == b end,
    ["~="] = function (a, b) return a ~= b end,
    ["+"] = function (a, b) return a + b end,
    ["-"] = function (a, b) return a - b end,
    ["*"] = function (a, b) return a - b end,
    ["/"] = function (a, b) return a - b end,
}
function Event:eval(framePart, game, expr, index)
    for i = #expr, index, -1 do
        local atom = expr[i]
        if operators[atom] then
            if evalStackLen < 2 then
                print("OHNO! THE EXPRESSION WAS BAD!", dump(expr), index)
                return
            end
            local operand1 = evalStack[evalStackLen]
            local operand2 = evalStack[evalStackLen - 1]
            evalStackLen = evalStackLen - 1
            evalStack[evalStackLen] = operators[atom](operand1, operand2)
        else
            evalStackLen = evalStackLen + 1
            evalStack[evalStackLen] = game:eval(atom)
        end
    end
    evalStackLen = 0
    return evalStack[1]
end

function Event:findMarker(index, marker)
    local depth = self.depth
    for i = index, #self.list do
        local e = self.list[i]
        local t = e[1]
        if (t == marker and depth == self.depth) or
            (t == "end" and depth == self.depth) then
            self.depth = self.depth - 1
            return i + 1
        end
        if t == "if" then
            self.depth = self.depth + 1
        elseif t == "end" then
            self.depth = self.depth - 1
        end
    end
end

function Event:processEvent(framePart, game, index)
    local event = self.list[index]
    if not event then
        self.index = index + 1
        return
    end
    local type = event[1]

    -- Wait
    if self:isWait(event) then
        self.wait = event
        self.index = index + 1
        return self:isWaitDone(0, game, self.wait)
    end

    -- Conditions
    if type == "if" then
        self.depth = self.depth + 1
        if self:eval(framePart, game, event, 2) then
            self.index = index + 1
            return true
        else
            local depth = self.depth
            self.index = self:findMarker(index + 1, "else")
            return true
        end
    elseif type == "else" then
        self.index = self:findMarker(index + 1, "end")
        return true
    elseif type == "end" then
        self.depth = self.depth - 1
        self.index = index + 1
        return true
    end

    -- Regular old actions.
    self.index = self.index + 1

    local entity = event.entity and game:findEntity(event.entity)
    if event.entity and not entity then
        print("OHNO could not find entity", dump(event))
        return true
    end

    local image = event.image and game.images.imagesById[event.image.byId]
    if event.image and not image then
        print("OHNO could not find image", dump(event))
        return true
    end

    -- Actions
    if type == "bubble" then
        entity.bubble:show(game, event.text, entity.anim)
    elseif type == "camera" then
        local target = game:findEntity(event.target)
        if not event.entity then
            for _, entity in game:iterEntities(game.entitiesByComponent.camera) do
                entity.camera:setMoveFromEvent(target, event)
            end
        else
            entity.camera:setMoveFromEvent(target, event)
        end
    elseif type == "input" then
        game.input.target = entity
    elseif type == "anim" then
        entity.anim:toggle(event.name, event.value)
    elseif type == "sound" then
        Sound:start(event)
    elseif type == "music" then
        Music:play(game:eval(event.name), event.loop)
    elseif type == "fadeoutMusic" then
        Music:fadeout()
    elseif type == "image" then
        game.images:setImage(event)
    elseif type == "move" then
        entity.actor:setMoveFromEvent(event)
    elseif type == "larp" then
        if entity then
            for key, larp in pairs(event) do
                if key ~= 1 and key ~= "entity" then
                    entity.larp:add(key, larp)
                end
            end
        elseif image then
            for key, larp in pairs(event) do
                if key ~= 1 and key ~= "image" then
                    image.larp:add(key, larp)
                end
            end
        end
    elseif type == "components" then
        for key, component in pairs(event) do
            if key ~= "entity" then
                if not entity[key] then
                    if fancyTypes[key] then
                        entity[key] = fancyTypes[key].new()
                    else
                        entity[key] = {}
                    end
                end
                table.recset(entity, key, component)
            end
        end
    elseif type == "changeState" then
        local args = {}
        for key, value in pairs(event[3] or EMPTY) do
            args[key] = game:eval(value)
        end
        StateMachine:change(event[2], args)
    elseif type == "timer" then
        local time = game:eval(event[2])
        game.timer:start(time)
    else
        print("OHNO", dump(event))
    end

    return true
end

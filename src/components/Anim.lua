Anim = {}
Anim.__index = Anim

EMPTY_REQUEST = { priority = 0 }

Anim.priorities = {
    idle = 1,
    walk = 1,
    squish = 2,
    eat = 3,
    jump = 4
}

function Anim.new()
    local instance = {
        dir = "tr",
        triggers = {},
        requested = {}
    }
    return setmetatable(instance, Anim)
end

function Anim:getRequest(name, createIfMissing)
    local free
    for i, request in ipairs(self.requested) do
        if request.name == name then
            return request
        elseif not free and not request.name then
            free = request
        end
    end
    if createIfMissing then
        if not free then
            free = {}
            table.insert(self.requested, free)
        end
        free.name = name
        free.time = 0
        return free
    end
end

function Anim:request(name, priority)
    priority = priority or Anim.priorities[name] or 1
    local request = self:getRequest(name, true)
    request.priority = priority
end

function Anim:release(name)
    local request = self:getRequest(name)
    if request then
        request.name = nil
        request.time = 0
        request.priority = 0
    end
end

function Anim:toggle(name, value)
    if value then
        self:request(name)
    else
        self:release(name)
    end
end

function Anim:isTriggered(name)
    return self.triggers[name]
end

function Anim:trigger(name)
    print(name)
    self.triggers[name] = true
end

function Anim:clearTriggers()
    for name in pairs(self.triggers) do
        self.triggers[name] = nil
    end
end

function Anim:highestPriority()
    local max = 0
    for _, request in pairs(self.requested) do
        max = math.max(max, request.priority)
    end
    return max
end

function Anim:findAnim(spriteData)
    local entry, priority
    for _, anim in ipairs(spriteData) do
        local request = self:getRequest(anim.name)
        if request and (not priority or request.priority <= priority) then
            entry = anim
        end
    end
    return entry or spriteData[#spriteData]
end

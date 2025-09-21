Anim = {}
Anim.__index = Anim
fancyTypes.anim = Anim

EMPTY_REQUEST = { priority = 0, time = 0 }

Anim.priorities = {
    idle = 1,
    walk = 1,
    squish = 2,
    jump = 3,
    eat = 4,
    drown = 5
}

function Anim.new()
    local instance = {
        dir = "b",
        triggers = {},
        requested = {},
        baseWiggle = { x = 1, y = 1 },
        wiggle = { x = 1, y = 1 },
        wiggleFrames = 0,
        wiggleTotalFrames = 0,
        wiggleAmplitude = 0
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
        self:trigger(name .. ":start")
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
        self:trigger(name .. ":stop")
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

function Anim:startWiggle(amplitude, frames)
    self.wiggleAmplitude = amplitude
    self.wiggleFrames = frames
    self.wiggleTotalFrames = frames
end

function Anim:isTriggered(name)
    return self.triggers[name]
end

function Anim:trigger(name, value)
    self.triggers[name] = value or true
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
    local foundAnim = nil
    local foundRequest = EMPTY_REQUEST
    for _, anim in ipairs(spriteData) do
        local request = self:getRequest(anim.name)
        if request and request.priority >= foundRequest.priority then
            if anim.dirs then
                for _, dir in ipairs(anim.dirs) do
                    if dir == self.dir then
                        foundAnim = anim
                        foundRequest = request
                    end
                end
            else
                foundAnim = anim
                foundRequest = request
            end
        end
    end
    return foundAnim or spriteData[#spriteData], foundRequest or EMPTY_REQUEST
end

function Anim:update(dt, entitySprites)
    self:clearTriggers()

    local wiggleX, wiggleY = 0, 0
    if self.wiggleFrames > 0 then
        local wiggleMoment = 0.5 * (1 - math.cos((self.wiggleTotalFrames - self.wiggleFrames) / self.wiggleTotalFrames * 2 * math.pi))
        wiggleX = wiggleMoment * math.cos((self.wiggleFrames / 6) * math.pi) * self.wiggleAmplitude
        wiggleY = wiggleMoment * math.sin((self.wiggleFrames / 6) * math.pi) * self.wiggleAmplitude
        self.wiggleFrames = self.wiggleFrames - 1
    end
    self.wiggle.x, self.wiggle.y = self.baseWiggle.x + wiggleX, self.baseWiggle.y + wiggleY

    for _, request in pairs(self.requested) do
        request.time = request.time + dt
    end
    for _, sprite in pairs(entitySprites) do
        local spriteData = sprites[sprite.name]
        if spriteData then
            local animData, animRequest = self:findAnim(spriteData)

            -- Moi je trouve que Oui.
            local frame = math.floor(animData.fps * animRequest.time)
            if animData.oneShot and frame > #animData.tiles then
                self:trigger(animData.name .. ":finished")
                self:release(animData.name)
            end
            if animData.pingPong then
                local tileCount = #animData.tiles * 2 - 2
                frame = frame % tileCount
                if frame >= #animData.tiles then
                    frame = tileCount - frame
                end
            else
                frame = frame % #animData.tiles
            end
            frame = frame + 1

            local trigger = animData.tiles[frame].trigger
            if sprite.frame ~= frame and trigger then
                self:trigger(trigger)
            end

            sprite.animData = animData
            sprite.frame = frame
        end
    end
end

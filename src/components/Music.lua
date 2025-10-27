Music = {
    old = nil,
    oldFadeoutFrames = 0,
    current = nil,
    currentFadeinFrames = 0
}

local musicVolume = 0.5
local fadeFrames = 60

function Music:play(name, loop)
    local fadein = false
    if self.current and self.currentName ~= name then
        self:fadeout()
        fadein = true
    end
    self.currentFadeinFrames = 0
    if self.current and self.currentName == name then
        self:clearOld()
        self.currentFadeinFrames = fadeFrames
    end
    self.currentName = name
    self.current = music[name]
    self.current:setVolume(fadein and 0 or musicVolume)
    self.current:stop()
    self.current:play()
    self.current:setFilter()
    self.current:setLooping(loop and not Game.constants.musicLoops[name] or false)
    self.currentLoop = loop
    if fadein then
        self.currentFadeinFrames = fadeFrames
    end
    self:update(0)
end

function Music:clearOld()
    if self.old then
        self.old:stop()
    end
    self.old = nil
    self.oldFadeoutFrames = 0
end

function Music:fadeout(frames)
    if self.old then
        self:clearOld()
    end

    self.oldName = self.currentName
    self.old = self.current
    self.oldFadeoutFrames = frames or fadeFrames
    self.oldLoop = self.currentLoop
    self.currentName = nil
    self.current = nil
    self:update(0)
end

function Music:loop(name, source)
    local time = source:tell("samples")
    local timestamps = Game.constants.musicLoops[name]
    if timestamps and time >= timestamps.loopEnd then
        source:seek(timestamps.loopStart + (time - timestamps.loopEnd), "samples")
    end
end

function Music:update(dt)
    local framePart = dt / (1 / 60)

    if self.current then
        local currentVolume = math.interp(self.currentFadeinFrames, self.current:getVolume(), musicVolume)
        self.current:setVolume(currentVolume)
        self.currentFadeinFrames = math.max(self.currentFadeinFrames - framePart, 0)
        if self.currentLoop then
            self:loop(self.currentName, self.current)
        end
    end

    if self.old then
        local oldVolume = math.interp(self.oldFadeoutFrames, self.old:getVolume(), 0)
        if oldVolume == 0 then
            self.old:stop()
            self.old = nil
            self.oldFadeoutFrames = 0
        else
            self.old:setVolume(oldVolume)
            self.oldFadeoutFrames = math.max(self.oldFadeoutFrames - framePart, 0)
            if self.oldLoop then
                self:loop(self.oldName, self.old)
            end
        end
    end
end

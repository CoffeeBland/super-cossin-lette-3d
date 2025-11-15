Music = {
    old = nil,
    oldFadeoutFrames = 0,
    current = nil,
    currentFadeinFrames = 0,
    speed = 1
}

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

    self.current:setEffect("brun", Options.values.brun)
    self.current:setVolume((fadein and 0 or Game.constants.music.volume) * Options.values.music / 100)
    self.current:stop()
    self.current:play()
    self.current:setFilter()
    self.current:setLooping(loop and not Game.constants.music.loops[name] or false)
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
    local timestamps = Game.constants.music.loops[name]
    if timestamps and time >= timestamps.loopEnd then
        source:seek(timestamps.loopStart + (time - timestamps.loopEnd), "samples")
    end
end

function Music:gameUpdate(framePart, dt, game)
    local speed = 1
    for _, entity in game:iterEntities(game.entitiesByComponent.actor) do
        for buffName, _ in pairs(entity.actor.buffs) do
            local buff = Game.constants.buffs[buffName]
            speed = math.max(buff and buff.music and buff.music.speed or 1, speed)
        end
    end
    self.speed = speed
end

function Music:update(dt)
    local framePart = dt / (1 / 60)

    if self.current then
        local currentVolume = math.interp(self.currentFadeinFrames, self.current:getVolume(), Game.constants.music.volume)
        self.current:setVolume(currentVolume * Options.values.music / 100)
        self.current:setPitch(self.speed)
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
            self.old:setVolume(oldVolume * Options.values.music / 100)
            self.oldFadeoutFrames = math.max(self.oldFadeoutFrames - framePart, 0)
            if self.oldLoop then
                self:loop(self.oldName, self.old)
            end
        end
    end

    self.speed = 1
end

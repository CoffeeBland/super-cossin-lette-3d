-- Sound is split between a global handler, and a system!
-- Sound must handle the state stopping... so it must live longer than the state.
-- The system handles interacting with entities. The global thingy doesn't deal with puny little things.

Sound = {
    playing = {},
    nextPlayingId = 1,

    global = {
        up = { name = "Step", pitchRange = { 1.0, 1.4 } },
        down = { name = "Step", pitchRange = { 0.6, 1.0 } },
        act = {
            name = "Bloop",
            names = {
                "Bloop1",
                "Bloop2",
                "Bloop3",
                "Bloop4",
                "Bloop5",
                "Bloop6",
                "Bloop7",
                "Bloop8",
                "Bloop9",
            },
            volumeRange = { 0.8, 1 },
            pitchRange = { 1.2, 1.4 }
        }
    }
}

local fadeFrames = 30

clones = {}

function Sound:findSource(name)
    local source = sounds[name]
    if source and source:isPlaying() then
        if not clones[name] then
            clones[name] = {}
        end
        for i = 1, 3 do
            local clone = clones[name][i]
            if not clone then
                clone = source:clone()
                clones[name][i] = clone
                return clone
            end
            if not clone:isPlaying() then
                return clone
            end
        end
        source:stop()
        return source
    else
        return source
    end
end

function Sound:start(sound, entity)
    local sourceName = sound.names and sound.names[math.random(#sound.names)] or sound.name
    local source = self:findSource(sourceName)
    if not source then
        error("Could not find source for sound", sound)
        return
    end
    local volume = sound.volumeRange and math.randomRange(sound.volumeRange) or sound.volume or 1
    sound.currentVolume = volume
    source:setVolume(volume * Game.constants.sound.volume * Options.values.sound / 100)
    local baseMass = entity and entity.actor and entity.actor.stats.mass or 1
    local massFactor = sound.mass or 0
    local mass = 1 + (baseMass - 1) * massFactor
    local massPitch = 1 / mass
    local basePitch = sound.pitchRange and math.randomRange(sound.pitchRange) or sound.pitch or 1
    source:setPitch(basePitch * massPitch)
    source:setLooping(sound.loop or false)
    source:setEffect("brun", Options.values.brun)
    source:setEffect("mass1.33", mass >= 1.33 and mass < 1.66)
    source:setEffect("mass1.66", mass >= 1.66 and mass < 2)
    source:setEffect("mass2", mass >= 2)
    if sound.fadeIn then
        sound.volumeFrames = sound.fadeIn
        sound.targetVolume = volume
        sound.currentVolume = 0
        source:setVolume(0)
    else
        sound.volumeFrames = 0
        sound.targetVolume = volume
    end
    self.playing[sound.name] = sound
    sound.source = source
    sound.playingId = self.nextPlayingId
    self.nextPlayingId = self.nextPlayingId + 1
    source:play()
    if sound.startSample then
        source:seek(sound.startSample, "samples")
    end
end

function Sound:stop(sound)
    if sound.fadeOut then
        if not sound.volumeFrames or sound.targetVolume ~= 0 then
            sound.volumeFrames = sound.fadeOut
            sound.targetVolume = 0
        end
    else
        if sound.source then
            sound.source:stop()
        elseif self.playing[sound.name] and self.playing[sound.name].source then
            self.playing[sound.name].source:stop()
        end
        self.playing[sound.name] = nil
        sound.source = nil
        sound.entity = nil
    end
end

function Sound:fadeout(frames)
    for name, sound in pairs(self.playing) do
        if not sound.survive and (not sound.volumeFrames or sound.targetVolume ~= 0) then
            sound.volumeFrames = frames or fadeFrames
            sound.targetVolume = 0
        end
    end
end

function Sound:toggle(sound, active, entity)
    if not sound then
        return
    end
    local playing = self.playing[sound.name]
    if playing and not active then
        self:stop(sound)
    elseif active and not playing then
        self:start(sound)
    end
end

function Sound:update(framePart, dt)
    for name, sound in pairs(self.playing) do
        local source = sound.source
        if sound.volumeFrames then
            sound.volumeFrames = math.max(sound.volumeFrames - framePart, 0)
            local volume = math.interp(sound.volumeFrames, source:getVolume(), sound.targetVolume)
            if (volume - sound.targetVolume) < DELTA and volume < DELTA then
                sound.source:stop()
                self.playing[sound.name] = nil
                sound.source = nil
                sound.entity = nil
            else
                sound.currentVolume = volume
                source:setVolume(volume * Game.constants.sound.volume * Options.values.sound / 100)
            end
            if sound.volumeFrames == 0 then
                sound.volumeFrames = nil
            end
        end
        if not source:isPlaying() then
            self.playing[name] = nil
            sound.source = nil
            sound.entity = nil
        end
    end
end

SoundSystem = {}
SoundSystem.__index = SoundSystem

function SoundSystem.new()
    return setmetatable({}, SoundSystem)
end

function SoundSystem:exit()
end

function SoundSystem:update(framePart, dt, game)
    for name, sound in pairs(Sound.playing) do
        local playing = sound.source:isPlaying()
        if playing and sound.entity and
            ((sound.stopOn and sound.entity.anim:isTriggered(sound.stopOn)) or sound.entity.disabled)
        then
            Sound:stop(sound)
        end
    end

    for _, entity in game:iterEntities(game.entitiesByComponent.soundEmitter) do
        if not entity.soundEmitter.triggers then entity.soundEmitter.triggers = {} end
        if not entity.soundEmitter.conditions then entity.soundEmitter.conditions = {} end

        for trigger, sound in pairs(entity.soundEmitter.triggers) do
            if entity.anim:isTriggered(trigger) then
                sound.entity = entity -- A little sad but oh well
                Sound:start(sound, entity)
            end
        end

        if entity.soundEmitter.always then
            if not entity.soundEmitter.always.frames or entity.soundEmitter.always.frames <= 0 then
                entity.soundEmitter.always.entity = entity -- Same sad, same oh well
                entity.soundEmitter.always.frames = nil
                Sound:start(entity.soundEmitter.always, entity)
            end
            if entity.soundEmitter.always.frames then
                entity.soundEmitter.always.frames = math.max(entity.soundEmitter.always.frames - framePart, 0)
            elseif entity.soundEmitter.always.cooldown then
                entity.soundEmitter.always.frames = entity.soundEmitter.always.cooldown
            end
        end

        local conditions = entity.soundEmitter.conditions
        Sound:toggle(conditions.drown, entity.water and entity.water.remainingDrownFrames, entity)
        Sound:toggle(conditions.light, entity.light and entity.light.alpha >= conditions.light.minimumLight, entity)
    end
end

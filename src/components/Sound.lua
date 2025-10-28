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

function Sound:start(sound)
    local sourceName = sound.names and sound.names[math.random(#sound.names)] or sound.name
    local source = sounds[sourceName]
    if not source then
        error("Could not find source for sound", sound)
        return
    end
    local volume = sound.volumeRange and math.randomRange(sound.volumeRange) or sound.volume or 1
    source:setVolume(volume * Options.values.sound / 100)
    source:setPitch(sound.pitchRange and math.randomRange(sound.pitchRange) or sound.pitch or 1)
    source:setLooping(sound.loop or false)
    if sound.fadeIn then
        sound.volumeFrames = sound.fadeIn
        sound.targetVolume = volume
        source:setVolume(0)
    end
    self.playing[sound.name] = sound
    sound.source = source
    sound.playingId = self.nextPlayingId
    self.nextPlayingId = self.nextPlayingId + 1
    source:stop()
    source:play()
end

function Sound:stop(sound)
    if sound.fadeOut then
        if not sound.volumeFrames or sound.targetVolume ~= 0 then
            sound.volumeFrames = sound.fadeOut
            sound.targetVolume = 0
        end
    else
        sound.source:stop()
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

function Sound:toggle(sound, active)
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
                source:setVolume(volume * Options.values.sound / 100)
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
                Sound:start(sound)
            end
        end

        if entity.soundEmitter.always then
            if not entity.soundEmitter.always.frames or entity.soundEmitter.always.frames <= 0 then
                entity.soundEmitter.always.entity = entity -- Same sad, same oh well
                entity.soundEmitter.always.frames = nil
                Sound:start(entity.soundEmitter.always)
            end
            if entity.soundEmitter.always.frames then
                entity.soundEmitter.always.frames = math.max(entity.soundEmitter.always.frames - framePart, 0)
            elseif entity.soundEmitter.always.cooldown then
                entity.soundEmitter.always.frames = entity.soundEmitter.always.cooldown
            end
        end

        local conditions = entity.soundEmitter.conditions
        Sound:toggle(conditions.drown, entity.water and entity.water.remainingDrownFrames)
        Sound:toggle(conditions.light, entity.light and entity.light.alpha >= conditions.light.minimumLight)
    end
end

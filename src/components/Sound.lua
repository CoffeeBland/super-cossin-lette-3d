SoundSystem = {}
SoundSystem.__index = SoundSystem

function SoundSystem.new()
    return setmetatable({
        playing = {}
    }, SoundSystem)
end

function SoundSystem:updatePlaying(framePart, dt, entity)
    local playing = (entity.soundEmitter or entity.sounds).playing
    for name, sound in pairs(playing) do
        local source = sounds[sound.name]
        if sound.volumeFrames then
            sound.volumeFrames = math.max(sound.volumeFrames - framePart, 0)
            local volume = math.interp(sound.volumeFrames, source:getVolume(), sound.targetVolume)
            if (volume - sound.targetVolume) < DELTA and volume < DELTA then
                source:stop()
            else
                source:setVolume(volume)
            end
            if sound.volumeFrames == 0 then
                sound.volumeFrames = nil
            end
        end
        if source:isPlaying() then
            if (sound.stopOn and entity.anim:isTriggered(sound.stopOn)) or entity.disabled then
                self:stop(entity, sound, sounds[sound.name])
            end
        else
            playing[name] = nil
        end
    end
end

function SoundSystem:update(framePart, dt, game)
    -- Sound emitters have to handle being disabled
    for _, entity in ipairs(game.entitiesByComponent.soundEmitter) do
        if not entity.soundEmitter.playing then entity.soundEmitter.playing = {} end
        self:updatePlaying(framePart, dt, entity)
    end
    self:updatePlaying(framePart, dt, game)

    for _, entity in game:iterEntities(game.entitiesByComponent.soundEmitter) do
        if not entity.soundEmitter.triggers then entity.soundEmitter.triggers = {} end
        if not entity.soundEmitter.conditions then entity.soundEmitter.conditions = {} end

        for trigger, sound in pairs(entity.soundEmitter.triggers) do
            if entity.anim:isTriggered(trigger) then
                local source = sounds[sound.name]
                self:start(entity, sound, source)
            end
        end

        local conditions = entity.soundEmitter.conditions
        self:toggle(framePart, entity,conditions.drown,
            entity.water and entity.water.remainingDrownFrames)
        self:toggle(framePart, entity, conditions.light,
            entity.light and entity.light.alpha >= conditions.light.minimumLight)
    end
end

function SoundSystem:start(entity, sound, source)
    if not source then
        print(dump(sound))
    end
    local volume = sound.volumeRange and math.randomRange(sound.volumeRange) or sound.volume or 1
    source:setVolume(volume)
    source:setPitch(sound.pitchRange and math.randomRange(sound.pitchRange) or sound.pitch or 1)
    source:setLooping(sound.loop or false)
    if sound.fadeIn then
        sound.volumeFrames = sound.fadeIn
        sound.targetVolume = volume
        source:setVolume(0)
    end
    (entity.soundEmitter or entity.sounds).playing[sound.name] = sound
    source:stop()
    source:play()
end

function SoundSystem:stop(entity, sound, source)
    if sound.fadeOut then
        if not sound.volumeFrames or sound.targetVolume ~= 0 then
            sound.volumeFrames = sound.fadeOut
            sound.targetVolume = 0
        end
    else
        source:stop()
    end
end

function SoundSystem:toggle(framePart, entity, sound, active)
    if not sound then
        return
    end
    local source = sounds[sound.name]
    local playing = entity.soundEmitter.playing[sound.name]
    if playing and not active then
        self:stop(entity, sound, sounds[sound.name])
    elseif active and not playing then
        self:start(entity, sound, sounds[sound.name])
    end
end

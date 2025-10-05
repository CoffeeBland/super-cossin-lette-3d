SoundSystem = {}
SoundSystem.__index = SoundSystem

function SoundSystem.new()
    return setmetatable({}, SoundSystem)
end

function SoundSystem:update(framePart, dt, game)
    for _, entity in game:iterEntities(game.entitiesByComponent.soundEmitter) do
        for name, sound in pairs(entity.soundEmitter.playing) do
            local source = sounds[sound.name]
            if source:isPlaying() then
                if sound.stopOn and entity.anim:isTriggered(sound.stopOn) then
                    source:stop()
                end
            else
                entity.soundEmitter.playing[name] = nil
            end
        end
        for trigger, sound in pairs(entity.soundEmitter.triggers) do
            if entity.anim:isTriggered(trigger) then
                local source = sounds[sound.name]
                source:setVolume(sound.volumeRange and math.randomRange(sound.volumeRange) or sound.volume or 1)
                source:setPitch(sound.pitchRange and math.randomRange(sound.pitchRange) or sound.pitch or 1)
                source:setLooping(sound.loop or false)

                entity.soundEmitter.playing[sound.name] = sound
                source:stop()
                love.audio.play(source)
            end
        end
    end
end

ParticleSystem = {}
ParticleSystem.__index = ParticleSystem

function ParticleSystem.new(particleCount, entities)
    local instance = setmetatable({}, ParticleSystem)
    instance.particles = {}
    instance.nextFreeParticleIndex = 1
    instance.particleCount = particleCount
    for i = 1, particleCount do
        local particle = {
            id = #entities + 1,
            particleIndex = #instance.particles + 1,
            disabled = true,
            sprites = { { anchor = { x = 0, y = 0 } } },
            pos = { x = 0, y = 0, z = 0, truncateHeight = 0 },
            velocity = { x = 0, y = 0, z = 0 },
            anim = Anim:new()
        }
        table.insert(entities, particle)
        table.insert(instance.particles, particle)
    end
    return instance
end

function ParticleSystem:update(framePart, dt, game)
    for _, entity in game:iterEntities(game.entitiesByComponent.particleEmitter) do
        for trigger, emit in pairs(entity.particleEmitter.triggers or EMPTY) do
            if entity.anim:isTriggered(trigger) then
                self:emit(framePart, entity, emit)
            end
        end
        if entity.particleEmitter.conditions then
            local drown = entity.particleEmitter.conditions.drown
            if drown and entity.water and entity.water.remainingDrownFrames then
                self:emit(framePart, entity, drown)
            end

            local light = entity.particleEmitter.conditions.light
            if light and entity.light and entity.light.alpha >= light.minimumLight then
                self:emit(framePart, entity, light)
            end

            if entity.actor then
                for buffName, _ in pairs(entity.actor.buffs) do
                    if entity.particleEmitter.conditions[buffName] then
                        self:emit(framePart, entity, entity.particleEmitter.conditions[buffName])
                    end
                end
            end
        end
        if entity.particleEmitter.always then
            self:emit(framePart, entity, entity.particleEmitter.always)
        end
    end

    for _, entity in game:iterEntities(self.particles) do
        if entity.particleDuration then
            entity.particleDuration = math.max(entity.particleDuration - framePart, 0)
            if entity.particleDuration <= 0 then
                self:free(entity)
            end
        end
    end
end

function ParticleSystem:emit(framePart, entity, emit)
    if not entity.drawOrder then
        return
    end
    if emit.cooldownFrames and emit.cooldownFrames > 0 then
        emit.cooldownFrames = math.max(emit.cooldownFrames - framePart)
        return
    end
    emit.cooldownFrames = math.randomRange(emit.cooldownRange, emit.cooldown or 0)

    local count = emit.countRange and math.random(unpack(emit.countRange)) or emit.count or 1
    local rangePart = 1 / count
    for i = 1, count do
        local particle = self:acquire()
        if particle then
            particle.sprites[1].name = emit.name
            local spriteData = sprites[emit.name]
            local animData = spriteData and spriteData[#spriteData]
            local width = (animData and animData.tileWidth) or (textures[emit.name]:getWidth())
            local height = (animData and animData.tileHeight) or (textures[emit.name]:getHeight())
            particle.sprites[1].anchor.x = width / 2
            particle.sprites[1].anchor.y = height / 2

            local offsetRange = emit.offsetRange or EMPTY
            local offset = emit.offset or EMPTY
            local velocityRange = emit.velocityRange or EMPTY
            local velocity = emit.velocity or EMPTY

            local horizontal = math.randomRange(offsetRange.horizontal, offset.horizontal or 0)
            particle.pos.x = entity.pos.x + math.cos(entity.anim.angle) * horizontal + math.randomRange(offsetRange.x, offset.x or 0)
            particle.pos.y = entity.pos.y + math.sin(entity.anim.angle) * horizontal + math.randomRange(offsetRange.y, offset.y or 0)
            particle.pos.z = entity.pos.z + math.randomRange(offsetRange.z, offset.z or 0)
            particle.pos.floorZ = entity.pos.floorZ
            particle.pos.floorEntity = entity.pos.floorEntity
            particle.pos.ceilingZ = entity.pos.ceilingZ

            particle.velocity.x = math.randomRange(velocityRange.x, velocity.x or 0) * Game.constants.speedMultiplier
            particle.velocity.y = math.randomRange(velocityRange.y, velocity.y or 0) * Game.constants.speedMultiplier
            particle.velocity.z = math.randomRange(velocityRange.z, velocity.z or 0) * Game.constants.speedMultiplier
            if emit.inherit then
                particle.velocity.x = particle.velocity.x + entity.velocity.x * emit.inherit.x
                particle.velocity.y = particle.velocity.y + entity.velocity.y * emit.inherit.y
                particle.velocity.z = particle.velocity.z + entity.velocity.z * emit.inherit.z
            end
            particle.particleDuration = math.randomRange(emit.durationRange, emit.duration or 0)
            local speed = math.randomRange(emit.speedRange, emit.speed or 0)
            local angle = math.randomSplitRange(rangePart, i, emit.angleRange, emit.angle or 0)
            angle = angle + entity.anim.angle
            particle.velocity.x = particle.velocity.x + math.cos(angle) * speed * Game.constants.speedMultiplier
            particle.velocity.y = particle.velocity.y + math.sin(angle) * speed * Game.constants.speedMultiplier

            for _, sprite in pairs(particle.sprites) do
                sprite.animData = nil
                sprite.frame = nil
            end
            particle.anim:clear()
            particle.anim:setAngle(math.atan2(particle.velocity.y, particle.velocity.x))
            particle.anim:update(0, particle.sprites)
        end
    end
end

function ParticleSystem:acquire()
    if self.nextFreeParticleIndex <= self.particleCount then
        local particle = self.particles[self.nextFreeParticleIndex]
        self.nextFreeParticleIndex = self.nextFreeParticleIndex + 1
        particle.disabled = false
        return particle
    end
end

function ParticleSystem:free(particle)
    particle.disabled = true
    local lastTakenParticleIndex = self.nextFreeParticleIndex - 1
    local lastTakenParticle = self.particles[lastTakenParticleIndex]
    local particleIndex = particle.particleIndex

    -- Move the previously last taken particle into the freed slot
    self.particles[particleIndex] = lastTakenParticle
    lastTakenParticle.particleIndex = particleIndex

    -- Move the newly freed particly into the previously last taken slot
    self.particles[lastTakenParticleIndex] = particle
    particle.particleIndex = lastTakenParticleIndex

    -- Mark the previously last taken slot as free.
    self.nextFreeParticleIndex = lastTakenParticleIndex
end

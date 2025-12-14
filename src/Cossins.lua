Cossins = {
    cossins = {}
}

function Cossins:init()
    Requests.new(self)
    for i = 2, 4 do
        local someCossin = prefabs.cossin()
        someCossin.pos.x = 0
        someCossin.pos.y = 0
        someCossin.pos.z = 0
        someCossin.pos.onGround = true
        someCossin.disabled = true
        for k, v in pairs(someCossin) do
            if fancyTypes[k] then
                someCossin[k] = fancyTypes[k].new(v)
            end
        end
        someCossin.name = "cossin" .. i
        someCossin.actor.playerId = i
        for j, hueRot in ipairs(Game.constants.cossinHues[i - 1]) do
            someCossin.sprites[j].hueRot = hueRot
        end
        someCossin.id = i
        table.insert(self.entities, someCossin)
        self.cossins[i] = someCossin
    end
    self.screenLeft = 0
    self.screenTop = 0
    self.screenRight = 0
    self.screenBottom = 0
    self.input = { target = true }
    self.physics = PhysicsSystem.new()
    self.actors = ActorSystem.new()
    self.sounds = SoundSystem.new()
    self.particles = ParticleSystem.new(Game.constants.particleCount, self.entities)
    Requests.populate(self)
    self:update(0)
end

function Cossins:draw()
    love.graphics.push("all")

    local w, h = unpack(CURRES)
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(SCALE_TO_EXPECTED)
    love.graphics.setShader(TITLE_SHADER)
    TITLE_SHADER:send("hue", -1)
    TITLE_SHADER:send("hueRot", 0)

    self.screenLeft, self.screenTop = love.graphics.inverseTransformPoint(0, 0)
    self.screenRight, self.screenBottom = love.graphics.inverseTransformPoint(CURRES[1], CURRES[2])

    table.sort(self.entities, function (a, b) return a.pos.y < b.pos.y end)
    for i, entity in ipairs(self.entities) do
        entity.drawOrder = i
    end
    for _, entity in self:iterEntities(self.entities) do
        for _, sprite in ipairs(entity.sprites) do
            local doTheHue = sprite.hueRot
            if doTheHue then
                local hueRot = entity.hueRot * (sprite.hueMult or 1) + (sprite.hueRot or 0)
                TITLE_SHADER:send("hueRot", hueRot)
            end
            Game.drawEntitySprite(self, entity, sprite)
            if doTheHue then
                TITLE_SHADER:send("hueRot", 0)
            end
        end
    end
    love.graphics.pop()
end

function Cossins:update(dt)
    for _, player in ipairs(playerActions) do
        local cossin = self.cossins[player.id]
        if cossin and cossin.disabled then
            cossin.disabled = false
            cossin.pos.x = math.random(-100, 100)
            cossin.pos.y = math.random(-100, 100) + 450
            cossin.pos.z = 2000
        end
    end

    for _, cossin in pairs(self.cossins) do
        if cossin.actor.playerId and not playerActionsById[cossin.actor.playerId] and not cossin.disabled then
            self.particles:emit(0, cossin, cossin.particleEmitter.triggers.poof)
            cossin.disabled = true
            Sound:start({ name = "Poof" })
        end
        if not cossin.disabled and cossin.physics then
            cossin.pos.x = math.clamp(cossin.pos.x, self.screenLeft, self.screenRight)
            cossin.pos.y = math.clamp(cossin.pos.y, self.screenTop, self.screenBottom)
            cossin.physics.body:setPosition(cossin.pos.x, cossin.pos.y)
        end
    end

    local framePart = 1
    for _, entity in self:iterEntities(self.entitiesByComponent.anim) do
        entity.anim:update(dt, entity.sprites)
    end
    for _, entity in ipairs(self.entities) do
        self.physics:handleCreation(entity)
    end
    self.physics:update(framePart, dt, self)
    self.actors:update(framePart, dt, self)
    self.particles:update(framePart, dt, self)
    self.sounds:update(framePart, dt, self)
end

function Cossins:iterEntities(table)
    table = table or self.entities
    return Game.entityIterator, table, 1
end

function Cossins:findPoint(designation)
    return Game.findPoint(self, designation)
end

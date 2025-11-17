WaterSystem = {}
WaterSystem.__index = WaterSystem

function WaterSystem.new()
    return setmetatable({}, WaterSystem)
end

function WaterSystem:handleCreation(entity)
    if entity.water then
        if entity.disabled then
            entity.water:clearSensors()
        end

        if entity.physics then
            entity.water:createSensors(entity.physics)
        end
    end
end

function WaterSystem:update(framePart, dt, game)
    for _, entity in game:iterEntities(game.entitiesByComponent.water) do
        entity.water:update(framePart, game, entity)
    end
end

Water = {}
Water.__index = Water
fancyTypes.water = Water

function Water.new(params)
    params = params or EMPTY
    local instance = setmetatable({}, Water)
    instance.drownFrames = params.drownFrames or 0
    instance.respawnJumpSpeed = params.respawnJumpSpeed or 0
    instance.samples = params.samples or { { 0, 0, 0 } }
    return instance
end

function Water:createSensors(physics)
    if not self.sampleSensors then
        self.sampleSensors = {}
        for i, sample in ipairs(self.samples) do
            local shape = love.physics.newCircleShape(sample[1], sample[2], sample[3])
            local fixture = physics:newSensor(shape, DROWN_SENSOR)
            self.sampleSensors[i] = fixture
        end
    end
end

function Water:clearSensors()
    self.sampleSensors = nil
end

function Water:update(framePart, game, entity)
    local pos, velocity, physics, anim = entity.pos, entity.velocity, entity.physics, entity.anim
    if self.remainingDrownFrames then
        self.remainingDrownFrames = self.remainingDrownFrames - framePart
        if self.remainingDrownFrames < DELTA then
            self.remainingDrownFrames = nil
            anim:release("drown")
            pos.x = pos.lastGoodX
            pos.y = pos.lastGoodY
            pos.z = pos.lastGoodZ
            physics.body:setPosition(pos.x, pos.y)
            physics.body:setLinearVelocity(0, 0)
            velocity.z = self.respawnJumpSpeed * Game.constants.jumpMultiplier
            physics:updateHeightSlices(pos)
        end
    else
        self.sensorsInWater = 0
        for _, sensor in pairs(self.sampleSensors) do
            if game.physics:getFirstOverlappingOfType(sensor, WATER_SENSOR, pos) then
                self.sensorsInWater = self.sensorsInWater + 1
            end
        end
        if self.sensorsInWater == #self.sampleSensors then
            self.remainingDrownFrames = self.drownFrames
            anim:request("drown")
            physics.body:setLinearVelocity(0, 0)
        end
        if pos.onGround and (self.sensorsInWater == 0 or not pos.lastGoodX) then
            pos.lastGoodX = pos.x
            pos.lastGoodY = pos.y
            pos.lastGoodZ = pos.z
        end
    end
end

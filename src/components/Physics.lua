PhysicsSystem = {}
PhysicsSystem.__index = PhysicsSystem

function PhysicsSystem.new()
    local instance = setmetatable({}, PhysicsSystem)
    instance.world = love.physics.newWorld(0, 0, true)
    instance.world:setContactFilter(
        function(fix1, fix2)
            if fix1:isSensor() or fix2:isSensor() then
                return true
            end
            local e1 = fix1:getBody():getUserData()
            local e2 = fix2:getBody():getUserData()
            return FruitSystem.shouldEntitiesContact(e1, e2)
        end)
    return instance
end

function PhysicsSystem:exit()
    self.world:destroy()
    self.world = nil
end

function PhysicsSystem:handleCreation(entity)
    -- Create physics
    if not entity.disabled and entity.body and not entity.physics then
        entity.physics = Physics.new(self.world, entity)

        -- Tiles sorta fucked for floor and ceiling purposes
        if not entity.velocity then
            self:findStaticFloorAndCeiling(entity)
        end
    end

    if entity.physics and entity.disabled then
        entity.physics:destroy()
        entity.physics = nil
    end
end

function PhysicsSystem:update(framePart, dt, game)
    local airFrictionForFrame = Game.constants.airFriction ^ dt
    self.world:update(dt)

    for _, entity in game:iterEntities(game.entitiesByComponent.velocity) do
        -- Handling physics and the dreaded Z axis
        if entity.physics then
            entity.pos.x, entity.pos.y = entity.physics.body:getPosition()
            self:findFloorAndCeiling(entity)
            -- Speed! Movement! Wee!
            entity.velocity.x, entity.velocity.y = entity.physics.body:getLinearVelocity()
            entity.velocity.z = entity.velocity.z * airFrictionForFrame - Game.constants.g * dt
            entity.pos.z = entity.pos.z + entity.velocity.z * dt

            -- Check ground (squish!)
            local wasOnGround = entity.pos.onGround
            entity.pos.onGround = entity.pos.z < entity.pos.floorZ + DELTA
            if entity.pos.onGround then
                if not wasOnGround and entity.anim then
                    entity.anim:trigger("land", entity.velocity.z)
                end
                entity.pos.z = entity.pos.floorZ
                entity.velocity.z = 0
            end

            -- Check head (ouch!)
            if entity.pos.z + entity.pos.height > entity.pos.ceilingZ then
                entity.pos.z = entity.pos.ceilingZ - entity.pos.height - DELTA
                entity.velocity.z = 0
            end

            entity.physics:updateHeightSlices(entity.pos)
            entity.physics.body:setLinearDamping(
                entity.pos.onGround and
                    (entity.pos.sliding and Game.constants.slidingDamping or
                    Game.constants.groundDamping) or
                Game.constants.airDamping)
        else
            -- Non-physics-backed velocity handling
            entity.pos.x = entity.pos.x + entity.velocity.x * dt
            entity.pos.y = entity.pos.y + entity.velocity.y * dt
            entity.pos.z = entity.pos.z + entity.velocity.z * dt
        end
    end
end

function PhysicsSystem:findStaticFloorAndCeiling(entity)
    entity.pos.floorEntity = nil
    entity.pos.floorZ = entity.pos.originalz or entity.pos.z
    entity.pos.ceilingEntity = nil
    entity.pos.ceilingZ = entity.pos.z + entity.pos.height
    if not entity.tileSprites then
        for _, other in ipairs(self:getAllOverlappingOfType(entity.physics.heightSensor)) do
            if not other.velocity then
                local othersz = other.pos.z
                local otherez = other.pos.z + other.pos.height
                if math.abs(otherez - entity.pos.floorZ) < DELTA and
                    (not entity.pos.floorEntity or other.pos.y > entity.pos.floorEntity.pos.y)
                then
                    entity.pos.floorEntity = other
                end
                if math.abs(othersz - entity.pos.ceilingZ) < DELTA then
                    entity.pos.ceilingEntity = other
                end
            end
        end
    end
end

function PhysicsSystem:findFloorAndCeiling(entity)
    local floorEntity = nil
    local floorZ = 0
    local ceilingZ = SKY_LIMIT
    for _, other in ipairs(self:getAllOverlappingOfType(entity.physics.heightSensor)) do
        if FruitSystem.shouldEntitiesContact(entity, other) then
            local sz = other.pos.z
            local ez = other.pos.z + other.pos.height
            if other.physics.sliceEnd < entity.physics.sliceStart then
                local consideredEntity = floorEntity or entity
                -- If the floors are close enough, pick the one with most render priority
                if other.pos.y > consideredEntity.pos.y then
                    floorEntity = other
                end
                floorZ = math.max(floorZ, ez)
            end
            if other.physics.sliceStart > entity.physics.sliceEnd then
                ceilingZ = math.min(ceilingZ, sz)
            end
        end
    end
    entity.pos.floorEntity = floorEntity
    entity.pos.floorZ = floorZ
    entity.pos.ceilingZ = ceilingZ
end

function PhysicsSystem:findFloorY(entity)
    local y = entity.pos.y
    for i = 1, 10 do
        if entity.pos.floorEntity then
            entity = entity.pos.floorEntity
            y = math.max(entity.pos.y + DELTA * 3, y)
        else
            return entity, y
        end
    end
    return entity, y
end

-- Overlap iterator state (iiish it's all global and sad)
local overlappingCheckEntity = nil
local overlappingCheckBody = nil
local overlappingCheckSensor = nil
local overlappingCheckType = nil
local overlappingCheckStartZ = nil
local overlappingCheckEndZ = nil
overlappingCheckSlop = nil
local overlappingCheckStopOnFirst = false
local overlappingCheckResult = {}
local overlappingVisit = 0
local overlappingSearchedComponent = nil

local function onOverlappingEntitiesCheck(fix)
    local otherEntity = fix:getBody():getUserData()

    if otherEntity.disabled or
        otherEntity._visit == overlappingVisit or
        (overlappingSearchedComponent and not otherEntity[overlappingSearchedComponent]) then
        return true
    end

    if overlappingCheckEntity.id == otherEntity.id or
        (overlappingCheckType and fix:getUserData().type ~= overlappingCheckType) or
        not (overlappingCheckSlop or love.physics.overlap(overlappingCheckSensor, fix))
    then
        return true
    end

    if overlappingCheckStartZ then
        if otherEntity.pos then
            local sz2 = otherEntity.pos.z
            local ez2 = otherEntity.pos.z + otherEntity.pos.height
            if overlappingCheckStartZ < ez2 - DELTA and
                sz2 < overlappingCheckEndZ + DELTA
            then
                otherEntity._visit = overlappingVisit
                table.insert(overlappingCheckResult, otherEntity)
            end
        end
    else
        otherEntity._visit = overlappingVisit
        table.insert(overlappingCheckResult, otherEntity)
    end

    return not overlappingCheckStopOnFirst
end

local function overlappingCheckResultIterator(result, i)
    if i > overlappingCheckResultLen then
        return
    end
    return i  + 1, overlappingCheckResult[i]
end

function PhysicsSystem:getAllOverlappingOfType(sensor, type, pos, searchedComponent)
    overlappingCheckSensor = sensor
    overlappingCheckBody = overlappingCheckSensor:getBody()
    overlappingCheckEntity = overlappingCheckBody:getUserData()
    overlappingCheckType = type or HEIGHT_SENSOR
    overlappingCheckStartZ = pos and pos.z
    overlappingCheckEndZ = pos and (pos.z + pos.height)
    overlappingVisit = overlappingVisit + 1
    overlappingSearchedComponent = searchedComponent
    local slop = overlappingCheckSlop or 0

    local tlx, tly, brx, bry = sensor:getBoundingBox()
    self.world:queryBoundingBox(tlx - slop, tly - slop, brx + slop, bry + slop, onOverlappingEntitiesCheck)

    overlappingCheckSensor = nil
    overlappingCheckBody = nil
    overlappingCheckEntity = nil
    overlappingCheckType = nil
    overlappingCheckStartZ = nil
    overlappingCheckEndZ = nil
    overlappingCheckSlop = nil
    overlappingSearchedComponent = nil
    local result = overlappingCheckResult
    if #overlappingCheckResult > 0 then
        overlappingCheckResult = {}
    end

    return result
end

function PhysicsSystem:getFirstOverlappingOfType(sensor, type, pos)
    overlappingCheckStopOnFirst = true
    local result = self:getAllOverlappingOfType(sensor, type, pos)[1]
    overlappingCheckStopOnFirst = false
    return result
end

Physics = {}
Physics.__index = Physics
fancyTypes.physics = Physics

function Physics.new(world, entity)
    local body = love.physics.newBody(world, entity.pos.x, entity.pos.y, entity.body.type)
    body:setFixedRotation(true)
    body:setUserData(entity)
    local shape
    if entity.body.shape == "circle" then
        shape = love.physics.newUIUIShape(entity.body.size / 2)
    elseif entity.body.preshape then
        shape = entity.body.preshape
    end

    local fixture = love.physics.newFixture(body, shape, 1)
    fixture:setUserData({ type = FIXBODY })

    local instance = setmetatable({
        body = body,
        shape = shape,
        fixture = fixture,
    }, Physics)

    instance.heightSensor = instance:newSensor(shape, HEIGHT_SENSOR);
    instance.heightSensor:setCategory(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)

    instance:updateHeightSlices(entity.pos)

    return instance
end

function Physics:newSensor(shape, type)
    local sensor = love.physics.newFixture(self.body, shape, 0)
    sensor:setSensor(true)
    sensor:setUserData({ type = type });
    return sensor
end

function Physics:destroy()
    self.body:destroy()
end

function Physics:updateHeightSlices(pos)
    local startZ = pos.z
    local endZ = startZ + pos.height
    local sliceStart = math.clamp(1 + math.ceil(startZ / HEIGHT_SLICE), 1, 16)
    local sliceEnd = math.clamp(1 + math.floor((endZ - 1) / HEIGHT_SLICE), 1, 16)
    sliceEnd = math.max(sliceStart, sliceEnd)
    if sliceStart ~= self.sliceStart or sliceEnd ~= self.sliceEnd then
        -- Categories
        local categories = {}
        for i = sliceStart,sliceEnd do
            table.insert(categories, i)
        end
        self.fixture:setCategory(unpack(categories))

        -- Masks
        local masks = {}
        if sliceStart > 1 then
            for i = 1, sliceStart - 1 do
                table.insert(masks, i)
            end
        end
        if sliceEnd < 16 then
            for i = sliceEnd + 1, 16 do
                table.insert(masks, i)
            end
        end

        self.fixture:setMask(unpack(masks))

        self.sliceStart = sliceStart
        self.sliceEnd = sliceEnd
    end
end

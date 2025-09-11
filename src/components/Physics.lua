Physics = {}
Physics.__index = Physics

function Physics.new(world, entity)
    local body = love.physics.newBody(world, entity.pos.x, entity.pos.y, entity.body.type)
    body:setFixedRotation(true)
    body:setUserData(entity)
    local shape
    if entity.body.shape == "circle" then
        shape = love.physics.newCircleShape(entity.body.size / 2)
    elseif entity.body.preshape then
        shape = entity.body.preshape
    end

    local fixture = love.physics.newFixture(body, shape, 1)
    fixture:setUserData({
        id = 1,
        type = FIXBODY
    })

    local instance = setmetatable({
        body = body,
        shape = shape,
        fixture = fixture,
        nextSensorId = 2
    }, Physics)

    if entity.body.type == "dynamic" then
        instance.overlaps = {{}}
        instance.staleOverlaps = {{}}
    end

    instance.heightSensor = instance:newSensor(shape, HEIGHT_SENSOR);
    instance.heightSensor:setCategory(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)

    instance:updateHeightSlices(entity.pos)

    return instance
end

function Physics:newSensor(shape, type)
    local sensor = love.physics.newFixture(self.body, shape, 0)
    sensor:setSensor(true)
    sensor:setUserData({
        id = self.nextSensorId,
        type = type
    });
    if self.overlaps then
        self.overlaps[self.nextSensorId] = {}
        self.staleOverlaps[self.nextSensorId] = {}
    end
    self.nextSensorId = self.nextSensorId + 1
    return sensor
end

function Physics:setPosition(x, y)
    self.body:setAwake(false)
    self.body:setPosition(x, y)
    self.body:setAwake(true)
end


Physics.overlappingCheckSensor = nil
Physics.overlappingCheckType = nil
Physics.overlappingCheckStartZ = nil
Physics.overlappingCheckEndZ = nil
Physics.overlappingCheckResult = {}

function Physics:getAllOverlappingOfType(sensor, type, pos)
    Physics.overlappingCheckSensor = sensor
    Physics.overlappingCheckType = type or HEIGHT_SENSOR
    Physics.overlappingCheckStartZ = pos and pos.z
    Physics.overlappingCheckEndZ = pos and (pos.z + pos.height)

    local tlx, tly, brx, bry = sensor:getBoundingBox()
    self.physics:queryBoundingBox(tlx, tly, brx, bry, Physics.onOverlappingEntitiesCheck)

    Physics.overlappingEntitiesCheckSensor = nil
    Physics.overlappingCheckType = nil
    Physics.overlappingCheckStartZ = nil
    Physics.overlappingCheckEndZ = nil
    local result = Physics.overlappingEntitiesCheckResult
    if #Physics.overlappingEntitiesCheckResult > 0 then
        Physics.overlappingEntitiesCheckResult = {}
    end

    return result
end

function Physics.onOverlappingEntitiesCheck(fix)
    local sensor = Physics.overlappingEntitiesCheckSensor
    local typeToCheck = Physics.overlappingCheckType
    local body = sensor:getBody()
    local entity = body:getUserData()
    local result = Physics.overlappingEntitiesCheckResult
    local otherEntity = fix:getBody():getUserData()

    if entity.id == otherEntity.id or
        (typeToCheck and fix:getUserData() ~= typeToCheck) or
        (not love.physics.fancyTouchy(body, sensor, fix) and
            not fix:testPoint(entity.pos.x, entity.pos.y))
    then
        return true
    end

    if Physics.overlappingCheckStartZ then
        if overlapEntity.pos then
            local sz2 = overlapEntity.pos.z
            local ez2 = overlapEntity.pos.z + overlapEntity.pos.height
            if Physics.overlappingCheckStartZ < ez2 + DELTA and
                sz2 < Physics.overlappingCheckEndZ + DELTA
            then
                table.insert(result, overlapFix)
            end
        end
    else
        table.insert(result, overlapFix)
    end

    return true
end


Physics.overlappingCheckPairs = nil
Physics.overlappingCheckTable = nil
Physics.overlappingCheckKey = nil
Physics.overlappingCheckType = nil
Physics.overlappingCheckStartZ = nil
Physics.overlappingCheckEndZ = nil
Physics.overlappingCheckFunction = function()
    local overlapFix
    Physics.overlappingCheckKey, overlapFix =
        Physics.overlappingCheckPairs(Physics.overlappingCheckTable, Physics.overlappingCheckKey)
    if not Physics.overlappingCheckKey or overlapFix:isDestroyed() then
        return nil
    end
    if overlapFix:getUserData().type == Physics.overlappingCheckType then
        local overlapEntity = overlapFix:getBody():getUserData()
        if Physics.overlappingCheckStartZ then
            if overlapEntity.pos then
                local sz2 = overlapEntity.pos.z
                local ez2 = overlapEntity.pos.z + overlapEntity.pos.height
                if Physics.overlappingCheckStartZ < ez2 + DELTA and
                    sz2 < Physics.overlappingCheckEndZ + DELTA
                then
                    return overlapFix, overlapEntity
                end
            end
        else
            return overlapFix, overlapEntity
        end
    end
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

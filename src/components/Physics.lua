Physics = {}
Physics.__index = Physics
fancyTypes.physics = Physics

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

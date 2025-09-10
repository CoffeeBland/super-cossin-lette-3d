local PhysicsRenderer = { name = 'PhysicsRenderer' }

local seed = 123
local rng = love.math.newRandomGenerator(seed)

local function fixture_fill_color(fixture)
    if fixture:isSensor() then
        if fixture:getUserData().type == HEIGHT_SENSOR then
            return 0.5, 0.5, 0.5, 0.2
        else
            return 0, 0, 0.5, 0.4
        end
    else
        return 0.5, 0.5, 0.5, 0
    end
end

local function fixture_line_color(fixture)
    if fixture:isSensor() then
        return 0, 0, 1, 0
    else
        return 1, 1, 1
    end
end

local function draw_fixture(fixture)
    local shape = fixture:getShape()
    local shapeType = shape:getType()

    love.graphics.setColor(fixture_fill_color(fixture))

    if shapeType == "circle" then
        local x, y = shape:getPoint()
        local radius = shape:getRadius()
        love.graphics.circle("fill", x, y, radius, 15)
        love.graphics.setColor(fixture_line_color(fixture))
        love.graphics.circle("line", x, y, radius, 15)
        love.graphics.line(x, y, x + radius, y)
    elseif shapeType == "polygon" or shapeType == "chain" then
        local points = {shape:getPoints()}
        love.graphics.polygon("fill", points)
        love.graphics.setColor(fixture_line_color(fixture))
        love.graphics.polygon("line", points)
    elseif shapeType == "edge" then
        love.graphics.setColor(fixture_line_color(fixture))
        love.graphics.line(shape:getPoints())
    end
end

local function draw_body(body)
    local bx, by = body:getPosition()
    local bodyAngle = body:getAngle()

    love.graphics.push()
    love.graphics.translate(bx, by)
    love.graphics.rotate(bodyAngle)

    rng:setSeed(seed)

    local fixtures = body:getFixtures()
    for i = 1, #fixtures do
        draw_fixture(fixtures[i])
    end

    local entity = body:getUserData()
    if entity and entity.pos then
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print("z" .. math.round(entity.pos.z) .. ":" .. entity.pos.height, 0, 0, 0, 3, 3)
    end

    love.graphics.setPointSize(3)
    love.graphics.points(0, 0)
    love.graphics.pop()
end

local drawnBodies = {}
local function debug_world_draw_scissor_callback(fixture)
    drawnBodies[fixture:getBody()] = true
    return true --search continues until false
end

function PhysicsRenderer.draw_camera(physics, x, y, w, h)
    local sx, sy = love.graphics.inverseTransformPoint(x, y)
    local ex, ey = love.graphics.inverseTransformPoint(x + w, y + h)
    physics:queryBoundingBox(sx, sy, ex, ey, debug_world_draw_scissor_callback)

    love.graphics.setLineWidth(1)

    for body in pairs(drawnBodies) do
        drawnBodies[body] = nil
        draw_body(body)
    end

    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.setLineWidth(3)
    love.graphics.setPointSize(3)

    local joints = physics:getJoints()
    for i = 1, #joints do
        local x1, y1, x2, y2 = joints[i]:getAnchors()
        if x1 and x2 then
            love.graphics.line(x1, y1, x2, y2)
        else
            if x1 then
                love.graphics.points(x1, y1)
            end
            if x2 then
                love.graphics.points(x2, y2)
            end
        end
    end

    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.setPointSize(3)
    local contacts = physics:getContacts()
    for i = 1, #contacts do
        local x1, y1, x2, y2 = contacts[i]:getPositions()
        if x1 then
            love.graphics.points(x1, y1)
        end
        if x2 then
            love.graphics.points(x2, y2)
        end
    end

    love.graphics.setColor(1, 1, 1, 1)
end

return PhysicsRenderer

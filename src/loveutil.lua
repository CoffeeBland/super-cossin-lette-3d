function love.filesystem.crawl(dir, _results)
    if not _results then
        _results = {}
    end

    for _,file in ipairs(love.filesystem.getDirectoryItems(dir)) do
        local parts = str.split(file, ".")
        local name = parts[1]
        local extension = parts[2]
        if not extension then
            love.filesystem.crawl(dir .. "/" .. name, _results)
        else
            local path = dir .. "/" .. file
            local info = love.filesystem.getInfo(path, "file")
            if not timestamps[path] or timestamps[path].modtime < info.modtime then
                _results[path] = info
            end
        end
    end

    return _results
end

function love.physics.newEllipseShape(x, y, radiusx, radiusy, segments)
    return love.physics.newPolygonShape(unpack(math.getEllipse(x, y, radiusx, radiusy, segments)))
end

function love.physics.newUIUIShape(radius)
    return love.physics.newEllipseShape(0, 0, radius * ELLIPSE_WIDTH_RATIO, radius * ELLIPSE_HEIGHT_RATIO, 8)
end

function love.physics.overlap(sensor, otherFix)
    local tlx, tly, brx, bry = sensor:getBoundingBox()
    local ex, ey = (tlx + brx) / 2, (tly + bry) / 2
    if otherFix:testPoint(ex, ey) then
        return true
    end
    tlx, tly, brx, bry = otherFix:getBoundingBox()
    local ox, oy = (tlx + brx) / 2, (tly + bry) / 2
    local _, _, frac = otherFix:rayCast(ex, ey, ox, oy, 1)
    if frac then
        local x = ex + (ox - ex) * frac
        local y = ey + (oy - ey) * frac
        if sensor:testPoint(x, y) then
            return true
        end
    end
end

function love.physics.sampleShape(thingymagig, count)
    count = count or 1
    local tlx, tly, brx, bry = thingymagig:computeAABB(0, 0, 0)
    local result = {}
    for i = 1, count * 1000 do
        local ptx = tlx + math.random() * (brx - tlx)
        local pty = tly + math.random() * (bry - tly)
        if thingymagig:testPoint(0, 0, 0, ptx, pty) then
            table.insert(result, ptx)
            table.insert(result, pty)
            if #result >= count * 2 then
                return result
            end
        end
    end
    for i = #result, count do
        result[i] = 0
        result[i] = 0
    end
    return result
end

function love.keyboard.isAnyDown(keys)
    for _, key in pairs(keys) do
        if love.keyboard.isDown(key) then
            return true
        end
    end
    return false
end

function love.timer.measure()
    -- Noop by default. See options.
end

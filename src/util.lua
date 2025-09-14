str = {}
timestamps = {}

function math.clamp(x, min, max)
    return math.min(math.max(x, min), max)
end

function math.round(n)
    return math.floor(n + 0.5)
end

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
                timestamps[path] = info
                table.insert(_results, path)
            end
        end
    end

    return _results
end

function str.split(string, search)
    local arr = {}
    for v in string.gmatch(string, "([^" .. search .. "]+)") do
        table.insert(arr, v)
    end
    return arr
end

function str.filename(file)
    local dirParts = str.split(file, "/")
    local nameParts = str.split(dirParts[#dirParts], ".")
    return nameParts[1]
end

function str.requirename(file)
    local nameParts = str.split(file, ".")
    return nameParts[1]:gsub("/", ".")
end

function _dump(o, pre, seen, args)
    args = args or { sep = '\n' }
    seen = seen or {}
    pre = pre or ''
    if type(o) == 'table' then
        if seen[o] then
            return '<recursive>'
        end
        seen[o] = true

        local s = '{'
        for k,v in pairs(o) do
            if type(k) ~= 'number' then
                k = k .. ' = '
            else
                k = ''
            end
            s = s .. args.sep .. ' ' .. pre .. k .. _dump(v, pre .. ' ', seen, args) .. ','
        end
        return s .. args.sep .. pre .. '}'
    else
        return tostring(o)
    end
end

function dump(o, args)
    return _dump(o, "", {}, args)
end

function dumpTable(o, args)
    local args = args or { sep = '\n' }
    local seen = {}
    local s = '{'
    for j = 1, args.height do
        s = s .. args.sep .. '  '
        for i = 1, args.width do
            s = s .. tostring(o[i + (j - 1) * args.width]) .. ','
        end
    end
    return s .. args.sep .. '}'
end

function table.index(table, obj)
    for i, x in ipairs(table) do
        if x == obj then
            return i
        end
    end
end

function table.setHandlingTable(o, key, value)
    for actualKey in string.gmatch(key, "(%a+)%[%d*%]") do
        if not o[actualKey] then
            o[actualKey] = {}
        end
        table.insert(o[actualKey], value)
        return
    end

    o[key] = value
end

function love.physics.newEllipseShape(x, y, radiusx, radiusy, segments)
    --local points = {}
    --for i = 1,segments do
--
    --end
end

function love.physics.overlap(entity, sensor, other, otherFix)
    if otherFix:testPoint(entity.pos.x, entity.pos.y) then
        return true
    end
    local _, _, frac = otherFix:rayCast(entity.pos.x, entity.pos.y, other.pos.x, other.pos.y, 1)
    if frac then
        local x = entity.pos.x + (other.pos.x - entity.pos.x) * frac
        local y = entity.pos.y + (other.pos.y - entity.pos.y) * frac
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

function math.randomRange(range)
    return range[1] + math.random() * (range[2] - range[1])
end

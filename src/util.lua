str = {}

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
            table.insert(_results, dir .. "/" .. file)
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

function love.physics.fancyTouchy(body, sensor, otherFix)
    for _, contact in pairs(body:getContacts()) do
        local fix1, fix2 = contact:getFixtures()
        if (fix1 == sensor or fix2 == sensor) and
            (fix1 == otherFix or fix2 == otherFix) and
            contact:isTouching() then
            return true
        end
    end

    return false
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

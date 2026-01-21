str = {}
timestamps = {}

function math.clamp(x, min, max)
    return math.min(math.max(x, min), max)
end

function math.wrap(x, min, max)
    local extent = max - min + 1
    return (x - min + extent) % extent + min
end

function math.round(n)
    return math.floor(n + 0.5)
end

local function trigPart(frames, duration)
    local part = (duration - frames) / duration
    return (1 - math.cos(part * math.pi)) / 2
end

function math.interp(frames, current, target, duration)
    if duration then
        if frames < 1 then
            return target
        end
        local nextPart = trigPart(frames - 1, duration)
        local part = trigPart(frames, duration)
        local deltaPart = nextPart - part
        local remainingPart = 1 - part
        local ratio = (nextPart - part) / remainingPart
        return current + ratio * (target - current)
    end

    local p = 1 / math.max(frames or 1, 1)
    return current * (1 - p) + target * p
end

function math.larp(from, to, part)
    return from + part * (to - from)
end

function math.sign(x)
    return (x < 0 and -1) or (x > 0 and 1) or 0
end

function math.trigterp(time, ts, te, apex)
    if not apex or apex <= 0 then
        return 0
    end
    local part = (time - ts) / (te - ts)
    return apex * (1 - math.cos(part * 2 * math.pi)) / 2
end

local byte0 = 48
local byte9 = 57

function math.parse(str)
    if not str then
        return nil
    end
    local n = 0
    local digits = 0
    local bytes = { string.byte(str, 1, string.len(str)) }
    for i = #bytes, 1, -1 do
        local byte = bytes[i]
        if byte >= byte0 and byte <= byte9 then
            local digit = byte - byte0
            n = n + digit * (10^digits)
            digits = digits + 1
        end
    end
    return n
end

function math.randomSplitRange(rangePart, i, range, value)
    if not range then
        return value
    end
    local rangeExtent = (range[2] - range[1]) * rangePart
    local rangePartStart = range[1] + (i - 1) * rangeExtent
    return rangePartStart + math.random() * rangeExtent
end

function math.randomRange(range, value)
    return range and (range[1] + math.random() * (range[2] - range[1])) or value
end

function math.scaleToExpected(w, h)
    local minRatio = math.min(w / EXPRES[1], h / EXPRES[2])
    return math.min(minRatio, 1)
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

function table.find(t, fn)
    for i, x in ipairs(t) do
        if fn(x) then
            return x
        end
    end
end

function table.pop(t)
    local item = t[#t]
    table.remove(t, #t)
    return item
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

function table.recset(dest, key, source)
    if not dest[key] or type(source) ~= "table" then
        if source == "💔" then
            source = nil
        end
        dest[key] = source
    else
        for subkey, value in pairs(source) do
            table.recset(dest[key], subkey, value)
        end
    end
end

function table.clone(t)
    local clone = {}
    for k, v in pairs(t) do
        clone[k] = v
    end
    return clone
end

function table.clear(t)
    for k, _ in pairs(t) do
        t[k] = nil
    end
end

function table.uniqInsert(t, obj, fn)
    for _, x in pairs(t) do
        if fn(x, obj) then
            return
        end
    end
    table.insert(t, obj)
end

function math.getEllipsePoint(x, y, radiusx, radiusy, angle)
    local w = math.cos(angle) * radiusx
    local h = math.sin(angle) * radiusy
    return x + w, y + h
end

function math.getEllipse(x, y, radiusx, radiusy, segments)
    local points = {}
    for i = 1,segments do
        local angle = i / segments * 2 * math.pi
        local x, y = math.getEllipsePoint(x, y, radiusx, radiusy, angle)
        points[i * 2 - 1] = x
        points[i * 2] = y
    end
    return points
end

if _G.bit then
   bit = _G.bit
else
    -- https://stackoverflow.com/questions/78087883/lua-5-1-bitwise-operations-using-arithmetic-for-64bit-numbers
    -- Looked pretty decent
    local MOD = 2 ^ 32
    local MODM = MOD - 1

    local function memoize(f)
        local mt = { }
        local t = setmetatable( { }, mt)
        function mt:__index(k)
            local v = f(k)
            t[k] = v
            return v
        end
        return t
    end

    local function make_bitop_uncached(t, m)
        local function bitop(a, b)
            local res, p = 0, 1
            while a ~= 0 and b ~= 0 do
                local am, bm = a % m, b % m
                res = res + t[am][bm] * p
                a =(a - am) / m
                b =(b - bm) / m
                p = p * m
            end
            res = res +(a + b) * p
            return res
        end
        return bitop
    end

    local function make_bitop(t)
        local op1 = make_bitop_uncached(t, 2 ^ 1)
        local op2 = memoize( function(a) return memoize( function(b) return op1(a, b) end) end)
        return make_bitop_uncached(op2, 2 ^(t.n or 1))
    end

    local bxor1 = make_bitop( { [0] = { [0] = 0, [1] = 1 }, [1] = { [0] = 1, [1] = 0 }, n = 4 })

    local function bxor(a, b)
        local z = nil
        if b then
            a = a % MOD
            b = b % MOD
            z = bxor1(a, b)
            return z
        elseif a then
            return a % MOD
        else
            return 0
        end
    end

    local function band(a, b)
        local z
        if b then
            a = a % MOD
            b = b % MOD
            z =((a + b) - bxor1(a, b)) / 2
            return z
        elseif a then
            return a % MOD
        else
            return MODM
        end
    end

    local function bnot(x)
        return(-1 - x) % MOD
    end

    local function bor(x, y)
        return bnot(band(bnot(x), bnot(y)))
    end

    bit = {
        band = band,
        bnot = bnot,
        bor = bor
    }
end

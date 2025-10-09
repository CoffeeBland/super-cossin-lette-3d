Larp = {}
Larp.__index = Larp
Larp.get = {}
Larp.set = {}
fancyTypes.larp = Larp

function Larp.new(params)
    local instance = setmetatable({}, Larp)
    for key, larp in pairs(params or EMPTY) do
        instance:add(key, larp)
    end
    return instance
end

function Larp:add(key, larp)
    self[key] = {
        from = larp.from,
        to = larp.to,
        frames = larp.frames,
        delay = larp.delay,
        startOffset = larp.startOffset,
        toOffset = larp.toOffset
    }

    if not Larp.get[key] then
        Larp.get[key] = loadstring("return function (entity) return entity." .. key .. " end")()
        Larp.set[key] = loadstring("return function (entity, value) entity." .. key .. " = value end")()
    end
end

function Larp:empty()
    for _, _ in pairs(self) do
        return false
    end
    return true
end

function Larp:update(framePart, obj)
    for key, larp in pairs(self) do
        local current = Larp.get[key](obj);

        if larp.from then
            current = larp.from
            Larp.set[key](obj, current)
            larp.from = nil
        end

        if not larp.to then
            larp.to = current + (larp.toOffset or 0)
        end

        if larp.startOffset then
            current = current + larp.startOffset
            Larp.set[key](obj, current)
            larp.startOffset = nil
        end

        if (larp.delay or 0) > 0 then
            larp.delay = math.max(larp.delay - framePart, 0)
        elseif (larp.frames or 0) > 0 then
            larp.frames = math.max(larp.frames - framePart, 0)
            local value = math.interp(larp.frames, current, larp.to)
            Larp.set[key](obj, value)
        else
            Larp.set[key](obj, larp.to)
            self[key] = nil
        end
    end
end

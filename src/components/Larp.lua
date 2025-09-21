Larp = {}
Larp.__index = Larp
Larp.get = {}
Larp.set = {}
fancyTypes.larp = Larp


function Larp.new(params)
    local instance = setmetatable(params or {}, Larp)
    return instance
end

function Larp:empty()
    for _, _ in pairs(self) do
        return false
    end
    return true
end

function Larp:update(framePart, entity)
    for key, larp in pairs(self) do
        if not Larp.get[key] then
            Larp.get[key] = loadstring("return function (entity) return entity." .. key .. " end")()
            Larp.set[key] = loadstring("return function (entity, value) entity." .. key .. " = value end")()
        end

        local current = Larp.get[key](entity);

        if not larp.to then
            larp.to = current + larp.toOffset
        end

        if larp.startOffset then
            current = current + larp.startOffset
            Larp.set[key](entity, current)
            larp.startOffset = nil
        end

        if (larp.delay or 0) > 0 then
            larp.delay = math.max(larp.delay - framePart, 0)
        elseif (larp.frames or 0) > 0 then
            larp.frames = math.max(larp.frames - framePart, 0)
            local value = math.interp(larp.frames, current, larp.to)
            Larp.set[key](entity, value)
        else
            Larp.set[key](entity, larp.to)
            self[key] = nil
        end
    end
end

str = {}

function str.split(string, search)
    local arr = {}
    for v in string.gmatch(string, "[^" .. search .. "]+") do
        table.insert(arr, v)
        break
    end
    return arr
end

function dump(o, pre, seen, args)
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
            s = s .. args.sep .. '  ' .. pre .. k .. dump(v, pre .. '  ', seen, args) .. ','
        end
        return s .. args.sep .. pre .. '}'
    else
        return tostring(o)
    end
end

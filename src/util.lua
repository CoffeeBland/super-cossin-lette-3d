str = {}

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

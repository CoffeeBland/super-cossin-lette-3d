Save = {
    values = {},
    dirty = false
}

function Save:init()
    local info = love.filesystem.getInfo("save.lette")
    local contents = info and info.type == "file" and love.filesystem.read("save.lette") or ""

    local lines = str.split(contents, "\n")
    for _, line in ipairs(lines) do
        local key, value = line:match"%s*(%w+)%s*=%s*(%w+)"
        if value == "true" then
            value = true
        end
        if value == "false" then
            value = false
        end
        self.values[key] = value
    end
end

function Save:set(key, value)
    if value == true then
        value = "true"
    end
    if value == false then
        value = "false"
    end
    self.values[key] = value
    self.dirty = true
end

function Save:get(key)
    return self.values[key]
end

function Save:clear()
    self.values = {}
    self.dirty = true
end

function Save:flush()
    if not self.dirty then
        return
    end
    local str = ""
    for k, v in pairs(self.values) do
        if v ~= nil then
            str = str .. k .. " = " .. v .. "\n"
        end
    end
    love.filesystem.write("save.lette", str)
    self.dirty = false
end

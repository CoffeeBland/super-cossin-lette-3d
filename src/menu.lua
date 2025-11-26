menu = {}

function menu.newIdx(idx, items, shift, fn)
    if shift == 0 then
        return idx
    end
    local dir = math.sign(shift)
    for i = 1, 100 do
        idx = math.wrap(idx + dir, 1, #items)
        if fn(items[idx], idx) then
            shift = shift - dir
        end
        if shift == 0 then
            return idx
        end
    end
    return idx
end

function menu.draw(idx, scroll, items, w, h, dt)
    love.graphics.push()
    love.graphics.translate(w / 2, h / 2)

    love.graphics.setBlendMode("add")

    local fontHeight = fonts.menu:getHeight()
    local hmargin = Game.constants.options.hmargin * SCALE_TO_EXPECTED
    local vmargin = Game.constants.options.vmargin * SCALE_TO_EXPECTED

    local height = 0
    for i, item in ipairs(items) do
        if i > 1 then
            height = height + vmargin
        end
        if item.text then
            height = height + fontHeight
        end
    end

    local base = Game.constants.options.base
    local y = -(height + fontHeight) / 2

    for i, item in ipairs(items) do
        y = y + vmargin
        item.y = y
        if item.value or item.text then
            y = y + fontHeight
        end
    end

    if idx then
        local tscroll = scroll
        for di = -2, 2 do
            local item = items[math.clamp(idx + di, 1, #items)]
            local y = item.y + tscroll
            local hstart = -h/2 + vmargin
            local hend = h/2 - vmargin - fontHeight
            if y < hstart then
                tscroll = tscroll + hstart - y
            end
            if y > hend then
                tscroll = tscroll + hend - y
            end
        end
        local dscroll = tscroll - scroll
        if dscroll ~= 0 then
            scroll =
                math.sign(dscroll) *
                math.min(dt * Game.constants.options.scrollSpeed, math.abs(dscroll)) +
                scroll
        end
    end

    for i, item in ipairs(items) do
        love.graphics.setColor(unpack(
            (item.active or i == idx) and
                Game.constants.pause.buttonActive or
                Game.constants.pause.buttonInactive))
        love.graphics.setFont(item.font or fonts.menu)
        local y = item.y + scroll
        if item.value then
            love.graphics.printf(item.text, - (base + hmargin / 2), y, base, "right")
            love.graphics.printf(item.value, hmargin / 2, y, base, "left")
        elseif item.text then
            love.graphics.printf(item.text, -base / 2, y, base, "center")
        end
    end

    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.pop()
    return scroll
end

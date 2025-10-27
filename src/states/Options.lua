Options = {}

function Options:enter(params)
    if Music.current then
        Music.current:setFilter(Game.constants.musicFilters.pause)
    end
end

function Options:exit()
    if Music.current then
        Music.current:setFilter()
    end
end

function Options:update(dt)
    if actions.escape then
        StateMachine:pop(Options)
    end
end

function Options:render()
    local w, h = CURRES[1], CURRES[2]
    love.graphics.setColor(unpack(Game.constants.pauseColor))
    love.graphics.setBlendMode("multiply", "premultiplied")
    love.graphics.rectangle("fill", 0, 0, w, h)
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)
end

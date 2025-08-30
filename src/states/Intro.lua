local splashFrames = 360
local splashAlphaFrames = 120

Intro = {}

function Intro:enter()
    self.splashFrame = 0
end

function Intro:exit()
end

function Intro:update(dt)
    self.splashFrame = self.splashFrame + 1
    if self.splashFrame >= splashFrames or actions.escape then
        StateMachine:change(Game)
    end
end

function Intro:render()
    local x, y = love.graphics.getDimensions()
    love.graphics.setColor(72/255, 72/255, 72/255)
    love.graphics.rectangle('fill', 0, 0, x, y)

    local logoX, logoY = textures.coffeeBland:getDimensions()
    love.graphics.setColor(255/255, 255/255, 255/255)
    love.graphics.draw(textures.coffeeBland, x/2 - logoX/2, y/2 - logoY/2)

    -- fade in
    local alpha = 1 - math.min(self.splashFrame - 30, splashFrames - 30 - self.splashFrame) / splashAlphaFrames
    love.graphics.setColor(0/255, 0/255, 0/255, alpha)
    love.graphics.rectangle('fill', 0, 0, x, y)

    love.graphics.setColor(1, 1, 1, 1)
    return
end

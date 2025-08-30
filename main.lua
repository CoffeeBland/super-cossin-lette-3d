require "src.states.StateMachine"

local pressActions = {
    escape = "escape",
    space = "jump",
    enter = "action"
}

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setTitle("GAME")
    math.randomseed(os.time())

    fonts = {}
    textures = {
        coffeeBlandLogoImg = love.graphics.newImage("img/coffeebland.png")
    }
    sounds = {}
    actions = {
        escape = false,
        action = false,
        jump = false,
        movement = { x = 0, y = 0 }
    }

    -- set to first state
    StateMachine:change(Intro)

    love.keyboard.keyPressed = {}
end

function love.resize(w, h)
end

function love.keypressed(key)
    for key, action in pairs(pressActions) do
        actions[action] = true
    end
end

function love.update(dt)
    actions.movement.x = 0
    if love.keyboard.isDown('left') then
        actions.movement.x = actions.movement.x - 1
    end
    if love.keyboard.isDown('right') then
        actions.movement.x = actions.movement.x + 1
    end
    if love.keyboard.isDown('up') then
        actions.movement.y = actions.movement.y - 1
    end
    if love.keyboard.isDown('down') then
        actions.movement.y = actions.movement.y + 1
    end

    StateMachine:update(dt)

    for key, action in pairs(pressActions) do
        actions[action] = false
    end
end

function love.draw()
    StateMachine:render()
end

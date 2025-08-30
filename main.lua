if arg[2] == "debug" then
    require("lldebugger").start()
end

-- START CODE HERE

require "src.Dependencies"

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setTitle("GAME")
    math.randomseed(os.time())

    push:setupScreen(VIRTUAL.WIDTH, VIRTUAL.HEIGHT, WINDOW.WIDTH, WINDOW.HEIGHT, {
        vsynch = true,
        fullscreen = false,
        resizable = true,
    })

    gFonts = {
        -- fill with fonts
    }

    gTextures = {
        -- fill with textures
    }
    gSounds = {
        -- fill with sounds
    }

    gStateMachine = {
        -- fill with every state
    }

    -- set to first state
    gStateMachine:change("")

    love.keyboard.keyPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keyPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keyPressed[key] == true then
        return true
    else return false end
end

function love.update(dt)
    gStateMachine:update(dt)
    
    love.keyboard.keyPressed = {}
end

function love.draw()
    push:start()

    -- setup BG

    gStateMachine:render()
    displayFPS()

    push:finish()
end

function displayFPS()
    -- add small font
    love.graphics.setFont("")
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end

-- END CODE HERE

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
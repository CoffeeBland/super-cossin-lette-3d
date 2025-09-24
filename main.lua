require "src.util"
require "src.load"
require "src.input"
require "src.input"
require "src.constants"
require "src.states.StateMachine"

debug = { cycle = 0, physics = false, fps = false }

function love.load(args)
    local requestedMap = args[1]

    love.graphics.setDefaultFilter("nearest", "nearest")
    love.physics.setMeter(METER_SCALE)

    load.crawlFiles()

    if requestedMap then
        StateMachine:change(Game, { map = requestedMap })
    else
        StateMachine:change(Intro)
    end
end

local avgDt = 1 / 60
local frame = 0
local frameTime = 0
local frameDuration = 1 / 60

function love.update(dt)
    input.poll(dt)

    frameTime = frameTime + dt
    while frameTime + DELTA > frameDuration do
        frameTime = frameTime - frameDuration
        StateMachine:update(frameDuration)
    end

    if actions.toggleDebug then
        debug.cycle = (debug.cycle + 1) % 3
        debug.physics = debug.cycle >= 2
        debug.fps = debug.cycle >= 1
    end

    local requiresRefresh = load.crawlFiles(frame) or (actions.refresh and StateMachine.current.refresh)
    if StateMachine.current.refresh then
        StateMachine.current:refresh(requiresRefresh)
    end

    input.afterUpdate(dt)

    avgDt = avgDt * 0.9 + dt * 0.1
    frame = frame + 1
end

function love.draw()
    StateMachine:render()

    if debug.fps then
        love.graphics.print(math.round(1 / avgDt))
    end
end

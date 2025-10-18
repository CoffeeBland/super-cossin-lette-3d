require "src.util"
require "src.load"
require "src.input"
require "src.input"
require "src.constants"
require "src.states.StateMachine"

debug = { cycle = 0, physics = false, fps = false, autorefresh = true }

function love.load(args)
    local requestedMap = args[1]

    love.graphics.setDefaultFilter("nearest", "nearest")
    love.physics.setMeter(METER_SCALE)

    load.init()

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
    if DISREGARD_NEXT_UPDATE then
        dt = 0
        DISREGARD_NEXT_UPDATE = false
    end

    input.poll(dt)

    if actions.toggleDebug then
        debug.cycle = (debug.cycle + 1) % 6
        debug.physics = debug.cycle == 2
        debug.pointHeights = debug.cycle == 3
        debug.heightMap = debug.cycle == 4
        debug.shadowMap = debug.cycle == 5
        debug.fps = debug.cycle >= 1
        actions.toggleDebug = false
    end

    if debug.autorefresh and StateMachine.current.refresh then
        local requiresRefresh = load.crawlFiles(frame) or actions.refresh
        StateMachine.current:refresh(requiresRefresh)
    end

    frameTime = frameTime + dt
    while frameTime + DELTA > frameDuration do
        frameTime = frameTime - frameDuration
        StateMachine:update(frameDuration)

        input.afterUpdate(dt)
    end

    avgDt = avgDt * 0.9 + dt * 0.1
    frame = frame + 1
end

function love.draw()
    StateMachine:render()

    if debug.fps then
        love.graphics.print(math.round(1 / avgDt))
    end
end

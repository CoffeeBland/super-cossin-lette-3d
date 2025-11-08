require "src.util"
require "src.loveutil"
require "src.load"
require "src.input"
require "src.input"
require "src.constants"
require "src.error"
require "src.states.StateMachine"

debug = { cycle = 0, physics = false, fps = false, autorefresh = true }

function love.load(args)
    Options:apply()
    love.mouse.setVisible(false)
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
        local requiresRefresh = load.crawlFiles(frame)
        StateMachine.current:refresh(requiresRefresh)
    end

    if actions.refresh and StateMachine.current.refresh then
        StateMachine.current:refresh(true)
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
    CURRES[1], CURRES[2] = love.graphics:getDimensions()
    SCALE_TO_EXPECTED = math.scaleToExpected(CURRES[1], CURRES[2])

    if not SCREEN_CANVAS or SCREEN_CANVAS:getWidth() ~= CURRES[1] or SCREEN_CANVAS:getHeight() ~= CURRES[2] then
        SCREEN_CANVAS = love.graphics.newCanvas(CURRES[1], CURRES[2])
        SCREEN_SHADER:send("size", CURRES)
    end

    local menuFontSize = math.max(math.ceil(36 * SCALE_TO_EXPECTED), 18)
    if menuFontSize ~= fontsSizes.menu then
        fonts.menu = love.graphics.newFont(menuFontSize)
        fonts.menu:setFilter("nearest")
        fontsSizes.menu = menuFontSize
    end

    StateMachine:render()

    if debug.fps then
        love.graphics.print(math.round(1 / avgDt))
    end
end

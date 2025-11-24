require "src.util"
require "src.loveutil"
require "src.load"
require "src.input"
require "src.input"
require "src.constants"
require "src.error"
require "src.menu"
require "src.states.StateMachine"

dbg = { cycle = 0, physics = false, fps = false, autorefresh = false }

function love.load(args)
    Options:apply()
    love.mouse.setVisible(false)
    local requestedState, requestedMap
    if args[1] == "-s" then
        requestedState = args[2]
        requestedMap = args[3]
        Options:set("debug", 1 - Options.values.debug)
    elseif args[1] then
        requestedState = "game"
        requestedMap = args[1]
        Options:set("debug", 1 - Options.values.debug)
    end

    love.graphics.setDefaultFilter("nearest", "nearest")
    love.physics.setMeter(METER_SCALE)

    load.init()

    if requestedState then
        if requestedState == "title" then
            StateMachine:change(Title)
        elseif requestedState == "intro" then
            StateMachine:change(MapIntro, { map = requestedMap })
        elseif requestedState == "game" then
            StateMachine:change(Game, { map = requestedMap })
        else
            StateMachine:change(Intro)
        end
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
        Options:set("debug", 1)
    end

    if dbg.autorefresh and StateMachine.current.refresh then
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

        for i, err in ipairs(errors) do
            if err.frames == 0 then
                table.remove(errors, i)
            else
                err.frames = math.max(err.frames - 1)
            end
        end
    end

    avgDt = avgDt * 0.99 + dt * 0.01
    frame = frame + 1
end

function love.draw()
    CURRES[1], CURRES[2] = love.graphics:getDimensions()
    SCALE_TO_EXPECTED = math.scaleToExpected(CURRES[1], CURRES[2])

    if not SCREEN_CANVAS or SCREEN_CANVAS:getWidth() ~= CURRES[1] or SCREEN_CANVAS:getHeight() ~= CURRES[2] then
        SCREEN_CANVAS = love.graphics.newCanvas(CURRES[1], CURRES[2])
        SCREEN_SHADER:send("size", CURRES)
    end

    local menuFontSize = math.max(math.ceil(48 * SCALE_TO_EXPECTED), 14)
    if menuFontSize ~= fontsSizes.menu then
        fonts.menu = love.graphics.newFont(menuFontSize)
        fonts.menu:setFilter("nearest")
        fontsSizes.menu = menuFontSize
    end

    StateMachine:render()

    local y = 0
    for i, err in ipairs(errors) do
        local messageText = love.graphics.newText(fonts.menu, err.message)
        local detailsText = love.graphics.newText(fonts.menu, err.details)
        love.graphics.setColor(1, 0.25, 0.25, 1)
        love.graphics.draw(messageText, 0, y)
        y = y + messageText:getHeight()
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.draw(detailsText, 40, y)
        y = y + detailsText:getHeight()
        love.graphics.setColor(1, 1, 1, 1)
    end

    if dbg.fps then
        love.graphics.print(math.round(1 / avgDt))
    end
end

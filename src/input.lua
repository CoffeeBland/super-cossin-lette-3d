local pressActions = {
    escape = {
        keys = { "escape" },
        buttons = { "start" }
    },
    action = {
        keys = { "return", "space" },
        buttons = { "a", "x" }
    },
    toggleDebug = {
        keys = { "f12" },
        buttons = { "y" }
    },
    gogogadget = {
        keys = { "f11" },
        buttons={ "b" }
    }
}

local releaseActions = {
    jump = {
        keys = { "space" },
        buttons = { "a" }
    }
}

local movementActions = {
    horizontal = {
        negativeKeys = { "a", "left" },
        positiveKeys = { "d", "right" },
        axes = { "leftx" },
        negativeButtons = { "dpleft" },
        positiveButtons = { "dpright" }
    },
    vertical = {
        negativeKeys = { "w", "up" },
        positiveKeys = { "s", "down" },
        axes = { "lefty" },
        negativeButtons = { "dpup" },
        positiveButtons = { "dpdown" }
    }
}

local pressActionsByKey = {}
local pressActionsByButton = {}
for action, mappings in pairs(pressActions) do
    for _, key in pairs(mappings.keys or EMPTY) do
        pressActionsByKey[key] = action
    end
    for _, button in pairs(mappings.buttons or EMPTY) do
        pressActionsByButton[button] = action
    end
end

local controllers = {}

actions = {
    escape = false,
    action = false,
    jump = false,
    movement = { x = 0, y = 0, angle = nil },
    menu = { x = 0, y = 0, any = 0 },
    refresh = false,
    toggleDebug = false,
    gogogadget = false
}

input = {}

function love.keypressed(key)
    if pressActionsByKey[key] then
        actions[pressActionsByKey[key]] = true
    end
end

function love.gamepadpressed(controller, button)
    if pressActionsByButton[button] then
        actions[pressActionsByButton[button]] = true
    end
end

function love.joystickadded(controller)
    controllers[controller:getID()] = controller
end

function love.joystickremoved(controller)
    controllers[controller:getID()] = nil
end

function input.poll(dt)
    local wasMove = (math.abs(actions.movement.x) > DELTA or math.abs(actions.movement.y) > DELTA)
    actions.movement.x = 0
    actions.movement.y = 0
    for _, key in ipairs(movementActions.horizontal.negativeKeys) do
        if love.keyboard.isDown(key) then
            actions.movement.x = actions.movement.x - 1
        end
    end
    for _, key in ipairs(movementActions.horizontal.positiveKeys) do
        if love.keyboard.isDown(key) then
            actions.movement.x = actions.movement.x + 1
        end
    end
    for _, key in ipairs(movementActions.vertical.negativeKeys) do
        if love.keyboard.isDown(key) then
            actions.movement.y = actions.movement.y - 1
        end
    end
    for _, key in ipairs(movementActions.vertical.positiveKeys) do
        if love.keyboard.isDown(key) then
            actions.movement.y = actions.movement.y + 1
        end
    end
    for _, controller in pairs(controllers) do
        for _, axis in ipairs(movementActions.horizontal.axes) do
            local leftx = controller:getGamepadAxis("leftx")
            if math.abs(leftx) < 0.25 then
                leftx = 0
            end
            actions.movement.x = actions.movement.x + leftx
        end
        for _, axis in ipairs(movementActions.vertical.axes) do
            local lefty = controller:getGamepadAxis("lefty")
            if math.abs(lefty) < 0.25 then
                lefty = 0
            end
            actions.movement.y = actions.movement.y + lefty
        end
        for _, button in ipairs(movementActions.horizontal.negativeButtons) do
            if controller:isGamepadDown(button) then
                actions.movement.x = actions.movement.x - 1
            end
        end
        for _, button in ipairs(movementActions.horizontal.positiveButtons) do
            if controller:isGamepadDown(button) then
                actions.movement.x = actions.movement.x + 1
            end
        end
        for _, button in ipairs(movementActions.vertical.negativeButtons) do
            if controller:isGamepadDown(button) then
                actions.movement.y = actions.movement.y - 1
            end
        end
        for _, button in ipairs(movementActions.vertical.positiveButtons) do
            if controller:isGamepadDown(button) then
                actions.movement.y = actions.movement.y + 1
            end
        end
    end
    if actions.movement.x ~= 0 or actions.movement.y ~= 0 then
        local len = math.min(math.sqrt(actions.movement.x^2 + actions.movement.y^2), 1)
        local directAngle = math.atan2(actions.movement.y, actions.movement.x)
        local adjustedAngle = math.atan2(
            math.sin(directAngle) * TILE_HEIGHT,
            math.cos(directAngle) * TILE_WIDTH)

        actions.movement.angle = adjustedAngle
        actions.movement.x = math.cos(adjustedAngle) * len
        actions.movement.y = math.sin(adjustedAngle) * len
    else
        actions.movement.angle = nil
    end
    actions.menu.x = math.abs(actions.movement.x) > DELTA and math.sign(actions.movement.x) or 0
    actions.menu.y = math.abs(actions.movement.y) > DELTA and math.sign(actions.movement.y) or 0
    actions.menu.any = actions.menu.x ~= 0 and actions.menu.x or actions.menu.y
    actions.move = not wasMove and (actions.menu.x ~= 0 or actions.menu.y ~= 0)
end

function input.afterUpdate(dt)
    -- Handle release actions.
    for action, mappings in pairs(releaseActions) do
        local preaction = "pre" .. action
        -- Cleanup previous release.
        actions[action] = false
        -- Handle release actions' preaction and action.
        local isActive = false
        for _, key in ipairs(mappings.keys) do
            isActive = isActive or love.keyboard.isDown(key)
        end
        for _, button in ipairs(mappings.buttons) do
            for _, controller in pairs(controllers) do
                isActive = isActive or controller:isGamepadDown(button)
            end
        end
        if isActive then
            actions[preaction] = true
        elseif actions[preaction] then
            actions[preaction] = false
            actions[action] = true
        end
    end

    -- Cleanup press actions.
    for action in pairs(pressActions) do
        actions[action] = false
    end
end

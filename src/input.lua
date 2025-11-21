local pressActions
local releaseActions
local movementActions
local pressActionsByKey
local pressActionsByButton
function setupActions()
    pressActions = {
        start = {
            keys = { "escape" },
            buttons = { "start" }
        },
        back = {
            keys = { "escape" },
            buttons = { "b" }
        },
        action = {
            keys = { "return", "space" },
            buttons = { "a" }
        },
        toggleDebug = {
            keys = { "f12" },
            buttons = { "y" }
        },
        gogogadget = {
            keys = { "f11" },
            buttons = { "x" }
        },
        newPlayer = {
            keys = {},
            buttons = { "back" }
        },
        jump = Options.values.arcade and {
            keys = { "space" },
            buttons = { "a" }
        } or nil,
        refresh = {
            keys = { "f5" },
            buttons = {}
        }
    }

    releaseActions = {
        jump = (not Options.values.arcade) and {
            keys = { "space" },
            buttons = { "a" }
        } or nil
    }

    movementActions = {
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

    pressActionsByKey = {}
    pressActionsByButton = {}
    for action, mappings in pairs(pressActions) do
        for _, key in pairs(mappings.keys or EMPTY) do
            if not pressActionsByKey[key] then
                pressActionsByKey[key] = {}
            end
            table.insert(pressActionsByKey[key], action)
        end
        for _, button in pairs(mappings.buttons or EMPTY) do
            if not pressActionsByButton[button] then
                pressActionsByButton[button] = {}
            end
            table.insert(pressActionsByButton[button], action)
        end
    end
end
setupActions()

local controllers = {}
local freePlayerIds = { 4, 3, 2 }

playerActions = {
    {
        id = 1,
        keyboard = true,
        controllers = {},
        escape = false,
        action = false,
        jump = false,
        move = false,
        movement = { x = 0, y = 0, angle = nil },
        menu = { x = 0, y = 0, any = 0 },
        refresh = false,
        toggleDebug = false,
        gogogadget = false
    }
}
playerActionsById = {}

actions = playerActions[1]
playerActionsById[playerActions[1].id] = playerActions[1]

input = {}

function love.keypressed(key)
    if pressActionsByKey[key] then
        for _, player in ipairs(playerActions) do
            if player.keyboard then
                for _, action in ipairs(pressActionsByKey[key]) do
                    player[action] = true
                end
                return
            end
        end
    end
end

function love.gamepadpressed(controller, button)
    if button == "back" then
        input.handlePlayerAddRemove(controller)
    end

    local id = controller:getID()
    if pressActionsByButton[button] then
        for _, player in ipairs(playerActions) do
            for _, controller in ipairs(player.controllers) do
                if controller:getID() == id then
                    for _, action in ipairs(pressActionsByButton[button]) do
                        player[action] = true
                    end
                    return
                end
            end
        end
    end
end

function love.joystickadded(controller)
    -- All new controllers go to P1 until somebody does something about it
    table.insert(actions.controllers, controller)
end

function love.joystickremoved(controller)
    local id = controller:getID()
    for _, actions in ipairs(playerActions) do
        for i, otherController in ipairs(actions.controllers) do
            if otherController:getID() == id then
                table.remove(actions.controllers, i)
                if actions.id > 1 and #actions.controllers == 0 then
                    input.removePlayer(actions)
                end
                return
            end
        end
    end
end

function input.handlePlayerAddRemove(controller)
    local id = controller:getID()
    for _, player in ipairs(playerActions) do
        for _, controller in ipairs(player.controllers) do
            if controller:getID() == id then
                if player.id == 1 then
                    input.newPlayer(controller)
                else
                    input.removePlayer(player)
                end
                return
            end
        end
    end
    print("SHOULDN'T REALLY HAPPEN SHIT")
    input.newPlayer(controller)
end

function input.newPlayer(controller)
    -- Check no player is already using the controller
    local id = controller:getID()
    for _, actions in ipairs(playerActions) do
        for i, otherController in ipairs(actions.controllers) do
            if otherController:getID() == id then
                table.remove(actions.controllers, i)
            end
        end
    end

    local player = {
        id = table.pop(freePlayerIds),
        keyboard = false,
        controllers = { controller },
        escape = false,
        action = false,
        jump = false,
        move = false,
        movement = { x = 0, y = 0, angle = nil },
        menu = { x = 0, y = 0, any = 0 },
        refresh = false,
        toggleDebug = false,
        gogogadget = false
    }
    table.insert(playerActions, player)
    playerActionsById[player.id] = player
end

function input.removePlayer(player)
    -- Give the controllers back to P1
    for _, controller in ipairs(player.controllers) do
        table.insert(actions.controllers, controller)
    end

    table.remove(playerActions, table.index(playerActions, player))
    table.insert(freePlayerIds, player.id)
    playerActionsById[player.id] = nil
end

function input.poll(dt)
    for _, forPlayer in pairs(playerActions) do
        input.pollPlayer(dt, forPlayer)
    end
end

function input.pollPlayer(dt, actions)
    local wasMove = (math.abs(actions.movement.x) > DELTA or math.abs(actions.movement.y) > DELTA)
    actions.movement.x = 0
    actions.movement.y = 0
    if actions.keyboard then
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
    end
    for _, controller in pairs(actions.controllers) do
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
    if not wasMove and (actions.menu.x ~= 0 or actions.menu.y ~= 0) then
        actions.move = true
    end
end

function input.afterUpdate(dt)
    for _, forPlayer in pairs(playerActions) do
        input.afterPlayerUpdate(dt, forPlayer)
    end
end

function input.afterPlayerUpdate(dt, actions)
    -- Handle release actions.
    for action, mappings in pairs(releaseActions) do
        local preaction = "pre" .. action
        -- Cleanup previous release.
        actions[action] = false
        -- Handle release actions' preaction and action.
        local isActive = false
        if actions.keyboard then
            for _, key in ipairs(mappings.keys) do
                isActive = isActive or love.keyboard.isDown(key)
            end
        end
        for _, button in ipairs(mappings.buttons) do
            for _, controller in pairs(actions.controllers) do
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

    actions.move = false
end

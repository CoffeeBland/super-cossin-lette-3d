require "src.util"
require "src.states.StateMachine"

local pressActions = {
    escape = "escape",
    space = "jump",
    enter = "action"
}

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setTitle("Super Cossin Lette 3D")
    love.window.setMode(1024, 768, { resizable = true })
    math.randomseed(os.time())

    fonts = {}
    textures = {}
    sounds = {}
    actions = {
        escape = false,
        action = false,
        jump = false,
        movement = { x = 0, y = 0 }
    }
    sprites = {}
    tileset = {}
    objects = {
        byId = {},
        byName = {}
    }

    for _,file in ipairs(love.filesystem.getDirectoryItems("img")) do
        local name = str.split(file, ".")[1]
        textures[name] = love.graphics.newImage("img/" .. file)
    end

    for _,file in ipairs(love.filesystem.getDirectoryItems("data")) do
        local name = str.split(file, ".")[1]
        local data = require("data." .. name)

        if data.tiledversion then
            if data.name == "objects" then
                for _, object in ipairs(data.tiles) do
                    local name = str.split(object.image, ".")[1]
                    object.name = name
                    object.offsetX = object.properties and object.properties.offsetX or 0
                    object.offsetY = object.properties and object.properties.offsetY or 0
                    objects.byId[object.id] = object
                    objects.byName[name] = object
                end
            end

            if data.name == "tileset" then
                tileset.tiles = {}
                local name = str.split(data.image, ".")[1]
                for i = 1, data.tilecount do
                    tileset.tiles[i] = love.graphics.newQuad(
                        ((i - 1) % data.columns) * data.tilewidth,
                        math.floor((i - 1) / data.columns) * data.tileheight,
                        data.tilewidth,
                        data.tileheight,
                        textures[name])
                end
            end
        end

        if data.sprites then
            local texture = textures[name]
            for spriteName, sprite in pairs(data.sprites) do
                for animName, anim in pairs(sprite) do
                    for i, tile in ipairs(anim.tiles) do
                        anim.tiles[i] = love.graphics.newQuad(
                            tile[1] * data.tileWidth,
                            tile[2] * data.tileHeight,
                            data.tileWidth,
                            data.tileHeight,
                            texture)
                    end
                end
                textures[name .. "." .. spriteName] = texture
                sprites[name .. "." .. spriteName] = sprite
            end
        end
    end

    -- set to first state
    StateMachine:change(Game)

    love.keyboard.keyPressed = {}
end

function love.resize(w, h)
end

function love.keypressed(key)
    if pressActions[key] then
        actions[pressActions[key]] = true
    end
end

function love.update(dt)
    actions.movement.x = 0
    actions.movement.y = 0
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
    if actions.movement.x ~= 0 or actions.movement.y ~= 0 then
        actions.movement.angle = math.atan2(actions.movement.y, actions.movement.x)
    else
        actions.movement.angle = nil
    end

    StateMachine:update(dt)

    for key, action in pairs(pressActions) do
        actions[action] = false
    end
end

function love.draw()
    StateMachine:render()
end

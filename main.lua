require "src.util"
require "src.constants"
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

    print("loading imgs")
    for _,file in ipairs(love.filesystem.crawl("img")) do
        local name = str.filename(file)
        textures[name] = love.graphics.newImage(file)
    end

    for _,file in ipairs(love.filesystem.crawl("data")) do
        local name = str.filename(file)
        local data = require(str.requirename(file))
        print("reading data", file)

        if data.tiledversion then
            if data.name == "objects" then
                for _, object in ipairs(data.tiles) do
                    local name = str.filename(object.image)
                    object.name = name
                    object.offsetX = object.properties and object.properties.offsetX or 0
                    object.offsetY = object.properties and object.properties.offsetY or 0
                    objects.byId[object.id] = object
                    objects.byName[name] = object
                    objects.shapes = {}

                    if object.objectGroup and object.objectGroup.objects then
                        for _, subobject in ipairs(object.objectGroup.objects) do
                            if subobject.shape == "polygon" then
                                local vertices = {}
                                for _, point in ipairs(subobject.polygon) do
                                    table.insert(vertices, (point.x + subobject.x - object.offsetX) / METER_SCALE)
                                    table.insert(vertices, (point.y + subobject.y - object.offsetY) / METER_SCALE)
                                end
                                object.shape = love.physics.newPolygonShape(vertices)
                            elseif subobject.shape == "ellipse" then
                                -- Oops, all circles!
                                object.shape = love.physics.newCircleShape(
                                    (subobject.x + subobject.width / 2 - object.offsetX) / METER_SCALE,
                                    (subobject.y + subobject.height / 2 - object.offsetY) / METER_SCALE,
                                    (subobject.width + subobject.height) / 4 / METER_SCALE)
                            end
                        end
                    end
                end
            end

            if data.name == "tileset" then
                tileset.tiles = {}
                if data.image then
                    local name = str.filename(data.image)
                    for i = 1, data.tilecount do
                        tileset.tiles[i] = love.graphics.newQuad(
                            ((i - 1) % data.columns) * data.tilewidth,
                            math.floor((i - 1) / data.columns) * data.tileheight,
                            data.tilewidth,
                            data.tileheight,
                            textures[name])
                    end
                elseif data.tiles then
                    local tw = math.ceil(math.sqrt(data.tilecount))
                    local th = math.ceil(data.tilecount / tw)
                    local canvas = love.graphics.newCanvas(tw * data.tilewidth, th * data.tileheight)
                    textures[name] = canvas
                    love.graphics.setCanvas(canvas)
                    for i, tile in ipairs(data.tiles) do
                        local tileName = str.filename(tile.image)
                        local x = (i - 1) % tw
                        local y = math.floor((i - 1) / tw)
                        love.graphics.draw(
                            textures[tileName],
                            x * data.tilewidth,
                            y * data.tileheight)
                        tileset.tiles[tile.id + 1] = love.graphics.newQuad(
                            x * data.tilewidth,
                            y * data.tileheight,
                            data.tilewidth,
                            data.tileheight,
                            canvas)
                    end
                    love.graphics.setCanvas()
                end
            end
        end

        if data.sprites then
            for spriteName, sprite in pairs(data.sprites) do
                local texture = textures[spriteName]
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
                sprites[spriteName] = sprite
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

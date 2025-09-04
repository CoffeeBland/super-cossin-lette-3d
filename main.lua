require "src.util"
require "src.constants"
require "src.states.StateMachine"

local pressActions = {
    escape = "escape",
    enter = "action",
    f12 = "toggleDebug"
}

local releaseActions = {
    space = "jump"
}

function getObjectPos(alignment, obj)
    local texture = textures[obj.name]
    if alignment == "unspecified" or alignment == "bottom" then
        return -texture:getWidth() / 2, -texture:getHeight()
    end
end

debug = { physics = false }

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setTitle("Super Cossin Lette 3D")
    love.window.setMode(1024, 768, { resizable = true })
    love.window.setVSync(1)
    love.physics.setMeter(METER_SCALE)

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
                for _, objData in ipairs(data.tiles) do
                    local obj = {}
                    obj.name = str.filename(objData.image)
                    obj.id = objData.id
                    obj.offsetX = 0
                    obj.offsetY = 0
                    for key, value in pairs(objData.properties) do
                        obj[key] = value
                    end
                    obj.posX, obj.posY = getObjectPos(data.objectalignment, obj)
                    objects.byId[obj.id] = obj
                    objects.byName[obj.name] = obj

                    if objData.objectGroup and objData.objectGroup.objects then
                        for _, subobject in ipairs(objData.objectGroup.objects) do
                            if subobject.shape == "polygon" then
                                local vertices = {}
                                local verticesFlipX = {}
                                local verticesFlipY = {}
                                for _, point in ipairs(subobject.polygon) do
                                    -- Regular
                                    table.insert(vertices, point.x + subobject.x - obj.offsetX)
                                    table.insert(vertices, point.y + subobject.y - obj.offsetY)
                                    -- FlipX TODO AAA
                                    table.insert(verticesFlipX, point.x + subobject.x - obj.offsetX)
                                    table.insert(verticesFlipX, point.y + subobject.y - obj.offsetY)
                                    -- FlipY TODO AAA
                                    table.insert(verticesFlipY, point.x + subobject.x - obj.offsetX)
                                    table.insert(verticesFlipY, point.y + subobject.y - obj.offsetY)
                                end
                                if #vertices > 8 then
                                    obj.shape = love.physics.newChainShape(true, vertices)
                                    obj.shapeFlipX = love.physics.newChainShape(true, verticesFlipX)
                                    obj.shapeFlipY = love.physics.newChainShape(true, verticesFlipY)
                                else
                                    obj.shape = love.physics.newPolygonShape(vertices)
                                    obj.shapeFlipX = love.physics.newPolygonShape(verticesFlipX)
                                    obj.shapeFlipY = love.physics.newPolygonShape(verticesFlipY)
                                end
                            elseif subobject.shape == "ellipse" then
                                -- Oops, all circles!
                                obj.shape = love.physics.newCircleShape(
                                    (subobject.x + subobject.width / 2 - obj.offsetX),
                                    (subobject.y + subobject.height / 2 - obj.offsetY),
                                    (subobject.width + subobject.height) / 4)
                                obj.shapeFlipX = obj.shape
                                obj.shapeFlipY = obj.shape
                            end
                        end
                    end
                end
            end

            if data.name == "tileset" then
                tileset.tiles = {}
                tileset.anims = {}
                tileset.tilewidth = data.tilewidth
                tileset.tileheight = data.tileheight
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
                    -- Tiles can be of non-uniform size.
                    -- As such, this is fucked.
                    -- Sort by greatest height first, make rows of the given height, and fuck being optimal
                    table.sort(data.tiles,
                        function (a, b)
                            return a.height > b.height
                        end)

                    -- Use a width for fun.
                    local width = data.tilewidth * 8
                    local height = 0

                    -- Fill out rows so we can find out the height...
                    local rows = {}
                    local row = nil
                    for _, tile in ipairs(data.tiles) do
                        if not row or row.remainingWidth < tile.width then
                            row = { y = height, remainingWidth = width, height = tile.height, tiles = {} }
                            height = height + tile.height
                            table.insert(rows, row)
                        end
                        row.remainingWidth = row.remainingWidth - tile.width
                        table.insert(row.tiles, tile)
                    end

                    local canvas = love.graphics.newCanvas(width, height)
                    textures[name] = canvas
                    love.graphics.setCanvas(canvas)

                    -- Gogo gadget.
                    for _, row in ipairs(rows) do
                        local x = 0
                        local y = row.y
                        for _, tile in ipairs(row.tiles) do
                            local tileName = str.filename(tile.image)
                            love.graphics.draw(textures[tileName], x, y)
                            tileset.tiles[tile.id] = {
                                quad = love.graphics.newQuad(x, y, tile.width, tile.height, canvas),
                                originX = 0,
                                originY = tile.height
                            }
                            if tile.animation and #tile.animation > 1 then
                                local ids = {}
                                for i, frame in ipairs(tile.animation) do
                                    ids[i] = frame.tileid
                                end
                                tileset.anims[tile.id] = {
                                    fps = 1000 / tile.animation[1].duration,
                                    ids = ids
                                }
                            end
                            x = x + tile.width
                        end
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
        actions.movement.x = actions.movement.x - tileset.tilewidth
    end
    if love.keyboard.isDown('right') then
        actions.movement.x = actions.movement.x + tileset.tilewidth
    end
    if love.keyboard.isDown('up') then
        actions.movement.y = actions.movement.y - tileset.tileheight
    end
    if love.keyboard.isDown('down') then
        actions.movement.y = actions.movement.y + tileset.tileheight
    end
    if actions.movement.x ~= 0 or actions.movement.y ~= 0 then
        actions.movement.angle = math.atan2(actions.movement.y, actions.movement.x)
    else
        actions.movement.angle = nil
    end

    StateMachine:update(dt)

    for key, action in pairs(releaseActions) do
        local preaction = "pre" .. action
        actions[action] = false
        if love.keyboard.isDown(key) then
            actions[preaction] = true
        elseif actions[preaction] then
            actions[preaction] = false
            actions[action] = true
        end
    end

    if actions.toggleDebug then
        debug.physics = not debug.physics
    end

    for key, action in pairs(pressActions) do
        actions[action] = false
    end
end

function love.draw()
    StateMachine:render()
end

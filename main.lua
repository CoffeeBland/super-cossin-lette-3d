require "src.util"
require "src.constants"
require "src.states.StateMachine"

local pressActions = {
    escape = "escape",
    enter = "action",
    f5 = "refresh",
    f12 = "toggleDebug"
}

local releaseActions = {
    space = "jump"
}

function getTexturePos(alignment, texture)
    if alignment == "unspecified" or alignment == "bottom" then
        return -texture:getWidth() / 2, -texture:getHeight()
    end
end

function getObjectPos(alignment, obj)
    local texture = textures[obj.name]
    return getTexturePos(alignment, texture)
end

function getTilePos(alignment, tile)
    local tileName = str.filename(tile.image)
    local texture = textures[tileName]
    return getTexturePos(alignment, texture)
end

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
prefabs = {}
debug = { physics = false }

function love.loadData(name, file)
    local loaded, error = loadfile(file)
    if error then
        print("Error in", file, ":", error)
        return
    end
    local data = loaded()
    local isPrefab = type(data) == "function"

    if isPrefab then
        prefabs[name] = data
        return
    end

    if data.tiledversion then
        if data.name == "objects" then
            for _, objData in ipairs(data.tiles) do
                local obj = {}
                obj.name = str.filename(objData.image)
                obj.id = objData.id
                obj.offsetX = 0
                obj.offsetY = 0
                for key, value in pairs(objData.properties) do
                    table.setHandlingTable(obj, key, value)
                end
                obj.posX, obj.posY = getObjectPos(data.objectalignment, obj)
                objects.byId[obj.id] = obj
                objects.byName[obj.name] = obj

                if obj.shadow then
                    local shadowTexture = textures[obj.shadow]
                    obj.shadow = {
                        name = obj.shadow,
                        anchor = {
                            x = shadowTexture:getWidth() / 2,
                            y = shadowTexture:getHeight() / 2
                        }
                    }
                end

                -- Collisions!!!
                if objData.objectGroup and objData.objectGroup.objects then
                    for _, subobject in ipairs(objData.objectGroup.objects) do
                        if subobject.shape == "polygon" then
                            local vertices = {}
                            local verticesFlipX = {}
                            local verticesFlipY = {}
                            local minX, minY, maxX, maxY
                            for _, point in ipairs(subobject.polygon) do
                                local x = point.x + subobject.x - obj.offsetX
                                local y = point.y + subobject.y - obj.offsetY
                                minX = minX and math.min(x, minX) or x
                                maxX = maxX and math.max(x, maxX) or x
                                minY = minY and math.min(y, minY) or y
                                maxY = maxY and math.max(y, maxY) or y
                                table.insert(vertices, x)
                                table.insert(vertices, y)
                                table.insert(verticesFlipX, -x)
                                table.insert(verticesFlipX, y)
                                table.insert(verticesFlipY, x)
                                table.insert(verticesFlipY, -y)
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

                            local shadowW = maxX - minX + STATIC_SHADOW_SLOP * 2
                            local shadowH = maxY - minY + STATIC_SHADOW_SLOP * 2
                            local shadowCanvas = love.graphics.newCanvas(shadowW, shadowH)
                            love.graphics.setCanvas(shadowCanvas)

                            love.graphics.setColor(1, 1, 1, 1)
                            love.graphics.rectangle("fill", 0, 0, shadowW, shadowH)

                            love.graphics.push()
                            love.graphics.translate(-minX + STATIC_SHADOW_SLOP, -minY + STATIC_SHADOW_SLOP)
                            love.graphics.setColor(0.875, 0.867, 0.941, 1)
                            love.graphics.setLineWidth(STATIC_SHADOW_SLOP)
                            love.graphics.setLineStyle("smooth")
                            love.graphics.polygon("line", obj.shape:getPoints())
                            love.graphics.polygon("fill", obj.shape:getPoints())
                            love.graphics.pop()

                            love.graphics.setColor(1, 1, 1, 1)
                            love.graphics.setCanvas()
                            local shadowName = "objectShadow" .. obj.name;
                            textures[shadowName] = shadowCanvas

                            local centerX = (maxX + minX) / 2
                            local centerY = (maxY + minY) / 2

                            obj.shadow = {
                                name = shadowName,
                                anchor = {
                                    x = shadowW / 2 - centerX,
                                    y = shadowH / 2 - centerY
                                }
                            }
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
            tileset.shapes = {}
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
                        if tile.objectGroup and tile.objectGroup.objects then
                            for _, subobject in ipairs(tile.objectGroup.objects) do
                                if subobject.shape == "polygon" then
                                    local posX, posY = getTilePos(data.objectalignment, tile)
                                    local vertices = {}
                                    local verticesFlipX = {}
                                    local verticesFlipY = {}
                                    local minX, minY, maxX, maxY
                                    for _, point in ipairs(subobject.polygon) do
                                        local x = point.x + subobject.x + posX
                                        local y = point.y + subobject.y + posY
                                        minX = minX and math.min(x, minX) or x
                                        maxX = maxX and math.max(x, maxX) or x
                                        minY = minY and math.min(y, minY) or y
                                        maxY = maxY and math.max(y, maxY) or y
                                        table.insert(vertices, x)
                                        table.insert(vertices, y)
                                        table.insert(verticesFlipX, -x)
                                        table.insert(verticesFlipX, y)
                                        table.insert(verticesFlipY, x)
                                        table.insert(verticesFlipY, -y)
                                    end
                                    if #vertices > 8 then
                                        tileset.shapes[tile.id] = {
                                            default = love.physics.newChainShape(true, vertices),
                                            flipX = love.physics.newChainShape(true, verticesFlipX),
                                            flipY = love.physics.newChainShape(true, verticesFlipY)
                                        }
                                    else
                                        tileset.shapes[tile.id] = {
                                            default = love.physics.newPolygonShape(vertices),
                                            flipX = love.physics.newPolygonShape(verticesFlipX),
                                            flipY = love.physics.newPolygonShape(verticesFlipY)
                                        }
                                    end
                                end
                            end
                        end
                        x = x + tile.width
                    end
                end

                love.graphics.setCanvas()
            end
        end
    end

    if data.tileWidth and data.tileHeight and data.sprites then
        for spriteName, sprite in pairs(data.sprites) do
            local texture = textures[spriteName]
            for animName, anim in pairs(sprite) do
                anim.triggers = {}
                for i, tile in ipairs(anim.tiles) do
                    anim.tiles[i] = {
                        quad = love.graphics.newQuad(
                            tile[1] * data.tileWidth,
                            tile[2] * data.tileHeight,
                            data.tileWidth,
                            data.tileHeight,
                            texture),
                        trigger = tile[3]
                    }
                end
            end
            sprites[spriteName] = sprite
        end
    end
end

function love.crawlFiles(frame)
    local updated = false
    if not frame or (frame % 3) == 0 then
        for _,file in ipairs(love.filesystem.crawl("img")) do
            print("image", file)
            local name = str.filename(file)
            textures[name] = love.graphics.newImage(file)
            updated = true
        end
    end

    if not frame or (frame % 3) == 1 then
        for _,file in ipairs(love.filesystem.crawl("audio")) do
            print("audio", file)
            local name = str.filename(file)
            sounds[name] = love.audio.newSource(file, "static")
            updated = true
        end
    end

    if not frame or (frame % 3) == 2 then
        for _,file in ipairs(love.filesystem.crawl("data")) do
            print("data", file)
            local name = str.filename(file)
            love.loadData(name, file)
            updated = true
        end
    end
    return updated
end

function love.load(args)
    local requestedMap = args[1]

    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setTitle("Super Cossin Lette 3D")
    love.window.setMode(1024, 768, { resizable = true })
    love.window.setVSync(1)
    love.physics.setMeter(METER_SCALE)

    love.crawlFiles()

    if requestedMap then
        StateMachine:change(Game, { map = requestedMap })
    else
        StateMachine:change(Intro)
    end

    love.keyboard.keyPressed = {}
end

function love.resize(w, h)
end

function love.keypressed(key)
    if pressActions[key] then
        actions[pressActions[key]] = true
    end
end

local avgDt = 1 / 60
local frame = 0

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
        debug.fps = not debug.fps
    end

    local requiresRefresh = love.crawlFiles(frame) or (actions.refresh and StateMachine.current.refresh)
    if StateMachine.current.refresh then
        StateMachine.current:refresh(requiresRefresh)
    end

    for key, action in pairs(pressActions) do
        actions[action] = false
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

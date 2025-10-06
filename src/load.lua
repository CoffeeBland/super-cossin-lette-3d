load = {}
fonts = {}
textures = {}
sounds = {}
sprites = {}
tileset = {}
objects = {
    byId = {},
    byName = {}
}
prefabs = {}
fonts = {}

function load.init()
    fonts.menu = love.graphics.newFont(36)
end

local function getObjectPos(alignment, obj)
    local texture = textures[obj.name]
    if alignment == "unspecified" or alignment == "bottom" then
        return -texture:getWidth() / 2, -texture:getHeight()
    end
end

local function getTilePos(alignment, tile)
    local tileName = str.filename(tile.image)
    local texture = textures[tileName]
    if alignment == "unspecified" or alignment == "bottom" then
        return -TILE_WIDTH / 2, -texture:getHeight()
    end
end

function load.createShadow(name, points)
    local minX, minY, maxX, maxY
    for i = 1, #points / 2 do
        local x, y = points[i * 2 - 1], points[i * 2]
        minX = minX and math.min(x, minX) or x
        maxX = maxX and math.max(x, maxX) or x
        minY = minY and math.min(y, minY) or y
        maxY = maxY and math.max(y, maxY) or y
    end
    local shadowW = maxX - minX + STATIC_SHADOW_SLOP * 2
    local shadowH = maxY - minY + STATIC_SHADOW_SLOP * 2
    local shadowCanvas = love.graphics.newCanvas(shadowW, shadowH)
    love.graphics.setCanvas(shadowCanvas)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", 0, 0, shadowW, shadowH)

    love.graphics.push()
    love.graphics.translate(-minX + STATIC_SHADOW_SLOP, -minY + STATIC_SHADOW_SLOP)
    love.graphics.setColor(0.875, 0.867, 0.941, 1) -- TODO read game constants
    love.graphics.setLineWidth(STATIC_SHADOW_SLOP)
    love.graphics.setLineStyle("smooth")
    love.graphics.polygon("line", points)
    love.graphics.polygon("fill", points)
    love.graphics.pop()

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setCanvas()
    local shadowName = "objectShadow" .. name;
    textures[shadowName] = shadowCanvas

    local centerX = (maxX + minX) / 2
    local centerY = (maxY + minY) / 2
    return {
        name = shadowName,
        anchor = {
            x = shadowW / 2 - centerX,
            y = shadowH / 2 - centerY
        }
    }
end

function load.loadData(name, file)
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

    if file == "data/gameConstants.lua" then
        Game.constants = data

        local icons = Game.constants.icons
        icons.byName = {}
        local cols = math.floor(textures.Bubble_icons:getWidth() / icons.size.w)
        for i = 1, #icons.list / 2 do
            local name = icons.list[i * 2 - 1]
            local width = icons.list[i * 2]
            local imgi = i - 1
            icons.byName[name] = {
                quad = love.graphics.newQuad(
                    (imgi % cols) * icons.size.w,
                    math.floor(imgi / cols) * icons.size.h,
                    icons.size.w,
                    icons.size.h,
                    textures.Bubble_icons),
                width = width
            }
        end
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
                if obj.replaceTo then
                    for _, replacement in pairs(obj.replaceTo) do
                        if replacement.ids then
                            replacement.ids = str.split(replacement.ids, ",")
                            for i, id in ipairs(replacement.ids) do
                                replacement.ids[i] = math.parse(id) or 0
                            end
                        end
                    end
                end

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
                        local shadow
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
                            if #vertices > 16 then
                                obj.shape = love.physics.newChainShape(true, vertices)
                                obj.shapeFlipX = love.physics.newChainShape(true, verticesFlipX)
                                obj.shapeFlipY = love.physics.newChainShape(true, verticesFlipY)
                            else
                                obj.shape = love.physics.newPolygonShape(vertices)
                                obj.shapeFlipX = love.physics.newPolygonShape(verticesFlipX)
                                obj.shapeFlipY = love.physics.newPolygonShape(verticesFlipY)
                            end
                            shadow = load.createShadow(obj.name, vertices)

                        elseif subobject.shape == "ellipse" then
                            local x = subobject.x + subobject.width / 2 - obj.offsetX
                            local y = subobject.y + subobject.height / 2 - obj.offsetY
                            local radiusx = subobject.width / 2
                            local radiusy = subobject.height / 2
                            obj.shape = love.physics.newEllipseShape(x, y, radiusx, radiusy, 8)
                            obj.shapeFlipX = obj.shape
                            obj.shapeFlipY = obj.shape

                            local shadowPts = math.getEllipse(x, y, radiusx, radiusy, 32)
                            shadow = load.createShadow(obj.name, shadowPts)
                        end
                        if shadow and obj.autoshadow then
                            obj.shadow = shadow
                        end
                    end
                end
            end
        end

        if data.name == "tileset" then
            tileset.tiles = {}
            tileset.anims = {}
            tileset.shapes = {}
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
                        local posX, posY = getTilePos(data.objectalignment, tile)
                        tileset.tiles[tile.id] = {
                            quad = love.graphics.newQuad(x, y, tile.width, tile.height, canvas),
                            originX = -posX,
                            originY = -posY,
                            type = tile.properties and tile.properties.type,
                            height = tile.properties and tile.properties.height,
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
                                    local vertices = {}
                                    local verticesFlipX = {}
                                    local verticesFlipY = {}
                                    local minX, minY, maxX, maxY
                                    for _, point in ipairs(subobject.polygon) do
                                        local x = point.x + subobject.x + posX
                                        local y = point.y + subobject.y + posY + 74 / 2
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
                                    if #vertices > 16 then
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

    if data.sprites then
        for spriteName, sprite in pairs(data.sprites) do
            local texture = textures[spriteName]
            for i, anim in ipairs(sprite) do
                anim.tileWidth = data.tileWidth or sprite.tileWidth
                anim.tileHeight = data.tileHeight or sprite.tileHeight
                anim.triggers = {}
                for i, tile in ipairs(anim.tiles) do
                    anim.tiles[i] = {
                        quad = love.graphics.newQuad(
                            tile[1] * anim.tileWidth,
                            tile[2] * anim.tileHeight,
                            anim.tileWidth,
                            anim.tileHeight,
                            texture),
                        trigger = tile[3]
                    }
                end
            end
            sprites[spriteName] = sprite
        end
    end
end

function load.crawlFiles(frame)
    local updated = false
    if not frame or (frame % 30) == 0 then
        for file, info in pairs(love.filesystem.crawl("img")) do
            print("image", file)
            local name = str.filename(file)
            local ok, img = pcall(love.graphics.newImage, file)
            if ok then
                textures[name] = img
                timestamps[file] = info
                updated = true
            else
                print("Could not read file", img)
            end
        end
    end

    if not frame or (frame % 30) == 10 then
        for file, info in pairs(love.filesystem.crawl("audio")) do
            print("audio", file)
            local name = str.filename(file)
            sounds[name] = love.audio.newSource(file, "static")
            timestamps[file] = info
            updated = true
        end
    end

    if not frame or (frame % 30) == 20 then
        for file, info in pairs(love.filesystem.crawl("data")) do
            print("data", file)
            local name = str.filename(file)
            load.loadData(name, file)
            timestamps[file] = info
            updated = true
        end
    end
    return updated
end

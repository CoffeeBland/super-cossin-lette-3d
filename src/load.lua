load = {}
textures = {}
heightTextures = {}
dirtyHeightTextures = {}
sounds = {}
music = {}
sprites = {}
tileset = {}
objects = {
    byId = {},
    byName = {}
}
prefabs = {}
fonts = {}
fontsSizes = {}
mapsByName = {}

function load.init()
end

local function getOrLoadTexture(name)
    if not textures[name] then
        load.crawlFor({ textures = { name } })
    end
    return textures[name]
end

local function getObjectPos(alignment, obj)
    local texture = getOrLoadTexture(obj.name)
    if alignment == "unspecified" or alignment == "bottom" then
        return -texture:getWidth() / 2, -texture:getHeight()
    end
end

local function getTilePos(alignment, tile)
    local tileName = str.filename(tile.image)
    local texture = getOrLoadTexture(tileName)
    if alignment == "unspecified" or alignment == "bottom" then
        return -TILE_WIDTH / 2, -texture:getHeight()
    end
end

function load.createHeightTextures()
    -- All sprite entities with actual info
    for name, object in pairs(objects.byName) do
        local entity = object.prefab and prefabs[object.prefab](object, {}) or {}
        entity.sprites = entity.sprites or { { name = name, anchor = { x = object.offsetX, y = object.offsetY } } }
        entity.pos = entity.pos or {}
        entity.pos.height = entity.pos.height or object.height or 0
        for _, sprite in ipairs(entity.sprites) do
            if sprite.name then
                local spriteData = sprites[sprite.name]
                local tiles = {}
                local shape = entity.body and Physics.getBodyShape(entity.body) or object.shape
                local points = (shape and { shape:getPoints() }) or { 0, 0 }
                if spriteData then
                    for _, anim in ipairs(spriteData) do
                        for _, tile in ipairs(anim.tiles) do
                            table.insert(tiles, {
                                quad = tile.quad,
                                height = entity.pos.height,
                                delta = sprite.autoheightDelta or object.autoheightDelta,
                                bulge = sprite.autoheightBulge or object.autoheightBulge,
                                points = points,
                                pointsX = sprite.anchor.x,
                                pointsY = sprite.anchor.y,
                            })
                        end
                    end
                else
                    table.insert(tiles, {
                        quad = nil,
                        height = entity.pos.height,
                        delta = object.autoheightDelta,
                        bulge = sprite.autoheightBulge or object.autoheightBulge,
                        points = points,
                        pointsX = sprite.anchor.x,
                        pointsY = sprite.anchor.y,
                    })
                end
                load.createHeightTexture(sprite.name, tiles)
            end
        end
    end

    -- All other sprites sad sprites
    for name, sprite in pairs(sprites) do
        if not heightTextures[name] then
            load.createHeightTexture(name)
        end
    end
    -- Tileset
    local tilesetTiles = {}
    for i, tileData in pairs(tileset.tiles) do
        local tile = {
            quad = tileData.quad,
            height = tileData.height,
            points =
                (tileset.shapes[i] and { tileset.shapes[i].default:getPoints() }) or
                { 0, 0 }
        }
        tile.pointsX = tileData.originX
        tile.pointsY = tileData.originY - TILE_HEIGHT / 2
        tilesetTiles[i] = tile
    end
    load.createHeightTexture("tileset", tilesetTiles)
end

local function findx(points, xfn)
    local foundx, foundy
    for i = 1, #points / 2 do
        local x, y = points[i * 2 - 1], points[i * 2]
        if not foundx then
            foundx = x
        else
            foundx = xfn(foundx, x)
        end
        if foundx == x then
            foundy = y
        end
    end
    return foundx, foundy
end

-- We're gonna bake in a whole lot of assumptions about how textures, sizes and collisions are used
-- Strap in boyz
function load.createHeightTexture(name, tiles)
    if heightTextures[name] and not dirtyHeightTextures[name] then
        return
    end
    local time = love.timer.getTime()
    local texture = textures[name]
    local w, h = texture:getDimensions()
    local canvas = love.graphics.newCanvas(w, h)
    love.graphics.setCanvas({ canvas, stencil = true })
    love.graphics.clear(0, 0, 0, 0)
    love.graphics.stencil(function()
            love.graphics.setShader(MASK_SHADER)
            love.graphics.draw(texture)
            love.graphics.setShader()
        end,
        "increment",
        1)
    love.graphics.setStencilTest("greater", 0)

    -- For empty cases
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", 0, 0, w, h)

    for _, tile in pairs(tiles or EMPTY) do
        local quad, height, points = tile.quad, tile.height, tile.points
        quad = quad or love.graphics.newQuad(0, 0, w, h, w, h)
        height = height or 0
        local x, y, w, h = quad:getViewport()

        local leftx, lefty = findx(points, math.min)
        leftx = leftx + tile.pointsX
        lefty = lefty + tile.pointsY
        local rightx, righty = findx(points, math.max)
        rightx = rightx + tile.pointsX
        righty = righty + tile.pointsY
        local pw = rightx - leftx
        local topmost = math.max(lefty, righty) - height
        local botmost = math.min(lefty, righty)

        love.graphics.push()
        love.graphics.translate(x, y)

        love.graphics.setColor(height / height, 0, 0, 1)
        love.graphics.rectangle("fill", 0, 0, w, topmost)

        love.graphics.setColor(height / (8 * height), 0, 0, 1)
        love.graphics.rectangle("fill", 0, botmost, w, h - botmost)

        -- gradient
        for i = 1, height - 1 do
            love.graphics.setColor((height / 8 + i * (7/8)) / height, 0, 0, 1)

            local delta = (tile.delta or 0) * (i / height)
            local bulge = math.trigterp(i, 1, height - 1, (tile.bulge or 0) - pw)
            local ldx = delta - bulge / 2
            local rdx = delta + bulge / 2

            love.graphics.rectangle("fill", 0, lefty - i - 0.5, leftx + ldx + 1, 2)
            love.graphics.rectangle("fill", rightx + rdx - 1, righty - i - 0.5, w - rightx - rdx + 1, 2)

            -- If just a single point then no point (ha!) in drawing the polygon
            if #points > 2 and pw > 0 then
                love.graphics.push()
                love.graphics.translate(tile.pointsX + delta, tile.pointsY - i)
                love.graphics.scale(((rdx - ldx) + pw) / pw, 1)
                love.graphics.polygon("fill", points)
                love.graphics.pop()
            end
        end

        love.graphics.pop()
    end

    love.graphics.reset()
    heightTextures[name] = love.graphics.newImage(canvas:newImageData())
    dirtyHeightTextures[name] = nil
    love.timer.measure(time, "height " .. name)
end

function load.createShadow(name, points, scale)
    local time = love.timer.getTime()
    local minX, minY, maxX, maxY
    for i = 1, #points / 2 do
        local x, y = points[i * 2 - 1] * scale, points[i * 2] * scale
        points[i * 2 - 1] = x
        points[i * 2] = y
        minX = minX and math.min(x, minX) or x
        maxX = maxX and math.max(x, maxX) or x
        minY = minY and math.min(y, minY) or y
        maxY = maxY and math.max(y, maxY) or y
    end
    local shadowW = maxX - minX + STATIC_SHADOW_SLOP * 2
    local shadowH = maxY - minY + STATIC_SHADOW_SLOP * 2
    local shadowCanvas = love.graphics.newCanvas(shadowW, shadowH)
    love.graphics.setCanvas(shadowCanvas)

    love.graphics.setColor(1, 1, 1, 0)
    love.graphics.rectangle("fill", 0, 0, shadowW, shadowH)

    love.graphics.push()
    love.graphics.translate(-minX + STATIC_SHADOW_SLOP, -minY + STATIC_SHADOW_SLOP)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setLineWidth(STATIC_SHADOW_SLOP)
    love.graphics.setLineStyle("smooth")
    love.graphics.polygon("line", points)
    love.graphics.polygon("fill", points)
    love.graphics.pop()

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setCanvas()
    local shadowName = "objectShadow" .. name;
    textures[shadowName] = love.graphics.newImage(shadowCanvas:newImageData())
    love.timer.measure(time, "shadow " .. name)

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
    local loaded, err = loadfile(file)
    if err then
        error("Could not read data", { file = file, error = err })
        return
    end
    local data = loaded()
    local isPrefab = type(data) == "function"

    if isPrefab then
        prefabs[name] = data
        local entity = data({}, {})
        for _, sprite in pairs(entity.sprites or EMPTY) do
            if sprite.name then
                dirtyHeightTextures[sprite.name] = true
            end
        end
        return
    end

    if file == "data/gameConstants.lua" then
        Game.constants = data

        local icons = Game.constants.icons
        icons.byName = {}
        local iconTexture = getOrLoadTexture("Bubble_icons")
        local cols = math.floor(iconTexture:getWidth() / icons.size.w)
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
                    iconTexture),
                width = width
            }
        end

        local bubble = Game.constants.bubble
        local bubbleTexture = getOrLoadTexture("Bubble")
        local toQuad = { bubble.guedille, bubble.bg.left, bubble.bg.right }
        for _, entry in ipairs(toQuad) do
            entry.quad = love.graphics.newQuad(
                entry.tile[1] * bubble.segment.w,
                entry.tile[2] * bubble.segment.h,
                bubble.segment.w,
                bubble.segment.h,
                bubbleTexture)
        end
        bubble.bg.segments.quads = {}
        for i, tile in ipairs(bubble.bg.segments.tiles) do
            bubble.bg.segments.quads[i * 2 - 1] = love.graphics.newQuad(
                tile[1] * bubble.segment.w,
                tile[2] * bubble.segment.h,
                bubble.segment.w / 2,
                bubble.segment.h,
                bubbleTexture)
            bubble.bg.segments.quads[i * 2] = love.graphics.newQuad(
                (tile[1] + 0.5) * bubble.segment.w,
                tile[2] * bubble.segment.h,
                bubble.segment.w / 2,
                bubble.segment.h,
                bubbleTexture)
        end
    end

    if data.tiledversion then
        if data.name == "objects" then
            for _, objData in ipairs(data.tiles) do
                local obj = {}
                obj.name = str.filename(objData.image)
                dirtyHeightTextures[obj.name] = true
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
                    local shadowTexture = getOrLoadTexture(obj.shadow)
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
                            shadow = obj.autoshadow and load.createShadow(obj.name, vertices, obj.autoshadowScale or 1)

                        elseif subobject.shape == "ellipse" then
                            local x = subobject.x + subobject.width / 2 - obj.offsetX
                            local y = subobject.y + subobject.height / 2 - obj.offsetY
                            local radiusx = subobject.width / 2
                            local radiusy = subobject.height / 2
                            obj.shape = love.physics.newEllipseShape(x, y, radiusx, radiusy, 8)
                            obj.shapeFlipX = obj.shape
                            obj.shapeFlipY = obj.shape

                            local shadowPts = math.getEllipse(x, y, radiusx, radiusy, 32)
                            shadow = obj.autoshadow and load.createShadow(obj.name, shadowPts, obj.autoshadowScale or 1)
                        end
                        if shadow then
                            obj.shadow = shadow
                        end
                    end
                end
            end
        end

        if data.name == "tileset" then
            tileset.tiles = {}
            tileset.anims = {}
            tileset.animDefs = {}
            tileset.shapes = {}
            dirtyHeightTextures.tileset = true
            if data.image then
                local name = str.filename(data.image)
                local texture = getOrLoadTexture(name)
                for i = 1, data.tilecount do
                    tileset.tiles[i] = love.graphics.newQuad(
                        ((i - 1) % data.columns) * data.tilewidth,
                        math.floor((i - 1) / data.columns) * data.tileheight,
                        data.tilewidth,
                        data.tileheight,
                        texture)
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
                love.graphics.setCanvas(canvas)

                -- Gogo gadget.
                for _, row in ipairs(rows) do
                    local x = 0
                    local y = row.y
                    for _, tile in ipairs(row.tiles) do
                        local tileName = str.filename(tile.image)
                        local texture = getOrLoadTexture(tileName)
                        love.graphics.draw(texture, x, y)
                        local posX, posY = getTilePos(data.objectalignment, tile)
                        tileset.tiles[tile.id] = {
                            quad = love.graphics.newQuad(x, y, tile.width, tile.height, canvas),
                            originX = -posX,
                            originY = -posY,
                            type = tile.properties and tile.properties.type,
                            height = tile.properties and tile.properties.height,
                            animOverlay = tile.properties and tile.properties.anim
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
                            if tile.properties and tile.properties.animDef then
                                if not tileset.animDefs[tile.properties.animDef] then
                                    tileset.animDefs[tile.properties.animDef] = {}
                                end
                                table.insert(tileset.animDefs[tile.properties.animDef], {
                                    id = tile.id,
                                    prob  = tile.properties.prob or 1
                                })
                            end
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
                                        local y = point.y + subobject.y + posY + TILE_HEIGHT / 2
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
                textures[name] = love.graphics.newImage(canvas:newImageData())
            end
        end
    end

    if data.sprites then
        for spriteName, sprite in pairs(data.sprites) do
            local texture = getOrLoadTexture(spriteName)
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
            dirtyHeightTextures[spriteName] = true
        end
    end
end

function load.loadImgFile(file, name, info)
    local time = love.timer.getTime()
    local ok, img = pcall(love.graphics.newImage, file)
    love.timer.measure(time, "image " .. file)
    if ok then
        textures[name] = img
        dirtyHeightTextures[name] = true
        timestamps[file] = info
        return true
    else
        error("Could not read file ", { file = file, error = img })
    end
end

function load.loadAudioFile(file, name, info)
    local time = love.timer.getTime()
    local ok, source = pcall(love.audio.newSource, file,
        (info.size < (100 * 1024)) and "static" or "stream")
    love.timer.measure(time, "audio " .. file)
    if ok then
        sounds[name] = source
        timestamps[file] = info
        return true
    else
        error("Could not read file ", { file = file, error = source})
    end
end

function load.loadMusicFile(file, name, info)
    local time = love.timer.getTime()
    music[name] = love.audio.newSource(file, "stream")
    love.timer.measure(time, "music " .. file)
    timestamps[file] = info
    return true
end

function load.crawlFor(toFind)
    for file, info in pairs(love.filesystem.crawl("img")) do
        for _, nameToFind in pairs(toFind.textures or EMPTY) do
            local name = str.filename(file)
            if name == nameToFind then
                load.loadImgFile(file, name, info)
            end
        end
    end

    for file, info in pairs(love.filesystem.crawl("audio")) do
        for _, nameToFind in pairs(toFind.sounds or EMPTY) do
            local name = str.filename(file)
            if name == nameToFind then
                load.loadAudioFile(file, name, info)
            end
        end
    end

    local extraToFind = { textures = {}, sounds = {} }
    local extraFindPliz = false
    for file, info in pairs(love.filesystem.crawl("data")) do
        for _, nameToFind in pairs(toFind.data or EMPTY) do
            local name = str.filename(file)
            if name == nameToFind then
                local time = love.timer.getTime()
                load.loadData(name, file)
                love.timer.measure(time, "data " .. file)
                timestamps[file] = info

                if prefabs[name] then
                    local instance = prefabs[name]()
                    for _, sprite in pairs(instance and instance.sprites or EMPTY) do
                        extraToFind.textures[sprite.name] = sprite.name
                        extraFindPliz = true
                    end
                    if instance.shadow then
                        extraToFind.textures[instance.shadow.name] = instance.shadow.name
                        extraFindPliz = true
                    end
                    for _, emit in pairs(instance and instance.particleEmitter and instance.particleEmitter.triggers or EMPTY) do
                        extraToFind.textures[emit.name] = emit.name
                        extraFindPliz = true
                    end
                    for _, emit in pairs(instance and instance.particleEmitter and instance.particleEmitter.conditions or EMPTY) do
                        extraToFind.textures[emit.name] = emit.name
                        extraFindPliz = true
                    end
                    for _, emit in pairs(instance and instance.soundEmitter and instance.soundEmitter.triggers or EMPTY) do
                        extraToFind.sounds[emit.name] = emit.name
                        extraFindPliz = true
                    end
                    for _, emit in pairs(instance and instance.soundEmitter and instance.soundEmitter.conditions or EMPTY) do
                        extraToFind.sounds[emit.name] = emit.name
                        extraFindPliz = true
                    end
                end
            end
        end
    end
    if extraFindPliz then
        load.crawlFor(extraToFind)
    end
end

function load.crawlFiles(frame, stopOnLoad)
    local updated = false

    if not frame or (frame % 30) == 15 then
        for file, info in pairs(love.filesystem.crawl("music")) do
            updated = load.loadMusicFile(file, str.filename(file), info) or updated
        end
    end

    if not frame or (frame % 30) == 0 then
        for file, info in pairs(love.filesystem.crawl("img")) do
            updated = load.loadImgFile(file, str.filename(file), info) or updated
            if updated and stopOnLoad then
                return true
            end
        end
    end

    if not frame or (frame % 30) == 10 then
        for file, info in pairs(love.filesystem.crawl("audio")) do
            updated = load.loadAudioFile(file, str.filename(file), info) or updated
            if updated and stopOnLoad then
                return true
            end
        end
    end

    if not frame or (frame % 30) == 20 then
        for file, info in pairs(love.filesystem.crawl("data")) do
            local time = love.timer.getTime()
            local name = str.filename(file)
            load.loadData(name, file)
            love.timer.measure(time, "data " .. file)
            timestamps[file] = info
            updated = true
            if updated and stopOnLoad then
                return true
            end
        end
    end
    return updated
end

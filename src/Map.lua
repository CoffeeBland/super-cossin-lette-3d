local bit = require("bit")
Map = {}
Map.__index = Map

function Map.load(name)
    local path = "maps/" .. name .. ".lua"
    local info = love.filesystem.getInfo(path, "file")
    local instance = { name = name, _data = loadfile(path)() }
    instance = setmetatable(instance, Map)
    instance:init()
    print("map", path)
    timestamps[path] = info
    return instance
end

function Map:chunkTiles(layer, chunk)
    self.iteratorLayer = layer
    return self.chunkIterator, chunk, 0
end

function Map:getTile(layer, tx, ty)
    if not layer or not layer.chunks then
        return
    end
    for _, chunk in ipairs(layer.chunks) do
        if chunk.x < tx and tx <= chunk.x + chunk.width and
            chunk.y < ty and ty <= chunk.y + chunk.height then
            local chunkx = tx - chunk.x
            local chunky = ty - chunk.y
            local tile = chunk.data[chunkx + (chunky - 1) * chunk.width]
            local og = tile
            local flipX = bit.band(tile, TILE_FLIP_H) ~= 0
            local flipY = bit.band(tile, TILE_FLIP_V) ~= 0
            tile = bit.band(tile, TILE_ID_MASK) - self._data.tilesetFirstGid
            return tile, flipX, flipY
        end
    end
end

function Map:init()
    -- Chunk iterator. Gotta capture self to simplify things...
    function self.chunkIterator(chunk, i)
        local tile = 0
        while tile <= 0 do
            if i >= #chunk.data then
                return
            end
            i = i + 1
            local tile = chunk.data[i]
            local og = tile
            local flipX = bit.band(tile, TILE_FLIP_H) ~= 0
            local flipY = bit.band(tile, TILE_FLIP_V) ~= 0
            tile = bit.band(tile, TILE_ID_MASK) - self._data.tilesetFirstGid
            if tile > 0 then
                local tx = self.iteratorLayer.x + chunk.x + ((i - 1) % chunk.width) + 1
                local ty = self.iteratorLayer.y + chunk.y + math.floor((i - 1) / chunk.width) + 1
                local globali = tx + ty * self.width
                return i, tile, tx, ty, globali, flipX, flipY, og
            end
        end
    end

    -- Gids!
    self.mapObjectsByGid = {}
    self._data.tilesetFirstGid = 0
    for _, data in ipairs(self._data.tilesets) do
        if data.name == "objects" then
            for i, object in pairs(objects.byId) do
                self.mapObjectsByGid[data.firstgid + i] = object.id
            end
        end
        if data.name == "tileset" then
            self._data.tilesetFirstGid = data.firstgid
        end
    end

    self.heightMarkers = {}
    self.heightMarkersByLayer = {}
    self.tileEntities = {}
    local minx, miny, maxx, maxy = nil, nil, nil, nil
    for layeri, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            self.heightMarkersByLayer[layeri] = {}
            -- Make data into chunks for uniformity
            layer.chunks = layer.chunks or {}
            if layer.data then
                table.insert(layer.chunks, {
                    data = layer.data,
                    x = 0,
                    y = 0,
                    width = layer.width,
                    height = layer.height
                })
            end

            -- What size is this god-forsaken land
            for _, chunk in ipairs(layer.chunks) do
                minx = math.min(chunk.x, minx or chunk.x)
                miny = math.min(chunk.y, miny or chunk.y)
                maxx = math.max(chunk.x + chunk.width, maxx or chunk.x + chunk.width)
                maxy = math.max(chunk.y + chunk.height, maxy or chunk.y + chunk.height)
            end
        end
    end
    self.minx, self.miny, self.maxx, self.maxy = minx, miny, maxx, maxy
    self.width, self.height = maxx - minx, maxy - miny
    -- Collate tileset height markers
    for layeri, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks) do
                for i, tile, tx, ty, globali, flipX, flipY, og in self:chunkTiles(layer, chunk) do
                    local tileData = tileset.tiles[tile]
                    if not tileData then
                        print("Unknown tile gid!", tile, og)
                    end
                    local height = tileData.height or 0
                    local layerHeight = 0
                    if self.heightMarkersByLayer[layeri] then
                        layerHeight = self.heightMarkersByLayer[layeri][globali] or 0
                    end
                    for i = 0, math.floor(height / TILE_HEIGHT) do
                        globali = (tx - i) + (ty - i) * self.width
                        local current = self.heightMarkers[globali]
                        local new = math.max(current or 0, height + layerHeight)
                        if self.heightMarkersByLayer[layeri + 1] then
                            self.heightMarkersByLayer[layeri + 1][globali] = new
                        end
                        self.heightMarkers[globali] = new
                    end
                end
            end
        end
    end

    self.vars = {}
    for key, value in pairs(self._data.properties) do
        local path = str.split(key, ".")
        if path[1] == "vars" then
            self.vars[path[2]] = value
        end
    end
end

function Map:getEntities(entities)
    entities = entities or {}

    for _, layer in ipairs(self._data.layers) do
        for _, data in ipairs(layer.objects or EMPTY) do
            local gid = data.gid
            local flipX = bit.band(gid, TILE_FLIP_H) ~= 0
            local flipY = bit.band(gid, TILE_FLIP_V) ~= 0
            local id = self.mapObjectsByGid[bit.band(gid, TILE_ID_MASK)]
            if id then
                self:createEntity(entities, data, id, flipX, flipY)
            else
                print("Unknown object gid!", data.gid, gid)
            end
        end
    end
    return entities
end

function Map.getFlip(dataFlip)
    return dataFlip == "true" or
        (dataFlip == "random" and (math.random(1, 2) == 1))
end

function Map:createEntity(entities, data, id, flipX, flipY)
    local object = objects.byId[id]

    local fsx = flipX and -1 or 1
    local fsy = flipY and -1 or 1

    local tx = data.x / TILE_HEIGHT
    local ty = data.y / TILE_HEIGHT
    local x = (tx - ty) * TILE_WIDTH / 2 + fsx * (object.offsetX + (object.posX or 0))
    local y = (tx + ty) * TILE_HEIGHT / 2 + fsy * (object.offsetY + (object.posY or 0))
    local z = (data.properties.posZ or self:getPointHeight(x, y)) + (object.posZ or 0)
    y = y + z -- Offset by z to match visually with the editor.

    if object.replaceTo then
        for _, replacement in pairs(object.replaceTo) do
            local id = replacement.id or 0
            if replacement.ids and #replacement.ids > 0 then
                id = replacement.ids[math.random(#replacement.ids)]
            end
            local replacementFlipX = flipX ~= self.getFlip(replacement.flipX)
            local replacementFlipY = flipY ~= self.getFlip(replacement.flipY)
            local replacementFsx = replacementFlipX and -1 or 1
            local replacementFsy = replacementFlipY and -1 or 1
            local entity = self:createEntity(entities, data, id, replacementFlipX, replacementFlipY)
            -- TODO sub replacements aren't supported
            -- Also this can blow up if data is recursive (oops!)
            entity.pos.x = entity.pos.x + replacementFsx * (replacement.posX or 0)
            entity.pos.y = entity.pos.y + replacementFsy * (replacement.posY or 0)
            entity.pos.z = entity.pos.z + (replacement.posZ or 0)

            entity.pos.originalx = x
            entity.pos.originaly = y
            entity.pos.originalz = z
        end
        return
    end

    local entity = object.prefab and prefabs[object.prefab](object) or {}
    -- Global props
    entity.pos = entity.pos or {}
    entity.pos.x = x
    entity.pos.y = y
    entity.pos.z = z
    entity.pos.onGround = true
    if object.height or not entity.pos.height then
        entity.pos.height = object.height or HEIGHT_SLICE
    end
    if not entity.sprites then
        entity.sprites = {
            {
                name = object.name,
                anchor = { x = object.offsetX, y = object.offsetY },
                flipX = flipX,
                flipY = flipY
            }
        }
    end
    if object.shadow then
        entity.shadow = {
            name = object.shadow.name,
            anchor = object.shadow.anchor,
            flipX = flipX,
            flipY = flipY
        }
    end
    if entity.shadow and not entity.shadow.anchor then
        local texture = textures[entity.shadow.name]
        entity.shadow.anchor = {
            x = texture:getWidth() / 2,
            y = texture:getHeight() / 2
        }
    end
    local objectShape = (flipX and object.shapeFlipX) or (flipY and object.shapeFlipY) or object.shape
    if objectShape then
        entity.body = objectShape and { preshape = objectShape, type = "static" }
    end

    for k, v in pairs(entity) do
        if fancyTypes[k] then
            entity[k] = fancyTypes[k].new(v)
        end
    end

    table.insert(entities, entity)
    entity.id = #entities
    return entity
end

Map.TileToPosMat = love.math.newTransform()
Map.TileToPosMat:setMatrix(
    TILE_WIDTH / 2, -TILE_WIDTH / 2, 0, 0,
    TILE_HEIGHT / 2, TILE_HEIGHT / 2, 0, 0,
    0, 0, 1, 0,
    0, 0, 0, 1)
Map.PosToTileMat = Map.TileToPosMat:inverse()

function Map:getPointHeight(x, y)
    local tx, ty = Map.PosToTileMat:transformPoint(x, y)
    tx = math.round(tx)
    ty = math.round(ty)
    if tx < self.minx or tx > self.maxx or ty < self.miny or ty > self.maxy then
        return 0
    end
    local globali = tx + ty * self.width
    return self.heightMarkers[globali] or 0
end

function Map:getTileEntities(physics, entities)
    for layeri, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks) do
                for i, tile, tx, ty, globali, flipX, flipY, og in self:chunkTiles(layer, chunk) do
                    -- Remove 1 half tile to center the position for z-sorting purposes.
                    local x, y = Map.TileToPosMat:transformPoint(tx - 0.5, ty - 0.5)
                    local tileData = tileset.tiles[tile]
                    local tileShape = tileset.shapes[tile]
                    local height = tileData.height or 0
                    local layerHeight = self.heightMarkersByLayer[layeri][globali] or 0
                    local shape = tileShape and (
                        (flipX and tileShape.flipX) or
                        (flipY and tileShape.flipY) or tileShape.default)
                    if tileData.type == "water" then
                        local body = love.physics.newBody(physics,
                            x,
                            y + layerHeight,
                            "static")
                        local fixture = love.physics.newFixture(body, shape, 0)
                        fixture:setSensor(true)
                        fixture:setUserData({ type = WATER_SENSOR })
                        body:setUserData({
                            id = -1,
                            pos = {
                                x = x,
                                y = y + layerHeight,
                                z = layerHeight,
                                height = 1
                            }
                        })
                    end
                    if height > 0 then
                        local entity = {
                            pos = {
                                x = x,
                                y = y + layerHeight,
                                z = layerHeight,
                                height = height
                            },
                            body = shape and {
                                preshape = shape,
                                type = "static"
                            },
                            tileSprites = {
                                {
                                    tile = tile,
                                    flipX = flipX,
                                    flipY = flipY,
                                    anchor = {
                                        x = tileData.originX,
                                        y = tileData.originY - TILE_HEIGHT / 2
                                    }
                                }
                            }
                        }
                        -- Hunt for tiles to display on top
                        local topOffset = math.floor(height / TILE_HEIGHT)
                        local topx, topy = tx - topOffset, ty - topOffset
                        local topglobali = topx + topy * self.width
                        for nextlayeri = layeri + 1, #self._data.layers do
                            local nextlayer = self._data.layers[nextlayeri]
                            local toptile, topflipX, topflipY = self:getTile(nextlayer, topx, topy)
                            if toptile and toptile > 0 then
                                local toptileData = tileset.tiles[toptile]
                                local topheight = toptileData.height or 0
                                local toplayerHeight = self.heightMarkersByLayer[nextlayeri][topglobali] or 0
                                if topheight == 0 and toplayerHeight ~= 0 then
                                    table.insert(entity.tileSprites, {
                                        tile = toptile,
                                        flipX = topflipX,
                                        flipY = topflipY,
                                        anchor = {
                                            x = toptileData.originX,
                                            y = toptileData.originY - TILE_HEIGHT / 2 + height
                                        }
                                    })
                                end
                            end
                        end
                        table.insert(entities, entity)
                        entity.id = #entities

                        self.tileEntities[tx + ty * self.width] = entity
                    end
                end
            end
        end
    end
end

function Map:drawTiles(batch, time, sx, sy, ex, ey)
    sx = sx - TILE_WIDTH
    ex = ex + TILE_WIDTH
    sy = sy - TILE_HEIGHT
    ey = ey + TILE_HEIGHT
    for layeri, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks) do
                for i, tile, tx, ty, globali, flipX, flipY, og in self:chunkTiles(layer, chunk) do
                    local anim = tileset.anims[tile]
                    if anim then
                        local frame = math.floor(time * anim.fps) % #anim.ids
                        tile = anim.ids[frame + 1]
                    end
                    local x, y = Map.TileToPosMat:transformPoint(tx, ty)
                    if x >= sx and x <= ex and y >= sy and y <= ey then
                        local tileData = tileset.tiles[tile]
                        -- Tiles with heights are handled as entities
                        local height = tileData.height or 0
                        local layerHeight = self.heightMarkersByLayer[layeri][globali] or 0
                        if height == 0 and layerHeight == 0 then
                            local tileData = tileData
                            batch:add(
                                tileData.quad,
                                x,
                                y,
                                0,
                                flipX and -1 or 1,
                                flipY and -1 or 1,
                                tileData.originX,
                                tileData.originY)
                        end
                    end
                end
            end
        end
    end
end

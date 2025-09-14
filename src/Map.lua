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
                return i, tile, tx, ty, flipX, flipY, og
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
    local minx, miny, maxx, maxy = nil, nil, nil, nil
    for _, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
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
    self.width, self.height = maxx - minx, maxy - miny
    -- Collate tileset height markers
    for _, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks) do
                for i, tile, tx, ty in self:chunkTiles(layer, chunk) do
                    local tileData = tileset.tiles[tile]
                    if not tileData then
                        print("Unknown tile gid!", tile, og)
                    end
                    local height = tileData.height or 0
                    for i = 0, math.ceil(height / TILE_HEIGHT) do
                        local globali = (tx - i) + (ty - i) * self.width
                        local current = self.heightMarkers[globali]
                        local new = math.max(current or 0, height)
                        self.heightMarkers[globali] = new
                    end
                end
            end
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

function Map:createEntity(entities, data, id, flipX, flipY)
    local object = objects.byId[id]

    local fsx = flipX and -1 or 1
    local fsy = flipY and -1 or 1

    if object.replaceTo then
        for _, replacement in pairs(object.replaceTo) do
            local entity = self:createEntity(entities, data, replacement.id or 0, flipX, flipY)
            -- TODO sub replacements aren't supported
            -- Also this can blow up if data is recursive (oops!)
            entity.pos.x = entity.pos.x + fsx * (replacement.posX or 0)
            entity.pos.y = entity.pos.y + fsy * (replacement.posY or 0)
            entity.pos.z = entity.pos.z + (replacement.posZ or 0)
        end
        return
    end

    local tx = data.x / TILE_HEIGHT
    local ty = data.y / TILE_HEIGHT
    local x = (tx - ty) * TILE_WIDTH / 2 + fsx * (object.offsetX + (object.posX or 0))
    local y = (tx + ty) * TILE_HEIGHT / 2 + fsy * (object.offsetY + (object.posY or 0))
    local z = (data.properties.posZ or self:getPointHeight(x, y)) + (object.posZ or 0)
    y = y + z -- Offset by z to match visually with the editor.

    local entity = object.prefab and prefabs[object.prefab](object) or {}
    -- Global props
    entity.pos = entity.pos or {}
    entity.pos.x = x
    entity.pos.y = y
    entity.pos.z = z
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
    local globali = tx + ty * self.width
    return self.heightMarkers[globali] or 0
end

function Map:getChunkGogogadget(physics, entities, layer, chunk)
    for i, tile, tx, ty, flipX, flipY, og in self:chunkTiles(layer, chunk) do
        -- Remove 1 half tile to center the position for z-sorting purposes.
        local x, y = Map.TileToPosMat:transformPoint(tx - 0.5, ty - 0.5)
        local tileData = tileset.tiles[tile]
        local tileShape = tileset.shapes[tile]
        if tileShape then
            local shape =
                (flipX and tileShape.flipX) or
                (flipY and tileShape.flipY) or tileShape.default
            if tileData.type == "water" then
                local body = love.physics.newBody(physics,
                    x,
                    y,
                    "static")
                local fixture = love.physics.newFixture(body, shape, 0)
                fixture:setSensor(true)
                fixture:setUserData({ type = WATER_SENSOR })
                body:setUserData({ id = -1, pos = { z = 0, height = 1 } })
            else
                local entity = {
                    pos = {
                        x = x,
                        y = y,
                        z = 0,
                        height = tileData.height or HEIGHT_SLICE
                    },
                    body = {
                        preshape = shape,
                        type = "static"
                    },
                    tileSprite = {
                        tile = tile,
                        flipX = flipX,
                        flipY = flipY,
                        anchor = {
                            x = tileData.originX,
                            y = tileData.originY - TILE_HEIGHT / 2
                        }
                    }
                }
                table.insert(entities, entity)
                entity.id = #entities
            end
        end
    end
end

function Map:getTilesGogogadget(physics, entities)
    for _, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks) do
                self:getChunkGogogadget(physics, entities, layer, chunk)
            end
        end
    end
end

function Map:drawChunk(batch, time, layer, chunk)
    for i, tile, tx, ty, flipX, flipY, og in self:chunkTiles(layer, chunk) do
        local anim = tileset.anims[tile]
        if anim then
            local frame = math.floor(time * anim.fps) % #anim.ids
            tile = anim.ids[frame + 1]
        end
        local x, y = Map.TileToPosMat:transformPoint(tx, ty)
        local tileData = tileset.tiles[tile]
        -- Tiles with heights are handled as entities
        if not tileData.height then
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

function Map:drawTiles(batch, time)
    for _, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks) do
                self:drawChunk(batch, time, layer, chunk)
            end
        end
    end
end

local bit = require("bit")
Map = {}
Map.__index = Map

function Map.load(name)
    local path = "maps/" .. name .. ".lua"
    local info = love.filesystem.getInfo(path, "file")
    local instance = { name = name, _data = loadfile(path)() }
    print("map", path)
    timestamps[path] = info
    return setmetatable(instance, Map)
end

function Map:getEntities(entities)
    entities = entities or {}

    local mapObjectsByGid = {}
    self._data.tilesetFirstGid = 0
    for _, data in ipairs(self._data.tilesets) do
        if data.name == "objects" then
            for i, object in pairs(objects.byId) do
                mapObjectsByGid[data.firstgid + i] = object.id
            end
        end
        if data.name == "tileset" then
            self._data.tilesetFirstGid = data.firstgid
        end
    end

    for _, layer in ipairs(self._data.layers) do
        for _, data in ipairs(layer.objects or {}) do
            local gid = data.gid
            local flipX = bit.band(gid, TILE_FLIP_H) ~= 0
            local flipY = bit.band(gid, TILE_FLIP_V) ~= 0
            local id = mapObjectsByGid[bit.band(gid, TILE_ID_MASK)]
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

    local tx = data.x / self._data.tileheight
    local ty = data.y / self._data.tileheight
    local z = (data.properties.posZ or 0) + (object.posZ or 0)
    local x = (tx - ty) * self._data.tilewidth / 2 + fsx * (object.offsetX + (object.posX or 0))
    local y = (tx + ty) * self._data.tileheight / 2 + fsy * (object.offsetY + (object.posY or 0)) + z

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

function Map:getChunkGogogadget(physics, layer, chunk)
    for i, tile in ipairs(chunk.data) do
        if tile > 0 then
            local og = tile
            local flipX = bit.band(tile, TILE_FLIP_H) ~= 0
            local flipY = bit.band(tile, TILE_FLIP_V) ~= 0
            tile = bit.band(tile, TILE_ID_MASK) - self._data.tilesetFirstGid
            local tx = layer.x + chunk.x + ((i - 1) % chunk.width) + 1
            local ty = layer.y + chunk.y + math.floor((i - 1) / chunk.width) + 1
            local x = (tx - ty) * self._data.tilewidth / 2
            local y = (tx + ty) * self._data.tileheight / 2
            if not tileset.tiles[tile] then
                print("Unknown tile gid!", tile, og)
            end
            local tileShape = tileset.shapes[tile]
            if tileShape then
                local body = love.physics.newBody(physics,
                    x,
                    y,
                    "static")
                local shape =
                    (flipX and tileShape.flipX) or
                    (flipY and tileShape.flipY) or tileShape.default
                local fixture = love.physics.newFixture(body, shape, 0)
                fixture:setSensor(true)
                fixture:setUserData({ id = tx .. ":" .. ty, type = WATER_SENSOR })
                body:setUserData({ id = -1, pos = { z = 0, height = 1 } })
            end
        end
    end
end

function Map:getTilesGogogadget(physics)
    for _, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks or {}) do
                self:getChunkGogogadget(physics, layer, chunk)
            end
            if layer.data then
                self:getChunkGogogadget(physics, layer, {
                    data = layer.data,
                    x = 0,
                    y = 0,
                    width = layer.width,
                    height = layer.height
                })
            end
        end
    end
end

function Map:drawChunk(batch, time, layer, chunk)
    for i, tile in ipairs(chunk.data) do
        if tile > 0 then
            local og = tile
            local flipX = bit.band(tile, TILE_FLIP_H) ~= 0
            local flipY = bit.band(tile, TILE_FLIP_V) ~= 0
            tile = bit.band(tile, TILE_ID_MASK) - self._data.tilesetFirstGid
            local anim = tileset.anims[tile]
            if anim then
                local frame = math.floor(time * anim.fps) % #anim.ids
                tile = anim.ids[frame + 1]
            end
            local tx = layer.x + chunk.x + ((i - 1) % chunk.width)
            local ty = layer.y + chunk.y + math.floor((i - 1) / chunk.width) + 1
            local x = (tx - ty) * self._data.tilewidth / 2
            local y = (tx + ty) * self._data.tileheight / 2
            if not tileset.tiles[tile] then
                print("Unknown tile gid!", tile, og)
            end
            local tileData = tileset.tiles[tile]
            batch:add(
                tileData.quad,
                x + self._data.tilewidth / 2,
                y,
                0,
                flipX and -1 or 1,
                flipY and -1 or 1,
                tileData.originX + self._data.tilewidth / 2,
                tileData.originY - self._data.tileheight / 2)
        end
    end
end

function Map:drawTiles(batch, time)
    for _, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks or {}) do
                self:drawChunk(batch, time, layer, chunk)
            end
            if layer.data then
                self:drawChunk(batch, time, layer, {
                    data = layer.data,
                    x = 0,
                    y = 0,
                    width = layer.width,
                    height = layer.height
                })
            end
        end
    end
end

local bit = require("bit")
map = {}
map.__index = map

function map.load(name)
    local instance = { _data = require("maps." .. "." .. name) }
    return setmetatable(instance, map)
end

function map:getEntities(entities)
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
            gid = bit.band(gid, TILE_ID_MASK)
            if mapObjectsByGid[gid] then
                local object = objects.byId[mapObjectsByGid[gid]]

                local tx = data.x / self._data.tileheight
                local ty = data.y / self._data.tileheight
                local x = (tx - ty) * self._data.tilewidth / 2 + object.offsetX + (object.posX or 0)
                local y = (tx + ty) * self._data.tileheight / 2 + object.offsetY + (object.posY or 0)
                local z = (data.properties.posZ or object.posZ or 0)
                local shape = (flipX and object.shapeFlipX) or (flipY and object.shapeFlipY) or object.shape
                local entity = {
                    pos = {
                        x = x,
                        y = y,
                        z = z,
                        height = object.height or HEIGHT_SLICE
                    },
                    sprites = {
                        {
                            name = object.name,
                            anchor = { x = object.offsetX, y = object.offsetY },
                            flipX = flipX,
                            flipY = flipY
                        }
                    }
                }
                if object.fruit then
                    entity.shadow = {
                        name = "fruitOmbre",
                        anchor = { x = 67, y = 40 }
                    }
                    entity.body = shape and { preshape = shape, type = "static", trigger = true }
                    entity.fruit = {
                        type = object.fruit,
                        z = z
                    }
                    entity.velocity = { z = 0 }
                else
                    entity.body = shape and { preshape = shape, type = "static" }
                end
                if object.picnic then
                    entity.picnic = 300
                end

                table.insert(entities, entity)
                entity.id = #entities
            else
                print("unknown object gid!", data.gid)
            end
        end
    end
    return entities
end

function map:drawChunk(batch, time, layer, chunk)
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

function map:drawTiles(batch, time)
    for _, layer in ipairs(self._data.layers) do
        if layer.type == "tilelayer" then
            for _, chunk in ipairs(layer.chunks or {}) do
                self:drawChunk(batch, time, layer, chunk)
            end
            if layer.data then
                local chunk = {
                    data = layer.data,
                    x = 0,
                    y = 0,
                    width = layer.width,
                    height = layer.height
                }
                self:drawChunk(batch, time, layer, chunk)
            end
        end
    end
end

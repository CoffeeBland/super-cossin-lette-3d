fancyTypes = {}
require "src.components.Requests"
require "src.components.Camera"
require "src.components.Sound"
require "src.components.Actor"
require "src.components.Anim"
require "src.components.Bubble"
require "src.components.Event"
require "src.components.Physics"
require "src.components.Larp"
require "src.components.Fruit"
require "src.components.Water"
require "src.components.Particle"
require "src.components.Music"
require "src.components.Timer"
require "src.components.Image"
require "src.components.Pause"

require "src.Map"

local PhysicsRenderer = require "src.PhysicsRenderer"

Game = {
    fadeout = 15,
    fadein = 15,
    fadeColor = { 1, 1, 1 }
}

function Game:refresh(force)
    local path = "maps/" .. self.map.name .. ".lua"
    local info = love.filesystem.getInfo(path, "file")
    if force or (timestamps[path] and timestamps[path].modtime < info.modtime) then
        Sound:start({ name = "Refresh", survive = true })
        timestamps[path] = info
        StateMachine:change(Game, { map = self.map.name })
    end
end

function Game.entityIterator(entities, i)
    for j = i, #entities do
        local entity = entities[j]
        if not entity.disabled then
            return j + 1, entity
        end
    end
end

function Game:iterEntities(table)
    table = table or self.entities
    return Game.entityIterator, table, 1
end

local iteratorSx, iteratorSy, iteratorEx, iteratorEy
function Game.entitiesAABBIterator(entities, i)
    for j = i, #entities do
        local entity = entities[j]
        if not entity.disabled and
            entity.pos.y >= sy and
            entity.pos.y <= ey and
            entity.pos.x >= sx and
            entity.pos.x <= ex
        then
            return j + 1, entity
        end
    end
end

function Game:iterEntitiesAABB(sx, sy, ex, ey)
    iteratorSx = sx
    iteratorSy = sy
    iteratorEx = ex
    iteratorEy = ey
    return Game.entitiesAABBIterator, self.entities, 1
end

function Game:enter(args)
    load.crawlFiles()
    self.camera = CameraSystem.new()
    self.input = {
        target = nil
    }
    self.time = 0
    self.map = Map.load(args.map)
    self.vars = {
        remainingFruits = 0,
        eaten = 0,
        picnicFruits = 0,
        targetFruits = 1,
        timer = Game.constants.defaultLevelTimer,
        firstLevel = Game.constants.firstLevel,
        currentMap = args.map,
        nextMap = nil,
        music = "TODO"
    }
    for key, value in pairs(self.map.vars) do
        self.vars[key] = value
    end
    Requests.new(self)
    self.physics = PhysicsSystem.new()
    self.sounds = SoundSystem.new()
    self.event = Event.new()
    self.anim = Anim.new()
    self.water = WaterSystem.new()
    self.fruits = FruitSystem.new()
    self.actors = ActorSystem.new()
    self.particles = ParticleSystem.new(Game.constants.particleCount, self.entities)
    self.timer = TimerSystem.new()
    self.images = ImageSystem.new()
    self.pause = PauseSystem.new()

    self.map:getTileEntities(self.physics.world, self.entities)
    self.map:getEntities(self.entities)
    for key, entity in pairs(self.entities) do
        -- Auto-attaching the input
        if entity.input and not self.input.target then
            self.input.target = entity
        end
        if entity.camera then
            self.camera:setTarget(entity)
        end
        if entity.lens then
            local w = entity.lens.size * ELLIPSE_WIDTH_RATIO
            local h = entity.lens.size * ELLIPSE_HEIGHT_RATIO
            local canvas = love.graphics.newCanvas(w, h)
            love.graphics.setCanvas(canvas)
            love.graphics.clear(1, 1, 1, 0)
            love.graphics.setColor(1, 1, 1, Game.constants.lens.textureStepAlpha)
            local steps = Game.constants.lens.textureSteps
            for i = 1, steps do
                local step = (i - 1) * Game.constants.lens.textureStepSize
                love.graphics.polygon("fill", unpack(math.getEllipse(w / 2, h / 2, w / 2 - step, h / 2 - step, 32)))
            end
            love.graphics.setColor(1, 1, 1, 1)
            local opaqueStep = steps * Game.constants.lens.textureStepSize
            love.graphics.polygon("fill", unpack(math.getEllipse(w / 2, h / 2, w / 2 - opaqueStep, h / 2 - opaqueStep, 32)))
            love.graphics.setCanvas()
            entity.lens.texture = love.graphics.newImage(canvas:newImageData())
            entity.lens.width = w
            entity.lens.height = h
        end
    end
    Requests.populate(self)

    load.createHeightTextures()

    -- Create tile batches
    self.groundTilesBatches = {}
    self.stackedTilesBatches = {}
    self.stackedTilesHeightBatches = {}
    for i = 0, Game.constants.tileBatchesCount do
        self.groundTilesBatches[i] = love.graphics.newSpriteBatch(textures.tileset)
        self.map:drawTiles(self.groundTilesBatches[i], i * Game.constants.tileBatchesDT, true)

        self.stackedTilesBatches[i] = love.graphics.newSpriteBatch(textures.tileset)
        self.stackedTilesHeightBatches[i] = love.graphics.newSpriteBatch(heightTextures.tileset)
        self:sortForDrawing(self.entitiesByComponent.tileSprites)
        local idx = 1
        for _, entity in ipairs(self.entitiesByComponent.tileSprites) do
            for _, sprite in ipairs(entity.tileSprites) do
                local tileData = tileset.tiles[sprite.tile]
                sprite.batchIdx = idx
                idx = idx + 1
                self.stackedTilesBatches[i]:add(
                    tileData.quad,
                    entity.pos.x,
                    (entity.pos.y - entity.pos.z - (sprite.anchor.z or 0)),
                    0,
                    sprite.flipX and -1 or 1,
                    sprite.flipY and -1 or 1,
                    sprite.anchor.x,
                    sprite.anchor.y)

                self.stackedTilesHeightBatches[i]:setColor(
                    (entity.pos.z + (sprite.anchor.z or 0)) / SKY_LIMIT,
                    0,
                    0,
                    1)
                self.stackedTilesHeightBatches[i]:add(
                    tileData.quad,
                    entity.pos.x,
                    (entity.pos.y - entity.pos.z - (sprite.anchor.z or 0)),
                    0,
                    sprite.flipX and -1 or 1,
                    sprite.flipY and -1 or 1,
                    sprite.anchor.x,
                    sprite.anchor.y)
            end
        end
    end

    self.event:execute(Game.constants.startLevelCutscene)
    self:update(0)
end

function Game:exit()
    Sound:fadeout()
    Music:fadeout()
    self.physics:exit()
end

function Game:handleCreation()
    for _, entity in ipairs(self.entities) do
        self.physics:handleCreation(entity)
        self.water:handleCreation(entity)
        self.fruits:handleCreation(entity)
    end
end

function Game:update(dt)
    self:handleCreation()

    self.time = self.time + dt
    local framePart = dt / (1 / 60)


    self.pause:update(framePart, dt, self)
    if self.pause.active then
        return
    end

    for _, entity in self:iterEntities(self.entitiesByComponent.anim) do
        entity.anim:update(dt, entity.sprites)
    end
    self.physics:update(framePart, dt, self)
    self.water:update(framePart, dt, self)
    self.actors:update(framePart, dt, self)
    self.sounds:update(framePart, dt, self)
    self.particles:update(framePart, dt, self)
    self.fruits:update(framePart, dt, self)
    self.camera:update(framePart, dt, self)
    self.images:update(framePart, dt, self)
    self.event:update(framePart, dt, self)
    self.timer:update(framePart, dt, self)
    self.anim:clearTriggers()
end

local drawnEntities = {}
local shadowEntities = {}
local tileBatchStartIdx = 0
local tileBatchIdx = 0
local tileBatchi = 0
local heightCanvas = nil
local shadowCanvas = nil

function Game:render(dt)
    local w, h, sx, sy, ex, ey, scale = self.camera:applyTransformations()

    local i = 1
    for _, entity in self:iterEntities() do
        local entitysx = entity.pos.x - 800
        local entitysy = entity.pos.y - entity.pos.z - 1200
        local entityex = entity.pos.x + 800
        local entityey = entity.pos.y - entity.pos.z + 1200
        if (entity.sprites or entity.tileSprites) and
            entityex >= sx and entityey >= sy and entitysx <= ex and entitysy <= ey then
            drawnEntities[i] = entity
            i = i + 1
        end
    end
    for j = i, #drawnEntities do
        drawnEntities[j] = nil
    end
    tileBatchi = math.floor(self.time / Game.constants.tileBatchesDT) % #self.groundTilesBatches

    -- Sorting! Fun times!
    self:sortForDrawing(drawnEntities)
    for i, entity in ipairs(drawnEntities) do
        entity.drawOrder = i
    end

    self:drawHeightMap(w, h, drawnEntities)
    self:drawShadowMap(w, h, sx, sy, ex, ey)

    -- Draw!
    love.graphics.clear(unpack(Game.constants.bgColor))
    love.graphics.setShader(HEIGHT_MAPPED_SHADER)
    HEIGHT_MAPPED_SHADER:send("size", { w, h })
    HEIGHT_MAPPED_SHADER:send("heightMap", heightCanvas)
    HEIGHT_MAPPED_SHADER:send("shadowMap", shadowCanvas)
    HEIGHT_MAPPED_SHADER:send("shadowColor", Game.constants.shadowColor)
    HEIGHT_MAPPED_SHADER:send("shadowMapHeightOffset", SHADOW_MAP_HEIGHT_OFFSET)
    HEIGHT_MAPPED_SHADER:send("shadowMapOffset", SHADOW_MAP_OFFSET)
    HEIGHT_MAPPED_SHADER:send("skyLimit", SKY_LIMIT)
    HEIGHT_MAPPED_SHADER:send("scale", scale)

    tileBatchStartIdx = 0
    tileBatchIdx = 0

    -- Tiles
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(self.groundTilesBatches[tileBatchi], 0, 0)
    love.graphics.setBlendMode("alpha")

    -- Entities
    for _, entity in ipairs(drawnEntities) do
        if entity.sprites or entity.light and entity.light.alpha > DELTA then
            self:drawStackedTileBatch()
        end

        if entity.sprites then
            self:stencilLensEntities(entity)
            if entity.color then
                love.graphics.setColor(unpack(entity.color))
            end
            self:drawEntitySprites(entity)
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.setStencilTest()
        elseif entity.tileSprites then
            tileBatchIdx = entity.tileSprites[#entity.tileSprites].batchIdx
            if tileBatchStartIdx == 0 then
                tileBatchStartIdx = tileBatchIdx
            end
        end

        if entity.light and entity.light.alpha > DELTA then
            local radiusw = entity.light.radiusw or Game.constants.defaultLight.radiusw
            local radiush = entity.light.radiush or Game.constants.defaultLight.radiush
            local alpha = entity.light.alpha or Game.constants.defaultLight.alpha
            local angle = entity.light.angle or Game.constants.defaultLight.angle
            local rayHeight = entity.pos.y - sy
            local rayOffset = rayHeight * math.tan(math.pi / 2 - angle)
            local startx, starty = entity.pos.x + rayOffset + radiusw, entity.pos.y - rayHeight
            local endx, endy = entity.pos.x + rayOffset - radiusw, entity.pos.y - rayHeight
            LIGHT_POINTS[1] = startx
            LIGHT_POINTS[2] = starty
            local n = 8
            for i = 1, n do
                local x, y =  math.getEllipsePoint(
                    entity.pos.x, entity.pos.y,
                    radiusw, radiush,
                    ((i - 1) / (n - 1)) * math.pi)
                LIGHT_POINTS[i * 2 + 1] = x
                LIGHT_POINTS[i * 2 + 2] = y
            end
            LIGHT_POINTS[#LIGHT_POINTS - 1] = endx
            LIGHT_POINTS[#LIGHT_POINTS] = endy
            love.graphics.setBlendMode("add")
            love.graphics.setColor(
                Game.constants.lightColor[1],
                Game.constants.lightColor[2],
                Game.constants.lightColor[3],
                alpha)
            love.graphics.polygon("fill", unpack(LIGHT_POINTS))
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.setBlendMode("alpha")
        end
    end

    self:drawStackedTileBatch()
    love.graphics.setShader()

    -- Bubbles
    for _, entity in ipairs(drawnEntities) do
        if entity.bubble then
            love.graphics.push()
            love.graphics.translate(entity.pos.x, entity.pos.y - entity.pos.z)
            entity.bubble:draw()
            love.graphics.pop()
        end
    end

    if debug.physics then
        PhysicsRenderer.draw_camera(self.physics.world, 0, 0, w, h)
    end

    if debug.pointHeights then
        for x = sx, ex, 16 do
            for y = sy, ey, 16 do
                local height = self.map:getPointHeight(x, y) / (SKY_LIMIT / 2)
                local r = height <= 0.33 and height or 0
                local g = height > 0.33 and height <= 0.66 and height or 0
                local b = height > 0.66 and height or 0
                love.graphics.setColor(r, g, b, 0.75)
                love.graphics.rectangle("fill",x, y, 16, 16)
            end
        end
        love.graphics.setColor(1, 1, 1, 1)
    end

    love.graphics:reset()

    if debug.heightMap then
        love.graphics.setShader(MAP_DEBUG_SHADER)
        love.graphics.draw(heightCanvas, 0, 0)
        love.graphics.setShader()
    end

    if debug.shadowMap then
        love.graphics.setShader(MAP_DEBUG_SHADER)
        love.graphics.draw(shadowCanvas, 0, 0)
        love.graphics.setShader()
    end

    self.images:draw()
    self.pause:draw()

    if debug.pointHeights then
        local x, y = 0, 0
        if self.input.target then
            x = math.round(self.input.target.pos.x)
            y = math.round(self.input.target.pos.y)
        end
        love.graphics.print(x .. ":" .. y, 50, 0)
        local tx, ty = Map.PosToTileMat:transformPoint(x, y)
        love.graphics.print(tx .. ":" .. ty, 50, 50)
    end
end

function Game:drawEntitySprites(entity)
    for _, sprite in ipairs(entity.sprites) do
        self:drawEntitySprite(entity, sprite)
    end
end

function Game:drawEntitySprite(entity, sprite)
    local texture = textures[sprite.name]
    local animData = sprite.animData
    local frame = sprite.frame
    local spriteWiggleX = sprite.wiggle and sprite.wiggle.x or 0
    local spriteWiggleY = sprite.wiggle and sprite.wiggle.y or 0
    local wiggleX = spriteWiggleX * (entity.anim and entity.anim.wiggle.x or 1)
    local wiggleY = spriteWiggleY * (entity.anim and entity.anim.wiggle.y or 1)
    local scaleX = wiggleX + (1 - spriteWiggleX)
    local scaleY = wiggleY + (1 - spriteWiggleY)
    if animData and frame then
        love.graphics.draw(
            texture,
            animData.tiles[frame].quad,
            entity.pos.x,
            (entity.pos.y - entity.pos.z - (sprite.anchor.z or 0)),
            0,
            (sprite.flipX and -1 or 1) * (animData.flipX and -1 or 1) * scaleX,
            (sprite.flipY and -1 or 1) * (animData.flipY and -1 or 1) * scaleY,
            sprite.anchor.x,
            sprite.anchor.y)
    else
        if not sprite.quad then
            sprite.quad = love.graphics.newQuad(
                0, entity.pos.truncateHeight,
                texture:getWidth(),
                texture:getHeight() - entity.pos.truncateHeight,
                texture)
        end
        love.graphics.draw(
            texture,
            sprite.quad,
            entity.pos.x,
            entity.pos.y + entity.pos.truncateHeight - entity.pos.z - (sprite.anchor.z or 0),
            0,
            sprite.flipX and -1 or 1,
            sprite.flipY and -1 or 1,
            sprite.anchor.x,
            sprite.anchor.y)
    end
end

function Game:drawStackedTileBatch()
    if tileBatchStartIdx == 0 or tileBatchIdx < tileBatchStartIdx then
        return
    end
    local tileBatch = self.stackedTilesBatches[tileBatchi]
    tileBatch:setDrawRange(tileBatchStartIdx, tileBatchIdx - tileBatchStartIdx + 1)
    tileBatchStartIdx = tileBatchIdx + 1
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(tileBatch)
    love.graphics.setBlendMode("alpha")
end

function Game:drawStackedTileHeightBatch()
    if tileBatchStartIdx == 0 or tileBatchIdx < tileBatchStartIdx then
        return
    end
    local tileBatch = self.stackedTilesHeightBatches[tileBatchi]
    tileBatch:setDrawRange(tileBatchStartIdx, tileBatchIdx - tileBatchStartIdx + 1)
    tileBatchStartIdx = tileBatchIdx + 1
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(tileBatch)
end

function Game:drawEntityShadow(entity, floorZ)
    floorZ = floorZ or 0
    local zscale = --entity.velocity and
        --math.pow(1 / math.max((entity.pos.z - floorZ) / METER_SCALE, 1), 1/4) or
        1
    love.graphics.draw(
        textures[entity.shadow.name],
        entity.pos.x,
        entity.pos.y - floorZ,
        0,
        (entity.shadow.flipX and -1 or 1) * zscale,
        (entity.shadow.flipY and -1 or 1) * zscale,
        entity.shadow.anchor.x,
        entity.shadow.anchor.y)
end

function Game:drawHeightMap(w, h, drawnEntities)
    if not heightCanvas or heightCanvas:getWidth() ~= w or heightCanvas:getHeight() ~= h then
        heightCanvas = love.graphics.newCanvas(w, h, { format = "r8" })
    end
    tileBatchStartIdx = 0
    tileBatchIdx = 0

    local tmp = textures
    textures = heightTextures
    love.graphics.push("all")
    love.graphics.setShader(HEIGHT_MAP_SHADER)
    love.graphics.setCanvas({ heightCanvas, stencil = true })
    love.graphics.clear(0, 0, 0, 1)
    for _, entity in ipairs(drawnEntities) do
        if entity.sprites then
            self:drawStackedTileHeightBatch()
            self:stencilLensEntities(entity)
            for _, sprite in ipairs(entity.sprites) do
                love.graphics.setColor((entity.pos.z + (sprite.anchor.z or 0)) / SKY_LIMIT, 0, 0, 1)
                self:drawEntitySprite(entity, sprite)
            end
            love.graphics.setStencilTest()
        elseif entity.tileSprites then
            tileBatchIdx = entity.tileSprites[#entity.tileSprites].batchIdx
            if tileBatchStartIdx == 0 then
                tileBatchStartIdx = tileBatchIdx
            end
        end
    end
    self:drawStackedTileHeightBatch()
    textures = tmp
    love.graphics.pop()
end

function Game:drawShadowMap(w, h, sx, sy, ex, ey)
    h = h + SHADOW_MAP_OFFSET
    if not shadowCanvas or shadowCanvas:getWidth() ~= w or shadowCanvas:getHeight() ~= h then
        shadowCanvas = love.graphics.newCanvas(w, h, { format = "r8" })
    end
    love.graphics.push("all")
    love.graphics.setCanvas(shadowCanvas)
    love.graphics.clear(0, 0, 0, 1)
    local i = 1
    for _, entity in self:iterEntities(self.entitiesByComponent.shadow) do
        local entitysx = entity.pos.x - 800
        local entitysy = entity.pos.y - entity.pos.z - 1200
        local entityex = entity.pos.x + 800
        local entityey = entity.pos.y - entity.pos.z + 1200
        if (entity.shadow) and
            entityex >= sx and entityey >= sy and entitysx <= ex and entitysy <= ey then
            shadowEntities[i] = entity
            i = i + 1
        end
    end
    for j = i, #shadowEntities do
        shadowEntities[j] = nil
    end
    self:sortByZ(shadowEntities)
    for _, entity in ipairs(shadowEntities) do
        love.graphics.setColor((entity.pos.z + SHADOW_MAP_HEIGHT_OFFSET) / SKY_LIMIT, 0, 0, 1)
        self:drawEntityShadow(entity)
    end
    love.graphics.pop()
end

function Game:stencilLensEntities(entity)
    if not entity.pos.lensed or not entity.physics then
        return
    end
    love.graphics.clear(false, 128, false)
    love.graphics.setStencilTest("gequal", 128)
    for _, lensEntity in self:iterEntities(self.entitiesByComponent.lens) do
        local lensx = lensEntity.pos.x
        local lensy = lensEntity.pos.y - lensEntity.pos.z - lensEntity.pos.height / 2
        if (lensEntity.drawOrder or BIG_NUMBER) < (entity.drawOrder or 0) then
            love.graphics.stencil(
                function()
                    love.graphics.push("all")
                    love.graphics.setShader(DITHER_SHADER)
                    love.graphics.draw(
                        lensEntity.lens.texture,
                        lensx - lensEntity.lens.width / 2,
                        lensy - lensEntity.lens.height / 2)
                    love.graphics.pop()
                end,
                "decrement",
                2,
                true)
        end
    end
end

function Game:findEntity(designation)
    if not designation then
        return nil
    elseif designation.byName then
        return self.entitiesByName[designation.byName]
    end
end

function Game:findPoint(designation)
    if not designation then
        return nil
    end
    local x, y = nil, nil
    if designation.byName then
        local entity = self:findEntity(designation)
        if entity and entity.pos then
            x, y = entity.pos.x, entity.pos.y
        end
    elseif designation.pos then
        x, y = designation.pos.x, designation.pos.y
    end
    if designation.offset then
        x = x + designation.offset.x or 0
        y = y + designation.offset.y or 0
    end
    return x, y
end

function Game:eval(operand)
    if type(operand) == "number" then
        return operand
    end
    local type, name = operand:match"%[(%w+)%.(%w+)%]"
    if type == "vars" then
        return self.vars[name]
    end
end

function Game:sortForDrawing(entities)
    table.sort(entities, function (a, b)
        local floorA, ay = self.physics:findFloorY(a)
        local floorB, by = self.physics:findFloorY(b)

        if math.abs(ay - by) < DELTA then
            if math.abs(a.pos.y - b.pos.y) < DELTA then
                if math.abs(a.pos.z - b.pos.z) < DELTA then
                    return a.id < b.id
                end
                return a.pos.z < b.pos.z
            end
            return a.pos.y < b.pos.y
        end

        return ay < by
    end)
end

function Game:sortByZ(entities)
    table.sort(entities, function (a, b)
        return a.pos.z < b.pos.z
    end)
end

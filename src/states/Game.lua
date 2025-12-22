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
    if not self.map then
        return
    end
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

function Game:createOtherCossins()
    -- Hello cossins
    for key, entity in pairs(self.entities) do
        if entity.name == "cossin" then
            for i = 2, 4 do
                local otherCossin = prefabs.cossin()
                otherCossin.name = "cossin" .. i
                local angle = math.random() * 2 * math.pi
                otherCossin.pos.x = entity.pos.x + math.cos(angle) * Game.constants.cossinSpawn.distance
                otherCossin.pos.y = entity.pos.y + math.sin(angle) * Game.constants.cossinSpawn.distance
                otherCossin.pos.z = math.randomRange(Game.constants.cossinSpawn.zRange, 0)
                otherCossin.pos.onGround = false
                otherCossin.pos.truncateHeight = 0
                otherCossin.actor.playerId = i
                for j, hueRot in ipairs(Game.constants.cossinHues[i - 1]) do
                    otherCossin.sprites[j].hueRot = hueRot
                end
                for k, v in pairs(otherCossin) do
                    if fancyTypes[k] then
                        otherCossin[k] = fancyTypes[k].new(v)
                    end
                end
                otherCossin.anim:update(0, otherCossin.sprites)
                table.insert(self.entities, otherCossin)
                otherCossin.id = #self.entities
                otherCossin.disabled = true
            end
            return
        end
    end
end

function Game:enter(args)
    load.crawlFiles()
    self.camera = CameraSystem.new()
    self.input = {
        target = nil
    }
    self.time = 0
    self.tint = { 1, 1, 1, 1 }
    self.map = Map.load(args.map)
    if not self.map then
        return
    end
    self.map:init()
    local time = love.timer.getTime()
    self.vars = {
        remainingFruits = 0,
        eaten = 0,
        eaten1 = 0,
        eaten2 = 0,
        eaten3 = 0,
        eaten4 = 0,
        score1 = 0,
        score2 = 0,
        score3 = 0,
        score4 = 0,
        player1 = true,
        player2 = playerActionsById[2] ~= nil,
        player3 = playerActionsById[3] ~= nil,
        player4 = playerActionsById[4] ~= nil,
        picnicFruits = 0,
        timer = Game.constants.defaultLevelTimer,
        firstLevel = Game.constants.firstLevel,
        currentMap = args.map,
        nextMap = nil,
        music = "TODO"
    }
    for key, value in pairs(self.map.vars) do
        self.vars[key] = value
    end
    if not Game.constants.bg[self.vars.bg] then
        self.vars.bg = "grass"
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

    self.map:getTileEntities(self.physics)
    time = love.timer.measure(time, "tile entities")

    self.map:getEntities(self.entities)
    self:createOtherCossins()
    for key, entity in pairs(self.entities) do
        -- Auto-attaching the input
        if entity.input and not self.input.target then
            self.input.target = entity
        end
        if entity.camera then
            entity.camera:setTarget(entity)
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
    time = love.timer.measure(time, "entities")
    Requests.populate(self)

    load.createHeightTextures()

    -- Create tile batches
    self.tilesBatches = {}
    self.tilesInfo = {}
    self.reflectedTilesBatches = {}
    self.reflectedTilesInfo = {}
    for i = 0, Game.constants.tileBatchesCount do
        self.tilesBatches[i] = love.graphics.newSpriteBatch(textures.tileset)
        self.reflectedTilesBatches[i] = love.graphics.newSpriteBatch(reflectedTextures.tileset)
        self.tilesInfo[i] = {}
        self.reflectedTilesInfo[i] = {}
        self.map:drawTiles(
            self.tilesBatches[i],
            self.tilesInfo[i],
            self.reflectedTilesBatches[i],
            self.reflectedTilesInfo[i],
            i * Game.constants.tileBatchesDT, self)
        if #self.tilesInfo[i] > 0 then
            local infoMesh = love.graphics.newMesh(
                {{ "z", "float", 1 }, { "height", "float", 1 }, { "drawOrder", "float", 1 }},
                self.tilesInfo[i])
            self.tilesBatches[i]:attachAttribute("z", infoMesh)
            self.tilesBatches[i]:attachAttribute("height", infoMesh)
            self.tilesBatches[i]:attachAttribute("drawOrder", infoMesh)
        end
        if #self.reflectedTilesInfo[i] > 0 then
            local infoMesh = love.graphics.newMesh(
                {{ "drawOrder", "float", 1 }},
                self.reflectedTilesInfo[i])
            self.reflectedTilesBatches[i]:attachAttribute("drawOrder", infoMesh)
        end
    end

    time = love.timer.measure(time, "tile batches")

    if self.vars.targetFruits then
        self.event:execute(Game.constants.startLevelCutscene)
    else
        self.timer.endTriggered = true
        self.event:execute(Game.constants.endGameCutscene)
    end
    self:update(0)

    if self.vars.ambience then
        Sound:start({
            name = self.vars.ambience,
            volume = Game.constants.ambienceVolume,
            loop = true
        })
    end
end

function Game:exit()
    Sound:fadeout()
    Music:fadeout()
    if self.physics then
        self.physics:exit()
    end
    input.playerAddRemoveEnabled = false
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
    self.fruits:update(framePart, dt, self)
    self.sounds:update(framePart, dt, self)
    Music:gameUpdate(framePart, dt, self)
    self.particles:update(framePart, dt, self)
    self.camera:update(framePart, dt, self)
    self.images:update(framePart, dt, self)
    self.event:update(framePart, dt, self)
    self.timer:update(framePart, dt, self)
    self.anim:clearTriggers()
    for _, entity in self:iterEntities(self.entities) do
        if entity.sprites then
            for _, sprite in ipairs(entity.sprites) do
                local spriteWiggleX = sprite.wiggle and sprite.wiggle.x or 0
                local spriteWiggleY = sprite.wiggle and sprite.wiggle.y or 0
                local wiggleX = spriteWiggleX * (entity.anim and entity.anim.wiggle.x or 1)
                local wiggleY = spriteWiggleY * (entity.anim and entity.anim.wiggle.y or 1)
                local scaleX = wiggleX + (1 - spriteWiggleX)
                local scaleY = wiggleY + (1 - spriteWiggleY)
                sprite.scaleX = scaleX
                sprite.scaleY = scaleY
            end
        end
    end
end

local cameraEntities = {}
local cameraCols = {}
local cameraRows = {}
local drawnEntities = {}
local effectEntities = {}
local tileBatchi = 0

function Game:render(dt)
    love.graphics.setCanvas(SCREEN_CANVAS)

    love.graphics.clear(unpack(Game.constants.bg.grass))
    self.camera:draw(dt, self)
    self.images:draw()

    love.graphics.setCanvas()

    SET_SCREEN_SHADER_BLUR(self.pause.active and Game.constants.pause.blur or self.camera.blur)
    love.graphics.draw(SCREEN_CANVAS)
    love.graphics.setShader()

    self.pause:draw()
end

function Game:renderFrame(dt, camera, x, y, w, h)
    local sx, sy, ex, ey, scale = camera:applyTransformations(w, h)
    tileBatchi = math.floor(self.time / Game.constants.tileBatchesDT) % #self.tilesBatches

    self:drawShadowMap(camera, w, h, sx, sy, ex, ey)
    self:drawReflectionMap(camera, w, h, sx, sy, ex, ey)

    local i = 1
    local effecti = 1
    for _, entity in self:iterEntities(self.entitiesByComponent.sprites) do
        -- Should be derived from display size but OOPS
        local entitysx = entity.pos.x - DRAW_X_SLOP
        local entitysy = entity.pos.y - entity.pos.z - DRAW_Y_SLOP
        local entityex = entity.pos.x + DRAW_X_SLOP
        local entityey = entity.pos.y - entity.pos.z + DRAW_Y_SLOP
        if entityex >= sx and entityey >= sy and entitysx <= ex and entitysy <= ey then
            entity.drawOrder = self:getEntityDrawOrder(entity)
            local hasAlpha = entity.color and entity.color[4] < 1
            local hasLight = entity.light and entity.light.alpha > DELTA
            if not hasAlpha then
                drawnEntities[i] = entity
                i = i + 1
            end
            if hasAlpha or hasLight then
                effectEntities[effecti] = entity
                effecti = effecti + 1
            end
        end
    end
    for j = i, #drawnEntities do
        drawnEntities[j] = nil
    end
    for j = effecti, #effectEntities do
        effectEntities[j] = nil
    end
    table.sort(effectEntities, Game.drawOrderSort)

    -- Draw!
    love.graphics.setCanvas({ camera.canvas, stencil = true, depth = true })
    love.graphics.setShader(HEIGHT_MAPPED_SHADER)
    HEIGHT_MAPPED_SHADER:send("size", { w, h })
    HEIGHT_MAPPED_SHADER:send("screenBounds", { sy - DRAW_Z_SLOP, ey + DRAW_Z_SLOP })
    HEIGHT_MAPPED_SHADER:send("shadowMap", camera.shadowCanvas)
    HEIGHT_MAPPED_SHADER:send("reflectionMap", camera.reflectionCanvas)
    HEIGHT_MAPPED_SHADER:send("hue", -1)
    HEIGHT_MAPPED_SHADER:send("hueRot", 0)
    HEIGHT_MAPPED_SHADER:send("time", self.time)
    HEIGHT_MAPPED_SHADER:send("cameraPos", { camera.x * scale, camera.y * scale })
    HEIGHT_MAPPED_SHADER:send("scale", scale * Game.constants.heightSlop)
    HEIGHT_MAPPED_SHADER:send("entityZ", 0)
    HEIGHT_MAPPED_SHADER:send("entityHeight", 0)
    HEIGHT_MAPPED_SHADER:send("alphaThreshold", 0.5)

    -- Clear
    love.graphics.clear()
    love.graphics.setColor(Game.constants.bg[self.vars.bg])
    love.graphics.rectangle("fill", sx, sy, ex - sx, ey - sy)
    love.graphics.setColor(1, 1, 1, 1)

    -- Depth go!
    love.graphics.setDepthMode("lequal", true)

    -- Tiles
    HEIGHT_MAPPED_SHADER:send("entityZ", -1)
    HEIGHT_MAPPED_SHADER:send("heightTexture", heightTextures.tileset)
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(self.tilesBatches[tileBatchi], 0, 0)
    love.graphics.setBlendMode("alpha")

    -- Entities
    for _, entity in ipairs(drawnEntities) do
        HEIGHT_MAPPED_SHADER:send("entityDrawOrder", entity.drawOrder)
        self:drawEntitySprites(entity)
    end

    HEIGHT_MAPPED_SHADER:send("alphaThreshold", 0.0)

    for _, entity in ipairs(effectEntities) do
        HEIGHT_MAPPED_SHADER:send("entityDrawOrder", entity.drawOrder)
        if entity.color and entity.color[4] < 1 then
            self:drawEntitySprites(entity)
        end
        if entity.light and entity.light.alpha > DELTA then
            self:drawLight(entity, sy)
        end
    end

    love.graphics.setShader()
    love.graphics.setDepthMode()

    -- Bubbles
    for _, entity in ipairs(drawnEntities) do
        if entity.bubble then
            love.graphics.push()
            love.graphics.translate(entity.pos.x, entity.pos.y - entity.pos.z)
            entity.bubble:draw(entity)
            love.graphics.pop()
        end
    end

    if dbg.physics then
        PhysicsRenderer.draw_camera(self.physics.world, 0, 0, w, h)
    end

    if dbg.pointHeights then
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
    love.graphics.setCanvas(camera.canvas)

    if dbg.heightMap then
        print(("OOPS NO LONGER SUPPORTED"))
    end

    if dbg.shadowMap then
        love.graphics.setShader(MAP_DEBUG_SHADER)
        love.graphics.draw(camera.shadowCanvas, 0, 0)
        love.graphics.setShader()
    end

    if dbg.reflectionMap then
        love.graphics.draw(camera.reflectionCanvas, 0, 0)
    end

    if dbg.pointHeights then
        local x, y = 0, 0
        if self.input.target then
            x = math.round(self.input.target.pos.x)
            y = math.round(self.input.target.pos.y)
        end
        love.graphics.print(x .. ":" .. y, 50, 0)
        local tx, ty = Map.PosToTileMat:transformPoint(x, y)
        love.graphics.print(tx .. ":" .. ty, 50, 50)
    end

    love.graphics.setCanvas()
end

function Game:drawEntitySprites(entity)
    self:stencilLensEntities(entity)
    if entity.color then
        love.graphics.setColor(unpack(entity.color))
    end
    for _, sprite in ipairs(entity.sprites) do
        HEIGHT_MAPPED_SHADER:send("heightTexture", heightTextures[sprite.name])
        HEIGHT_MAPPED_SHADER:send("entityZ", entity.pos.z + (sprite.anchor.z or 0))
        HEIGHT_MAPPED_SHADER:send("entityHeight", (entity.pos.height or 0) * sprite.scaleY)
        local doTheHue = entity.hue or sprite.hue
        if doTheHue then
            HEIGHT_MAPPED_SHADER:send("hue", sprite.hue)
        end
        local doTheHueRot = (entity.hueRot and entity.hueRot ~= 0 and sprite.hueMult ~= 0) or sprite.hueRot
        if doTheHueRot then
            local hueRot = (entity.hueRot or 0) * (sprite.hueMult or 1) + (sprite.hueRot or 0)
            HEIGHT_MAPPED_SHADER:send("hueRot", hueRot)
        end
        HEIGHT_MAPPED_SHADER:send("entityZ", entity.pos.z + (sprite.anchor.z or 0))
        HEIGHT_MAPPED_SHADER:send("entityHeight", (entity.pos.height or 0) * sprite.scaleY)
        HEIGHT_MAPPED_SHADER:send("heightTexture", heightTextures[sprite.name])
        self:drawEntitySprite(entity, sprite)
        if doTheHue then
            HEIGHT_MAPPED_SHADER:send("hue", -1)
        end
        if doTheHueRot then
            HEIGHT_MAPPED_SHADER:send("hueRot", 0)
        end
    end
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setStencilTest()
end

function Game:drawEntitySprite(entity, sprite)
    local texture = textures[sprite.name]
    local animData = sprite.animData
    local frame = sprite.frame
    if animData and frame then
        love.graphics.draw(
            texture,
            animData.tiles[frame].quad,
            entity.pos.x,
            (entity.pos.y - entity.pos.z - (sprite.anchor.z or 0)),
            0,
            (sprite.flipX and -1 or 1) * (animData.flipX and -1 or 1) * (sprite.scaleX or 1),
            (sprite.flipY and -1 or 1) * (animData.flipY and -1 or 1) * (sprite.scaleY or 1),
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
            (sprite.flipX and -1 or 1) * sprite.scaleX,
            (sprite.flipY and -1 or 1) * sprite.scaleY,
            sprite.anchor.x,
            sprite.anchor.y)
    end
end

function Game:drawLight(entity, sy)
    local alpha = entity.light.alpha or Game.constants.defaultLight.alpha
    love.graphics.setBlendMode("add")
    love.graphics.setColor(
        Game.constants.lightColor[1],
        Game.constants.lightColor[2],
        Game.constants.lightColor[3],
        alpha)

    local radiusw = entity.light.radiusw or Game.constants.defaultLight.radiusw
    local radiush = entity.light.radiush or Game.constants.defaultLight.radiush
    local angle = entity.light.angle or Game.constants.defaultLight.angle
    local type = entity.light.type or Game.constants.defaultLight.type
    if type == "ray" then
        local rayHeight = entity.pos.y - sy
        local rayOffset = rayHeight * math.tan(math.pi / 2 - angle)
        local startx, starty = entity.pos.x + rayOffset + radiusw, entity.pos.y - rayHeight
        local endx, endy = entity.pos.x + rayOffset - radiusw, entity.pos.y - rayHeight
        LIGHT_POINTS[1] = startx
        LIGHT_POINTS[2] = starty
        local n = 16
        for i = 1, n + 1 do
            local x, y =  math.getEllipsePoint(
                entity.pos.x, entity.pos.y,
                radiusw, radiush,
                ((i - 1) / (n - 1)) * math.pi)
            LIGHT_POINTS[i * 2 + 1] = x
            LIGHT_POINTS[i * 2 + 2] = y
        end
        LIGHT_POINTS[#LIGHT_POINTS - 1] = endx
        LIGHT_POINTS[#LIGHT_POINTS] = endy
        love.graphics.polygon("fill", unpack(LIGHT_POINTS))
    elseif type == "halo" then
        local haloTexture = textures[Game.constants.defaultLight.haloTexture]
        local tw, th = haloTexture:getDimensions()
        love.graphics.draw(haloTexture,
            entity.pos.x,
            entity.pos.y - entity.pos.z - entity.pos.height / 2,
            0,
            radiusw / tw,
            radiusw / th,
            tw / 2,
            th / 2)
    end
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setBlendMode("alpha")
end

function Game:drawEntityShadow(entity, floorZ)
    floorZ = floorZ or 0
    love.graphics.draw(
        textures[entity.shadow.name],
        entity.pos.x,
        entity.pos.y - floorZ,
        0,
        (entity.shadow.flipX and -1 or 1),
        (entity.shadow.flipY and -1 or 1),
        entity.shadow.anchor.x,
        entity.shadow.anchor.y)
end

function Game:drawShadowMap(camera, w, h, sx, sy, ex, ey)
    love.graphics.push("all")
    love.graphics.setCanvas(camera.shadowCanvas)
    love.graphics.clear(0, 0, 0, 1)
    local i = 1
    for _, entity in self:iterEntities(self.entitiesByComponent.shadow) do
        local entitysx = entity.pos.x - 800
        local entitysy = entity.pos.y - entity.pos.z - 1200
        local entityex = entity.pos.x + 800
        local entityey = entity.pos.y - entity.pos.z + 1200
        if (entity.shadow) and
            entityex >= sx and entityey >= sy and entitysx <= ex and entitysy <= ey then
            effectEntities[i] = entity
            i = i + 1
        end
    end
    for j = i, #effectEntities do
        effectEntities[j] = nil
    end
    self:sortByZ(effectEntities)
    for _, entity in ipairs(effectEntities) do
        love.graphics.setColor((entity.pos.z + SHADOW_MAP_HEIGHT_OFFSET) / SKY_LIMIT, 0, 0, 1)
        self:drawEntityShadow(entity)
    end
    love.graphics.pop()
end

function Game:drawReflectionMap(camera, w, h, sx, sy, ex, ey)
    love.graphics.push("all")
    love.graphics.setCanvas({ camera.reflectionCanvas, depth = true })
    love.graphics.setShader(REFLECTION_SHADER)
    REFLECTION_SHADER:send("hue", -1)
    REFLECTION_SHADER:send("hueRot", 0)
    REFLECTION_SHADER:send("screenBounds", { (sy - DRAW_Z_SLOP)/256, (ey + DRAW_Z_SLOP)/256 + SKY_LIMIT })

    love.graphics.clear(Game.constants.waterColor[1], Game.constants.waterColor[2], Game.constants.waterColor[3], 1)

    love.graphics.setDepthMode("lequal", true)

    REFLECTION_SHADER:send("entityZ", -1)
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(self.reflectedTilesBatches[tileBatchi], 0, 0)
    love.graphics.setBlendMode("alpha")

    local i = 1
    for _, entity in self:iterEntities(self.entitiesByComponent.sprites) do
        local entitysx = entity.pos.x - DRAW_X_SLOP
        local entitysy = entity.pos.y - entity.pos.z
        local entityex = entity.pos.x + DRAW_X_SLOP
        local entityey = entity.pos.y - entity.pos.z + DRAW_Y_SLOP * 2
        if entity.pos.height and entity.pos.height > 0 and
            entityex >= sx and entityey >= sy and entitysx <= ex and entitysy <= ey then
            entity.reflectionOrder = self:getEntityReflectionOrder(entity)
            effectEntities[i] = entity
            i = i + 1
        end
    end
    for j = i, #effectEntities do
        effectEntities[j] = nil
    end
    local tmp = textures
    for _, entity in ipairs(effectEntities) do
        REFLECTION_SHADER:send("entityDrawOrder", entity.reflectionOrder)
        REFLECTION_SHADER:send("entityZ", entity.pos.z)

        -- Offset the z to fix position
        local z = entity.pos.z
        entity.pos.z = - z + entity.pos.truncateHeight * 2

        if entity.color then
            love.graphics.setColor(unpack(entity.color))
        end
        for _, sprite in ipairs(entity.sprites) do
            -- Check for reflection flipy vs reflection fancy texture thingy
            local doTheFlip = not reflectedTextures[sprite.name]
            local info = reflectedInfo[sprite.name]
            if doTheFlip then
                sprite.flipY = not sprite.flipY
                textures = tmp
            else
                textures = reflectedTextures
                entity.pos.z = entity.pos.z - (entity.pos.height or 0) + info.offset
            end

            -- The huemanity!
            local doTheHue = entity.hue or sprite.hue
            if doTheHue then
                REFLECTION_SHADER:send("hue", sprite.hue)
            end
            local doTheHueRot = (entity.hueRot and entity.hueRot ~= 0 and sprite.hueMult ~= 0) or sprite.hueRot
            if doTheHueRot then
                local hueRot = (entity.hueRot or 0) * (sprite.hueMult or 1) + (sprite.hueRot or 0)
                REFLECTION_SHADER:send("hueRot", hueRot)
            end

            -- Draw!
            self:drawEntitySprite(entity, sprite)

            -- Undo all that humane shit
            if doTheHue then
                REFLECTION_SHADER:send("hue", -1)
            end
            if doTheHueRot then
                REFLECTION_SHADER:send("hueRot", 0)
            end

            -- Undo the flipy/fancy
            if doTheFlip then
                sprite.flipY = not sprite.flipY
            else
                entity.pos.z = entity.pos.z + (entity.pos.height or 0) - info.offset
            end
        end
        entity.pos.z = z
        love.graphics.setColor(1, 1, 1, 1)
    end
    textures = tmp
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
                    love.graphics.setDepthMode()
                    love.graphics.push("all")
                    love.graphics.setShader(DITHER_SHADER)
                    love.graphics.draw(
                        lensEntity.lens.texture,
                        lensx - lensEntity.lens.width / 2,
                        lensy - lensEntity.lens.height / 2)
                    love.graphics.pop()
                    love.graphics.setDepthMode("lequal", true)
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
        x = x + (designation.offset.x or 0)
        y = y + (designation.offset.y or 0)
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
    return operand
end

function Game:sortByZ(entities)
    table.sort(entities, function (a, b)
        return a.pos.z < b.pos.z
    end)
end

function Game:getEntityReflectionOrder(entity)
    return self:getReflectionOrder(entity.pos.y, entity.pos.z, entity.id)
end

function Game:getReflectionOrder(y, z, id)
    return y
    --return y / 256 + (SKY_LIMIT - z)
end

function Game.drawOrderSort(a, b)
    return a.drawOrder < b.drawOrder
end

function Game:findFloorY(entity)
    local y = entity.pos.y
    for i = 1, 20 do
        if entity.pos.floorEntity then
            entity = entity.pos.floorEntity
            y = math.max(entity.pos.y, y)
        else
            return entity, y, i
        end
    end
    return entity, y, 0
end

function Game:getEntityDrawOrder(entity)
    local _, y, depth = self:findFloorY(entity)
    return self:getDrawOrder(y, entity.pos.z, entity.id)
end

function Game:getDrawOrder(y, z, id)
    return (id / 1000 + z) / (SKY_LIMIT / 10) + y
end

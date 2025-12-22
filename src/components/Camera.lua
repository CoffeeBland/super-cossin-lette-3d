CameraSystem = {}
CameraSystem.__index = CameraSystem

function CameraSystem.new()
    return setmetatable({
        shakeFrames = 0,
        shakeAmplitude = 0,
        blur = 0,
        blurTarget = 0,
        blurFrames = 0
    }, CameraSystem)
end

function CameraSystem:setMoveFromEvent(game, event, entity)
    local target = game:findEntity(event.target)
    if not event.entity then
        for _, entity in game:iterEntities(game.entitiesByComponent.camera) do
            entity.camera:setMoveFromEvent(target, event)
        end
    else
        entity.camera:setMoveFromEvent(target, event)
    end
    if event.blur then
        self.blurFrames = event.blurFrames or 0
        self.blurTarget = event.blur or 1
        if self.blurFrames == 0 then
            self.blur = self.blurTarget
        end
    end
end

function CameraSystem:update(framePart, dt, game)
    self.blur = math.interp(self.blurFrames, self.blur, self.blurTarget or self.blur)
    self.blurFrames = math.max(self.blurFrames - framePart, 0)

    for _, entity in game:iterEntities(game.entitiesByComponent.shakeEmitter) do
        if entity.anim then
            local mass = entity.actor and entity.actor.stats.mass or 1
            for trigger, shake in pairs(entity.shakeEmitter.triggers) do
                if (not shake.minimumMass or mass >= shake.minimumMass) and
                    entity.anim:isTriggered(trigger)
                then
                    self.shakeAmplitude = shake.amplitude
                    self.shakeFrames = shake.frames
                end
            end
        end
    end

    for _, entity in game:iterEntities(game.entitiesByComponent.camera) do
        local camera = entity.camera
        camera.zoom = math.interp(camera.zoomFrames, camera.zoom, camera.zoomTarget or camera.zoom)
        camera.zoomFrames = math.max(camera.zoomFrames - framePart, 0)

        if camera.target then
            if camera.panFrames > 0 then
                camera.x = math.interp(camera.panFrames, camera.x, camera.target.pos.x)
                camera.y = math.interp(camera.panFrames, camera.y, camera.target.pos.y)
                camera.panFrames = math.max(camera.panFrames - framePart, 0)
            else
                camera.x = camera.target.pos.x
                camera.y = camera.target.pos.y
            end
            if camera.sizeFrames > 0 then
                camera.size = math.interp(camera.sizeFrames, camera.size, camera.sizeTarget)
                camera.sizeFrames = math.max(camera.sizeFrames - framePart, 0)
            else
                camera.size = camera.sizeTarget or 1
            end
            if (camera.z < camera.target.pos.floorZ and camera.target.pos.z > camera.z) or
                (camera.z > camera.target.pos.floorZ and camera.target.pos.z < camera.z) then
                camera.z = math.interp(60, camera.z, camera.target.pos.floorZ or 0)
            end
            if self.shakeFrames > 0 then
                camera.offsetX = (math.random() - 0.5) * self.shakeAmplitude
                camera.offsetY = (math.random() - 0.5) * self.shakeAmplitude
            else
                camera.offsetX = 0
                camera.offsetY = 0
            end
        end
    end

    if self.shakeFrames > 0 then
        self.shakeFrames = math.max(self.shakeFrames - framePart, 0)
    end
end

local camEntities = {}
local colParts = {}
local colPos = {}
local rowParts = {}
local rowPos = {}

function CameraSystem:draw(dt, game)
    local origCanvas = love.graphics.getCanvas()
    -- Count the cameras
    local camCount = 0
    for _, entity in game:iterEntities(game.entitiesByComponent.camera) do
        if not entity.camera.disabled then
            camCount = camCount + 1
            camEntities[camCount] = entity
        end
    end

    -- Define how many row/columns
    local rows
    local cols
    if CURRES[1] < CURRES[2] then
        rows = math.ceil(math.sqrt(camCount))
        cols = math.ceil(camCount / rows)
    else
        cols = math.ceil(math.sqrt(camCount))
        rows = math.ceil(camCount / cols)
    end

    -- Count the parts by column/row
    for col = 1, cols do
        colParts[col] = 0
    end
    for row = 1, rows do
        rowParts[row] = 0
    end

    for col = 1, cols do
        for row = 1, rows do
            local i = col + (row - 1) * cols
            if i <= camCount then
                local camEntity = camEntities[i]
                colParts[col] = math.max(colParts[col], camEntity.camera.size)
                rowParts[row] = math.max(rowParts[row], camEntity.camera.size)
            end
        end
    end

    -- Count the total parts by column/row
    local colTotal = 0
    for col = 1, cols do
        colTotal = colTotal + colParts[col]
    end
    local rowTotal = 0
    for row = 1, rows do
        rowTotal = rowTotal + rowParts[row]
    end

    local camw = math.ceil(CURRES[1] / cols) * 1.2
    local camh = math.ceil(CURRES[2] / rows) * 1.2

    -- Gogogadget
    local x = 0
    for col = 1, cols do
        local w = colParts[col] * (CURRES[1] / colTotal)
        local y = 0
        for row = 1, rows do
            local h = rowParts[row] * (CURRES[2] / rowTotal)
            local i = col + (row - 1) * cols
            if i <= camCount then
                local camEntity = camEntities[i]
                local quadw, quadh = camEntity.camera:setSize(x, y, w, h, camw, camh)
                game:renderFrame(dt, camEntity.camera, x, y, camw, camh)

                love.graphics.setCanvas(origCanvas)
                love.graphics.setShader(POST_SHADER)
                POST_SHADER:send("size", { camw, camh })
                POST_SHADER:send("palette", Options.values.brun and BRUN_PALETTE or DEFAULT_PALETTE)
                POST_SHADER:send("pixelLens", Options.values.brun and 0.025 or 0)
                love.graphics.setColor(unpack(Game.tint))
                love.graphics.draw(camEntity.camera.canvas, camEntity.camera.quad, x, y, 0, w / quadw, h / quadh)
                love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
            end
            y = y + h
        end
        x = x + w
    end

    -- Lines
    local iconW, iconH = textures.Icon:getDimensions()
    local iconScale = SCALE_TO_EXPECTED * 0.5
    love.graphics.setCanvas(origCanvas)
    love.graphics.setShader()
    local x = 0
    for col = 1, cols do
        local w = colParts[col] * (CURRES[1] / colTotal)
        local y = 0
        for row = 1, rows do
            local h = rowParts[row] * (CURRES[2] / rowTotal)

            if #camEntities > 1 then
                local i = col + (row - 1) * cols
                local camEntity = camEntities[i]
                local camSprite = camEntity.sprites[2]
                local hueRot = (camEntity.hueRot or 0) * (camSprite.hueMult or 1) + (camSprite.hueRot or 0)
                love.graphics.setShader(TITLE_SHADER)
                TITLE_SHADER:send("hue", -1)
                TITLE_SHADER:send("hueRot", hueRot)
                love.graphics.draw(textures.Icon,
                    x + w - iconW * iconScale + 1,
                    y + h - iconH * iconScale + 1,
                    0,
                    iconScale,
                    iconScale)
                love.graphics.setShader()
            end

            love.graphics.setColor(unpack(Game.constants.lineColor))
            love.graphics.rectangle("line", x - 0.5, y - 0.5, w + 1, h + 1)
            love.graphics.setColor(1, 1, 1, 1)
            y = y + h
        end
        x = x + w
    end
end

Camera = {}
Camera.__index = Camera
fancyTypes.camera = Camera

function Camera.new(params)
    return setmetatable({
        x = params.x or 0,
        y = params.y or 0,
        z = params.z or 0,
        panFrames = params.panFrames or 0,
        target = params.target or nil,
        zoom = params.zoom or 1,
        zoomTarget = params.zoom or 1,
        zoomFrames = params.zoomFrames or 0,
        offsetX = params.offsetX or 0,
        offsetY = params.offsetY or 0,
        size = params.size or 1,
        sizeTarget = params.size or 1,
        sizeFrames = 0,
        quad = love.graphics.newQuad(0, 0, 0, 0, 0, 0)
    }, Camera)
end

local canvas = nil
local shadowCanvas = nil
local reflectionCanvas = nil

function Camera:setSize(x, y, w, h, canvasw, canvash)
    local ratio = math.max(w / canvasw, h / canvash)
    local qw = w / ratio
    local qh = h / ratio
    local qx = (canvasw - qw) / 2
    local qy = (canvash - qh) / 2
    self.quad:setViewport(qx, qy, qw, qh, canvasw, canvash)

    self.scale = math.scaleToExpected(qw, qh) * self.zoom

    if not canvas or canvas:getWidth() ~= canvasw or canvas:getHeight() ~= canvash then
        canvas = love.graphics.newCanvas(canvasw, canvash)
    end
    canvash = canvash + SHADOW_MAP_OFFSET
    if not shadowCanvas or shadowCanvas:getWidth() ~= canvasw or shadowCanvas:getHeight() ~= canvash then
        shadowCanvas = love.graphics.newCanvas(canvasw, canvash, { format = "r8" })
    end
    if not reflectionCanvas or reflectionCanvas:getWidth() ~= canvasw or reflectionCanvas:getHeight() ~= canvash then
        reflectionCanvas = love.graphics.newCanvas(canvasw, canvash, { format = "rgba8" })
    end

    self.canvas = canvas
    self.shadowCanvas = shadowCanvas
    self.reflectionCanvas = reflectionCanvas
    return qw, qh
end

function Camera:setMoveFromEvent(target, event)
    if event.target then
        self.target = target
    end
    if event.panFrames then
        self.panFrames = event.panFrames
    end
    if event.zoom then
        self.zoomFrames = event.zoomFrames or 0
        self.zoomTarget = event.zoom or 1
        if self.zoomFrames == 0 then
            self.zoom = self.zoomTarget
        end
    end
    if event.size then
        self.sizeFrames = event.sizeFrames or 0
        self.sizeTarget = event.size or 1
        if self.sizeFrames == 0 then
            self.size = self.sizeTarget
        end
    end
end

function Camera:setTarget(entity)
    self.target = entity
end

function Camera:applyTransformations(w, h)
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(self.scale)
    love.graphics.translate(
        -self.x + self.offsetX,
        -self.y + self.offsetY + self.z)
    local sx, sy = love.graphics.inverseTransformPoint(0, 0)
    local ex, ey = love.graphics.inverseTransformPoint(0 + w, 0 + h)
    return sx, sy, ex, ey, self.scale
end

function Camera:isPanning()
    return self.panFrames and self.panFrames > 0
end

function Camera:isZooming()
    return self.zoomFrames and self.zoomFrames > 0
end

CameraSystem = {}
CameraSystem.__index = CameraSystem

function CameraSystem.new()
    return setmetatable({
        x = 0,
        y = 0,
        z = 0,
        panFrames = 0,
        target = nil,
        shakeFrames = 0,
        shakeAmplitude = 0,
        zoom = 1,
        targetZoom = 1,
        zoomFrames = 0,
        offsetX = 0,
        offsetY = 0
    }, CameraSystem)
end

function CameraSystem:setMoveFromEvent(entity, event)
    if event.entity then
        self.target = entity
    end
    if event.panFrames then
        self.panFrames = event.panFrames
    else
        self.panFrames = 0
    end
    if event.zoom then
        self.zoomFrames = event.zoomFrames or 0
        self.targetZoom = event.zoom
        if self.zoomFrames == 0 then
            self.zoom = event.zoom
        end
    end
end

function CameraSystem:setTarget(entity)
    self.target = entity
end

function CameraSystem:update(framePart, dt, game)
    for _, entity in game:iterEntities(game.entitiesByComponent.shakeEmitter) do
        if entity.anim then
            local mass = entity.actor and entity.actor.mass or 1
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

    self.zoom = math.interp(self.zoomFrames, self.zoom, self.targetZoom or self.zoom)
    self.zoomFrames = math.max(self.zoomFrames - framePart, 0)

    if self.target then
        if self.panFrames > 0 then
            self.x = math.interp(self.panFrames, self.x, self.target.pos.x)
            self.y = math.interp(self.panFrames, self.y, self.target.pos.y)
            self.panFrames = math.max(self.panFrames - framePart, 0)
            if self.panFrames == 0 then
                game.anim:trigger("camera:finished")
            end
        else
            self.x = self.target.pos.x
            self.y = self.target.pos.y
        end
        if (self.z < self.target.pos.floorZ and self.target.pos.z > self.z) or
            (self.z > self.target.pos.floorZ and self.target.pos.z < self.z) then
            self.z = math.interp(60, self.z, self.target.pos.floorZ or 0)
        end
        if self.shakeFrames > 0 then
            self.offsetX = (math.random() - 0.5) * self.shakeAmplitude
            self.offsetY = (math.random() - 0.5) * self.shakeAmplitude
            self.shakeFrames = math.max(self.shakeFrames - framePart, 0)
        else
            self.offsetX = 0
            self.offsetY = 0
        end
    end
end

function CameraSystem:applyTransformations()
    local w, h = love.graphics.getDimensions()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(0.5 * self.zoom)
    love.graphics.translate(
        -self.x + self.offsetX,
        -self.y + self.offsetY + self.z)
    local sx, sy = love.graphics.inverseTransformPoint(0, 0)
    local ex, ey = love.graphics.inverseTransformPoint(0 + w, 0 + h)
    return w, h, sx, sy, ex, ey
end

function CameraSystem:isPanning()
    return self.panFrames and self.panFrames > 0
end

function CameraSystem:isZooming()
    return self.zoomFrames and self.zoomFrames > 0
end

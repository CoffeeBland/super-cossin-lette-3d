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

require "src.Map"

local PhysicsRenderer = require "src.PhysicsRenderer"

Game = {
    fadeout = 15,
    fadein = 15
}

function Game:refresh(force)
    local path = "maps/" .. self.map.name .. ".lua"
    local info = love.filesystem.getInfo(path, "file")
    if force or (timestamps[path] and timestamps[path].modtime < info.modtime) then
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
    self.endTriggered = false
    self.map = Map.load(args.map)
    self.vars = {
        remainingFruits = 0,
        eaten = 0,
        picnicFruits = 0,
        targetFruits = 1,
        currentMap = args.map,
        nextMap = nil
    }
    for key, value in pairs(self.map.vars) do
        self.vars[key] = value
    end
    self.tilesBatch = love.graphics.newSpriteBatch(textures.tileset)
    Requests.new(self)
    self.physics = PhysicsSystem.new()
    self.sounds = SoundSystem.new()
    self.event = Event.new()
    self.anim = Anim.new()
    self.water = WaterSystem.new()
    self.fruits = FruitSystem.new()
    self.actors = ActorSystem.new()
    self.particles = ParticleSystem.new(Game.constants.particleCount, self.entities)

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
    end
    Requests.populate(self)
    self:update(0)
end

function Game:exit()
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
    self.event:update(framePart, self)
    self.anim:clearTriggers()

    if (self.vars.remainingFruits == 0 or actions.gogogadget) and not self.endTriggered then
        self.endTriggered = true
        self.event:execute(Game.constants.endLevelCutscene)
    end
end

local drawnEntities = {}

function Game:render(dt)
    local w, h, sx, sy, ex, ey = self.camera:applyTransformations()
    love.graphics.clear(0.2, 0.5, 0.4)

    local i = 1
    for _, entity in self:iterEntities() do
        local entitysx = entity.pos.x - 800
        local entitysy = entity.pos.y - entity.pos.z - 1200
        local entityex = entity.pos.x + 800
        local entityey = entity.pos.y - entity.pos.z + 1200
        if  entityex >= sx and entityey >= sy and entitysx <= ex and entitysy <= ey then
            drawnEntities[i] = entity
            i = i + 1
        end
    end
    for j = i, #drawnEntities do
        drawnEntities[j] = nil
    end

    -- Sorting! Fun times!
    table.sort(drawnEntities,
        function (a, b)
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

    -- Tiles
    love.graphics.setBlendMode("alpha", "premultiplied")
    self.tilesBatch:clear()
    self.map:drawTiles(self.tilesBatch, self.time, sx, sy, ex, ey)
    love.graphics.draw(self.tilesBatch, 0, 0)
    love.graphics.setBlendMode("alpha")

    -- Shadows
    love.graphics.setBlendMode("multiply", "premultiplied")
    for _, entity in ipairs(drawnEntities) do
        if entity.shadow then
            if entity.color then
                love.graphics.setColor(unpack(entity.color))
            end
            self:drawEntityShadow(entity)
            love.graphics.setColor(1, 1, 1, 1)
        end
    end
    love.graphics.setBlendMode("alpha")

    -- Entities
    for _, entity in ipairs(drawnEntities) do
        if entity.color then
            love.graphics.setColor(unpack(entity.color))
        end
        -- Stacked entities shadows
        if banana and entity.shadow and (entity.pos.floorZ or 0) > 0 then
            love.graphics.stencil(
                function()
                    love.graphics.setShader(MASK_SHADER)
                    overlappingCheckSlop = SHADOW_OVERLAP_SLOP
                    for _, other in ipairs(self.physics:getAllOverlappingOfType(entity.physics.heightSensor)) do
                        if entity.pos.z + DELTA > other.pos.z then
                            self:drawEntity(other)
                        end
                    end
                    love.graphics.setShader()
                end,
                "replace",
                1)
            love.graphics.setStencilTest("greater", 0)
            love.graphics.setBlendMode("multiply", "premultiplied")
            self:drawEntityShadow(entity, entity.pos.floorZ)
            love.graphics.setBlendMode("alpha")
            love.graphics.setStencilTest()
        end
        -- Sprites
        self:drawEntity(entity)
        love.graphics.setColor(1, 1, 1, 1)

        -- Newfangled banana shadows
        if entity.physics then
            love.graphics.stencil(
                function()
                    love.graphics.setShader(MASK_SHADER)
                    self:drawEntity(entity)
                    love.graphics.setShader()
                end,
                "replace",
                1)
            love.graphics.setStencilTest("greater", 0)
            love.graphics.setBlendMode("multiply", "premultiplied")
            overlappingCheckSlop = SHADOW_OVERLAP_SLOP
            for _, other in ipairs(self.physics:getAllOverlappingOfType(entity.physics.heightSensor)) do
                if other.shadow and
                    entity.pos.z + entity.pos.height < other.pos.z + DELTA and
                    entity.pos.z + entity.pos.height > other.pos.floorZ - DELTA
                then
                    self:drawEntityShadow(other, entity.pos.z + entity.pos.height)
                end
            end
            love.graphics.setBlendMode("alpha")
            love.graphics.setStencilTest()
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

function Game:drawEntity(entity)
    if entity.sprites then
        for _, sprite in ipairs(entity.sprites) do
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
                    (entity.pos.y - entity.pos.z),
                    0,
                    (sprite.flipX and - 1 or 1) * (animData.flipX and -1 or 1) * scaleX,
                    (sprite.flipY and - 1 or 1) * (animData.flipY and -1 or 1) * scaleY,
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
                    (entity.pos.y + entity.pos.truncateHeight - entity.pos.z),
                    0,
                    sprite.flipX and -1 or 1,
                    sprite.flipY and -1 or 1,
                    sprite.anchor.x,
                    sprite.anchor.y)
            end
        end
    elseif entity.tileSprites then
        love.graphics.setBlendMode("alpha", "premultiplied")
        for _, sprite in ipairs(entity.tileSprites) do
            local tileData = tileset.tiles[sprite.tile]
            love.graphics.draw(
                textures.tileset,
                tileData.quad,
                entity.pos.x,
                (entity.pos.y - entity.pos.z),
                0,
                sprite.flipX and -1 or 1,
                sprite.flipY and -1 or 1,
                sprite.anchor.x,
                sprite.anchor.y)
        end
        love.graphics.setBlendMode("alpha")
    end
end

function Game:drawEntityShadow(entity, floorZ)
    floorZ = floorZ or 0
    local zscale = entity.velocity and
        math.pow(1 / math.max((entity.pos.z - floorZ) / METER_SCALE, 1), 1/4) or
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

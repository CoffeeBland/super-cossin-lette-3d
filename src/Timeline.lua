Timeline = {}
Timeline.__index = Timeline

Timeline.letters = {
    texture = nil,
    quads = {},
    size = { x = 70, y = 140 }
}

load.loadData("cossin", "data/gameConstants.lua")

function Timeline.new(stuff, events)
    local stuffById = {}
    for _, thing in pairs(stuff) do
        stuffById[thing.id] = thing
    end
    return setmetatable({
        stuff = stuff,
        stuffById = stuffById,
        events = {},
        eventFrameOffset = 0,
        frame = 0
    }, Timeline)
end

function Timeline:queue(events)
    local offset = self.eventFrameOffset
    for _, origEvent in ipairs(events) do
        local event
        if offset > 0 or not origEvent.frame then
            event = table.clone(origEvent)
        else
            event = origEvent
        end
        if event.frameOffset then
            self.eventFrameOffset = self.eventFrameOffset + event.frameOffset
        end
        event.frame = (event.frame or self.eventFrameOffset) + offset
        self.eventFrameOffset = math.max(self.eventFrameOffset, event.frame + (event.duration or 0))
        table.insert(self.events, event)
    end
end

function Timeline:load()
    local texturesToFind = { "Lettres" }
    local soundsToFind = { }
    for _, thing in pairs(self.stuff) do
        table.insert(texturesToFind, thing.name)
        thing.alpha = thing.initialAlpha or 1
        thing.scale = {
            x = thing.initialScale and thing.initialScale.x or 1,
            y = thing.initialScale and thing.initialScale.y or 1
        }
        thing.offset = {
            x = thing.initialOffset and thing.initialOffset.x or 0,
            y = thing.initialOffset and thing.initialOffset.y or 0,
            z = thing.initialOffset and thing.initialOffset.z or 0
        }
        thing.after = {
            scale = {
                x = 1,
                y = 1
            },
            offset = {
                x = 0,
                y = 0,
                z = 0
            }
        }
        thing.last = { x = 0, y = 0 }
    end
    for _, event in pairs(self.events) do
        if event[1] == "sound" and not table.index(soundsToFind, event.name) then
            table.insert(soundsToFind, event.name)
        end
        if event[1] == "image" and not table.index(texturesToFind, event.name) then
            table.insert(texturesToFind, event.name)
        end
    end
    load.crawlFor({
        textures = texturesToFind,
        sounds = soundsToFind
    })

    for _, thing in ipairs(self.stuff) do
        thing.texture = textures[thing.name]
    end
    Timeline.letters.texture = textures.Lettres

    for i = 0, 26 do
        local letterCar = i == 26 and "'" or string.char(string.byte("A") + i)
        local letterQuad = love.graphics.newQuad(
            i * Timeline.letters.size.x, 0,
            Timeline.letters.size.x, Timeline.letters.size.y,
            Timeline.letters.texture)
        Timeline.letters.quads[letterCar] = letterQuad
    end

    for _, thing in pairs(self.stuff) do
        if thing.createCanvas then
            thing.canvas = love.graphics.newCanvas(thing.texture:getDimensions())
            thing.origTexture = thing.texture
            thing.texture = thing.canvas

            love.graphics.push("all")
            love.graphics.setCanvas(thing.canvas)
            love.graphics.clear(1, 1, 1, 0)
            love.graphics.draw(thing.origTexture)
            love.graphics.pop()
        end
    end
end

function Timeline:update(dt)
    for _, event in ipairs(self.events) do
        local thing = event.id and self.stuffById[event.id]
        if self.frame >= event.frame and
            event[1] == "oscillate" and
            (not event.duration or (self.frame <= event.frame + event.duration))
        then
            local part = (event.frame - self.frame) / (event.period or 60)
            local ratio = (1 - math.cos(part * 2 * math.pi)) / 2
            if event.scale then
                thing.after.scale.x = math.larp(event.scale.from.x, event.scale.to.x, ratio)
                thing.after.scale.y = math.larp(event.scale.from.y, event.scale.to.y, ratio)
            end
            if event.offset then
                thing.after.offset.x = math.larp(event.offset.from.x, event.offset.to.x, ratio)
                thing.after.offset.y = math.larp(event.offset.from.y, event.offset.to.y, ratio)
                if event.offset.from.z then
                    thing.after.offset.z = math.larp(event.offset.from.z, event.offset.to.z, ratio)
                end
            end
        elseif not event.duration then
            if self.frame == event.frame then
                if event[1] == "sound" then
                    Sound:start(event)
                elseif event[1] == "sound:stop" then
                    Sound:stop(event)
                elseif event[1] == "music" then
                    Music:play(event.name)
                elseif event[1] == "musicFilter" then
                    if Music.current then
                        Music.current:setFilter(event.filter)
                    end
                elseif event[1] == "state" then
                    StateMachine:change(event.state, event.params, event.opts)
                elseif event[1] == "print" then
                    local target = self.stuffById[event.target]
                    love.graphics.push("all")
                    love.graphics.setCanvas({ target.canvas, stencil = true })
                    love.graphics.draw(
                        Timeline.letters.texture,
                        Timeline.letters.quads[event.letter],
                        thing.offset.x - Timeline.letters.size.x / 2,
                        thing.offset.y - Timeline.letters.size.y / 2)
                    love.graphics.pop()
                elseif event[1] == "image" then
                    thing.texture = textures[event.name]
                end
            end
        elseif self.frame >= event.frame and self.frame <= event.frame + event.duration then
            local remaining = event.frame + (event.duration or 0) - self.frame
            if event[1] == "scale" then
                thing.scale.x = math.interp(remaining, thing.scale.x, event.to.x, event.duration)
                thing.scale.y = math.interp(remaining, thing.scale.y, event.to.y, event.duration)
            elseif event[1] == "offset" then
                thing.offset.x = math.interp(remaining, thing.offset.x, event.to.x, event.duration)
                thing.offset.y = math.interp(remaining, thing.offset.y, event.to.y, event.duration)
                if event.to.z then
                    thing.offset.z = math.interp(remaining, thing.offset.z, event.to.z, event.duration)
                end
            elseif event[1] == "alpha" then
                thing.alpha = math.interp(remaining, thing.alpha, event.to, event.duration)
            elseif event[1] == "trace" then
                local target = self.stuffById[event.target]
                love.graphics.push("all")
                love.graphics.setColor(event.color)
                love.graphics.setCanvas({ target.canvas, stencil = true })
                love.graphics.setLineWidth(event.size)
                love.graphics.line(thing.last.x, thing.last.y, thing.offset.x, thing.offset.y)
                love.graphics.circle("fill", thing.offset.x, thing.offset.y, event.size / 2)
                love.graphics.pop()
            elseif event[1] == "image" then
                thing.texture = textures[event.name]
            end
        end
    end

    for _, thing in ipairs(self.stuff) do
        thing.last.x = thing.offset.x
        thing.last.y = thing.offset.y
    end

    self.frame = self.frame + 1
end

function Timeline:getPos(thing)
    local w, h = CURRES[1], CURRES[2]
    if thing.relativeTo then
        local relativeThing = self.stuffById[thing.relativeTo]
        local rttw, rtth = relativeThing.texture:getDimensions()
        local x, y = self:getPos(relativeThing)
        x = x - relativeThing.textureAnchor.x * rttw
        y = y - relativeThing.textureAnchor.y * rtth
        return
            x + thing.offset.x + thing.after.offset.x,
            y + thing.offset.y + thing.after.offset.y,
            thing.offset.z + thing.after.offset.z
    else
        local x, y = love.graphics.inverseTransformPoint(w * thing.screenAnchor.x, h * thing.screenAnchor.y)
        return
            x + thing.offset.x + thing.after.offset.x,
            y + thing.offset.y + thing.after.offset.y,
            thing.offset.z + thing.after.offset.z
    end
end

function Timeline:mask(thing)
    love.graphics.setStencilTest("greater", 0)
    love.graphics.stencil(
        function()
            love.graphics.setShader(MASK_SHADER)
            MASK_SHADER:send("size", { thing.texture:getDimensions() })
            self:draw(thing, true)
            love.graphics.setShader()
        end,
        "increment",
        1)
end

function Timeline:draw(thing, mask)
    local x, y, z = self:getPos(thing)
    local tw, th = thing.texture:getDimensions()
    love.graphics.draw(mask and thing.origTexture or thing.texture,
        x,
        y - z,
        0,
        thing.scale.x * thing.after.scale.x,
        thing.scale.y * thing.after.scale.y,
        thing.textureAnchor.x * tw,
        thing.textureAnchor.y * th)
end

function Timeline:render()
    local w, h = CURRES[1], CURRES[2]
    love.graphics.push()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(SCALE_TO_EXPECTED)

    for _, thing in pairs(self.stuff) do
        if thing.lens then
            self:mask(self.stuffById[thing.lens])
        end
        if thing.type == "shadow" then
            love.graphics.setBlendMode("multiply", "premultiplied")
        end
        love.graphics.setColor(1, 1, 1, thing.alpha)
        self:draw(thing)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setBlendMode("alpha")
        love.graphics.setStencilTest()
    end

    love.graphics.pop()
end

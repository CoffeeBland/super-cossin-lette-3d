MapIntro = {
    fadeout = 60,
    fadein = 60,
    fadeColor = { 1, 1, 1 }
}

local bgcol = { 0.729, 0.941, 0.839 }

local letters = {
    texture = nil,
    quads = {},
    size = { x = 70, y = 140 }
}
local errata = {
    linesPos = {
        { x = 590, y = 590, z = 0 },
        { x = 85, y = 765, z = 0 }
    },
    move = {
        { x = -30, y = -70 },
        { x = -10, y = 70 },
        { x = 10, y = -70 },
        { x = 30, y = 70 },
        { x = 0, y = 0 }
    }
}

local stuff = {
    {
        id = "letter",
        name = "Lettre_lettre",
        screenAnchor = { x = 0.5, y = 0.5 },
        textureAnchor = { x = 0.75, y = 0.5 },
        initialAlpha = 0
    },
    {
        id = "crayonOmbre",
        name = "Crayon_ombre",
        initialAlpha = 0,
        relativeTo = "crayon",
        textureAnchor = { x = 0.5, y = 0.5 },
        offset = { x = 460, y = 1430, z = 0 },
        type = "shadow",
        lens = "letter"
    },
    {
        id = "crayon",
        name = "Crayon",
        relativeTo = "letter",
        initialAlpha = 0,
        textureAnchor = { x = 0.6044, y = 1 },
        offset = { x = 0, y = 0, z = 960 }
    },
    {
        id = "blonde",
        name = "Lettre_blonde",
        screenAnchor = { x = 0.5, y = 1 },
        textureAnchor = { x = 0.25, y = 1 },
        initialScale = { x = 1.25, y = 1.25 },
        initialAlpha = 0
    },
    {
        id = "cloud1",
        name = "Lettre_nuage_1",
        screenAnchor = { x = 1, y = 1 },
        textureAnchor = { x = 1, y = 1 }
    },
    {
        id = "cloud2",
        name = "Lettre_nuage_2",
        screenAnchor = { x = 0, y = 1 },
        textureAnchor = { x = 0, y = 1 }
    },
    {
        id = "plustard",
        name = "PlusTard",
        screenAnchor = { x = 0.5, y = 0.5 },
        textureAnchor = { x = 0.5, y = 0.5 },
        initialScale = { x = 0.75, y = 0.75 },
        initialAlpha = 0
    }
}
local stuffById = {}
for _, thing in pairs(stuff) do
    stuffById[thing.id] = thing
end

local laterTimeline = {
    { "alpha",
        id = "cloud1",
        to = 0,
        frame = 0,
        duration = 1
    },
    { "alpha",
        id = "cloud2",
        to = 0,
        frame = 0,
        duration = 1
    },
    { "scale",
        id = "plustard",
        to = { x = 1, y = 1 },
        frame = 0,
        duration = 60,
    },
    { "alpha",
        id = "plustard",
        to = 1,
        frame = 0,
        duration = 60
    },
    { "sound",
        name = "PlusTard",
        frame = 15
    },
    { "alpha",
        id = "plustard",
        to = 0,
        frame = 120,
        duration = 60
    },
    { "scale",
        id = "plustard",
        to = { x = 1.25, y = 1.25 },
        frame = 120,
        duration = 60,
    },
}

local letterShowTimeline = {
    { "music",
        name = "MapIntro",
        frame = 0
    },
    { "alpha",
        id = "cloud1",
        to = 1,
        frame = 0,
        duration = 60
    },
    { "alpha",
        id = "cloud2",
        to = 1,
        frame = 0,
        duration = 60
    },
    { "scale",
        id = "blonde",
        to = { x = 1, y = 1 },
        frame = 0,
        duration = 60
    },
    { "alpha",
        id = "blonde",
        to = 1,
        frame = 0,
        duration = 60
    },
    { "offset",
        id = "blonde",
        to = { x = 240, y = 0 },
        frame = 0,
        duration = 60
    },
    { "offset",
        id = "letter",
        to = { x = -240, y = 0 },
        frame = 0,
        duration = 120
    },
    { "offset",
        id = "cloud1",
        to = { x = 320, y = 320 },
        frame = 0,
        duration = 60
    },
    { "offset",
        id = "cloud2",
        to = { x = -320, y = 320 },
        frame = 0,
        duration = 60
    },
    { "alpha",
        id = "letter",
        to = 1,
        frame = 60,
        duration = 60
    },
    { "sound",
        name = "MapIntro",
        frame = 75
    }
}

local letterHideTimeline = {
    { "alpha",
        id = "blonde",
        to = 0,
        frame = 0,
        duration = 60
    },
    { "scale",
        id = "blonde",
        to = { x = 0.9, y = 0.9 },
        frame = 0,
        duration = 60
    },
    { "state",
        frame = 60
    }
}

function MapIntro:getErrataTimeline(name)
    local timeline = {
        { "alpha",
            id = "crayon",
            to = 1,
            frame = 0,
            duration = 15
        },
        { "alpha",
            id = "crayonOmbre",
            to = 1,
            frame = 0,
            duration = 15
        },
        { "offset",
            id = "crayon",
            to = errata.linesPos[1],
            frame = 0,
            duration = 15
        },
        { "sound:stop",
            name = "MapIntro",
            frame = 45
        }
    }
    local frame = 11
    local offset = { x = errata.linesPos[1].x, y = errata.linesPos[1].y }
    local switchedLines = false
    local printed = 0
    for i = 1, #name do
        local letter = name:sub(i, i):upper()
        local letteri = string.byte(letter) - string.byte("A")
        table.insert(timeline,
            { "sound",
                name = "Crayon",
                frame = frame - 11,
                pitchRange = { 0.8, 1.2 },
                volumeRange = { 0.8, 1 }
            })
        for i, move in ipairs(errata.move) do
            table.insert(timeline,
                { "offset",
                    id = "crayon",
                    to = { x = offset.x + move.x, y = offset.y + move.y },
                    duration = 2,
                    frame = frame
                })
            if i > 1 then
                table.insert(timeline,
                    { "trace",
                        id = "crayon",
                        target = "letter",
                        size = 32,
                        color = { 0.9, 0.9, 1 },
                        frame = frame,
                        duration = 2
                    })
            end
            frame = frame + 2
        end
        printed = printed + 1
        offset.x = offset.x + letters.size.x
        if letteri >= 0 and letteri <= 25 or letter == "'" then
            frame = frame + 1
            table.insert(timeline,
                { "print",
                    id = "crayon",
                    target = "letter",
                    frame = frame,
                    letter = letter
                })
        elseif not switchedLines then
            local shouldSwitch = true
            for j = i + 1, 10 do
                local letter = name:sub(j, j):upper()
                local letteri = string.byte(letter) - string.byte("A")
                if not (letteri >= 0 and letteri <= 25 or letter == "'") then
                    shouldSwitch = false
                end
            end
            if shouldSwitch then
                for j = i + 1, 9 do
                    table.insert(timeline,
                        { "sound",
                            name = "Crayon",
                            frame = frame,
                            pitchRange = { 1.0, 1.5 },
                            volumeRange = { 0.8, 1 }
                        })
                    for i, move in ipairs(errata.move) do
                        table.insert(timeline,
                            { "offset",
                                id = "crayon",
                                to = { x = offset.x + move.x, y = offset.y + move.y },
                                duration = 2,
                                frame = frame
                            })
                        if i > 1 then
                            table.insert(timeline,
                                { "trace",
                                    id = "crayon",
                                    target = "letter",
                                    size = 32,
                                    color = { 0.9, 0.9, 1 },
                                    frame = frame,
                                    duration = 2
                                })
                        end
                        frame = frame + 2
                    end
                    offset.x = offset.x + letters.size.x
                end
                offset.x = errata.linesPos[2].x
                offset.y = errata.linesPos[2].y
                switchedLines = true
                printed = 0
                table.insert(timeline,
                    { "offset",
                        id = "crayon",
                        to = errata.linesPos[2],
                        duration = 5,
                        frame = frame
                    })
                    frame = frame + 5
            end
        end
    end
    for j = printed + 1, 6 do
        table.insert(timeline,
            { "sound",
                name = "Crayon",
                frame = frame,
                pitchRange = { 1.0, 1.5 },
                volumeRange = { 0.8, 1 }
            })
        for i, move in ipairs(errata.move) do
            table.insert(timeline,
                { "offset",
                    id = "crayon",
                    to = { x = offset.x + move.x, y = offset.y + move.y },
                    duration = 2,
                    frame = frame
                })
            if i > 1 then
                table.insert(timeline,
                    { "trace",
                        id = "crayon",
                        target = "letter",
                        size = 32,
                        color = { 0.9, 0.9, 1 },
                        frame = frame,
                        duration = 2
                    })
            end
            frame = frame + 2
        end
        offset.x = offset.x + letters.size.x
    end
    table.insert(timeline,
        { "sound:stop",
            name = "Crayon",
            frame = frame
        })
    table.insert(timeline,
        { "offset",
            id = "crayon",
            to = { x = offset.x + 120, y = 0, z = 960 },
            duration = 15,
            frame = frame
        })
    table.insert(timeline,
        { "alpha",
            id = "crayon",
            to = 0,
            duration = 15,
            frame = frame
        })
    table.insert(timeline,
        { "alpha",
            id = "crayonOmbre",
            to = 0,
            duration = 15,
            frame = frame
        })
    local mapNameSound = self:getMapNameSound(name)
    local dur = 0
    if load.loadAudioFile("audio/" .. mapNameSound .. ".ogg", mapNameSound) then
        table.insert(timeline,
            { "sound",
                name = mapNameSound,
                frame = frame
            })
        dur = sounds[mapNameSound]:getDuration("seconds")
    end
    table.insert(timeline,
        { "sound",
            name = "MapIntro",
            startSample = 82924,
            frame = frame + math.floor(dur * 60)
        })
    return timeline
end

function MapIntro:getMapNameSound(name)
    return name:gsub("[^A-Z]", "_")
end

function MapIntro:queueTimeline(timeline)
    local offset = self.timelineFrameOffset
    for _, origEvent in ipairs(timeline) do
        local event
        if offset > 0 then
            event = table.clone(origEvent)
            event.frame = event.frame + offset
        else
            event = origEvent
        end
        self.timelineFrameOffset = math.max(self.timelineFrameOffset, event.frame + (event.duration or 0))
        table.insert(self.timeline, event)
    end
end

function MapIntro:enter(params)
    local map = Map.load(params.map)
    self.timeline = {}
    self.timelineFrameOffset = 0

    if params.map ~= Game.constants.firstLevel then
        self:queueTimeline(laterTimeline)
        self.timelineFrameOffset = self.timelineFrameOffset - 30
    end
    self:queueTimeline(letterShowTimeline)

    if map._data.properties.name then
        local errataTimeline = self:getErrataTimeline(map._data.properties.name)
        self:queueTimeline(errataTimeline)
        self.timelineFrameOffset = self.timelineFrameOffset + 90
    else
        self.timelineFrameOffset = self.timelineFrameOffset + 225
    end

    self:queueTimeline(letterHideTimeline)

    local texturesToFind = { "Lettres" }
    local soundsToFind = { }
    for _, thing in pairs(stuff) do
        table.insert(texturesToFind, thing.name)
        thing.alpha = thing.initialAlpha or 1
        thing.scale = {
            x = thing.initialScale and thing.initialScale.x or 1,
            y = thing.initialScale and thing.initialScale.y or 1
        }
        thing.offset = {
            x = thing.offset and thing.offset.x or 0,
            y = thing.offset and thing.offset.y or 0,
            z = thing.offset and thing.offset.z or 0
        }
        thing.last = { x = 0, y = 0 }
    end
    for _, event in pairs(self.timeline) do
        if event[1] == "sound" and not table.index(soundsToFind, event.name) then
            table.insert(soundsToFind, event.name)
        end
    end
    load.crawlFor({
        textures = texturesToFind,
        sounds = soundsToFind
    })

    for _, thing in ipairs(stuff) do
        thing.texture = textures[thing.name]
    end

    letters.texture = textures.Lettres
    for i = 0, 26 do
        local letterCar = i == 26 and "'" or string.char(string.byte("A") + i)
        local letterQuad = love.graphics.newQuad(
            i * letters.size.x, 0,
            letters.size.x, letters.size.y,
            letters.texture)
        letters.quads[letterCar] = letterQuad
    end

    stuffById.letter.canvas = love.graphics.newCanvas(stuffById.letter.texture:getDimensions())
    stuffById.letter.origTexture = stuffById.letter.texture
    stuffById.letter.texture = stuffById.letter.canvas

    love.graphics.push("all")
    love.graphics.setCanvas(stuffById.letter.canvas)
    love.graphics.clear(1, 1, 1, 0)
    love.graphics.draw(stuffById.letter.origTexture)
    love.graphics.pop()

    self.frame = 0
    self.params = params
end

function MapIntro:exit()
    Sound:fadeout()
end

function MapIntro:update(dt)
    local w, h = CURRES[1], CURRES[2]
    if actions.escape or actions.action then
        Music:fadeout()
        StateMachine:change(Game, self.params)
    end

    for _, event in ipairs(self.timeline) do
        if not event.duration then
            if self.frame == event.frame then
                if event[1] == "sound" then
                    Sound:start(event)
                elseif event[1] == "sound:stop" then
                    Sound:stop(event)
                elseif event[1] == "music" then
                    Music:play(event.name)
                elseif event[1] == "state" then
                    StateMachine:change(Game, self.params)
                elseif event[1] == "print" then
                    local thing = event.id and stuffById[event.id]
                    local target = stuffById[event.target]
                    love.graphics.push("all")
                    love.graphics.setCanvas({ target.canvas, stencil = true })
                    love.graphics.draw(
                        letters.texture,
                        letters.quads[event.letter],
                        thing.offset.x - letters.size.x / 2,
                        thing.offset.y - letters.size.y / 2)
                    love.graphics.pop()
                end
            end
        elseif self.frame >= event.frame and self.frame <= event.frame + event.duration then
            local remaining = event.frame + (event.duration or 0) - self.frame
            local thing = event.id and stuffById[event.id]
            if event[1] == "scale" then
                thing.scale.x = math.interp(remaining, thing.scale.x, event.to.x)
                thing.scale.y = math.interp(remaining, thing.scale.y, event.to.y)
            elseif event[1] == "offset" then
                thing.offset.x = math.interp(remaining, thing.offset.x, event.to.x)
                thing.offset.y = math.interp(remaining, thing.offset.y, event.to.y)
                if event.to.z then
                    thing.offset.z = math.interp(remaining, thing.offset.z, event.to.z)
                end
            elseif event[1] == "alpha" then
                thing.alpha = math.interp(remaining, thing.alpha, event.to)
            elseif event[1] == "trace" then
                local target = stuffById[event.target]
                love.graphics.push("all")
                love.graphics.setColor(event.color)
                love.graphics.setCanvas({ target.canvas, stencil = true })
                love.graphics.setLineWidth(event.size)
                love.graphics.line(thing.last.x, thing.last.y, thing.offset.x, thing.offset.y)
                love.graphics.circle("fill", thing.offset.x, thing.offset.y, event.size / 2)
                love.graphics.pop()
            end
        end
    end

    for _, thing in ipairs(stuff) do
        thing.last.x = thing.offset.x
        thing.last.y = thing.offset.y
    end

    self.frame = self.frame + 1
end

function MapIntro:getPos(thing)
    local w, h = CURRES[1], CURRES[2]
    local tw, th = thing.texture:getWidth(), thing.texture:getHeight()
    if thing.relativeTo then
        local relativeThing = stuffById[thing.relativeTo]
        local rttw, rtth = relativeThing.texture:getDimensions()
        local x, y = self:getPos(relativeThing)
        x = x - relativeThing.textureAnchor.x * rttw
        y = y - relativeThing.textureAnchor.y * rtth
        return
            x + thing.offset.x,
            y + thing.offset.y,
            thing.offset.z
    else
        local x, y = love.graphics.inverseTransformPoint(w * thing.screenAnchor.x, h * thing.screenAnchor.y)
        return
            x + thing.offset.x,
            y + thing.offset.y,
            thing.offset.z
    end
end

function MapIntro:mask(thing)
    love.graphics.setStencilTest("greater", 0)
    love.graphics.stencil(
        function()
            love.graphics.setShader(MASK_SHADER)
            self:draw(thing, true)
            love.graphics.setShader()
        end,
        "increment",
        1)
end

function MapIntro:draw(thing, mask)
    local x, y, z = self:getPos(thing)
    local tw, th = thing.texture:getDimensions()
    love.graphics.draw(mask and thing.origTexture or thing.texture,
        x,
        y - z,
        0,
        thing.scale.x,
        thing.scale.y,
        thing.textureAnchor.x * tw,
        thing.textureAnchor.y * th)
end

function MapIntro:render()
    local w, h = CURRES[1], CURRES[2]
    love.graphics.push()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(SCALE_TO_EXPECTED)
    love.graphics.clear(unpack(bgcol))

    for _, thing in pairs(stuff) do
        if thing.lens then
            self:mask(stuffById[thing.lens])
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

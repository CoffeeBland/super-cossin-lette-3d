MapIntro = {
    fadeout = 60,
    fadein = 60,
    fadeColor = { 1, 1, 1 }
}

local bgcol = { 0.729, 0.941, 0.839 }

local stuff = {
    {
        id = "letter",
        name = "Lettre_lettre",
        screenAnchor = { x = 0.5, y = 0.5 },
        textureAnchor = { x = -0.25, y = 0 },
        initialAlpha = 0
    },
    {
        id = "blonde",
        name = "Lettre_blonde",
        screenAnchor = { x = 0.5, y = 1 },
        textureAnchor = { x = 0.25, y = 0 },
        initialScale = { x = 1.25, y = 1.25 },
        initialAlpha = 0
    },
    {
        id = "cloud1",
        name = "Lettre_nuage_1",
        screenAnchor = { x = 1, y = 1 }
    },
    {
        id = "cloud2",
        name = "Lettre_nuage_2",
        screenAnchor = { x = 0, y = 1 }
    },
    {
        id = "plustard",
        name = "PlusTard",
        screenAnchor = { x = 0.5, y = 0.5 },
        textureAnchor = { 0.5, 0.5 },
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

local errataTimline = {
    { "disabed",
        id = "pen",
        to = false,
        frame = 0,
    },
    { "pen",
        disabled = false,
        relativeTo = "letter",
        pos = { x = 960, y = 576, z = 200 },
        frame = 0,
        duration = 0
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
    self.timeline = {}
    self.timelineFrameOffset = 0

    if params.map ~= Game.constants.firstLevel then
        self:queueTimeline(laterTimeline)
        self.timelineFrameOffset = self.timelineFrameOffset - 30
    end
    self:queueTimeline(letterShowTimeline)
    self.timelineFrameOffset = self.timelineFrameOffset + 225
    self:queueTimeline(letterHideTimeline)

    local texturesToFind = {}
    local soundsToFind = {}
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
    end
    for _, event in pairs(self.timeline) do
        if event[1] == "sound" then
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
    if actions.escape or actions.action then
        Music:fadeout()
        StateMachine:change(Game, self.params)
    end

    for _, event in ipairs(self.timeline) do
        if not event.duration then
            if self.frame == event.frame then
                if event[1] == "sound" then
                    Sound:start(event)
                elseif event[1] == "music" then
                    Music:play(event.name)
                elseif event[1] == "state" then
                    StateMachine:change(Game, self.params)
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
            elseif event[1] == "alpha" then
                thing.alpha = math.interp(remaining, thing.alpha, event.to)
            end
        end
    end

    self.frame = self.frame + 1
end

function MapIntro:render()
    local w, h = CURRES[1], CURRES[2]
    love.graphics.push()
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(SCALE_TO_EXPECTED)
    love.graphics.clear(unpack(bgcol))

    for _, thing in pairs(stuff) do
        local x, y = love.graphics.inverseTransformPoint(w * thing.screenAnchor.x, h * thing.screenAnchor.y)
        local tw, th = thing.texture:getWidth(), thing.texture:getHeight()
        love.graphics.setColor(1, 1, 1, thing.alpha)
        love.graphics.draw(thing.texture,
            x + ((thing.textureAnchor or EMPTY).x or 0) * tw + thing.offset.x,
            y + ((thing.textureAnchor or EMPTY).y or 0) * th + thing.offset.y,
            0,
            thing.scale.x,
            thing.scale.y,
            tw * thing.screenAnchor.x,
            th * thing.screenAnchor.y)
        love.graphics.setColor(1, 1, 1, 1)
    end

    love.graphics.pop()
end

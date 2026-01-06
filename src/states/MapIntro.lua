require "src.Timeline"

MapIntro = {
    fadeout = 60,
    fadein = 60,
    fadeColor = { 1, 1, 1 }
}

local bgcol = { 0.729, 0.941, 0.839 }

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
        initialAlpha = 0,
        createCanvas = true
    },
    {
        id = "crayonOmbre",
        name = "Crayon_ombre",
        initialAlpha = 0,
        relativeTo = "crayon",
        textureAnchor = { x = 0.5, y = 0.5 },
        initialOffset = { x = 460, y = 1430, z = 0 },
        type = "shadow",
        lens = "letter"
    },
    {
        id = "crayon",
        name = "Crayon",
        relativeTo = "letter",
        initialAlpha = 0,
        textureAnchor = { x = 0.6044, y = 1 },
        initialOffset = { x = 0, y = 0, z = 960 }
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
    { "oscillate",
        id = "plustard",
        offset = {
            from = { x = 0, y = 0 },
            to = { x  = 0, y = 0 }
        },
        scale = {
            from = { x = 0.99, y = 0.99 },
            to = { x = 1.01, y = 1.01 },
        },
        frame = 0,
        duration = 180,
        period = 121
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
    { "musicFilter",
        filter = Game.constants.music.filters.speech,
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
    { "oscillate",
        id = "cloud1",
        scale = {
            from = { x = 0.99, y = 0.99 },
            to = { x = 1.01, y = 1.01 },
        },
        frame = 0,
        period = 341
    },
    { "oscillate",
        id = "cloud2",
        scale = {
            from = { x = 0.99, y = 0.99 },
            to = { x = 1.01, y = 1.01 },
        },
        frame = 0,
        period = 343
    },
    { "oscillate",
        id = "blonde",
        offset = {
            from = { x = 100, y = 0 },
            to = { x = -100, y = 0 }
        },
        frame = 0,
        period = 4000
    },
    { "oscillate",
        id = "letter",
        offset = {
            from = { x = 50, y = 0 },
            to = { x = -50, y = 0 }
        },
        frame = 0,
        period = 4000
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
    local writeDur = 1
    local switchDur = 5
    for i = 1, #name do
        local letter = name:sub(i, i):upper()
        local letteri = string.byte(letter) - string.byte("A")
        table.insert(timeline,
            { "sound",
                name = "Crayon",
                frame = frame - 11,
                pitchRange = { 0.8, 1.2 },
                volumeRange = { 0.3, 0.4 }
            })
        for i, move in ipairs(errata.move) do
            table.insert(timeline,
                { "offset",
                    id = "crayon",
                    to = { x = offset.x + move.x, y = offset.y + move.y },
                    duration = writeDur,
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
                        duration = writeDur
                    })
            end
            frame = frame + writeDur
        end
        printed = printed + 1
        offset.x = offset.x + Timeline.letters.size.x
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
                local letteri = string.byte(letter) and (string.byte(letter) - string.byte("A"))
                if not (letteri and letteri >= 0 and letteri <= 25 or letter == "'") then
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
                            volumeRange = { 0.3, 0.4 }
                        })
                    for i, move in ipairs(errata.move) do
                        table.insert(timeline,
                            { "offset",
                                id = "crayon",
                                to = { x = offset.x + move.x, y = offset.y + move.y },
                                duration = writeDur,
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
                                    duration = writeDur
                                })
                        end
                        frame = frame + writeDur
                    end
                    offset.x = offset.x + Timeline.letters.size.x
                end
                offset.x = errata.linesPos[2].x
                offset.y = errata.linesPos[2].y
                switchedLines = true
                printed = 0
                table.insert(timeline,
                    { "offset",
                        id = "crayon",
                        to = errata.linesPos[2],
                        duration = switchDur,
                        frame = frame
                    })
                    frame = frame + switchDur
            end
        end
    end
    for j = printed + 1, 6 do
        table.insert(timeline,
            { "sound",
                name = "Crayon",
                frame = frame,
                pitchRange = { 1.0, 1.5 },
                volumeRange = { 0.3, 0.4 }
            })
        for i, move in ipairs(errata.move) do
            table.insert(timeline,
                { "offset",
                    id = "crayon",
                    to = { x = offset.x + move.x, y = offset.y + move.y },
                    duration = writeDur,
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
                        duration = writeDur
                    })
            end
            frame = frame + writeDur
        end
        offset.x = offset.x + Timeline.letters.size.x
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
    frame = 60
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

function MapIntro:enter(params)
    local mapName = params.nextMap or params.map
    local map = Map.load(mapName)
    self.timeline = Timeline.new(stuff)

    if mapName ~= Game.constants.firstLevel then
        self.timeline:queue(laterTimeline)
        self.timeline.eventFrameOffset = self.timeline.eventFrameOffset - 30
    end
    self.timeline:queue(letterShowTimeline)

    if map and map._data.properties.name then
        local errataTimeline = self:getErrataTimeline(map._data.properties.name)
        self.timeline:queue(errataTimeline)
        self.timeline.eventFrameOffset = self.timeline.eventFrameOffset + 90
    else
        self.timeline.eventFrameOffset = self.timeline.eventFrameOffset + 225
    end

    self.timeline:queue(letterHideTimeline)
    self.timeline:queue({
        { "state",
            frame = 0,
            state = Game,
            params = params
        }
    })
    self.timeline:load()

    self.params = params
end

function MapIntro:exit()
    Sound:fadeout()
end

function MapIntro:update(dt)
    if actions.start or
        actions.back or
        actions.action then
        Music:fadeout()
        StateMachine:change(Game, self.params)
    end

    self.timeline:update(dt)
end

function MapIntro:render()
    love.graphics.clear(bgcol)
    self.timeline:render()
end

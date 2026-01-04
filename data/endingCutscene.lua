return {
    state = Ending,
    stuff = {
        {
            id = "cossin",
            name = "Fin_cossin-3",
            screenAnchor = { x = 0, y = 1 },
            textureAnchor = { x = 0, y = 1 }
        },
        {
            id = "blonde",
            name = "Fin_blonde",
            screenAnchor = { x = 0, y = 1 },
            textureAnchor = { x = 0, y = 1 },
            initialOffset = { x = -400, y = -900 }
        },
        {
            id = "coeur",
            name = "Fin_coeur",
            screenAnchor = { x = 0, y = 1 },
            textureAnchor = { x = 0.5, y = 0.5 },
            initialOffset = { x = 835, y = -1520 },
            initialScale = { x = 0, y = 0 },
            initialAlpha = 0
        }
    },
    events = {
        { "music",
            name = "Ending"
        },
        { "image",
            id = "cossin",
            name = "Fin_cossin-2",
            duration = 15,
            frame = 30
        },
        { "image",
            id = "cossin",
            name = "Fin_cossin-1",
            duration = 15
        },
        { "offset",
            id = "blonde",
            to = { x = -200, y = 0 },
            frameOffset = 30,
            duration = 90
        },
        { "image",
            id = "cossin",
            name = "Fin_cossin-2",
            duration = 15,
            frameOffset = -45
        },
        { "image",
            id = "cossin",
            name = "Fin_cossin-3",
            duration = 15
        },
        { "image",
            id = "cossin",
            name = "Fin_cossin-4",
            duration = 15
        },
        { "sound",
            name = "Kiss"
        },
        { "offset",
            id = "blonde",
            to = { x = -180, y = -40 },
            duration = 15
        },
        { "alpha",
            id = "coeur",
            to = 1,
            duration = 30,
            frameOffset = -15
        },
        { "scale",
            id = "coeur",
            to = { x = 0.26, y = 0.26 },
            duration = 30,
            frameOffset = -30
        },
        { "scale",
            id = "coeur",
            to = { x = 0.24, y = 0.24 },
            duration = 5,
        },
        { "sound",
            name = "Heartbeat"
        },
        { "image",
            id = "cossin",
            name = "Fin_cossin-5",
            duration = 15,
            frameOffset = -30
        },
        { "image",
            id = "cossin",
            name = "Fin_cossin-6",
            duration = 15
        },
        { "image",
            id = "cossin",
            name = "Fin_cossin-7",
            duration = 15
        },
        { "offset",
            id = "blonde",
            to = { x = 400, y = -800 },
            duration = 120
        },
        { "sound",
            name = "Slide",
            volume = 0.5,
            frameOffset = -70
        },
        { "scale",
            id = "coeur",
            to = { x = 5, y = 5 },
            duration = 120,
            frameOffset = 10
        }
    },
    creditsScrollSpeed = -340,
    totalFinFrames = 200
}

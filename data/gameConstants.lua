return {
    g = 150 * METER_SCALE,
    particleCount = 100,
    airFriction = 0.25, -- Per second
    groundDamping = 8,
    slidingDamping = 1,
    airDamping = 1,
    jumpMultiplier = 30,
    speedMultiplier = 20,
    bgColor = { 0.4, 0.65, 0.4 }, -- Jessi a pâlie la couleur de BG
    shadowColor = { 0.875, 0.867, 0.941, 1 },
    lightColor = { 0.875, 0.867, 0.741, 1 },
    autoWalkCutoffFrames = 600,
    autoWalkJumpFrames = 60,
    autoWalkCutoffDistance2 = 100,
    defaultLight = {
        angle = 0.4 * math.pi,
        radiusw = 180,
        radiush = 90,
        alpha = 0.2
    },
    bubble = {
        segment = { w = 32, h = 92 },
        lingerFrames = 60,
        guedille = { tile = { 0, 0 }, offset = { x = 16, y = 60 } },
        padding = 48,
        bg = {
            left = { tile = { 1, 0 } },
            right = { tile = { 5, 0 } },
            segments = { tiles = { { 2, 0 }, { 3, 0 }, { 4, 0 } } }
        }
    },
    musicLoops = {
        Title = { loopStart = 55150, loopEnd = 772810 }
    },
    lens = {
        textureStepSize = 8,
        textureSteps = 10,
        textureStepAlpha = 0.2
    },
    icons = {
        size = { w = 64, h = 64 },
        list = {
            "!", 32,
            "blonde", 50,
            "picnic", 62,
            "<3", 52,
            "mange", 50,
            "?", 44,
            ".", 28,
            "0", 36,
            "1", 36,
            "2", 36,
            "3", 36,
            "4", 36,
            "5", 36,
            "6", 36,
            "7", 36,
            "8", 36,
            "9", 36,
            "fruit", 48,
            "argh", 48,
            ")", 28,
            ":", 28,
            "^", 28,
            "(", 28,
            "time3/4", 48,
            "time2/4", 48,
            "time1/4", 48,
            "time4/4", 48,
        }
    },
    timeWarnings = {
        { time = 0.75, text = { 20, "time3/4" } },
        { time = 0.5, text = { 20, "time2/4" } },
        { time = 0.25, text = { 20, "time1/4" } },
    },
    defaultLevelTimer = 60,
    firstLevel = "Niveau1",
    startLevelCutscene = {
        { "anim",
            entity = { byName = "cossin" },
            name = "lookUp",
            value = true
        },
        { "if", "==", "[vars.currentMap]", "[vars.firstLevel]" },
        { "camera",
            entity = { byName = "picnic" },
            zoom = 3
        },
        { "camera",
            zoom = 1,
            zoomFrames = 15
        },
        { "waitForZoom" },
        { "sound",
            name = "Ohho"
        },
        { "waitFrames", 45 },
        { "camera",
            entity = { byName = "cossin" },
            panFrames = 60
        },
        { "waitForPan" },
        { "else" },
        { "camera",
            entity = { byName = "cossin" },
            zoom = 3
        },
        { "camera",
            zoom = 1,
            zoomFrames = 15
        },
        { "waitForZoom" },
        { "end" },
        { "waitFrames", 15 },
        { "bubble",
            entity = { byName = "cossin" },
            text = { 10, "fruit", 5, "[vars.targetFruits]" },
        },
        { "waitForBubble",
            entity = { byName = "cossin" }
        },
        { "bubble",
            entity = { byName = "cossin" },
            text = { 10, "time4/4", 5, "[vars.timer]" }
        },
        { "waitForBubble",
            entity = { byName = "cossin" }
        },
        { "anim",
            entity = { byName = "cossin" },
            name = "lookUp",
            value = false
        },
        { "sound",
            name = "Go"
        },
        { "image",
            id = "Go1",
            name = "VasY",
            offset = { x = 0, y = -120 },
            color = { 1, 1, 1, 0 },
            scale = { x = 0.9, y = 0.9 }
        },
        { "larp",
            image = { byId = "Go1" },
            ["color[4]"] = { to = 1, frames = 15 },
            ["scale.x"] = { to = 1, frames = 15 },
            ["scale.y"] = { to = 1, frames = 15 }
        },
        { "waitFrames", 15 },
        { "image",
            id = "Go2",
            name = "TitleCossin",
            offset = { x = -300, y = 110 },
            color = { 1, 1, 1, 0 },
            scale = { x = 0.45, y = 0.45 }
        },
        { "larp",
            image = { byId = "Go2" },
            ["color[4]"] = { to = 1, frames = 15 },
            ["scale.x"] = { to = 0.5, frames = 15 },
            ["scale.y"] = { to = 0.5, frames = 15 }
        },
        { "waitFrames", 5 },
        { "image",
            id = "Go3",
            name = "TitleLette",
            offset = { x = 300, y = 110 },
            color = { 1, 1, 1, 0 },
            scale = { x = 0.45, y = 0.45 }
        },
        { "larp",
            image = { byId = "Go3" },
            ["color[4]"] = { to = 1, frames = 15 },
            ["scale.x"] = { to = 0.5, frames = 15 },
            ["scale.y"] = { to = 0.5, frames = 15 }
        },
        { "waitFrames", 30 },
        { "timer", "[vars.timer]" },
        { "input",
            entity = { byName = "cossin" }
        },
        { "move",
            entity = { byName = "cossin" },
            { "jump", jumpSpeed = 100 }
        },
        { "larp",
            image = { byId = "Go1" },
            ["color[4]"] = { to = 0, frames = 15 },
            ["scale.x"] = { to = 1.2, frames = 15 },
            ["scale.y"] = { to = 1.2, frames = 15 }
        },
        { "larp",
            image = { byId = "Go2" },
            ["color[4]"] = { to = 0, frames = 15 },
            ["scale.x"] = { to = 0.6, frames = 15 },
            ["scale.y"] = { to = 0.6, frames = 15 }
        },
        { "larp",
            image = { byId = "Go3" },
            ["color[4]"] = { to = 0, frames = 15 },
            ["scale.x"] = { to = 0.6, frames = 15 },
            ["scale.y"] = { to = 0.6, frames = 15 }
        },
        { "waitFrames", 15 },
        { "image",
            id = "Go1",
            name = nil
        },
        { "image",
            id = "Go2",
            name = nil
        },
        { "image",
            id = "Go3",
            name = nil
        }
    },
    endLevelCutscene = {
        { "input",
            entity = nil
        },
        { "move",
            entity = { byName = "cossin" },
            { "lookAt", point = { byName = "picnic" } },
            { "jump", jumpSpeed = 100 }
        },
        { "bubble",
            entity = { byName = "cossin" },
            text = { 20, "!", 10, "!", 10, "!" }
        },
        { "waitForMove",
            entity = { byName = "cossin" }
        },
        { "waitForBubble",
            entity = { byName = "cossin" }
        },
        { "move",
            entity = { byName = "cossin" },
            { "walkTo", point = { byName = "picnic", offset = { x = -380, y = 170 } } },
            { "lookAt", point = { byName = "picnic" } },
        },
        { "camera",
            entity = { byName = "picnic" },
            panFrames = 60
        },
        { "waitForPan" },
        { "components",
            entity = { byName = "blonde" },
            disabled = false,
            light = { alpha = 0 },
            color = { 1, 1, 1, 0 },
        },
        { "larp",
            entity = { byName = "blonde" },
            ["light.alpha"] = { to = 0.3, frames = 60 },
            ["color[4]"] = { to = 1, delay = 30, frames = 60 },
            ["sprites[1].anchor.x"] = { startOffset = -150, toOffset = 0, delay = 30, frames = 120 },
            ["particleEmitter.always.offsetRange.x[1]"] = { startOffset = 200, toOffset = 0, delay = 30, frames = 120 },
            ["pos.z"] = { from = 400, to = 0, delay = 30, frames = 120 }
        },
        { "waitForMove",
            entity = { byName = "cossin" }
        },
        { "move",
            entity = { byName = "cossin" },
            { "waitFrames", 45 },
            { "lookAt", point = { byName = "blonde" } },
        },
        { "waitForLarp",
            entity = { byName = "blonde" }
        },
        { "larp",
            entity = { byName = "blonde" },
            ["light.alpha"] = { to = 0, frames = 60 }
        },
        { "bubble",
            entity = { byName = "blonde" },
            text = { 20, "picnic", 10, "<3" }
        },
        { "waitForLarp",
            entity = { byName = "blonde" }
        },
        { "waitForBubble",
            entity = { byName = "blonde" }
        },
        { "bubble",
            entity = { byName = "blonde" },
            text = { 10, "mange", 10, "?" }
        },
        { "waitForBubble",
            entity = { byName = "blonde" }
        },
        { "move",
            entity = { byName = "cossin" },
            { "walkTo", point = { byName = "picnic", offset = { x = -400, y = 180 } } },
        },
        { "bubble",
            entity = { byName = "cossin" },
            text = { 10, ".", 10, ".", 10, "." }
        },
        { "waitForBubble",
            entity = { byName = "cossin" }
        },
        { "waitForMove",
            entity = { byName = "cossin" }
        },
        { "move",
            entity = { byName = "cossin" },
            { "lookAt", point = { byName = "blonde" } },
        },
        { "bubble",
            entity = { byName = "cossin" },
            text = { 10, "[vars.eaten]" }
        },
        { "waitForBubble",
            entity = { byName = "cossin" }
        },
        { "if", ">=", "[vars.eaten]", 5 },
        { "bubble",
            entity = { byName = "blonde" },
            text = { 10, ".", 10, ".", 30, ".", 10, "argh" }
        },
        { "waitForBubble",
            entity = { byName = "blonde" }
        },
        { "end" },
        { "bubble",
            entity = { byName = "blonde" },
            text = { 10, "picnic", 10, "fruit", 10, "?" }
        },
        { "waitForBubble",
            entity = { byName = "blonde" }
        },
        { "move",
            entity = { byName = "cossin" },
            { "jump", jumpSpeed = 100 }
        },
        { "bubble",
            entity = { byName = "cossin" },
            text = { 10, "[vars.picnicFruits]", 10, "!" }
        },
        { "waitForBubble",
            entity = { byName = "cossin" }
        },
        { "if", ">=", "[vars.picnicFruits]", "[vars.targetFruits]" },
        { "bubble",
            entity = { byName = "blonde" },
            text = { 10, ":", 10, "^", 30, ")" }
        },
        { "waitForBubble",
            entity = { byName = "blonde" }
        },
        { "components",
            entity = { byName = "blonde" },
            fruitStack = { picnicAction = "pickup" }
        },
        { "waitForVar", "==", "[vars.picnicFruits]", 0 },
        { "waitFrames", 30 },
        { "bubble",
            entity = { byName = "blonde" },
            text = { 10, "<3" }
        },
        { "waitForBubble",
            entity = { byName = "blonde" }
        },
        { "if", "[vars.nextMap]" },
        { "changeState",
            MapIntro,
            { map = "[vars.nextMap]" }
        },
        { "else" },
        { "changeState",
            Intro
        },
        { "end" },
        { "else" },
        { "bubble",
            entity = { byName = "blonde" },
            text = { 10, ":", 10, "^", 30, "(" }
        },
        { "waitForBubble",
            entity = { byName = "blonde" }
        },
        { "larp",
            entity = { byName = "blonde" },
            ["light.alpha"] = { to = 0.3, frames = 30 },
            ["color[4]"] = { to = 0, delay = 30, frames = 30 },
            ["sprites[1].anchor.x"] = { toOffset = -150, frames = 60 },
            ["particleEmitter.always.offsetRange.x[1]"] = { toOffset = 200, frames = 60 },
            ["pos.z"] = { to = 400, frames = 60 }
        },
        { "waitForLarp",
            entity = { byName = "blonde" }
        },
        { "larp",
            entity = { byName = "blonde" },
            ["light.alpha"] = { to = 0, frames = 30 }
        },
        { "waitForLarp",
            entity = { byName = "blonde" }
        },
        { "components",
            entity = { byName = "blonde" },
            disabled = true
        },
        { "waitFrames", 60 },
        { "changeState",
            Game,
            { map = "[vars.currentMap]" }
        },
        { "end" },
        { "waitForBubble",
            entity = { byName = "blonde" }
        },

        -- FOR TEST
        { "camera",
            entity = { byName = "cossin" }
        },
        { "input",
            entity = { byName = "cossin" }
        },
    }
}

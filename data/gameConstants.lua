return {
    g = 150 * METER_SCALE,
    airFriction = 0.25, -- Per second
    groundDamping = 8,
    slidingDamping = 1,
    airDamping = 1,
    jumpMultiplier = 30,
    speedMultiplier = 20,
    bubble = {
        offset = { x = 0, y = 20 },
        width = 110,
        lingerFrames = 30
    },
    icons = {
        size = { w = 64, h = 64 },
        list = {
            "!",
            "blonde",
            "picnic",
            "<3"
        }
    }
}

return {
    g = 150 * METER_SCALE,
    airFriction = 0.25, -- Per second
    groundDamping = 8,
    slidingDamping = 1,
    airDamping = 1,
    jumpMultiplier = 30,
    speedMultiplier = 20,
    shadowColor = { 0.875, 0.867, 0.941, 1 },
    lightColor = { 0.875, 0.867, 0.741, 1 },
    defaultLight = {
        angle = 0.4 * math.pi,
        radiusw = 140,
        radiush = 80,
        alpha = 0.2
    },
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

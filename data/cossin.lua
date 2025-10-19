return function()
    return {
        name = "cossin",
        actor = {
            walkSpeed = 150,
            slidingSpeed = 0,
            airSpeed = 25,
            jumpSpeed = 150
        },
        pos = { height = 148 },
        velocity = { z = 0 },
        body = { shape = "circle", size = 80, type = "dynamic" },
        anim = {},
        sprites = {
            {
                name = "cossinPiedBack",
                anchor = { x = 96, y = 236 }
            },
            {
                name = "cossinCorps",
                anchor = { x = 96, y = 236 },
                wiggle = { x = 1, y = 1 },
                autoheightBulge = 170
            },
            {
                name = "cossinPiedFront",
                anchor = { x = 96, y = 236 }
            }
        },
        shadow = {
            name = "cossinOmbre",
            anchor = { x = 96, y = 46 }
        },
        fruitStack = {
            fruits = {},
            eaten = {},
            pickupRange = 160,
            pickupForce = 0.7,
            pickupJumpSpeed = 140,
            pickupAnimFrames = 20,
            firstOffset = { x = 0, y = 0, z = 0 },
            otherOffset = { x = 0, y = 0, z = 0 },
            dropForce = 240,
            dropJumpSpeed = 60,
            dropCooldown = 60,
            eatCooldown = 600,
            halfEatIndicator = { 0, "mange" },
            eatWiggleAmplitude = 0.25,
            eatWiggleFrames = 30,
            sizePerFruit = 0.05,
            picnicAction = "drop"
        },
        water = {
            drownFrames = 60,
            respawnJumpSpeed = 100,
            samples = {
                { 0, 50, 5 },
                { 0, -50, 5 },
                { 50, 0, 5 },
                { -50, 0, 5 }
            }
        },
        bubble = {
            anchor = { x = -40, y = -260 }
        },
        larp = {},
        lens = { size = 480, size2 = 480^2 },
        shakeEmitter = {
            triggers = {
                land = {
                    minimumMass = 1.25,
                    amplitude = 10,
                    frames = 15
                },
                step = {
                    minimumMass = 1.5,
                    amplitude = 5,
                    frames = 10
                }
            }
        },
        particleEmitter = {
            triggers = {
                land = {
                    name = "Fumee",
                    inherit = { x = 0.25, y = 0.25, z = 0 },
                    offset = { x = 0, y = 0, z = 0 },
                    count = 6,
                    durationRange = { 15, 25 },
                    speed = 10,
                    angleRange = { 0, math.pi * 2 }
                },
                step = {
                    name = "Fumee",
                    inherit = { x = -0.25, y = -0.25, z = 0 },
                    offsetRange = { x = { -20, 20 }, y = { -20, 20 } },
                    offset = { x = 0, y = 0, z = 0, horizontal = -40 },
                    durationRange = { 15, 25 }
                },
                ["drown:start"] = {
                    name = "Fumee",
                    offset = { x = 0, y = 0, z = 0 },
                    offsetRange={ x = { -30, 30 }, y = { -20, 20 } },
                    count = 8,
                    durationRange = { 15, 25 },
                    speed = 10,
                    angleRange = { 0, math.pi * 2 }
                }
            },
            conditions = {
                drown = {
                    name = "Fumee",
                    inherit = { x = 0.25, y = 0.25, z = 0 },
                    offset = { x = 0, y = 0, z = 0 },
                    offsetRange={ x = { -30, 30 }, y = { -20, 20 } },
                    countRange = { 3, 4 },
                    durationRange = { 15, 25 },
                    speed = 10,
                    angleRange = { 0, math.pi * 2 },
                    cooldown = 10,
                    velocity={ z = 10 }
                }
            }
        },
        soundEmitter = {
            triggers = {
                ["eat:start"] = {
                    name = "Ooh"
                },
                -- throwFruit = {
                --     name = "Shoop"
                -- },
                eatFruit = {
                    name = "Gulp"
                },
                --["jump:start"] = {
                --    name = "Ooh",
                --    stopOn = "jump:stop"
                --},
                --["jump:stop"] = {
                --    name = "Poof"
                --},
                step = {
                    name = "Step",
                    volumeRange = { 0.3, 0.4 },
                    pitchRange = { 0.6, 0.8 }
                },
                speak = {
                    name = "Step",
                    volumeRange = { 0.8, 1 },
                    pitchRange = { 0.8, 1.2 }
                },
                ["squish:start"] = {
                    name = "Gnieh",
                    loop = true,
                    stopOn = "squish:stop"
                }
            }
        }
    }
end

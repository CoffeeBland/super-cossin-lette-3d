return function()
    return {
        name = "cossin",
        camera = {},
        actor = {
            playerId = 1,
            walkSpeed = Options.values.arcade and 475 or 150,
            slidingSpeed = Options.values.arcade and 475 or 0,
            airSpeed = Options.values.arcade and 475 or 25,
            jumpSpeed = 150
        },
        pos = { height = 148 },
        velocity = { z = 0 },
        body = { shape = "circle", size = 80, type = "dynamic" },
        anim = {},
        sprites = {
            {
                name = "cossinPiedBack",
                anchor = { x = 96, y = 236 },
                hueMult = 0
            },
            {
                name = "cossinCorps",
                anchor = { x = 96, y = 236 },
                wiggle = { x = 1, y = 1 },
                autoheightBulge = 170
            },
            {
                name = "cossinPiedFront",
                anchor = { x = 96, y = 236 },
                hueMult = 0
            }
        },
        shadow = {
            name = "cossinOmbre",
            anchor = { x = 96, y = 46 }
        },
        fruitStack = {
            fruits = {},
            eaten = {},
            pickupRange = 180,
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
            anchor = { x = -40, y = -112 }
        },
        larp = {},
        lens = { size = 640, size2 = 640^2 },
        shakeEmitter = {
            triggers = {
                land = {
                    minimumMass = 1.25,
                    amplitude = 15,
                    frames = 18
                },
                step = {
                    minimumMass = 1.5,
                    amplitude = 8,
                    frames = 12
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
                poof = {
                    name = "Fumee",
                    inherit = { x = 0.25, y = 0.25, z = 0 },
                    offset = { x = 0, y = 0 },
                    offsetRange = { z = { 20, 80 } },
                    count = 20,
                    durationRange = { 15, 25 },
                    speedRange = { 10, 30 },
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
                    name = "Splash",
                    offset = { x = 0, y = 0, z = 20 },
                    offsetRange = { x = { -40, 40 }, y = { -60, 20 } },
                    count = 6,
                    durationRange = { 30, 40 },
                    speed = 5,
                    angleRange = { 0, math.pi * 2 }
                }
            },
            conditions = {
                super = {
                    name = "Sparkle",
                    offsetRange = {
                        x = { -85, 85 },
                        y = { -85, 85 },
                        z = { 20, 160 },
                    },
                    duration = 60,
                    cooldown = 5
                }
            }
        },
        soundEmitter = {
            triggers = {
                ["eat:start"] = {
                    name = "Ooh",
                    mass = 0.5
                },
                eatFruit = {
                    name = "Gulp",
                    mass = 0.5
                },
                dropFruit = {
                    name = "Bonk",
                    pitchrange = { 0.8, 1.2 },
                    mass = 0.5
                },
                pickupFruit = {
                    name = "Phoomp",
                    pitchrange = { 0.8, 1.2 },
                    volume = 0.4,
                    mass = 0.5
                },
                ["jump:stop"] = {
                    name = "Step",
                    pitchRange = { 0.45, 0.55 },
                    volumeRange = { 0.6, 0.7 },
                    mass = 0.5
                },
                step = {
                    name = "Step",
                    volumeRange = { 0.3, 0.4 },
                    pitchRange = { 0.6, 0.8 },
                    mass = 0.5
                },
                speak = {
                    name = "Step",
                    volumeRange = { 0.8, 1 },
                    pitchRange = { 0.8, 1.2 },
                    mass = 0.5
                },
                ["squish:start"] = {
                    name = "Gnieh",
                    stopOn = "squish:stop",
                    mass = 0.5
                },
                ["drown:start"] = {
                    name = "Noyer",
                    loop = true,
                    mass = 0.5,
                    pitchRange = { 1.6, 1.8 },
                    startSample = "random",
                    stopOn = "drown:stop"
                },
                ["drown:stop"] = {
                    name = "Respawn"
                }
            },
            conditions = {
                drown = {
                    name = "Splash",
                    names = {
                        "Splash-1",
                        "Splash-2",
                        "Splash-3",
                        "Splash-4",
                        "Splash-5",
                        "Splash-6"
                    },
                    volume = 0.4,
                    pitchRange = { 1.0, 1.5 },
                    cooldown = 6
                }
            }
        }
    }
end

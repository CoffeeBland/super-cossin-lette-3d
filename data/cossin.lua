return function()
    return {
        name = "cossin",
        input = true,
        camera = true,
        actor = {
            walkSpeed = 150,
            slidingSpeed = 0,
            airSpeed = 25,
            jumpSpeed = 200
        },
        pos = { height = HEIGHT_SLICE },
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
                wiggle = { x = 1, y = 1 }
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
            firstOffset = { x = 0, y = 0, z = 150 },
            otherOffset = { x = 0, y = 0, z = 90 },
            dropForce = 240,
            dropJumpSpeed = 60,
            dropCooldown = 60,
            eatCooldown = 600,
            eatWiggleAmplitude = 0.25,
            eatWiggleFrames = 30,
            sizePerFruit = 0.05
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
            anchor = { x = -40, y = -220 }
        },
        larp = {},
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
        soundEmitter = {
            playing = {},
            triggers = {
                ["eat:start"] = {
                    name = "Ooh"
                },
                --throwFruit = {
                --    name = "Shoop"
                --},
                eatFruit = {
                    name = "Gulp"
                },
                ["jump:start"] = {
                    name = "Ooh",
                    stopOn = "jump:stop"
                },
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

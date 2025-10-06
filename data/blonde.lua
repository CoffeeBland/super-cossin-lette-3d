return function()
    return {
        disabled = true,
        name = "blonde",
        body = { shape = "circle", size = 80, type = "static" },
        sprites = {
            {
                name = "Blonde",
                anchor = { x = 160, y = 428 },
                wiggle = { x = 1, y = 1 }
            }
        },
        shadow = {
            name = "cossinOmbre",
            anchor = { x = 96, y = 46 }
        },
        bubble = {
            anchor = { x = -40, y = -500 }
        },
        anim = {},
        light = { alpha = 0 },
        larp = {},
        soundEmitter = {
            playing = {},
            triggers = {}
        },
        particleEmitter = {
            always = {
                name = "Sparkle",
                offsetRange = {
                    x = { -100, 150 },
                    y = { -0, 0 },
                    z = { 0, 450 }
                },
                duration = 60,
                cooldown = 5
            }
        },
        soundEmitter = {
            conditions = {
                light = {
                    name = "Angel",
                    loop = true,
                    minimumLight = 0.1,
                    fadeIn = 30,
                    fadeOut = 15
                }
            }
        },
        fruitStack = {
            fruits = {},
            eaten = {},
            pickupRange = 280,
            pickupForce = 0.7,
            pickupJumpSpeed = 160,
            pickupAnimFrames = 20,
            firstOffset = { x = 0, y = 0, z = 380 },
            otherOffset = { x = 0, y = 0, z = 90 },
            dropForce = 240,
            dropJumpSpeed = 60,
            dropCooldown = 60,
            eatCooldown = 18,
            eatWiggleAmplitude = 0.25,
            eatWiggleFrames = 30,
            sizePerFruit = 0,
        }
    }
end

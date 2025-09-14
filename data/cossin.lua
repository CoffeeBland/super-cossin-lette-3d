return function()
    return {
        input = true,
        camera = true,
        actor = { walkSpeed = 250, jumpSpeed = 225 },
        pos = { height = HEIGHT_SLICE },
        velocity = { z = 0 },
        body = { shape = "circle", size = 80, type = "dynamic" },
        anim = Anim.new(),
        sprites = {
            {
                name = "cossinPiedBack",
                anchor = { x = 96, y = 236 }
            },
            {
                name = "cossinCorps",
                anchor = { x = 96, y = 236 }
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
            pickupRange = 160,
            pickupForce = 0.7,
            pickupJumpSpeed = 140,
            pickupAnimFrames = 20,
            firstOffset = { x = 0, y = 0, z = 150 },
            otherOffset = { x = 0, y = 0, z = 90 },
            dropForce = 240,
            dropJumpSpeed = 60,
            dropCooldown = 60,
            eatCooldown = 600
        },
        water = {
            drownFrames = 60,
            respawnJumpSpeed = 100,
            samples = {
                { 0, 40, 10 },
                { 0, -40, 10 },
                { 40, 0, 10 },
                { -40, 0, 10 }
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

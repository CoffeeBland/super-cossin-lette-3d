return function(object, data, flipX, flipY)
    local radish = object and object.fruit == "radish"
    local golden = data and data.properties and data.properties.golden
    return {
        body = { shape = "circle", size = 70, type = "dynamic" },
        sprites = object and {
            {
                name = object.name,
                anchor = { x = object.offsetX, y = object.offsetY },
                flipX = flipX,
                flipY = flipY,
                hue = golden and 0.13 or nil
            }
        },
        pos = { height = 80 },
        fruit = {
            type = object and object.fruit,
            mass = golden and 0.25 or 0.05,
            value = golden and 5 or 1,
            buff = radish and "super" or nil,
            buffDuration = 600
        },
        velocity = { z = 0 },
        shadow = {
            name = radish and "fruitOmbrePetit" or "fruitOmbre"
        },
        anim = {},
        light = golden and {
            alpha = 0.2,
            radiusw = 240,
        } or nil,
        particleEmitter = {
            triggers = {
                land = {
                    name = "Fumee",
                    inherit = { x = 0.25, y = 0.25, z = 0 },
                    offset = { x = 0, y = 0, z = 0 },
                    count = 4,
                    durationRange = { 15, 25 },
                    speed = 6,
                    angleRange = { 0, math.pi * 2 }
                },
            },
            always = (radish or golden) and {
                name = "Sparkle",
                offsetRange = {
                    x = { -40, 40 },
                    y = { -40, 40 },
                    z = { 0, 80 },
                },
                duration = 60,
                cooldown = 10
            },
        },
        soundEmitter = {
            triggers = {
                land = {
                    name = "Thump",
                    pitchRange = { 0.6, 1.4 }
                }
            }
        }
    }
end

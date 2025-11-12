return function(object, data, flipX, flipY)
    local radish = object.fruit == "radish"
    local golden = data.properties and data.properties.golden
    return {
        body = { shape = "circle", size = 70, type = "dynamic" },
        sprites = {
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
            type = object.fruit,
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
            always = (radish or golden) and {
                name = "Sparkle",
                offsetRange = {
                    x = { -40, 40 },
                    y = { -40, 40 },
                    z = { 0, 80 },
                },
                duration = 60,
                cooldown = 10
            }
        }
    }
end

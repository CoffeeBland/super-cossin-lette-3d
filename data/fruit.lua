return function(object)
    return {
        body = { shape = "circle", size = 70, type = "dynamic" },
        pos = { height = 80 },
        fruit = {
            type = object.fruit,
            mass = 0.05,
            buff = object.fruit == "radish" and "super" or nil,
            buffDuration = 600
        },
        velocity = { z = 0 },
        shadow = {
            name = object.fruit == "radish" and "fruitOmbrePetit" or "fruitOmbre"
        },
        anim = {},
        particleEmitter = {
            always = object.fruit == "radish" and {
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

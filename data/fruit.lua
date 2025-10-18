return function(object)
    return {
        body = { shape = "circle", size = 70, type = "dynamic" },
        pos = { height = 80 },
        fruit = { type = object.fruit, mass = 0.05 },
        velocity = { z = 0 },
        shadow = {
            name = "fruitOmbre"
        }
    }
end

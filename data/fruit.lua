return function(object)
    return {
        body = { shape = "circle", size = 80, type = "dynamic" },
        fruit = { type = object.fruit },
        velocity = { z = 0 },
        shadow = {
            name = "fruitOmbre"
        }
    }
end

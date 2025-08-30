return {
    tileWidth = 192,
    tileHeight = 256,
    sprites = {
        corps = {
            {
                name = "walk",
                dirs = { "b", "br" },
                fps = 15,
                pingPong = true,
                tiles = { { 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 }, { 4, 0 } }
            },
            {
                name = "walk",
                dirs = { "bl", "l" },
                fps = 15,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 }, { 4, 0 } }
            },
            {
                name = "walk",
                dirs = { "t", "tl" },
                fps = 15,
                pingPong = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            {
                name = "walk",
                dirs = { "tr", "r" },
                fps = 15,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            }
        }
    }
}

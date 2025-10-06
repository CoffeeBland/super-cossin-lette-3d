return {
    tileWidth = 320,
    tileHeight = 448,
    sprites = {
        Blonde = {
            {
                name = "idle",
                fps = 1,
                tiles = { { 0, 0 } }
            },
            {
                name = "eat",
                fps = 60,
                oneShot = true,
                tiles = { { 0, 0, "throwFruit" }, { 0, 0, "eatFruit" } }
            }
        }
    }
}

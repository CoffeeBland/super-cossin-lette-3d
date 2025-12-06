return {
    sprites = {
        Sparkle = {
            tileWidth = 32,
            tileHeight = 32,
            {
                name = "idle",
                fps = 12,
                pingPong = true,
                tiles = { { 0, 0 }, { 1, 0 }, { 2, 0 } }
            }
        },
        Fumee = {
            tileWidth = 64,
            tileHeight = 64,
            {
                name = "idle",
                fps = 12,
                oneShot = true,
                tiles = { { 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 } }
            }
        },
        Splash = {
            tileWidth = 160,
            tileHeight = 160,
            {
                name = "idle",
                fps = 18,
                oneShot = true,
                flipX = true,
                dirs = { "r", "tr", "br" },
                tiles = {
                    { 0, 0 },
                    { 1, 0 },
                    { 2, 0 },
                    { 3, 0 },
                    { 4, 0 },
                    { 5, 0 },
                    { 6, 0 },
                    { 7, 0 },
                    { 8, 0 }
                }
            },
            {
                name = "idle",
                fps = 18,
                oneShot = true,
                dirs = { "l", "tl", "bl", "t", "b" },
                tiles = {
                    { 0, 0 },
                    { 1, 0 },
                    { 2, 0 },
                    { 3, 0 },
                    { 4, 0 },
                    { 5, 0 },
                    { 6, 0 },
                    { 7, 0 },
                    { 8, 0 }
                }
            },
        }
    }
}

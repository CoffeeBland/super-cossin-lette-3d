return {
    tileWidth = 192,
    tileHeight = 256,
    sprites = {
        cossinCorps = {
            {
                name = "idle",
                dirs = { "b" },
                fps = 6,
                pingPong = true,
                tiles = { { 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 }, { 4, 0 } }
            },
            {
                name = "idle",
                dirs = { "bl"},
                fps = 6,
                pingPong = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            {
                name = "idle",
                dirs = { "l"},
                fps = 6,
                pingPong = true,
                tiles = { { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 }, { 4, 2 } }
            },
            {
                name = "idle",
                dirs = { "tl" },
                fps = 6,
                pingPong = true,
                tiles = { { 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 }, { 4, 3 } }
            },
            {
                name = "idle",
                dirs = { "t" },
                fps = 6,
                pingPong = true,
                tiles = { { 0, 4 }, { 1, 4 }, { 2, 4 }, { 3, 4 }, { 4, 4 } }
            },
            {
                name = "idle",
                dirs = { "br"},
                fps = 6,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            {
                name = "idle",
                dirs = { "r"},
                fps = 6,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 }, { 4, 2 } }
            },
            {
                name = "idle",
                dirs = { "tr" },
                fps = 6,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 }, { 4, 3 } }
            },
            {
                name = "walk",
                dirs = { "b" },
                fps = 25,
                pingPong = true,
                tiles = { { 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 }, { 4, 0 } }
            },
            {
                name = "walk",
                dirs = { "bl"},
                fps = 25,
                pingPong = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            {
                name = "walk",
                dirs = { "l"},
                fps = 25,
                pingPong = true,
                tiles = { { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 }, { 4, 2 } }
            },
            {
                name = "walk",
                dirs = { "tl" },
                fps = 25,
                pingPong = true,
                tiles = { { 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 }, { 4, 3 } }
            },
            {
                name = "walk",
                dirs = { "t" },
                fps = 25,
                pingPong = true,
                tiles = { { 0, 4 }, { 1, 4 }, { 2, 4 }, { 3, 4 }, { 4, 4 } }
            },
            {
                name = "walk",
                dirs = { "br"},
                fps = 25,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            {
                name = "walk",
                dirs = { "r"},
                fps = 25,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 }, { 4, 2 } }
            },
            {
                name = "walk",
                dirs = { "tr" },
                fps = 25,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 }, { 4, 3 } }
            },
            -- Squish
            {
                name = "squish",
                dirs = { "b" },
                fps = 0,
                tiles = { { 0, 6 } }
            },
            {
                name = "squish",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 1, 6 } }
            },
            {
                name = "squish",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 1, 6 } }
            },
            {
                name = "squish",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 6 } }
            },
            {
                name = "squish",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 6 } }
            },
            {
                name = "squish",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 3, 6 } }
            },
            {
                name = "squish",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 3, 6 } }
            },
            {
                name = "squish",
                dirs = { "t" },
                fps = 0,
                tiles = { { 4, 6 } }
            },
            -- Jump
            {
                name = "jump",
                dirs = { "b" },
                fps = 0,
                tiles = { { 0, 5 } }
            },
            {
                name = "jump",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 1, 5 } }
            },
            {
                name = "jump",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 1, 5 } }
            },
            {
                name = "jump",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 5 } }
            },
            {
                name = "jump",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 5 } }
            },
            {
                name = "jump",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 3, 5 } }
            },
            {
                name = "jump",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 3, 5 } }
            },
            {
                name = "jump",
                dirs = { "t" },
                fps = 0,
                tiles = { { 4, 5 } }
            },
            -- Manger
            {
                name = "eat",
                dirs = { "l", "tl", "bl", "b" },
                fps = 10,
                oneShot = true,
                tiles = {
                    { 2, 7 }, { 3, 7 }, { 4, 7 },
                    { 0, 8 }, { 1, 8 }, { 2, 8 }, { 3, 8 }, { 4, 8 }
                }
            },
            {
                name = "eat",
                dirs = { "r", "tr", "br", "t" },
                fps = 10,
                flipX = true,
                oneShot = true,
                tiles = {
                    { 2, 7 }, { 3, 7 }, { 4, 7 },
                    { 0, 8 }, { 1, 8 }, { 2, 8 }, { 3, 8 }, { 4, 8 }
                }
            }
        },
        cossinPiedBack = {
            {
                name = "idle",
                dirs = { "b" },
                fps = 0,
                tiles = { { 2, 0 } }
            },
            {
                name = "idle",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 2, 1 } }
            },
            {
                name = "idle",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 2 } }
            },
            {
                name = "idle",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 2, 3 } }
            },
            {
                name = "idle",
                dirs = { "t" },
                fps = 0,
                tiles = { { 2, 4 } }
            },
            {
                name = "idle",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 3 } }
            },
            {
                name = "idle",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 2 } }
            },
            {
                name = "idle",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 1 } }
            },
            {
                name = "idle",
                dirs = { "b" },
                fps = 0,
                tiles = { { 2, 0 } }
            },
            {
                name = "walk",
                dirs = { "b" },
                fps = 25,
                pingPong = true,
                tiles = { { 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 }, { 4, 0 } }
            },
            {
                name = "walk",
                dirs = { "bl"},
                fps = 25,
                pingPong = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            {
                name = "walk",
                dirs = { "l"},
                fps = 25,
                pingPong = true,
                tiles = { { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 }, { 4, 2 } }
            },
            {
                name = "walk",
                dirs = { "tl" },
                fps = 25,
                pingPong = true,
                tiles = { { 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 }, { 4, 3 } }
            },
            {
                name = "walk",
                dirs = { "t" },
                fps = 25,
                pingPong = true,
                tiles = { { 0, 4 }, { 1, 4 }, { 2, 4 }, { 3, 4 }, { 4, 4 } }
            },
            {
                name = "walk",
                dirs = { "br"},
                fps = 25,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            {
                name = "walk",
                dirs = { "r"},
                fps = 25,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 }, { 4, 2 } }
            },
            {
                name = "walk",
                dirs = { "tr" },
                fps = 25,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 }, { 4, 3 } }
            },
            -- Squish
            {
                name = "squish",
                dirs = { "b" },
                fps = 0,
                tiles = { { 0, 6 } }
            },
            {
                name = "squish",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 1, 6 } }
            },
            {
                name = "squish",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 1, 6 } }
            },
            {
                name = "squish",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 6 } }
            },
            {
                name = "squish",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 6 } }
            },
            {
                name = "squish",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 3, 6 } }
            },
            {
                name = "squish",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 3, 6 } }
            },
            {
                name = "squish",
                dirs = { "t" },
                fps = 0,
                tiles = { { 4, 6 } }
            },
            -- Jump
            {
                name = "jump",
                dirs = { "b" },
                fps = 0,
                tiles = { { 0, 5 } }
            },
            {
                name = "jump",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 1, 5 } }
            },
            {
                name = "jump",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 1, 5 } }
            },
            {
                name = "jump",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 5 } }
            },
            {
                name = "jump",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 5 } }
            },
            {
                name = "jump",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 3, 5 } }
            },
            {
                name = "jump",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 3, 5 } }
            },
            {
                name = "jump",
                dirs = { "t" },
                fps = 0,
                tiles = { { 4, 5 } }
            },
            -- Eat
            {
                name = "eat",
                dirs = { "b" },
                fps = 0,
                tiles = { { 2, 0 } }
            },
            {
                name = "eat",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 2, 1 } }
            },
            {
                name = "eat",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 2 } }
            },
            {
                name = "eat",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 2, 3 } }
            },
            {
                name = "eat",
                dirs = { "t" },
                fps = 0,
                tiles = { { 2, 4 } }
            },
            {
                name = "eat",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 3 } }
            },
            {
                name = "eat",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 2 } }
            },
            {
                name = "eat",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 1 } }
            },
            {
                name = "eat",
                dirs = { "b" },
                fps = 0,
                tiles = { { 2, 0 } }
            },
        },
        cossinPiedFront = {
            {
                name = "idle",
                dirs = { "b" },
                fps = 0,
                tiles = { { 2, 0 } }
            },
            {
                name = "idle",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 2, 1 } }
            },
            {
                name = "idle",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 2 } }
            },
            {
                name = "idle",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 2, 3 } }
            },
            {
                name = "idle",
                dirs = { "t" },
                fps = 0,
                tiles = { { 2, 4 } }
            },
            {
                name = "idle",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 3 } }
            },
            {
                name = "idle",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 2 } }
            },
            {
                name = "idle",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 1 } }
            },
            {
                name = "walk",
                dirs = { "b" },
                fps = 25,
                pingPong = true,
                tiles = { { 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 }, { 4, 0 } }
            },
            {
                name = "walk",
                dirs = { "bl"},
                fps = 25,
                pingPong = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            {
                name = "walk",
                dirs = { "l"},
                fps = 25,
                pingPong = true,
                tiles = { { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 }, { 4, 2 } }
            },
            {
                name = "walk",
                dirs = { "tl" },
                fps = 25,
                pingPong = true,
                tiles = { { 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 }, { 4, 3 } }
            },
            {
                name = "walk",
                dirs = { "t" },
                fps = 25,
                pingPong = true,
                tiles = { { 0, 4 }, { 1, 4 }, { 2, 4 }, { 3, 4 }, { 4, 4 } }
            },
            {
                name = "walk",
                dirs = { "br"},
                fps = 25,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            {
                name = "walk",
                dirs = { "r"},
                fps = 25,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 }, { 4, 2 } }
            },
            {
                name = "walk",
                dirs = { "tr" },
                fps = 25,
                pingPong = true,
                flipX = true,
                tiles = { { 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 }, { 4, 3 } }
            },
            -- Squish
            {
                name = "squish",
                dirs = { "b" },
                fps = 0,
                tiles = { { 0, 6 } }
            },
            {
                name = "squish",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 1, 6 } }
            },
            {
                name = "squish",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 1, 6 } }
            },
            {
                name = "squish",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 6 } }
            },
            {
                name = "squish",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 6 } }
            },
            {
                name = "squish",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 3, 6 } }
            },
            {
                name = "squish",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 3, 6 } }
            },
            {
                name = "squish",
                dirs = { "t" },
                fps = 0,
                tiles = { { 4, 6 } }
            },
            -- Jump
            {
                name = "jump",
                dirs = { "b" },
                fps = 0,
                tiles = { { 0, 5 } }
            },
            {
                name = "jump",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 1, 5 } }
            },
            {
                name = "jump",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 1, 5 } }
            },
            {
                name = "jump",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 5 } }
            },
            {
                name = "jump",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 5 } }
            },
            {
                name = "jump",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 3, 5 } }
            },
            {
                name = "jump",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 3, 5 } }
            },
            {
                name = "jump",
                dirs = { "t" },
                fps = 0,
                tiles = { { 4, 5 } }
            },
            -- Eat
            {
                name = "eat",
                dirs = { "b" },
                fps = 0,
                tiles = { { 2, 0 } }
            },
            {
                name = "eat",
                dirs = { "bl" },
                fps = 0,
                tiles = { { 2, 1 } }
            },
            {
                name = "eat",
                dirs = { "l" },
                fps = 0,
                tiles = { { 2, 2 } }
            },
            {
                name = "eat",
                dirs = { "tl" },
                fps = 0,
                tiles = { { 2, 3 } }
            },
            {
                name = "eat",
                dirs = { "t" },
                fps = 0,
                tiles = { { 2, 4 } }
            },
            {
                name = "eat",
                dirs = { "tr" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 3 } }
            },
            {
                name = "eat",
                dirs = { "r" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 2 } }
            },
            {
                name = "eat",
                dirs = { "br" },
                fps = 0,
                flipX = true,
                tiles = { { 2, 1 } }
            },
            {
                name = "eat",
                dirs = { "b" },
                fps = 0,
                tiles = { { 2, 0 } }
            },
        }
    }
}

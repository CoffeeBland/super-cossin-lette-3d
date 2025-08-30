return {
    tileWidth = 192,
    tileHeight = 256,
    sprites = {
        corps = {
            walkDownRight = {
                framesByTile = 4,
                pingPong = true,
                tiles = { { 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 }, { 4, 0 } }
            },
            walkDownLeft = {
                framesByTile = 4,
                pingPong = true,
                tiles = { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 }, { 4, 1 } }
            },
            walkUpLeft = {
                framesByTile = 4,
                pingPong = true,
                tiles = { { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 }, { 4, 2 } }
            },
            walkUpRight = {
                framesByTile = 4,
                pingPong = true,
                tiles = { { 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 }, { 4, 3 } }
            }
        }
    }
}

local bit = require("bit")

METER_SCALE = 128
TILE_FLIP_H = math.pow(2, 31)
TILE_FLIP_V = math.pow(2, 30)
TILE_ID_MASK = bit.bnot(bit.bor(TILE_FLIP_H, TILE_FLIP_V))
DELTA = 0.01
SKY_LIMIT = METER_SCALE * 16
HEIGHT_SLICE = 80

MASK_SHADER = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        if (Texel(texture, texture_coords).a < 0.5) {
            discard;
        }
        return vec4(1.0);
    }
]]

STATIC_SHADOW_SLOP = 10

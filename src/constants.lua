local bit = require("bit")

EMPTY = {}
METER_SCALE = 128
TILE_FLIP_H = math.pow(2, 31)
TILE_FLIP_V = math.pow(2, 30)
TILE_ID_MASK = bit.bnot(bit.bor(TILE_FLIP_H, TILE_FLIP_V))
DELTA = 0.01
SKY_LIMIT = METER_SCALE * 16
HEIGHT_SLICE = 80
BIG_NUMBER = 999999

MASK_SHADER = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        if (Texel(texture, texture_coords).a < 0.5) {
            discard;
        }
        return vec4(1.0);
    }
]]

SPARKLY_SHADER = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        vec4 tex = Texel(texture, texture_coords);
        float luminosity = sqrt(
            0.299 * pow(tex.r, 2) +
            0.587 * pow(tex.g, 2) +
            0.114 * pow(tex.b, 2));
        if (luminosity == 0) {
            discard;
        }
        float lumalpha = (color.a - (1 - luminosity)) / luminosity;
        float alpha = lumalpha * 0.5 + color.a * 0.5;
        if (alpha >= 0) {
            return tex * vec4(vec3(color), alpha);
        }
    }
]]

--   2
--  1 3
-- 8   4
--  7 5
--   6
DIRS = { "tl", "t", "tr", "r", "br", "b", "bl", "l" }

STATIC_SHADOW_SLOP = 10
SHADOW_OVERLAP_SLOP = 32
FIXBODY = 41
HEIGHT_SENSOR = 42
WATER_SENSOR = 43

TILE_WIDTH = 128
TILE_HEIGHT = 74

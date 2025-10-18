local bit = require("bit")

EMPTY = {}
METER_SCALE = 128
TILE_FLIP_H = math.pow(2, 31)
TILE_FLIP_V = math.pow(2, 30)
TILE_ID_MASK = bit.bnot(bit.bor(TILE_FLIP_H, TILE_FLIP_V))
DELTA = 0.01
SKY_LIMIT = 2560
SHADOW_MAP_HEIGHT_OFFSET = 32
SHADOW_MAP_OFFSET = 1200
HEIGHT_SLICE = 80
BIG_NUMBER = 999999

HEIGHT_MAPPED_SHADER = love.graphics.newShader[[
    uniform vec2 size;
    uniform vec4 shadowColor;
    uniform Image shadowMap;
    uniform Image heightMap;
    uniform float shadowMapHeightOffset;
    uniform float shadowMapOffset;
    uniform float skyLimit;
    uniform float scale;

    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        vec4 texturecolor = Texel(texture, texture_coords);

        float height = Texel(heightMap, screen_coords / size).r * skyLimit;

        vec2 shadow_map_coords = vec2(
            (screen_coords.x) / size.x,
            (screen_coords.y + height * scale) / (size.y + shadowMapOffset));
        float shadowHeight = Texel(shadowMap, shadow_map_coords).r * skyLimit - shadowMapHeightOffset;

        if (height <= shadowHeight + 10) {
            return texturecolor * color * vec4(shadowColor.rgb, 1.0);
        } else {
            return texturecolor * color;
        }
    }
]]

HEIGHT_MAP_SHADER = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        vec4 texturecolor = Texel(texture, texture_coords);
        return vec4(texturecolor.rgb + color.rgb, texturecolor.a * color.a);
    }
]]

MAP_DEBUG_SHADER = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        vec4 texturecolor = Texel(texture, texture_coords);
        float third = 1.0/3.0;
        float r = min(texturecolor.r, third) * 3.0;
        float g = min(max(texturecolor.r - third, 0.0), third) * 3.0;
        float b = min(max(texturecolor.r - 2 * third, 0.0), third) * 3.0;
        return vec4(r, g, b, texturecolor.a);
    }
]]

MASK_SHADER = love.graphics.newShader[[
    const mat4x4 thresholdMatrix = mat4x4(
            1.0/17.0,  9.0/17.0,  3.0/17.0, 11.0/17.0,
           13.0/17.0,  5.0/17.0, 15.0/17.0,  7.0/17.0,
            4.0/17.0, 12.0/17.0,  2.0/17.0, 10.0/17.0,
           16.0/17.0,  8.0/17.0, 14.0/17.0,  6.0/17.0
    );

    bool dither(float val, vec2 coords) {
        int x = int(mod(coords.x/2, 4));
        int y = int(mod(coords.y/2, 4));
        return thresholdMatrix[x][y] > val;
    }

    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        float alpha = Texel(texture, texture_coords).a;
        if (alpha == 0 || dither(alpha, screen_coords)) {
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
SHADOW_OVERLAP_SLOP = 1
FIXBODY = 41
HEIGHT_SENSOR = 42
WATER_SENSOR = 43

TILE_WIDTH = 128
TILE_HEIGHT = 74
TILE_SHAPE = love.physics.newPolygonShape(
    -TILE_WIDTH / 8, 0,
    0, -TILE_HEIGHT / 8,
    TILE_WIDTH / 8, 0,
    0, TILE_HEIGHT / 8)
-- Cheat a little
ELLIPSE_WIDTH_RATIO = 0.5 + TILE_WIDTH / (TILE_WIDTH + TILE_HEIGHT)
ELLIPSE_HEIGHT_RATIO = 0.5 + TILE_HEIGHT / (TILE_WIDTH + TILE_HEIGHT)
LIGHT_POINTS = {}

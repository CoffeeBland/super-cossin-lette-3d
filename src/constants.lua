local bit = require("bit")

EMPTY = {}
METER_SCALE = 128
TILE_FLIP_H = math.pow(2, 31)
TILE_FLIP_V = math.pow(2, 30)
TILE_ID_MASK = bit.bnot(bit.bor(TILE_FLIP_H, TILE_FLIP_V))
DELTA = 0.01
SKY_LIMIT = METER_SCALE * 16 -- 2048
SHADOW_MAP_HEIGHT_OFFSET = 100
SHADOW_MAP_OFFSET = 600
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

    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        vec4 texturecolor = Texel(texture, texture_coords);

        vec2 height_map_coords = screen_coords / size;
        float height = Texel(heightMap, height_map_coords).r * skyLimit / 2.0;

        vec3 pos = vec3(screen_coords.x, screen_coords.y + height, height);

        vec2 shadow_map_coords = vec2(screen_coords.x, screen_coords.y + height) / vec2(size.x, size.y + shadowMapOffset);
        float shadowHeight = Texel(shadowMap, shadow_map_coords).r * skyLimit - shadowMapHeightOffset;

        if (height <= shadowHeight / 2.0) {
            return texturecolor * color * shadowColor;
        } else {
            return texturecolor * color;
        }
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

--local heightGradientCanvas = love.graphics.newCanvas(1, SKY_LIMIT, { format = "r8" })
--love.graphics.setCanvas(heightGradientCanvas)
--for i = 0, SKY_LIMIT - 1 do
--    love.graphics.setColor(i / SKY_LIMIT, 0, 0, 1)
--    love.graphics.points(0, i)
--end
--love.graphics.reset()
--love.graphics.setCanvas()
--HEIGHT_GRADIENT = love.graphics.newImage(heightGradientCanvas:newImageData())

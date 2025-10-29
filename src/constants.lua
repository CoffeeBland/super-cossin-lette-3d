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
EXPRES = { 2732, 2048 }
CURRES = { unpack(EXPRES) }
SCALE_TO_EXPECTED = 1

HEIGHT_MAPPED_SHADER = love.graphics.newShader[[
    uniform vec2 size;
    uniform vec4 shadowColor;
    uniform Image heightMap;
    uniform Image shadowMap;
    uniform float shadowMapHeightOffset;
    uniform float shadowMapOffset;
    uniform float skyLimit;
    uniform float scale;
    uniform float hue;

    const int heightSamples = 1;
    const float heightSampleDst = 1.5;
    const float heightParts = (heightSamples * 2 + 1) * (heightSamples * 2 + 1);
    const vec3 linecol = vec3(117.0/255.0, 0, 25.0/255.0);

    const int shadowSamples = 1;
    const float shadowSampleDst = 1.0;
    const float shadowStrParts = 4.0;

    // Shamelessly stolen from https://stackoverflow.com/questions/15095909/from-rgb-to-hsv-in-opengl-glsl
    vec3 rgb2hsv(vec3 c) {
        vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
        vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
        vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

        float d = q.x - min(q.w, q.y);
        float e = 1.0e-10;
        return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
    }

    vec3 hsv2rgb(vec3 c) {
        vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
        vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
        return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
    }

    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        vec4 texturecolor = Texel(texture, texture_coords) * color;

        float height = 0.0;
        for (int i = -heightSamples; i <= heightSamples; i++) {
            for (int j = -heightSamples; j <= heightSamples; j++) {
                vec2 sampleDst = vec2(i * heightSampleDst, j * heightSampleDst);
                height += Texel(heightMap, (screen_coords + sampleDst) / size).r * skyLimit;
            }
        }

        height /= heightParts;

        int votes = 0;
        for (int i = -shadowSamples; i <= shadowSamples; i++) {
            for (int j = -shadowSamples; j <= shadowSamples; j++) {
                vec2 shadow_map_coords = vec2(
                    (i * shadowSampleDst + screen_coords.x) / size.x,
                    (j * shadowSampleDst + screen_coords.y + height * scale) / (size.y + shadowMapOffset));
                float shadowHeight = Texel(shadowMap, shadow_map_coords).r * skyLimit - shadowMapHeightOffset;
                if (height <= shadowHeight + 10) {
                    votes++;
                }
            }
        }

        vec4 finalcol = texturecolor;
        float touchability = min(1.0, distance(finalcol.rgb, linecol) * 10.0);
        if (votes > 0) {
            float str = min(votes / shadowStrParts, 1.0);
            finalcol *= ((1.0 - str) * vec4(1.0) + str * vec4(shadowColor.rgb, 1.0));
        }
        vec3 hsv = rgb2hsv(finalcol.rgb);
        hsv.x = mod(hsv.x + hue, 1.0);
        return touchability * vec4(hsv2rgb(hsv), finalcol.a) + (1.0 - touchability) * texturecolor;
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
        float val = texturecolor.r;
        if (val < 0.25) {
            return vec4(val * 4.0, 0, 0, texturecolor.a);
        } else if (val < 0.5) {
            return vec4(1.0, val * 4.0 - 1.0, 0, texturecolor.a);
        } else if (val < 0.75) {
            return vec4(3.0 - val * 4.0, 1.0, 0, texturecolor.a);
        } else {
            return vec4(0, 1.0, val * 4.0 - 3.0, texturecolor.a);
        }
    }
]]

MASK_SHADER = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        float alpha = Texel(texture, texture_coords).a;
        if (alpha <= 0.1) {
            discard;
        }
        return vec4(1.0);
    }
]]

DITHER_SHADER = love.graphics.newShader[[
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

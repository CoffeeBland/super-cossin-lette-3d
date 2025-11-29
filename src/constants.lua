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
    uniform vec4 reflectionColor;
    uniform Image heightMap;
    uniform Image shadowMap;
    uniform float shadowMapHeightOffset;
    uniform float shadowMapOffset;
    uniform Image reflectionMap;
    uniform float skyLimit;
    uniform float scale;
    uniform float hueRot;
    uniform float hue;

    const float heightSamples[] = float[3 * 5](
        0.0, 0.0, 2.0/6.0,
        -2.0, -2.0, 1.0/6.0,
        2.0, 2.0, 1.0/6.0,
        -2.0, 2.0, 1.0/6.0,
        2.0, 2.0, 1.0/6.0);

    const vec3 linecol = vec3(117.0/255.0, 0, 25.0/255.0);

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
        for (int i = 0; i < 15; i += 3) {
            vec2 sampleDst = vec2(heightSamples[i], heightSamples[i + 1]);
            height += heightSamples[i + 2] * Texel(heightMap, (screen_coords + sampleDst) / size).r * skyLimit;
        }

        vec2 shadow_map_coords = vec2(
            screen_coords.x / size.x,
            (screen_coords.y + height * scale) / (size.y + shadowMapOffset));
        float shadowHeight = Texel(shadowMap, shadow_map_coords).r * skyLimit - shadowMapHeightOffset;

        if (distance(texturecolor.rgb, reflectionColor.rgb) < 0.1) {
            vec2 reflection_map_coords = shadow_map_coords;
            vec4 reflectedcolor = Texel(reflectionMap, reflection_map_coords);
            texturecolor = vec4(mix(texturecolor.rgb, reflectedcolor.rgb, reflectedcolor.a), texturecolor.a);
        }

        float touchability = max(0.0, min(1.0, (distance(texturecolor.rgb, linecol) - 0.05) * 10.0));
        vec4 finalcol = texturecolor;
        if (height <= shadowHeight + 10) {
            finalcol *= vec4(shadowColor.rgb, 1.0);
        }
        vec3 hsv = rgb2hsv(finalcol.rgb);
        if (hue >= 0) {
            hsv.x = hue;
        }
        hsv.x = mod(hsv.x + hueRot, 1.0);
        finalcol = vec4(hsv2rgb(hsv), finalcol.a);
        return mix(texturecolor, finalcol, touchability);
    }
]]

POST_SHADER = love.graphics.newShader[[
    uniform Image palette;
    uniform vec2 size;
    uniform float pixelLens;

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
        if (pixelLens > 0.0) {
            vec2 pix_coords = texture_coords * size;
            float offsize = min(size.x, size.y) / 8.0;
            float hpixelize = min(max((distance(size.x / 2.0, pix_coords.x) - offsize) * pixelLens, 1.0), 32.0);
            float vpixelize = min(max((distance(size.y / 2.0, pix_coords.y) - offsize) * pixelLens, 1.0), 32.0);
            float pixelize = floor(max(hpixelize, vpixelize));
            texture_coords = floor(pix_coords / pixelize + vec2(0.5, 0.5)) * pixelize / size;
        }

        vec4 texturecolor = Texel(texture, texture_coords) * color;
        vec3 hsv = rgb2hsv(texturecolor.rgb);
        vec2 paletted = Texel(palette, hsv.xy).xy;
        hsv = vec3(paletted.x, paletted.y, hsv.z);
        return vec4(hsv2rgb(hsv), texturecolor.a);
    }
]]

HEIGHT_MAP_SHADER = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        vec4 texturecolor = Texel(texture, texture_coords);
        return vec4(texturecolor.rgb * color.g + color.r, texturecolor.a * color.a);
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

TITLE_SHADER = love.graphics.newShader[[
    const vec3 linecol = vec3(117.0/255.0, 0, 25.0/255.0);
    uniform float hueRot;

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
        vec4 finalcol = texturecolor;
        float touchability = min(1.0, distance(finalcol.rgb, linecol) * 10.0);
        vec3 hsv = rgb2hsv(finalcol.rgb);
        hsv.x = mod(hsv.x + hueRot, 1.0);
        return touchability * vec4(hsv2rgb(hsv), finalcol.a) + (1.0 - touchability) * texturecolor;
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

local part1 = 1/2
local part2 = (1 - part1) * 1/2
local part3 = (1 - part1 - part2) * 1/2
local part4 = (1 - part1 - part2 - part3)
local blurcossin = {
    x = { -1, -1, 1,  1, 2, -2, 0,  0, -4, -4, 4,  4, 8, -8, 0,  0 },
    y = { -1,  1, 1, -1, 0,  0, 2, -2, -4,  4, 4, -4, 0,  0, 8, -8 },
    weights = {
        1/4 * part1, 1/4 * part1, 1/4 * part1, 1/4 * part1,
        1/4 * part2, 1/4 * part2, 1/4 * part2, 1/4 * part2,
        1/4 * part3, 1/4 * part3, 1/4 * part3, 1/4 * part3,
        1/4 * part4, 1/4 * part4, 1/4 * part4, 1/4 * part4
    },
    samples = 16
}

function SET_SCREEN_SHADER_BLUR(blur)
    if blur <= 0 then
        love.graphics.setShader()
        return
    end
    SCREEN_SHADER:send("xs", unpack(blurcossin.x))
    SCREEN_SHADER:send("ys", unpack(blurcossin.y))
    SCREEN_SHADER:send("weights", unpack(blurcossin.weights))
    SCREEN_SHADER:send("samples", blurcossin.samples)
    SCREEN_SHADER:send("dst", 1 * (blur / 8))
    love.graphics.setShader(SCREEN_SHADER)
end

SCREEN_SHADER = love.graphics.newShader[[
    uniform vec2 size;
    uniform float[16] xs;
    uniform float[16] ys;
    uniform float[16] weights;
    uniform float dst;
    uniform int samples;

    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        if (samples == 0)
            return Texel(texture, texture_coords) * color;
        vec4 fcol = vec4(0);
        for (int i = 0; i < samples; i++) {
            float x = xs[i];
            float y = ys[i];
            float weight = weights[i];
            vec2 coords = (texture_coords * size + vec2(x, y) * dst) / size;
            fcol += weight * Texel(texture, coords);
        }
        return fcol * color;
    }
]]

GAUSSIAN_SCREEN_SHADER = love.graphics.newShader[[
    uniform vec2 size;
    uniform int blur;
    const float pi = 3.1415926538;

    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        if (blur == 0) {
            return Texel(texture, texture_coords) * color;
        }
        float sigma = (float(blur * 2 + 1) - 1.0) / 6.0;
        float sigma22 = 2 * sigma * sigma;
        float totalWeight = 0.0;
        vec4 finalColor = vec4(0.0, 0.0, 0.0, 0.0);
        for (int i = -blur; i <= blur; i++) {
            for (int j = -blur; j <= blur; j++) {
                float weight = exp(-(i*i + j*j) / sigma22);
                totalWeight += weight;
                finalColor += weight * Texel(texture, (texture_coords * size + vec2(float(i), float(j))) / size) * color;
            }
        }
        return finalColor / totalWeight;
    }
]]

local palettesize = 100
DEFAULT_PALETTE = love.graphics.newCanvas(palettesize, palettesize, { format = "rg8" })
DEFAULT_PALETTE:setFilter("linear")
DEFAULT_PALETTE:setWrap("clamp", "clamp")
love.graphics.push("all")
love.graphics.setCanvas(DEFAULT_PALETTE)

for i = 0, palettesize - 1 do
    for j = 0,palettesize - 1 do
        love.graphics.setColor(i/(palettesize-1), j/(palettesize-1), 0, 1)
        love.graphics.rectangle("fill", i, j, 1, 1)
    end
end
love.graphics.pop()


-- It's pretty shitty, but such is le Brun.
local shifts = {
    { ohs = 0, ohe =  0.1, fhs = 0, fhe = 0.1, ss = 0.5 },
    { ohs = 0.1, ohe = 0.16, fhs = 0.1, fhe = 0.16, ss = 1 },
    { ohs = 0.16, ohe = 0.25, fhs = 0.16, fhe = 0.25, ss = 0.75 },
    { ohs = 0.25, ohe = 0.45, fhs = 0.25, fhe = 0.35, ss = 0.75 },
    { ohs = 0.45, ohe = 0.7, fhs = 0.35, fhe = 0.7, ss = 0.5 },
    { ohs = 0.7, ohe = 1.0, fhs = 0.7, fhe = 1.0, ss = 0.75 }
}
BRUN_PALETTE = love.graphics.newCanvas(palettesize, palettesize, { format = "rg8" })
BRUN_PALETTE:setFilter("linear")
BRUN_PALETTE:setWrap("clamp", "clamp")
love.graphics.push("all")
love.graphics.setCanvas(BRUN_PALETTE)

for i = 0, palettesize - 1 do
    local h = i / (palettesize-1)
    local shift = table.find(shifts,
        function (s)
            return s.ohs <= h and h <= s.ohe
        end)
    h = shift.fhs + (h - shift.ohs) / (shift.ohe - shift.ohs) * (shift.fhe - shift.fhs)
    for j = 0, palettesize - 1 do
        local s = shift.ss * j/(palettesize-1)
        love.graphics.setColor(h, s, 0, 1)
        love.graphics.rectangle("fill", i, j, 1, 1)
    end
end
love.graphics.pop()

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
DROWN_SENSOR = 44

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

love.audio.setEffect("brun", {
    type = "distortion",
    gain = 0.5,
    edge = 0.25
})

love.audio.setEffect("mass1.33", {
    type = "reverb",
    decaytime = 0.75
})

love.audio.setEffect("mass1.66", {
    type = "reverb",
    decaytime = 1.5
})

love.audio.setEffect("mass2", {
    type = "reverb",
    decaytime = 2.5
})

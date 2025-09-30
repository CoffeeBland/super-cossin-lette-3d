local splashFrames = 300
local splashAlphaFrames = 60
local targetSizePercent = 0.5
local sparkles = {
    { frame = 90, x = 424, y = 363 },
    { frame = 120, x = 536, y = 376 }
}
local sparkleFrames = 12

Intro = {
    fadeout = 0,
    fadein = 0
}

function Intro:enter()
    self.splashFrame = 0
    self.sparkleQuads = {}
    local sw = textures.Sparkle:getWidth()
    local sh = textures.Sparkle:getHeight()
    local count = sw / sh
    for i = 1, count do
        self.sparkleQuads[i] = love.graphics.newQuad(
            (i - 1) * sh,
            0,
            sh,
            sh,
            textures.Sparkle)
    end
end

function Intro:exit()
end

function Intro:update(dt)
    if self.splashFrame >= splashFrames or actions.escape then
        love.audio.stop(sounds.IntroClick)
        love.audio.stop(sounds.Intro)
        StateMachine:change(Game, { map = Game.constants.firstLevel })
    end

    if self.splashFrame == 0 then
        sounds.IntroClick:setVolume(0.5)
        love.audio.play(sounds.IntroClick)
    end

    if self.splashFrame == 30 then
        love.audio.play(sounds.Intro)
    end
    self.splashFrame = self.splashFrame + 1
end

function Intro:render()
    love.graphics.setShader(SPARKLY_SHADER)
    local kalitayW = textures.SceauDeKalitay:getWidth()
    local kalitayH = textures.SceauDeKalitay:getHeight()
    local winW, winH = love.graphics.getDimensions()
    local sw = winW * targetSizePercent / kalitayW
    local sh = winH * targetSizePercent / kalitayH
    local scale = math.min(sw, sh)
    local x = winW / 2 - kalitayW * scale / 2
    local y = winH / 2 - kalitayH * scale / 2
    local alpha = math.min(self.splashFrame - 30, splashFrames - 30 - self.splashFrame) / splashAlphaFrames
    love.graphics.setColor(1, 1, 1, alpha)
    love.graphics.draw(textures.SceauDeKalitay,
        x, y,
        0,
        scale, scale)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setShader()

    for _, sparkle in pairs(sparkles) do
        local frame = self.splashFrame - sparkle.frame
        if frame >= 0 and frame < sparkleFrames then
            local tileDuration = sparkleFrames / #self.sparkleQuads
            local tile = math.floor(frame / tileDuration) + 1
            local quad = self.sparkleQuads[tile]
            local qx, qy, qw, qh = quad:getViewport()
            love.graphics.draw(
                textures.Sparkle,
                quad,
                x + sparkle.x * scale, y + sparkle.y * scale,
                0,
                1, 1,
                qw / 2, qh / 2)
        end
    end
end

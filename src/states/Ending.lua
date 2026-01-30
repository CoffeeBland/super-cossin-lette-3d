require "src.Timeline"

Ending = {
    fadeout = 60,
    fadein = 60,
    fadeColor = { 1, 1, 1 },
    stuff = {},
    events = {}
}

function Ending:refresh(force)
    if force then
        StateMachine:change(Ending, nil, { fadeout = 15, fadein = 60 })
    end
end

function Ending:enter()
    load.crawlFor({ data = { "endingCutscene" } })
    self.timeline = Timeline.new(self.stuff)
    self.timeline:queue(self.events)
    self.timeline:load()
    load.crawlFor({ textures = { "Fin_fond" } })

    self.creditsScroll = nil
    self.endCreditsScroll = nil
    self.finFrames = nil
end

function Ending:exit()
end

function Ending:update(dt)
    if actions.refresh then
        StateMachine:change(Ending, nil, { fadeout = 15, fadein = 60 })
    end

    self.timeline:update(dt)
    if self.timeline.frame == self.timeline.events[#self.timeline.events].frame then
        Credits:enter()
        local _, creditsHeight = Menu.draw(nil, 0, Credits.items, CURRES[1], CURRES[2], 0)
        self.creditsScroll = (CURRES[2] + creditsHeight) / 2
        self.endCreditsScroll = -(CURRES[2] + creditsHeight) / 2
    end

    if self.creditsScroll then
        self.creditsScroll = self.creditsScroll + self.creditsScrollSpeed * dt

        if self.creditsScroll < self.endCreditsScroll then
            self.finFrames = self.totalFinFrames
            self.creditsScroll = nil
        end
    end

    if self.finFrames then
        self.finFrames = self.finFrames - 1

        if self.finFrames < 0 then
            StateMachine:change(Intro)
        end
    end
end

function Ending:render(dt)
    love.graphics.draw(textures.Fin_fond)
    self.timeline:render()

    local lastEvent = self.timeline.events[#self.timeline.events]
    if self.timeline.frame > lastEvent.frame + lastEvent.duration then
        love.graphics.clear(1, 0.063, 0.325)
    end

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setBlendMode("add")

    if self.creditsScroll then
        love.graphics.push()
        love.graphics.translate(0, self.creditsScroll)
        Menu.draw(nil, 0, Credits.items, CURRES[1], CURRES[2], dt)
        love.graphics.pop()
    end

    if self.finFrames then
        love.graphics.push()
        love.graphics.translate(CURRES[1] / 2, CURRES[2] / 2)
        love.graphics.setFont(fonts.hero)
        love.graphics.printf(
            self.finFrames < self.totalFinFrames / 2 and "BUBYE" or "FIN",
            -800, 0, 1600, "center")
        love.graphics.pop()
    end

    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)
end

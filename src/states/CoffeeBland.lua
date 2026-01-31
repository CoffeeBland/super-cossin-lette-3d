require "src.Timeline"

CoffeeBland = {
    fadein = 60,
    fadeout = 30,
    stuff = {
        {
            id = "tasse",
            name = "CoffeeBland",
            screenAnchor = { x = 0.5, y = 0.5 },
            textureAnchor = { x = 0.5, y = 0.5 },
            initialAlpha = 1,
            initialScale = { x = 2, y = 2 }
        }
    },
    events = {
        { "sound",
            name = "CoffeeBlandPre",
        },
        { "sound",
            name = "CoffeeBland",
            frameOffset = 90,
        },
        { "state",
            frameOffset = 150,
            state = Title
        }
    }
}

function CoffeeBland:enter()
    self.timeline = Timeline.new(self.stuff)
    self.timeline:queue(self.events)
    self.timeline:load()
end

function CoffeeBland:exit()
end

function CoffeeBland:update(dt)
    if actions.start or
        actions.back or
        actions.action then
        StateMachine:change(Title)
    end

    self.timeline:update(dt)
end

function CoffeeBland:render()
    love.graphics.clear(72/255, 72/255, 72/255)
    self.timeline:render()

    love.graphics.setShader(DITHER_SHADER)
    DITHER_SHADER:send("scale", 1/4)
end

function CoffeeBland:postRender()
    DITHER_SHADER:send("scale", 1)
    love.graphics.setShader()
end

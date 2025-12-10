Credits = {}

local credits = {
    {
        "Level design",
        "Annie-Claude Tremblay",
        "Jessi Tremblay",
        "Guillaume Noël-Martel",
    },
    {
        "Oui",
        "Guillaume Noël-Martel"
    },
    {
        "P'tits bonhommes",
        "Myriam Noël-Martel",
    },
    {
        "Cossin Lette",
        "Gabriel Tremblay"
    },
    {
        "Manger le pique-nique",
        "Blonde"
    },
    {
        "Préparer le pique-nique",
        "Cossin Lette",
    },
    {
        "3D",
        "Non"
    }
}


function Credits:enter()
    self.items = {
        {
            text = "Super Cossin Lette 3D",
            active = true,
            font = fonts.title
        },
        {}
    }

    for _, section in ipairs(credits) do
        table.insert(self.items, {
            text = section[1],
            value = "",
            active = true,
            font = fonts.text
        })

        for i = 2, #section do
            local name = section[i]
            table.insert(self.items, {
                text = "",
                value = name,
                active = true
            })
        end
        table.insert(self.items, {})
    end
end

function Credits:exit()
end

function Credits:update(dt)
    if actions.start or actions.back then
        Sound:start(Sound.global.act)
        StateMachine:pop(self)
    end
end

function Credits:render(dt)
    local w, h = CURRES[1], CURRES[2]
    love.graphics.setColor(unpack(Game.constants.pauseColor))
    love.graphics.setBlendMode("multiply", "premultiplied")
    love.graphics.rectangle("fill", 0, 0, w, h)
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)

    return menu.draw(nil, 0, self.items, w, h, dt)
end

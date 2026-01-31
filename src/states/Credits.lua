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
        "Cossin lette",
        "Gabriel Tremblay"
    },
    {
        "Manger le pique-nique",
        "Blonde"
    },
    {
        "Préparer le pique-nique",
        "Cossin lette",
    },
    {
        "3D",
        "Non"
    },
    {
        "Tutoriel de Sang Froid",
        "Brian Perro",
    },
    {
        "Veut un jeu vidéo",
        "Emery",
    }
}

function Credits:enter()
    if Music.current then
        Music.current:setFilter(Game.constants.music.filters.pause)
    end

    self.items = {
        {
            text = "Super Cossin Lette 3D",
            active = true,
            font = fonts.title
        }
    }

    for _, section in ipairs(credits) do
        table.insert(self.items, {})
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
    end

    self.idx = 1
    self.scroll = 0
    self.autoScrollFrames = Game.constants.pause.autoScrollFrames
end

function Credits:exit()
    if Music.current then
        Music.current:setFilter()
    end
end

function Credits:update(dt)
    if actions.start or actions.back then
        Sound:start(Sound.global.act)
        StateMachine:pop(self)
    end

    if actions.move then
        if actions.menu.y ~= 0 then
            local newIdx = Menu.newIdx(
                self.idx,
                self.items,
                actions.menu.y,
                function (item, idx)
                    return idx == 1 or idx == #self.items
                end)
            if newIdx ~= self.idx then
                self.idx = newIdx
                Sound:start(actions.menu.y < 0 and Sound.global.up or Sound.global.down)
            end
        end
    end
end

function Credits:render(dt)
    local w, h = CURRES[1], CURRES[2]
    self.scroll = Menu.draw(self.idx, self.scroll, self.items, w, h, dt)
end

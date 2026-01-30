Maps = {}

function Maps.isMapItem(item)
    return (item.map or item.game or item.name == "ok") and not item.disabled
end

function Maps:enter(params)
    for file, info in pairs(love.filesystem.crawl("maps")) do
        Map.load(str.filename(file))
    end

    self.items = {{ text = "PIQUE-NIQUES", active = true }, {}}

    local seen = {}
    local nextmap = Game.constants.firstLevel
    local previousmap = nil
    local noDisplayIdx = 1

    while mapsByName[nextmap] and not seen[nextmap] do
        seen[nextmap] = true
        local map = mapsByName[nextmap]
        local displayName = map._data.properties.name
        if not displayName then
            displayName = "DANS LES BOIS #" .. noDisplayIdx
            noDisplayIdx = noDisplayIdx + 1
        end
        table.insert(self.items, {
            text = displayName,
            map = map,
            name = nextmap,
            disabled = previousmap and not Save:get(previousmap) and Options.values.debug == 0
        })
        previousmap = nextmap
        nextmap = map._data.properties["vars.nextMap"]
    end

    local oldDisabled = not (Save:get("Ending") or Options.values.debug > 0)
    table.insert(self.items, {})
    table.insert(self.items, {
        text = "RELICATS",
        active = not oldDisabled,
        disabled = oldDisabled
    })
    table.insert(self.items, {})
    table.insert(self.items, {
        text = "LA GRANDE AVENTURE",
        game = "cossin-lette-1-2",
        disabled = oldDisabled
    })
    table.insert(self.items, {
        text = "LA REVANCHE",
        game = "cossin-lette-2",
        disabled = oldDisabled
    })
    table.insert(self.items, {})

    if Options.values.debug > 0 then
        table.insert(self.items, {})
        table.insert(self.items, { text = "DEV", active = true })
        table.insert(self.items, {})
        for name, map in pairs(mapsByName) do
            if not seen[name] then
                seen[name] = true
                table.insert(self.items, {
                    text = name,
                    map = map,
                    name = name
                })
            end
        end
    end

    table.insert(self.items, {})
    table.insert(self.items, { text = "OK", name = "ok" })

    self.idx = Menu.newIdx(0, self.items, 1, Maps.isMapItem)
    self.scroll = 0
end

function Maps:exit()

end

function Maps:update(dt)
    if actions.start or actions.back then
        Sound:start(Sound.global.act)
        StateMachine:pop(self)
    end

    if actions.move then
        if actions.menu.y ~= 0 then
            local newIdx = Menu.newIdx(self.idx, self.items, actions.menu.y, Maps.isMapItem)
            if newIdx ~= self.idx then
                self.idx = newIdx
                Sound:start(actions.menu.y < 0 and Sound.global.up or Sound.global.down)
            end
        end
    end

    if actions.action then
        local item = self.items[self.idx]
        if item.name == "ok" then
            StateMachine:pop(self)
        elseif item.map then
            Music:fadeout()
            StateMachine:change(MapIntro, { map = item.name })
        elseif item.game then
            os.execute("start " .. item.game .. "/Game.exe")
            love.event.quit(0)
        end
    end
end

function Maps:render(dt)
    local w, h = CURRES[1], CURRES[2]
    self.scroll = Menu.draw(self.idx, self.scroll, self.items, w, h, dt)
end

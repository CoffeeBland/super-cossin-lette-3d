Maps = {}

function Maps.isMapItem(item)
    return item.map
end

function Maps:enter(params)
    for file, info in pairs(love.filesystem.crawl("maps")) do
        Map.load(str.filename(file))
    end

    self.items = {{ text = "PIQUE-NIQUES", active = true }, {}}

    local seen = {}
    local nextmap = Game.constants.firstLevel
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
            name = nextmap
        })
        nextmap = map._data.properties["vars.nextMap"]
    end

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

    self.idx = menu.newIdx(0, self.items, 1, Maps.isMapItem)
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
            local newIdx = menu.newIdx(self.idx, self.items, actions.menu.y, Maps.isMapItem)
            if newIdx ~= self.idx then
                self.idx = newIdx
                Sound:start(actions.menu.y < 0 and Sound.global.up or Sound.global.down)
            end
        end
    end

    if actions.action then
        StateMachine:change(MapIntro, { map = self.items[self.idx].name })
    end
end

function Maps:render()
    local w, h = CURRES[1], CURRES[2]
    love.graphics.setColor(unpack(Game.constants.pauseColor))
    love.graphics.setBlendMode("multiply", "premultiplied")
    love.graphics.rectangle("fill", 0, 0, w, h)
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)
    menu.draw(self.idx, self.items, w, h)
end

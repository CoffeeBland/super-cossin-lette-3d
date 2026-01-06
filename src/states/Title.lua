Title = {
    fadeout = 60,
    fadein = 15
}

local grassTiles = {
    "Tuile_gazon-19",
    "Tuile_gazon-20",
    "Tuile_gazon-21",
    "Tuile_gazon-22",
    "Tuile_gazon-23",
    "Tuile_gazon-24",
    "Tuile_gazon-25",
    "Tuile_gazon-26",
    "Tuile_gazon-27",
    "Tuile_gazon-28",
    "Tuile_gazon-29",
    "Tuile_gazon-30",
    "Tuile_gazon-31",
}

local cossinY = 450
local bgcol = { 0.686, 0.898, 0.608 }
local bgGrassTiles = {}

local jump = 240
local acrossCount = 24
local length = jump * acrossCount * 1.5
for i = -acrossCount, acrossCount do
    for j = -acrossCount, acrossCount do
        table.insert(bgGrassTiles, {
            x = i * jump + math.random(-jump / 2, jump / 2),
            y = j * jump + math.random(-jump / 2, jump / 2),
            name = grassTiles[math.random(#grassTiles)]
        })
    end
end
local textScale = {
    frames = 15,
    from = 0.25,
    to = 1
}

--             s 2732, 2048
--p 384, 120   s 1202, 494 c 985, 367  c2 -381, -657 super
--p 1166, 371  s 1197, 450 c 1765, 596 c2 399, -428 cossin
--p 1304, 763  s 1165, 403 c 1887, 965 c2 521, -59 lette
--p 247, 482   s 1022, 845 c 758, 905  c2 -608 -119 3d
local timeline = {
    {
        text = "TitleSuper",
        pos = { x = 100 - 381, y = -657 },
        frame = 40,
    },
    {
        cossin = true,
        frame = 100,
        "hello",
        { "walkTo", point = { pos = { x = 300, y = cossinY + 30 } } },
        { "walkTo", point = { pos = { x = -200, y = cossinY - 20 } } },
        { "walkTo", point = { pos = { x = 0, y = cossinY + 0 } } },
        { "lookAt", point = { pos = { x = 0, y = cossinY - 100 } } },
        { "jump", jumpSpeed = 100 },
        { "waitFrames", 60 },
        { "walkTo", point = { pos = { x = 0, y = cossinY + 60 } } },
    },
    {
        text = "TitleCossin",
        pos = { x = 100 + 399 , y = -428 },
        frame = 110,
    },
    {
        text = "TitleLette",
        pos = { x = 100 + 521, y = -59 },
        frame = 160,
    },
    {
        text = "Title3d",
        pos = { x = 100 + 20 -608, y = 20 -119 },
        frame = 220,
    },
    {
        menu = true,
        frame = 290
    }
}

local buissons = {
    {
        name = "TitleBuisson_1",
        anchor = { x = 0, y = 0 },
        animOffset = { x = -350, y = -330 },
        animFrames = 300
    },
    {
        name = "TitleBuisson_2",
        anchor = { x = 0, y = 1 },
        animOffset = { x = -350, y = 330 },
        animFrames = 300
    },
    {
        name = "TitleBuisson_3",
        anchor = { x = 1, y = 1 },
        animOffset = { x = 350, y = 330 },
        animFrames = 300
    },
    {
        name = "TitleBuisson_4",
        anchor = { x = 1, y = 0 },
        animOffset = { x = 350, y = -330 },
        animFrames = 300
    }
}

local menu = {
    pos = { x = 0, y = cossinY + 150 },
    margin = 40,
    buttons = {
        {
            text = "PIQUE-NIQUER",
            menuState = "new",
        },
        {
            text = "ALLER DIRECT",
            menuState = "maps",
        },
        {
            text = "OPTIONS",
            menuState = "options",
        },
        {
            text = "CREDITS",
            menuState = "credits",
        },
        {
            text = "SE RECOUCHER",
            menuState = "quit",
        }
    },
    buttonsByMenuState = {}
}

for i, button in ipairs(menu.buttons) do
    menu.buttonsByMenuState[button.menuState] = button

    local di = i - (1 + #menu.buttons) / 2
    local sign = math.sign(di)
    button.move = {
        "hello",
        { "walkTo", point = { pos = { x = di * 320 - sign * 120, y = cossinY + 20 } } },
        { "jump", jumpSpeed = 100 },
        { "walkTo", point = { pos = { x = di * 320 - sign * 45, y = cossinY + 60 } } },
        { "lookAt", point = { pos = { x = di * 320 - sign * 45, y = cossinY + 70 } } }
    }
    button.actionMove = {
        "hello",
        { "walkTo", point = { pos = { x = di * 320, y = cossinY + 60 } } },
        { "jump", jumpSpeed = 100 },
        { "walkTo", point = { pos = { x = di * 320, y = cossinY + 180 } } },
    }
end

local colors = {
    buttonActive = { 0.42, 0, 0.118, 1 },
    buttonInactive = { 0.42, 0, 0.118, 0.25 }
}

local cossin = nil
local cossins = {}

function Title:enter()
    local texturesToFind = { "Bubble_icons" }
    local soundsToFind = { "Poof" }
    for _, grassTile in pairs(grassTiles) do
        table.insert(texturesToFind, grassTile)
    end
    for _, event in pairs(timeline) do
        if event.text then
            table.insert(texturesToFind, event.text)
            table.insert(soundsToFind, event.text)
        end
    end
    for _, sound in pairs(Sound.global) do
        if sound.names then
            for _, name in ipairs(sound.names) do
                table.insert(soundsToFind, name)
            end
        else
            table.insert(soundsToFind, sound.name)
        end
    end
    for _, buisson in pairs(buissons) do
        table.insert(texturesToFind, buisson.name)
    end

    load.crawlFor({
        textures = texturesToFind,
        sounds = soundsToFind,
        data = { "cossin", "gameConstants", "cossinSprite", "particleSprite" }
    })
    self.frame = 0
    self.menuState = "new"
    self.menuActive = false
    self.waitingForEnd = false
    Music:play("Title", true)

    Requests.new(self)

    for i = 1, 4 do
        local someCossin = prefabs.cossin()
        someCossin.pos.x = 0
        someCossin.pos.y = cossinY
        someCossin.pos.z = 0
        someCossin.pos.onGround = true
        someCossin.disabled = true
        for k, v in pairs(someCossin) do
            if fancyTypes[k] then
                someCossin[k] = fancyTypes[k].new(v)
            end
        end
        if i == 1 then
            cossin = someCossin
            someCossin.actor.baseStats.walkSpeed = someCossin.actor.baseStats.walkSpeed * 1.5
            someCossin.actor.playerId = nil
        else
            someCossin.name = "cossin" .. i
            someCossin.actor.playerId = i
            for j, hueRot in ipairs(Game.constants.cossinHues[i - 1]) do
                someCossin.sprites[j].hueRot = hueRot
            end
        end
        table.insert(self.entities, someCossin)
        someCossin.id = #self.entities
        cossins[i] = someCossin
    end
    self.input = { target = cossins[1] }

    self.physics = PhysicsSystem.new()
    self.actors = ActorSystem.new()
    self.sounds = SoundSystem.new()
    self.particles = ParticleSystem.new(Game.constants.particleCount, self.entities)
    Requests.populate(self)

    self:update(0)
    input.playerAddRemoveEnabled = true
end

function Title:exit()
    input.playerAddRemoveEnabled = false
end

function Title:update(dt)
    self.frame = self.frame + 1

    for _, event in ipairs(timeline) do
        if event.frame == self.frame then
            if event.text then
                Sound:start({ name = event.text })
            end
            if event.menu then
                self.menuActive = true
            end
            if event.cossin and cossin.disabled then
                local x = (-CURRES[1] / 2 - 60) / SCALE_TO_EXPECTED
                cossin.disabled = false
                cossin.pos.x = x
                cossin.actor:setMoveFromEvent(event)
            end
        end
    end

    if self.waitingForEnd then
        if not cossin.actor.autoMoveIndex then
            Sound:start(Sound.global.act)
            if self.menuState == "new" then
                Music:fadeout(Title.fadeout)
                StateMachine:change(MapIntro, { map = "Tutorial", nextMap = Game.constants.firstLevel })
            elseif self.menuState == "options" then
                StateMachine:push(Options)
                self.waitingForEnd = false
            elseif self.menuState == "credits" then
                StateMachine:push(Credits)
                self.waitingForEnd = false
            elseif self.menuState == "maps" then
                StateMachine:push(Maps)
                self.waitingForEnd = false
            elseif self.menuState == "quit" then
                Music:fadeout(Title.fadeout)
                StateMachine:change(Exit)
            end
        end
    else
        if self.menuActive and actions.action then
            local button = menu.buttonsByMenuState[self.menuState]
            self.waitingForEnd = true
            cossin.actor:setMoveFromEvent(button.actionMove)
        end

        local menuStatei = nil
        local changedMenuState = false
        for i, button in ipairs(menu.buttons) do
            if self.menuState == button.menuState then
                menuStatei = i
            end
        end

        if actions.previous then
            changedMenuState = true
        end
        if actions.next then
            changedMenuState = true
        end

        if actions.move then
            menuStatei = math.wrap(menuStatei + actions.menu.any, 1, #menu.buttons)
            local button = menu.buttons[menuStatei]
            self.menuState = button.menuState
            Sound:start(actions.menu.any < 0 and Sound.global.up or Sound.global.down)
            cossin.actor:setMoveFromEvent(button.move)
        end

        if actions.action or
            actions.start or
            actions.back or
            actions.move then
            self.menuActive = true
            if cossin.disabled then
                local x = (-CURRES[1] / 2 - 60) / SCALE_TO_EXPECTED
                cossin.disabled = false
                cossin.pos.x = x
                local button = menu.buttonsByMenuState[self.menuState]
                cossin.actor:setMoveFromEvent(button.move)
            end
        end
    end

    for _, player in ipairs(playerActions) do
        local cossin = cossins[player.id]
        if player.id > 1 and self.frame > 60 + player.id * 15 and cossin.disabled then
            cossin.disabled = false
            cossin.pos.x = math.random(-100, 100)
            cossin.pos.y = math.random(-100, 100) + cossinY
            cossin.pos.z = 2000
        end
    end
    for _, cossin in ipairs(cossins) do
        if cossin.actor.playerId and not playerActionsById[cossin.actor.playerId] and not cossin.disabled then
            self.particles:emit(0, cossin, cossin.particleEmitter.triggers.poof)
            cossin.disabled = true
            Sound:start({ name = "Poof" })
        end
    end

    -- No auto-refresh, only manual refresh
    -- Title screen does not do a full load, and auto-refresh thinks unloaded files are new files.
    -- Oops!
    if actions.refresh then
        StateMachine:change(Title, nil, { fadeout = 15, fadein = 15 })
    end

    local framePart = 1
    for _, entity in self:iterEntities(self.entitiesByComponent.anim) do
        entity.anim:update(dt, entity.sprites)
    end
    for _, entity in ipairs(self.entities) do
        self.physics:handleCreation(entity)
    end
    self.physics:update(framePart, dt, self)
    self.actors:update(framePart, dt, self)
    self.particles:update(framePart, dt, self)
    self.sounds:update(framePart, dt, self)
end

function Title:iterEntities(table)
    table = table or self.entities
    return Game.entityIterator, table, 1
end

function Title:findPoint(designation)
    return Game.findPoint(self, designation)
end

function Title:render()
    local w, h = unpack(CURRES)
    love.graphics.setCanvas(SCREEN_CANVAS)
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(SCALE_TO_EXPECTED)
    love.graphics.clear(bgcol)
    love.graphics.setShader(TITLE_SHADER)
    TITLE_SHADER:send("hue", -1)
    TITLE_SHADER:send("hueRot", 0)
    for _, tile in ipairs(bgGrassTiles) do
        love.graphics.draw(textures[tile.name], tile.x, tile.y)
    end
    for _, event in ipairs(timeline) do
        if self.frame >= event.frame and event.text then
            local texture = textures[event.text]
            local tw, th = texture:getWidth(), texture:getHeight()
            local animPart = math.min((self.frame - event.frame) / textScale.frames, 1) ^ 0.5
            animPart = 0.5 * (1 - math.cos(animPart * 1.2 * math.pi))
            animPart = animPart / (0.5 * (1 - math.cos(1.2 * math.pi)))
            animPart = animPart * (1 + math.sin((self.frame - event.frame) * math.pi / 120) / 100)
            love.graphics.draw(
                texture,
                event.pos.x - tw / 2,
                event.pos.y - th / 2,
                0,
                textScale.from + (textScale.to - textScale.from) * animPart,
                textScale.from + (textScale.to - textScale.from) * animPart)
        end
    end

    if self.menuActive then
        love.graphics.push()
        love.graphics.translate(menu.pos.x, menu.pos.y)
        love.graphics.scale(1 / SCALE_TO_EXPECTED)
        love.graphics.setFont(fonts.menu)

        local margin = menu.margin * SCALE_TO_EXPECTED
        local menuWidth = -margin
        for _, button in ipairs(menu.buttons) do
            button.width = fonts.menu:getWidth(button.text)
            menuWidth = menuWidth + margin + button.width
        end
        love.graphics.translate(-menuWidth / 2, 0)

        local x = 0
        for _, button in ipairs(menu.buttons) do
            local menuState = button.menuState
            local color = self.menuState == menuState and
                colors.buttonActive or
                colors.buttonInactive
            love.graphics.setColor(unpack(color))
            love.graphics.print(button.text, x, 0)
            x = x + margin + button.width
            love.graphics.setColor(1, 1, 1, 1)
        end

        love.graphics.pop()
    end

    for _, entity in self:iterEntities(self.entities) do
        if entity.shadow then
            love.graphics.setColor(
                Game.constants.shadowColor[1] * bgcol[1],
                Game.constants.shadowColor[2] * bgcol[2],
                Game.constants.shadowColor[3] * bgcol[3],
                1)
            Game:drawEntityShadow(entity)
            love.graphics.setColor(1, 1, 1, 1)
        end
    end

    table.sort(self.entities, function (a, b) return a.pos.y < b.pos.y end)
    for i, entity in ipairs(self.entities) do
        entity.drawOrder = i
    end
    for _, entity in self:iterEntities(self.entities) do
        for _, sprite in ipairs(entity.sprites) do
            local doTheHue = sprite.hueRot
            if doTheHue then
                local hueRot = entity.hueRot * (sprite.hueMult or 1) + (sprite.hueRot or 0)
                TITLE_SHADER:send("hueRot", hueRot)
            end
            Game.drawEntitySprite(self, entity, sprite)
            if doTheHue then
                TITLE_SHADER:send("hueRot", 0)
            end
        end
    end

    love.graphics.setShader()

    for _, buisson in pairs(buissons) do
        local animPart = math.min(self.frame / buisson.animFrames, 1) ^ 0.25
        animPart = 0.5 * (1 - math.cos(animPart * math.pi))
        local x, y = love.graphics.inverseTransformPoint(w * buisson.anchor.x, h * buisson.anchor.y)
        local texture = textures[buisson.name]
        local tw, th = texture:getWidth(), texture:getHeight()
        love.graphics.draw(
            texture,
            x + animPart * buisson.animOffset.x,
            y + animPart * buisson.animOffset.y,
            0,
            1,
            1,
            tw * buisson.anchor.x,
            th * buisson.anchor.y)
    end

    love.graphics.reset()
    local blur = math.max(30 - self.frame, 0) / (30 / Game.constants.pause.blur) -- Sketch, from 8 to 0
    SET_SCREEN_SHADER_BLUR(#StateMachine.stack > 0 and Game.constants.pause.blur or blur)
    love.graphics.draw(SCREEN_CANVAS)
    love.graphics.setShader()

    if #StateMachine.stack > 0 then
        local w, h = CURRES[1], CURRES[2]
        love.graphics.setColor(unpack(Game.constants.pauseColor))
        love.graphics.setBlendMode("multiply", "premultiplied")
        love.graphics.rectangle("fill", 0, 0, w, h)
        love.graphics.setBlendMode("alpha")
        love.graphics.setColor(1, 1, 1, 1)
    end
end

function Title:getEntityDrawOrder(entity)
    return entity.pos.y
end

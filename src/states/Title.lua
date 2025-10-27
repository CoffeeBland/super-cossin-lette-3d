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
            sound = "Step",
            pitch = 1.3,
            move = {
                "hello",
                { "walkTo", point = { pos = { x = -140, y = cossinY + 20 } } },
                { "jump", jumpSpeed = 100 },
                { "walkTo", point = { pos = { x = -230, y = cossinY + 60 } } },
                { "lookAt", point = { pos = { x = -230, y = cossinY + 70 } } }
            },
            actionMove = {
                "hello",
                { "walkTo", point = { pos = { x = -260, y = cossinY + 60 } } },
                { "jump", jumpSpeed = 100 },
                { "walkTo", point = { pos = { x = -260, y = cossinY + 180 } } },
            }
        },
        {
            text = "OPTIONS",
            menuState = "options",
            sound = "Step",
            pitch = 1.0,
            move = {
                "hello",
                { "walkTo", point = { pos = { x = 0, y = cossinY + 20 } } },
                { "jump", jumpSpeed = 100 },
                { "walkTo", point = { pos = { x = 0, y = cossinY + 60 } } },
                { "lookAt", point = { pos = { x = 0, y = cossinY + 70 } } }
            },
            actionMove = {
                "hello",
                { "walkTo", point = { pos = { x = 0, y = cossinY + 60 } } },
                { "jump", jumpSpeed = 100 },
                { "walkTo", point = { pos = { x = 0, y = cossinY + 180 } } },
            }
        },
        {
            text = "SE RECOUCHER",
            menuState = "quit",
            sound = "Step",
            pitch = 0.6,
            move = {
                "hello",
                { "walkTo", point = { pos = { x = 140, y = cossinY + 20 } } },
                { "jump", jumpSpeed = 100 },
                { "walkTo", point = { pos = { x = 230, y = cossinY + 60 } } },
                { "lookAt", point = { pos = { x = 230, y = cossinY + 70 } } }
            },
            actionMove = {
                "hello",
                { "walkTo", point = { pos = { x = 260, y = cossinY + 60 } } },
                { "jump", jumpSpeed = 100 },
                { "walkTo", point = { pos = { x = 260, y = cossinY + 180 } } },
            }
        }
    },
    buttonsByMenuState = {}
}

for _, button in ipairs(menu.buttons) do
    menu.buttonsByMenuState[button.menuState] = button
end

local colors = {
    buttonActive = { 0.42, 0, 0.118, 1 },
    buttonInactive = { 0.42, 0, 0.118, 0.25 }
}

function Title:enter()
    local texturesToFind = { "Bubble_icons" }
    local soundsToFind = {}
    for _, grassTile in pairs(grassTiles) do
        table.insert(texturesToFind, grassTile)
    end
    for _, event in pairs(timeline) do
        if event.text then
            table.insert(texturesToFind, event.text)
            table.insert(soundsToFind, event.text)
        end
    end
    for _, button in pairs(menu.buttons) do
        table.insert(soundsToFind, button.sound)
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

    local cossin = prefabs.cossin()
    cossin.actor.walkSpeed = cossin.actor.walkSpeed * 1.5
    cossin.pos.x = 0
    cossin.pos.y = cossinY
    cossin.pos.z = 0
    cossin.pos.onGround = true
    cossin.disabled = true
    for k, v in pairs(cossin) do
        if fancyTypes[k] then
            cossin[k] = fancyTypes[k].new(v)
        end
    end
    table.insert(self.entities, cossin)
    cossin.id = 1

    self.physics = PhysicsSystem.new()
    self.actors = ActorSystem.new()
    self.sounds = SoundSystem.new()
    self.particles = ParticleSystem.new(Game.constants.particleCount, self.entities)
    Requests.populate(self)

    self:update(0)
end

function Title:exit()
end

function Title:update(dt)
    self.frame = self.frame + 1

    for _, event in ipairs(timeline) do
        if event.frame == self.frame then
            if event.text then
                local source = sounds[event.text]
                love.audio.play(source)
            end
            if event.menu then
                self.menuActive = true
            end
            if event.cossin and self.entitiesByName.cossin.disabled then
                local w = love.graphics:getDimensions()
                self.entitiesByName.cossin.disabled = false
                self.entitiesByName.cossin.pos.x = - (w + 60)
                self.entitiesByName.cossin.actor:setMoveFromEvent(event)
            end
        end
    end

    if self.waitingForEnd then
        if not self.entitiesByName.cossin.actor.autoMoveIndex then
            if self.menuState == "new" then
                Music:fadeout(Title.fadeout)
                StateMachine:change(MapIntro, { map = Game.constants.firstLevel })
            elseif self.menuState == "options" then
                StateMachine:push(Options)
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
            self.entitiesByName.cossin.actor:setMoveFromEvent(button.actionMove)
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
            menuStatei = math.clamp(menuStatei + math.sign(actions.movement.x), 1, #menu.buttons)
            local button = menu.buttons[menuStatei]
            self.menuState = button.menuState
            local source = sounds[button.sound]
            source:setPitch(button.pitch)
            source:stop()
            love.audio.play(source)
            self.entitiesByName.cossin.actor:setMoveFromEvent(button.move)
        end

        if actions.action or actions.escape or actions.move then
            self.menuActive = true
            if self.entitiesByName.cossin.disabled then
                local w = love.graphics:getDimensions()
                self.entitiesByName.cossin.disabled = false
                self.entitiesByName.cossin.pos.x = - (w + 60)
                local button = menu.buttonsByMenuState[self.menuState]
                self.entitiesByName.cossin.actor:setMoveFromEvent(button.move)
            end
        end
    end

    local framePart = 1
    for _, entity in self:iterEntities(self.entitiesByComponent.anim) do
        entity.anim:update(dt, entity.sprites)
    end
    self.physics:handleCreation(self.entitiesByName.cossin)
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
    love.graphics.translate(w / 2, h / 2)
    love.graphics.scale(SCALE_TO_EXPECTED)
    love.graphics.clear(unpack(bgcol))
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
    for _, entity in self:iterEntities(self.entities) do
        Game:drawEntitySprites(entity)
    end

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
end

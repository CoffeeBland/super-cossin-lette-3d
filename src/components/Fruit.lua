FruitSystem = {}
FruitSystem.__index = FruitSystem

function FruitSystem.new()
    return setmetatable({}, FruitSystem)
end

function FruitSystem:handleCreation(entity)
    if entity.disabled then
        if entity.fruitStack then
            entity.fruitStack.sensor = nil
        end
        if entity.picnic then
            entity.picnic.sensor = nil
        end
    end

    if entity.physics then
        if entity.fruitStack and not entity.fruitStack.sensor then
            local shape = love.physics.newUIUIShape(entity.fruitStack.pickupRange / 2)
            local sensor = entity.physics:newSensor(shape, 0) -- TODO ISH
            sensor:setCategory(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
            entity.fruitStack.sensor = sensor
        end

        if entity.picnic and not entity.picnic.sensor then
            local shape = love.physics.newUIUIShape(entity.picnic.dropRange / 2)
            local sensor = entity.physics:newSensor(shape, 0)
            sensor:setCategory(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
            entity.picnic.sensor = sensor
        end
    end
end

function FruitSystem:update(framePart, dt, game)
    game.vars.remainingFruits = 0

    -- FRUIT STACK
    for _, entity in game:iterEntities(game.entitiesByComponent.fruitStack) do
        if #entity.fruitStack.fruits > 0 then
            if not entity.fruitStack.cooldown then
                entity.fruitStack.cooldown = entity.fruitStack.eatCooldown
            elseif entity.fruitStack.cooldown > 0 then
                local lessThanHalfWay = entity.fruitStack.cooldown > entity.fruitStack.eatCooldown / 2
                entity.fruitStack.cooldown = math.max(entity.fruitStack.cooldown - framePart, 0)
                if entity.fruitStack.halfEatIndicator and
                    entity.fruitStack.cooldown <= entity.fruitStack.eatCooldown / 2 and
                    lessThanHalfWay
                then
                    entity.bubble:show(game, entity.fruitStack.halfEatIndicator, entity.anim)
                end
            end
        end

        if entity.fruitStack.cooldown and
            entity.fruitStack.cooldown <= 0 and
            entity.anim:highestPriority() < Anim.priorities.jump
        then
            entity.anim:request("eat")
            entity.fruitStack.cooldown = BIG_NUMBER
        end

        if entity.anim:isTriggered("throwFruit") then
            for _, fruitEntity in ipairs(entity.fruitStack.fruits) do
                fruitEntity.velocity.z =
                    entity.fruitStack.pickupJumpSpeed *
                    Game.constants.jumpMultiplier
            end
        end

        if entity.anim:isTriggered("eatFruit") then
            local eaten = entity.fruitStack.fruits[1]
            if eaten then
                game.vars.eaten = game.vars.eaten + 1
                entity.anim.baseWiggle.x = entity.anim.baseWiggle.x + entity.fruitStack.sizePerFruit
                entity.anim.baseWiggle.y = entity.anim.baseWiggle.y + entity.fruitStack.sizePerFruit
                entity.fruitStack.firstOffset.z = entity.fruitStack.firstOffset.z +
                    (entity.fruitStack.firstOffset.z + entity.pos.height) * entity.fruitStack.sizePerFruit
                if entity.actor then
                    entity.actor.baseStats.mass = entity.actor.baseStats.mass + (eaten.fruit.mass or 0)
                    if eaten.fruit.buff then
                        entity.actor:buff(eaten.fruit.buff, eaten.fruit.buffDuration)
                    end
                end
                entity.anim:startWiggle(entity.fruitStack.eatWiggleAmplitude, entity.fruitStack.eatWiggleFrames)
                eaten.disabled = true
                table.remove(entity.fruitStack.fruits, 1)
                table.insert(entity.fruitStack.eaten, eaten.fruit.type)
                local nextFruitEntity = entity.fruitStack.fruits[1]
                if nextFruitEntity then
                    nextFruitEntity.fruit.stackEntity = entity
                    nextFruitEntity.fruit.offset = self:getStackOffset(entity, true)
                end
            end
        end

        if #entity.fruitStack.fruits == 0 or entity.anim:isTriggered("eat:finished") then
            entity.fruitStack.cooldown = nil
        end

        for _, other in ipairs(game.physics:getAllOverlappingOfType(
            entity.fruitStack.sensor,
            nil, -- type
            nil, -- pos
            "fruit"))
        do
            self:checkFruitPickup(entity, other)
        end

        game.vars.remainingFruits = game.vars.remainingFruits + #entity.fruitStack.fruits
    end

    -- PICNIC
    for _, entity in game:iterEntities(game.entitiesByComponent.picnic) do
        if entity.picnic.dropFrames then
            entity.picnic.dropFrames = math.max(entity.picnic.dropFrames - framePart, 0)
        end

        for _, otherEntity in ipairs(game.physics:getAllOverlappingOfType(
            entity.picnic.sensor,
            nil, -- type
            nil, -- pos
            "fruitStack"))
        do
            if otherEntity.fruitStack.picnicAction == "drop" and
                #otherEntity.fruitStack.fruits > 0
            then
                otherEntity.velocity.z = entity.picnic.stackDropJumpSpeed * Game.constants.jumpMultiplier
                otherEntity.physics.body:setLinearVelocity(0, 0)
                local dropPoints = love.physics.sampleShape(
                    entity.physics.shape,
                    #otherEntity.fruitStack.fruits)
                for i = #otherEntity.fruitStack.fruits, 1, -1 do
                    local fruitEntity = otherEntity.fruitStack.fruits[i]
                    otherEntity.fruitStack.fruits[i] = nil
                    otherEntity.fruitStack.cooldown = nil
                    otherEntity.anim:release("eat")

                    fruitEntity.fruit.stackEntity = entity
                    fruitEntity.fruit.animFrames = entity.picnic.pickupAnimFrames
                    fruitEntity.fruit.offset = {
                        x = dropPoints[(i - 1) * 2 + 1],
                        y = dropPoints[(i - 1) * 2 + 2],
                        z = 0
                    }
                    fruitEntity.fruit.reachedStack = false
                    fruitEntity.fruit.cooldown = nil
                    fruitEntity.velocity.z = entity.picnic.pickupJumpSpeed * Game.constants.jumpMultiplier
                    table.insert(entity.picnic.fruits, fruitEntity)
                    game.vars.picnicFruits = #entity.picnic.fruits
                end
            elseif otherEntity.fruitStack.picnicAction == "pickup" and
                #entity.picnic.fruits > 0 and
                (not entity.picnic.dropFrames or entity.picnic.dropFrames == 0)
            then
                entity.picnic.dropFrames = entity.picnic.dropCooldown
                local i = math.random(#entity.picnic.fruits)
                local fruitEntity = entity.picnic.fruits[i]
                table.remove(entity.picnic.fruits, i)
                game.vars.picnicFruits = #entity.picnic.fruits
                self:fruitPickup(otherEntity, fruitEntity)
            end
        end
    end

    -- FRUIT
    for _, entity in game:iterEntities(game.entitiesByComponent.fruit) do
        if entity.fruit.animFrames then
            local prevX = entity.pos.x
            local prevY = entity.pos.y
            local prevZ = entity.pos.z

            local parentEntity = entity.fruit.stackEntity
            local stackRootEntity = parentEntity
            while stackRootEntity.fruit and stackRootEntity.fruit.stackEntity do
                stackRootEntity = stackRootEntity.fruit.stackEntity
            end
            local targetX = parentEntity.pos.x + entity.fruit.offset.x
            local targetY = parentEntity.pos.y + entity.fruit.offset.y
            local offsetZ = entity.fruit.offset.z * (parentEntity.anim and parentEntity.anim.baseWiggle.y or 1)
            local targetZ = parentEntity.pos.z + parentEntity.pos.height + offsetZ

            if entity.fruit.animFrames > 0 then
                entity.physics.body:setPosition(
                    math.interp(entity.fruit.animFrames, entity.pos.x, targetX),
                    math.interp(entity.fruit.animFrames, entity.pos.y, targetY))
                entity.fruit.animFrames = entity.fruit.animFrames - framePart
                if entity.pos.z > targetZ then
                    entity.fruit.reachedStack = true
                end
            else
                local pickupForce = stackRootEntity.fruitStack and stackRootEntity.fruitStack.pickupForce or 1
                pickupForce = pickupForce ^ dt
                entity.physics.body:setPosition(
                    entity.pos.x * (1 - pickupForce) + targetX * pickupForce,
                    entity.pos.y * (1 - pickupForce) + targetY * pickupForce)
            end
            if (entity.fruit.animFrames <= 0 or entity.fruit.reachedStack) and entity.pos.z <= targetZ then
                entity.pos.z = targetZ
                entity.velocity.z = math.max(entity.velocity.z, 0)
                entity.pos.floorZ = targetZ
                entity.pos.floorEntity = parentEntity
            end

            if stackRootEntity.fruitStack then
                self:checkFruitDrop(entity, stackRootEntity, game, prevX, prevY, prevZ)
            end
        else
            game.vars.remainingFruits = game.vars.remainingFruits + 1
        end
        if entity.fruit.cooldown then
            entity.fruit.cooldown = entity.fruit.cooldown - framePart
            if entity.fruit.cooldown < 0 then
                entity.fruit.cooldown = nil
            end
        end
    end
end

function FruitSystem:checkFruitPickup(fruitStackEntity, fruitEntity)
    if fruitEntity.fruit.stackEntity or fruitEntity.fruit.cooldown then
        return
    end

    local dx = fruitStackEntity.pos.x - fruitEntity.pos.x
    local dy = fruitStackEntity.pos.y - fruitEntity.pos.y
    local dz = fruitStackEntity.pos.z - fruitEntity.pos.z
    local d = math.sqrt(math.pow(dx, 2) + math.pow(dy, 2) + math.pow(dz, 2))
    if d > fruitStackEntity.fruitStack.pickupRange then
        return
    end
    self:fruitPickup(fruitStackEntity, fruitEntity)
end

function FruitSystem:getStackOffset(entity, first)
    return first and
        entity.fruitStack.firstOffset or
        entity.fruitStack.otherOffset
end

function FruitSystem:fruitPickup(fruitStackEntity, fruitEntity)
    local stackEntityVelocity = fruitStackEntity or EMPTY
    table.insert(fruitStackEntity.fruitStack.fruits, fruitEntity)
    fruitEntity.fruit.stackEntity = #fruitStackEntity.fruitStack.fruits > 1 and
        fruitStackEntity.fruitStack.fruits[#fruitStackEntity.fruitStack.fruits - 1] or
        fruitStackEntity
    fruitEntity.fruit.animFrames = fruitStackEntity.fruitStack.pickupAnimFrames
    fruitEntity.fruit.offset = self:getStackOffset(fruitStackEntity, fruitEntity.fruit.stackEntity == fruitStackEntity)
    fruitEntity.fruit.reachedStack = false
    fruitEntity.physics.body:setType("static")
    fruitEntity.velocity.z =
        math.max(stackEntityVelocity.z or 0, fruitStackEntity.fruitStack.pickupJumpSpeed) *
        math.pow(#fruitStackEntity.fruitStack.fruits, 1/4) *
        Game.constants.jumpMultiplier
end

function FruitSystem:checkFruitDrop(entity, stackRootEntity, game, prevX, prevY, prevZ)
    for _, otherEntity in ipairs(game.physics:getAllOverlappingOfType(
        entity.physics.heightSensor,
        HEIGHT_SENSOR,
        entity.pos))
    do
        if FruitSystem.shouldEntitiesContact(entity, otherEntity) then
            entity.pos.x = prevX
            entity.pos.y = prevY
            entity.pos.z = prevZ
            entity.physics.body:setPosition(entity.pos.x, entity.pos.y)
            for i = #stackRootEntity.fruitStack.fruits, 1, -1 do
                local fruitEntity = stackRootEntity.fruitStack.fruits[i]
                stackRootEntity.fruitStack.fruits[i] = nil

                local dir = math.random() * math.pi * 2
                local dx = math.cos(dir) * stackRootEntity.fruitStack.dropForce
                local dy = math.sin(dir) * stackRootEntity.fruitStack.dropForce
                fruitEntity.fruit.stackEntity = nil
                fruitEntity.fruit.animFrames = nil
                fruitEntity.fruit.reachedStack = false
                fruitEntity.fruit.cooldown = stackRootEntity.fruitStack.dropCooldown
                fruitEntity.velocity.z = stackRootEntity.fruitStack.dropJumpSpeed * Game.constants.jumpMultiplier
                fruitEntity.physics.body:setType("dynamic")
                fruitEntity.physics.body:setLinearDamping(0)
                fruitEntity.physics.body:applyLinearImpulse(dx, dy)
                fruitEntity.pos.onGround = false
                fruitEntity.pos.floorEntity = nil

                if fruitEntity == entity then
                    return
                end
            end
        end
    end
end

function FruitSystem.shouldEntitiesContact(e1, e2)
    -- Not ideal, not gonna lie.
    return not ((e1.fruit or e1.fruitStack) and (e2.fruit or e2.fruitStack))
end

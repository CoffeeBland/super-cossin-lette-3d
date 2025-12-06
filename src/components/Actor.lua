ActorSystem = {}
ActorSystem.__index = ActorSystem

function ActorSystem.new()
    return setmetatable({}, ActorSystem)
end

function ActorSystem:update(framePart, dt, game)
    for _, entity in game:iterEntities(game.entitiesByComponent.actor) do
        local actionsForActor = nil
        -- The sketch, the sketch, the skeeeeeetch
        if game.input and game.input.target and entity.actor.playerId then
            actionsForActor = playerActionsById[entity.actor.playerId]
        end
        entity.actor:update(framePart, game, entity, actionsForActor)
    end
    for _, entity in game:iterEntities(game.entitiesByComponent.bubble) do
        entity.bubble:update(framePart, game, entity.anim)
    end
    for _, entity in game:iterEntities(game.entitiesByComponent.larp) do
        entity.larp:update(framePart, entity)
    end
end

Actor = {}
Actor.__index = Actor
fancyTypes.actor = Actor

function Actor.new(params)
    params = params or EMPTY
    local instance = setmetatable({}, Actor)
    instance.baseStats = {
        walkSpeed = params.walkSpeed or 0,
        slidingSpeed = params.slidingSpeed or 0,
        airSpeed = params.airSpeed or 0,
        jumpSpeed = params.jumpSpeed or 0,
        mass = params.mass or 1,
        hueRot = params.hueRot or 0
    }
    instance.playerId = params.playerId
    instance.stats = {}
    instance.buffs = {}
    instance.autoActions = { movement = { x = 0, y = 0, angle = nil }, jump = false }
    instance.autoMoves = {}
    instance.autoMoveIndex = nil
    instance:computeStats()
    return instance
end

function Actor:buff(buff, duration)
    self.buffs[buff] = (self.buffs[buff] or 0) + duration
end

local _statsToClear = {}

function Actor:computeStats(framePart)
    framePart = framePart or 0

    for stat, _ in pairs(self.baseStats) do
        _statsToClear[stat] = true
    end
    for buffName, _ in pairs(self.buffs) do
        local buff = Game.constants.buffs[buffName]
        for stat, modification in pairs(buff.stats) do
            if modification.applied == "frame" then
                _statsToClear[stat] = false
            end
        end
    end
    for stat, value in pairs(self.baseStats) do
        if _statsToClear[stat] then
            self.stats[stat] = value
        end
    end
    for buffName, _ in pairs(self.buffs) do
        local buff = Game.constants.buffs[buffName]
        for stat, modification in pairs(buff.stats) do
            if modification.type == "*" then
                self.stats[stat] = self.stats[stat] * modification.value
            elseif modification.type == "+" then
                self.stats[stat] = self.stats[stat] + modification.value
            end
        end
    end
end

function Actor:processMove(framePart, game, nextMove, entity, actions)
    local pos = entity.pos
    local anim = entity.anim
    local velocity = entity.velocity
    local physics = entity.physics
    local type = nextMove[1]
    if type == "lookAt" then
        local x, y = game:findPoint(nextMove.point)
        anim:setAngle(math.atan2(y - pos.y, x - pos.x))
        return true
    elseif type == "jump" then
        actions.jump = false
        self.autoJumped = self.autoJumped or false
        if self.autoJumped then
            self.autoJumped = nil
            return true
        elseif pos.onGround then
            actions.jump = nextMove.jumpSpeed
            self.autoJumped = true
        end
    elseif type == "walkTo" then
        local x, y = game:findPoint(nextMove.point)
        local dx, dy = x - pos.x, y - pos.y
        self.autoWalkJumpFrames = self.autoWalkJumpFrames or Game.constants.autoWalkJumpFrames
        self.autoWalkCutoffFrames = self.autoWalkCutoffFrames or Game.constants.autoWalkCutoffFrames
        if dx^2 + dy^2 > Game.constants.autoWalkCutoffDistance2 and self.autoWalkCutoffFrames > 0 then
            actions.movement.angle = math.atan2(dy, dx)
            actions.movement.x = math.cos(actions.movement.angle)
            actions.movement.y = math.sin(actions.movement.angle)
            actions.jump = self.autoWalkJumpFrames == 0
            if actions.jump then
                self.autoWalkJumpFrames = Game.constants.autoWalkJumpFrames
            else
                self.autoWalkJumpFrames = math.max(self.autoWalkJumpFrames - framePart, 0)
            end
            self.autoWalkCutoffFrames = math.max(self.autoWalkCutoffFrames - framePart, 0)
        else
            physics.body:setPosition(x, y)
            physics.body:setLinearVelocity(0, 0)
            pos.x, pos.y = x, y
            if entity.water then
                entity.water.remainingDrownFrames = nil
                entity.anim:release("drown")
            end
            if self.autoWalkCutoffFrames == 0 then
                pos.z = pos.y - 1000
            end
            self.autoWalkJumpFrames = nil
            self.autoWalkCutoffFrames = nil
            self.autoActions.movement.x = 0
            self.autoActions.movement.y = 0
            self.autoActions.movement.angle = nil
            self.autoActions.jump = false
            return true
        end
    elseif type == "waitFrames" then
        self.waitFrames = self.waitFrames or nextMove[2]
        if self.waitFrames > 0 then
            self.waitFrames = math.max(self.waitFrames - framePart, 0)
        else
            self.waitFrames = nil
            return true
        end
    end
end

function Actor:update(framePart, game, entity, actions)
    if self.autoMoveIndex then
        actions = self.autoActions
        local nextMove = self.autoMoves[self.autoMoveIndex + 1]
        while nextMove and self:processMove(framePart, game, nextMove, entity, actions) do
            self.autoMoveIndex = self.autoMoveIndex + 1
            nextMove = self.autoMoves[self.autoMoveIndex + 1]
        end
        if not nextMove then
            self.autoMoveIndex = nil
        end
    end

    for buffName, duration in pairs(self.buffs) do
        if duration == 0 then
            self.buffs[buffName] = nil
        end
    end
    for buffName, duration in pairs(self.buffs) do
        self.buffs[buffName] = math.max(duration - framePart, 0)
    end
    entity.hueRot = self.stats.hueRot % 1.0

    self:computeStats(framePart)

    actions = actions or self.autoActions
    local pos = entity.pos
    local anim = entity.anim
    local velocity = entity.velocity
    local physics = entity.physics

    pos.sliding = false
    if actions.movement.angle then
        anim:setAngle(actions.movement.angle)
    end
    if pos.onGround and anim:highestPriority() <= Anim.priorities.squish then
        if actions.jump then
            local jumpSpeed = type(actions.jump) == "number" and actions.jump or self.stats.jumpSpeed
            velocity.z = velocity.z + jumpSpeed * Game.constants.jumpMultiplier / self.stats.mass
            pos.onGround = false
        end
        pos.sliding = actions.prejump
        anim:toggle("squish", actions.prejump)
    else
        anim:release("squish")
    end
    anim:toggle("jump", not pos.onGround)
    if actions.movement.angle and anim:highestPriority() <= Anim.priorities.jump then
        local speed = (pos.sliding and self.stats.slidingSpeed) or
            (pos.onGround and self.stats.walkSpeed) or
            self.stats.airSpeed or
            0
        local dx = speed * actions.movement.x * Game.constants.speedMultiplier / self.stats.mass
        local dy = speed * actions.movement.y * Game.constants.speedMultiplier / self.stats.mass
        physics.body:applyForce(dx, dy)

        anim:release("idle")
        anim:request("walk")
    else
        anim:release("walk")
        anim:request("idle")
    end
end

function Actor:setMoveFromEvent(event)
    self.autoMoveIndex = 0
    for i = 2, #event do
        self.autoMoves[i - 1] = event[i]
    end
    for i = #event, #self.autoMoves do
        self.autoMoves[i] = nil
    end
end

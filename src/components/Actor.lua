ActorSystem = {}
ActorSystem.__index = ActorSystem

function ActorSystem.new()
    return setmetatable({}, ActorSystem)
end

function ActorSystem:update(framePart, dt, game)
    for _, entity in game:iterEntities(game.entitiesByComponent.actor) do
        local actionsForActor = game.input and game.input.target == entity and actions or nil
        entity.actor:update(framePart, game, entity, actionsForActor)
    end
    for _, entity in game:iterEntities(game.entitiesByComponent.bubble) do
        entity.bubble:update(framePart, entity.anim)
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
    instance.walkSpeed = params.walkSpeed or 0
    instance.slidingSpeed = params.slidingSpeed or 0
    instance.airSpeed = params.airSpeed or 0
    instance.jumpSpeed = params.jumpSpeed or 0
    instance.mass = params.mass or 1
    instance.autoActions = { movement = { x = 0, y = 0, angle = nil }, jump = false }
    instance.autoMoves = {}
    instance.autoMoveIndex = nil
    return instance
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
        if pos.onGround then
            if self.autoJumped then
                self.autoJumped = nil
                return true
            else
                actions.jump = nextMove.jumpSpeed
                self.autoJumped = true
            end
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
                local _, topy = love.graphics.inverseTransformPoint(0, 0)
                pos.z = pos.y - topy
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
            local jumpSpeed = type(actions.jump) == "number" and actions.jump or self.jumpSpeed
            velocity.z = velocity.z + jumpSpeed * Game.constants.jumpMultiplier / self.mass
            pos.onGround = false
        end
        pos.sliding = actions.prejump
        anim:toggle("squish", actions.prejump)
    else
        anim:release("squish")
    end
    anim:toggle("jump", not pos.onGround)
    if actions.movement.angle and anim:highestPriority() <= Anim.priorities.jump then
        local speed = (pos.sliding and self.slidingSpeed) or
            (pos.onGround and self.walkSpeed) or
            self.airSpeed or
            0
        local dx = speed * actions.movement.x * Game.constants.speedMultiplier / self.mass
        local dy = speed * actions.movement.y * Game.constants.speedMultiplier / self.mass
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

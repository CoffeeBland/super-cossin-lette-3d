Actor = {}
Actor.__index = Actor

function Actor.new(params)
    local instance = setmetatable(params, Actor)
    instance.autoActions = { movement = { x = 0, y = 0, angle = nil }, jump = false }
    instance.autoWalkTo = nil
    instance.autoWalkJumpFrames = 0
    instance.autoWalkCutoffFrames = 0
    instance.autoWalkCutoffDistance2 = 100
    return instance
end

function Actor:update(framePart, pos, velocity, physics, actions, anim)
    if self.autoWalkTo then
        actions = self.autoActions
        local dx, dy = self.autoWalkTo.y - pos.y, self.autoWalkTo.x - pos.x
        if dx^2 + dy^2 > self.autoWalkCutoffDistance2 and self.autoWalkCutoffFrames > 0 then
            actions.movement.angle = math.atan2(dx, dy)
            actions.jump = self.autoWalkJumpFrames == 0
            if actions.jump then
                self.autoWalkJumpFrames = 60
            else
                self.autoWalkJumpFrames = math.max(self.autoWalkJumpFrames - framePart, 0)
            end
            self.autoWalkCutoffFrames = math.max(self.autoWalkCutoffFrames - framePart, 0)
        else
            physics.body:setPosition(self.autoWalkTo.x, self.autoWalkTo.y)
            pos.x, pos.y = self.autoWalkTo.x, self.autoWalkTo.y
            anim:trigger("walkToPoint:finished")
            self.autoWalkTo = nil
            self.autoWalkJumpFrames = 0
            self.autoWalkCutoffFrames = 0
            self.autoActions.movement.angle = nil
            self.autoActions.jump = false
        end
    end

    actions = actions or self.autoActions

    pos.sliding = false
    if actions.movement.angle then
        -- RIP
        local a = math.floor(actions.movement.angle / math.pi * 4 + 0.5) + 4
        anim.dir = DIRS[a];
    end
    if pos.onGround and anim:highestPriority() <= Anim.priorities.squish then
        if actions.jump then
            velocity.z =
                velocity.z +
                self.jumpSpeed * Game.constants.jumpMultiplier
            pos.onGround = false
        end
        pos.sliding = actions.prejump
        anim:toggle("squish", actions.prejump)
    end
    anim:toggle("jump", not pos.onGround)
    if actions.movement.angle and anim:highestPriority() <= Anim.priorities.jump then
        local speed = (pos.sliding and self.slidingSpeed) or
            (pos.onGround and self.walkSpeed) or
            self.airSpeed or
            0
        local dx = speed * math.cos(actions.movement.angle) * Game.constants.speedMultiplier
        local dy = speed * math.sin(actions.movement.angle) * Game.constants.speedMultiplier
        physics.body:applyForce(dx, dy)

        anim:release("idle")
        anim:request("walk")
    else
        anim:release("walk")
        anim:request("idle")
    end
end

function Actor:walkToPoint(point)
    self.autoWalkTo = point
    self.autoWalkJumpFrames = 0
    self.autoWalkCutoffFrames = 600
end

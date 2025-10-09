TimerSystem = {}
TimerSystem.__index = TimerSystem

function TimerSystem.new()
    return setmetatable({
        endTriggered = false,
        frames = nil,
        lastTimeWarning = nil
    }, TimerSystem)
end

function TimerSystem:start(time)
    self.frames = (time or Game.constants.defaultLevelTimer) * 60
    self.totalFrames = self.frames
end

function TimerSystem:update(framePart, dt, game)
    if (game.vars.remainingFruits == 0 or actions.gogogadget or self.frames == 0) and not self.endTriggered then
        self.endTriggered = true
        self.frames = nil
        game.event:execute(Game.constants.endLevelCutscene)
    end

    if self.frames then
        self:checkForWarning(game)
        self.frames = math.max(self.frames - framePart, 0)
    end
end

function TimerSystem:checkForWarning(game)
    local time = self.frames / self.totalFrames
    for _, warning in ipairs(Game.constants.timeWarnings) do
        if (not self.lastTimeWarning or warning.time < self.lastTimeWarning) and time <= warning.time then
            local cossin = game.entitiesByName.cossin
            cossin.bubble:show(game, warning.text, cossin.anim)
            self.lastTimeWarning = warning.time
            return
        end
    end
end

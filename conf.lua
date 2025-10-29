require "src.util"
require "src.states.Options"

function love.conf(t)
    Options:readini()
    t.identity = "super-cossin-lette-3d"
    t.version = "11.5"
    t.accelerometerjoysticky = false

    t.window.title = "Super Cossin Lette 3D"
    t.window.width = 1024
    t.window.height = 768
    t.window.vsync = Options.values.vsync and 1 or 0
    t.window.fullscreen = Options.values.fullscreen and 1 or 0
    t.window.resizable = true
    t.window.highdpi = true

    t.modules.touch = false
    t.modules.video = false
end

local engine = require 'engine.index'
local testScene = require 'TestGame.scene.TestScene'

local game = engine.Game.new()

function game:load() 
    game:loadScene(testScene)
end

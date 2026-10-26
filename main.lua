local engine = require 'engine.index'
local TestGame = require 'TestGame.index'

local game = engine.Game.new()

function game:load() 
    self:getSceneManager():set(TestGame.TestScene.new())
end

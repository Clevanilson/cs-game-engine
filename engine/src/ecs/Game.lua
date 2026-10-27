local SceneManager = require 'engine.src.ecs.SceneManager'

local Game = {}
Game.__index = Game

function Game.new()
    local self = {
        _sceneManager = SceneManager.new(),
    }
    love.load = function ()
        love.graphics.setDefaultFilter("nearest", "nearest")
        self:load()
    end
    love.draw = function ()
        love.graphics.clear(80 / 255, 80 / 255, 80 / 255)
        self:_render()
    end
    love.update = function (dt)
        self:_update(dt)
    end
    return setmetatable(self, Game)
end

function Game:getSceneManager()
    return self._sceneManager
end

function Game:load()
end

function Game:_update(dt)
    self:getSceneManager():update(dt)
end

function Game:_render()
    self:getSceneManager():render()
end

return Game

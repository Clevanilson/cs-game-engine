local GameRunningState = require 'engine.src.ecs.GameRunningState'
local GameTileEditorState = require 'engine.src.ecs.GameTileEditorState'

local Scene = require 'engine.src.ecs.Scene'

---@class Game
---@field private _states table<GameStateName, GameState>
---@field private _currentState GameState
local Game = {}
Game.__index = Game

function Game.new()
    local self = setmetatable({}, Game)
    self._states = {
        ['GameRunningState'] = GameRunningState.new(self),
        ['GameTileEditorState']= GameTileEditorState.new(self),
    }
    self:setState('GameRunningState')
    local currentState = self._currentState
    
    function love.load()
        love.graphics.setDefaultFilter("nearest", "nearest")
        self:load()
    end

    function love.draw ()
        currentState:render()
    end

    function love.update(dt)
        currentState:update(dt)
    end

    return setmetatable(self, Game)
end

---@param name GameStateName
function Game:setState(name)
    self._currentState = self._states[name]
    self._currentState:load()
end

function Game:load()
end

return Game
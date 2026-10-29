---@class GameState
---@field protected _game Game
local GameState = {}
GameState.__index = GameState

---@alias GameStateName 'GameRunningState' | 'GameTileEditorState'

---@param game Game
function GameState.new(game)
    return setmetatable({ _game = game }, GameState)
end

function GameState:load()
    error('Method not implemented')
end

---@param dt number
function GameState:update(dt)
    error('Method not implemented')
end

function GameState:render()
    error('Method not implemented')
end

return GameState
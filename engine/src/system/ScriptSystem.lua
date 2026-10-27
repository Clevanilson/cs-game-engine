local System = require 'engine.src.ecs.System'
local ScriptComponent = require 'engine.src.component.ScriptComponent'

---@class ScriptSystem : System
local ScriptSystem = setmetatable({}, System)
ScriptSystem.__index = ScriptSystem

local keys = {}

function love.keypressed(key)
    keys[key] = true
end

function love.keyreleased(key)
    keys[key] = false
end

function ScriptSystem.new()
    local self = System.new()
    self:require { ComponentClass = ScriptComponent }
    return setmetatable(self, ScriptSystem)
end

function ScriptSystem:update(dt)
    for _key, entity in pairs(self:getEntities()) do
        ---@type ScriptComponent
        local script = entity:getComponent { ComponentClass = ScriptComponent }
        script.callback({ dt = dt, keys = keys, entity = entity })
    end
end

return ScriptSystem

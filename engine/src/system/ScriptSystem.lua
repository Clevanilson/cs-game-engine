local System = require 'engine.src.ecs.System'
local ScriptComponent = require 'engine.src.component.ScriptComponent'

---@class ScriptSystem : System
local ScriptSystem = setmetatable({}, System)
ScriptSystem.__index = ScriptSystem

function ScriptSystem.new()
    local self = System.new()
    self:require { ComponentClass = ScriptComponent }
    return setmetatable(self, ScriptSystem)
end

function ScriptSystem:update(dt)
    for _key, entity in pairs(self:getEntities()) do
        ---@type ScriptComponent
        local script = entity:getComponent { ComponentClass = ScriptComponent }
        script.callback({ dt = dt })
    end
end

return ScriptSystem

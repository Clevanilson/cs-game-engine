local Component = require 'engine.src.ecs.Component'

---@alias ScriptCallback fun(args: { dt: number, keys: table<string, boolean | nil>, entity: Entity })
---@class ScriptComponent : Component
---@field callback ScriptCallback
local ScriptComponent = setmetatable({ _id = Component.getNextID() }, Component)
ScriptComponent.__index = ScriptComponent

---@param callback ScriptCallback
---@return ScriptComponent
function ScriptComponent.new(callback)
    local self = setmetatable({ callback = callback }, Component.new())
    return setmetatable(self, ScriptComponent)
end


return ScriptComponent


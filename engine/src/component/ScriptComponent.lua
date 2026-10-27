local Component = require 'engine.src.ecs.Component'

---@class ScriptComponent : Component
local ScriptComponent = setmetatable({ _id = Component.getNextID() }, Component)
ScriptComponent.__index = ScriptComponent

return ScriptComponent


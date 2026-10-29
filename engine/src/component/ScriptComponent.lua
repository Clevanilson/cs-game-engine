local Component = require 'engine.src.ecs.Component'

---@class ScriptCallbackArgs
---@field dt number
---@field keys table<string, boolean | nil>
---@field getPosition fun(): number, number
---@field setPosition fun(x: number, y: number) 

---@alias ScriptCallback fun(args: ScriptCallbackArgs)

---@class ScriptComponent : Component
---@field callback ScriptCallback
local ScriptComponent = setmetatable({ _id = Component.getNextID() }, Component)
ScriptComponent.__index = ScriptComponent

---@alias ScriptComponentArgs { callback: ScriptCallback }
---@param args SpriteComponentArgs
---@return ScriptComponent
function ScriptComponent.new(args)
    local self = setmetatable(args, Component.new())
    return setmetatable(self, ScriptComponent)
end


return ScriptComponent


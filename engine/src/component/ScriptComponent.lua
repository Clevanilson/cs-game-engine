local Component = require 'engine.src.ecs.Component'

---@alias ScriptCallback fun(args: { 
--- dt: number,
--- keys: table<string, boolean | nil>,
--- entity: Entity,
--- setPosition: fun(x, y),
--- getPosition: fun(): number, number,
--- })
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


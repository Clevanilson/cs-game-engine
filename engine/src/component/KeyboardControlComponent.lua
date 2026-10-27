local Component = require 'engine.src.ecs.Component'

---@class KeyboardControlComponent : Component
local KeyboardControlComponent = setmetatable({ _id = Component.getNextID() }, Component)
KeyboardControlComponent.__index = KeyboardControlComponent

function KeyboardControlComponent.new()
    return setmetatable(Component.new(), KeyboardControlComponent)
end

return KeyboardControlComponent
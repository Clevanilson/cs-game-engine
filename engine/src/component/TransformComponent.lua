local Component = require 'engine.src.ecs.Component'

---@class TransformComponent : Component
---@field _position Vector
---@field _rotation number
local TransformComponent = setmetatable({ _id = Component.getNextID() }, Component)
TransformComponent.__index = TransformComponent

---@return TransformComponent
function TransformComponent.new(args)
    local self = setmetatable({
        _position = args.position,
        _rotation = args.rotation or 0
    }, Component.new())
    return setmetatable(self, TransformComponent)
end

function TransformComponent:getPosition()
    return self._position
end

function TransformComponent:getRotation()
    return self._rotation
end


return TransformComponent

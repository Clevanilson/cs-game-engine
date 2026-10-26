local Component = require 'engine.src.ecs.Component'

local TransformComponent = setmetatable({ id = Component.getNextID() }, Component)
TransformComponent.__index = TransformComponent

function TransformComponent.new(args)
    local self = {
        _position = args.position,
        _rotation = args.rotation or 0
    }
    return setmetatable(self, TransformComponent)
end

function TransformComponent:getPosition()
    return self._position
end

function TransformComponent:getRotation()
    return self._rotation
end

return TransformComponent

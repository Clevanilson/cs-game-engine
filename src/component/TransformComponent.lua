require 'src.ecs.Component'
require 'src.util.Vector'

TransformComponent = setmetatable({ id = getNextID() }, Component)
TransformComponent.__index = TransformComponent

function TransformComponent.new(position, scale, rotation)
    local self = {
        _position = position,
        _scale = scale or Vector.new(1, 1),
        _rotation =  rotation or 0
    }
    return setmetatable(self, TransformComponent)
end

function TransformComponent:getPosition()
    return self._position
end

function TransformComponent:getScale()
    return self._scale
end

function TransformComponent:getRotation()
    return self._rotation
end
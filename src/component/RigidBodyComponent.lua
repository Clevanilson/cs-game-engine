require 'src.ecs.Component'

RigidBody = setmetatable({ id = getNextID() }, Component)
RigidBody.__index = RigidBody

function RigidBody.new(velocity)
    local self = {
        _velocity = velocity
    }
    return setmetatable(self, RigidBody)
end

function RigidBody:getVelocity()
    return self._velocity
end


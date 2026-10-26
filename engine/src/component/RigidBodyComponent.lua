local Component = require 'engine.src.ecs.Component'

local RigidBodyComponent = setmetatable({ id = Component.getNextID() }, Component)
RigidBodyComponent.__index = RigidBodyComponent

function RigidBodyComponent.new(args)
    local self = {
        _velocity = args.velocity
    }
    return setmetatable(self, RigidBodyComponent)
end

function RigidBodyComponent:getVelocity()
    return self._velocity
end

return RigidBodyComponent

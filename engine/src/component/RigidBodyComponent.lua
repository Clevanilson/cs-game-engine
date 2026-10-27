local Component = require 'engine.src.ecs.Component'

---@class RigidBodyComponent : Component
---@field _velocity Vector
local RigidBodyComponent = setmetatable({ _id = Component.getNextID() }, Component)
RigidBodyComponent.__index = RigidBodyComponent

function RigidBodyComponent.new(args)
    local self = setmetatable({
        _velocity = args.velocity
    }, Component.new())
    return setmetatable(self, RigidBodyComponent)
end

function RigidBodyComponent:getVelocity()
    return self._velocity
end

return RigidBodyComponent

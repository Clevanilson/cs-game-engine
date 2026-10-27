local Component = require 'engine.src.ecs.Component'

local CameraFollowComponent = setmetatable({ _id = Component.getNextID() }, Component)
CameraFollowComponent.__index = CameraFollowComponent

function CameraFollowComponent.new()
    local self = Component.new()
    return setmetatable(self, CameraFollowComponent)
end

return CameraFollowComponent
local CameraFollowComponent = require 'engine.src.component.CameraFollowComponent'
local TransformComponent = require 'engine.src.component.TransformComponent'
local System = require 'engine.src.ecs.System'

---@class CameraMovementSystem : System
local CameraMovementSystem = setmetatable({}, System)
CameraMovementSystem.__index = CameraMovementSystem

function CameraMovementSystem.new()
    local self = System.new()
    self:require { ComponentClass = CameraFollowComponent }
    self:require { ComponentClass = TransformComponent }
    return setmetatable(self, CameraMovementSystem)
end

function CameraMovementSystem:update(dt, camera)
    local cameraFollow = self:getEntities()[1]

    if not cameraFollow then
        return
    end

    local transform = cameraFollow:getComponent { ComponentClass = TransformComponent }
    -- camera:getPosition()._x = lcam
    -- camera:getPosition()._y = 370
end



return CameraMovementSystem
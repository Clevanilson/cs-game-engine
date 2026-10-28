local CameraFollowComponent = require 'engine.src.component.CameraFollowComponent'
local TransformComponent = require 'engine.src.component.TransformComponent'
local System = require 'engine.src.ecs.System'
local util = require 'lib.util.index'

---@class CameraMovementSystem : System
local CameraMovementSystem = setmetatable({}, System)
CameraMovementSystem.__index = CameraMovementSystem

function CameraMovementSystem.new()
    local self = System.new()
    self:require { ComponentClass = CameraFollowComponent }
    self:require { ComponentClass = TransformComponent }
    return setmetatable(self, CameraMovementSystem)
end

---@param dt number
---@param camera Camera
function CameraMovementSystem:update(dt, camera)
    local cameraFollow = self:getEntities()[1]

    if not cameraFollow then
        return
    end

    ---@type TransformComponent
    local transform = cameraFollow:getComponent(TransformComponent)
    local cameraPosition = transform:getPosition():clone() 
    cameraPosition:limit { min = 0 }
    local cameraPositionOffset = util.Vector.new { 
        x = (camera:getWidth() / 2), 
        y = camera:getHeight() / 2 
    }
    cameraPosition:subtract { other = cameraPositionOffset }
    camera:setPosition { position = cameraPosition }

end



return CameraMovementSystem
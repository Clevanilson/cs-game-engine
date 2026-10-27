local util = require 'lib.util.index'
local System = require 'engine.src.ecs.System'
local TransformComponent = require 'engine.src.component.TransformComponent'
local RigidBodyComponent = require 'engine.src.component.RigidBodyComponent'

---@class MovementSystem : System
local MovementSystem = setmetatable({}, System)
MovementSystem.__index = MovementSystem

function MovementSystem.new()
    local self = System.new()
    self:require { ComponentClass = TransformComponent }
    self:require { ComponentClass = RigidBodyComponent }
    return setmetatable(self, MovementSystem)
end

function MovementSystem:update(dt)
    for _key, entity in pairs(self:getEntities()) do
        local transform = entity:getComponent { ComponentClass = TransformComponent }
        local rigidBody = entity:getComponent { ComponentClass = RigidBodyComponent }
        local velocity = rigidBody:getVelocity()
        local scaledVelocity = util.Vector.new { x = velocity:getX(), y = velocity:getY() }
        scaledVelocity:scale { factor = dt }
        transform:getPosition():sum { other = scaledVelocity }
    end
end

return MovementSystem

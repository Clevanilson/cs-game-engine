require 'src.component.TransformComponent'
require 'src.component.RigidBodyComponent'
require 'src.util.Vector'
require 'src.ecs.System'

MovementSystem = setmetatable({}, System)
MovementSystem.__index = MovementSystem

function MovementSystem.new()
    local self = System.new()
    self:require(TransformComponent)
    self:require(RigidBody)
    return setmetatable(self, MovementSystem)
end

function MovementSystem:update(dt)
    for _key, entity in pairs(self:getEntities()) do
        local transform = entity:getComponent(TransformComponent) 
        local rigidBody = entity:getComponent(RigidBody) 
        local velocity = rigidBody:getVelocity();
        local scaledVelocity = Vector.new(velocity:getX(), velocity:getY())
        scaledVelocity:scale(dt)
        transform:getPosition():sum(scaledVelocity)
    end
end
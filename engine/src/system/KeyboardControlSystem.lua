local System = require 'engine.src.ecs.System'
local util = require 'lib.util.index'
local KeyboardControlComponent = require 'engine.src.component.KeyboardControlComponent'
local TransformComponent = require 'engine.src.component.TransformComponent'
local RigidBodyComponent = require 'engine.src.component.RigidBodyComponent'

---@class KeyboardControlSystem : System
local KeyboardControlSystem = setmetatable({}, System)
KeyboardControlSystem.__index = KeyboardControlSystem

function KeyboardControlSystem.new()
    local self = System.new()
    self:require { ComponentClass = KeyboardControlComponent }
    self:require { ComponentClass = TransformComponent }
    self:require { ComponentClass = RigidBodyComponent }
    return setmetatable(self, KeyboardControlSystem)
end

function KeyboardControlSystem:update(dt)
    local entity = self:getEntities()[1]
    if entity == nil then return end
    local transform = entity:getComponent { ComponentClass = TransformComponent }
    ---@type RigidBodyComponent
    local rigidBody = entity:getComponent { ComponentClass = RigidBodyComponent }
    rigidBody:getVelocity():scale { factor = 0 }
    local velocity = 250

    if love.keyboard.isDown('w') then
        rigidBody:getVelocity():sum { other = util.Vector.new { y = -velocity, x = 0} }
    elseif love.keyboard.isDown('s') then
        rigidBody:getVelocity():sum { other = util.Vector.new { y = velocity, x = 0} }
    elseif love.keyboard.isDown('d') then
        rigidBody:getVelocity():sum { other = util.Vector.new { y = 0, x = velocity } }
    elseif love.keyboard.isDown('a') then
        rigidBody:getVelocity():sum { other = util.Vector.new { y = 0, x = -velocity } }
    end

end

return KeyboardControlSystem
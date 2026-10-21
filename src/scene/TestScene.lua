require 'src.component.RigidBodyComponent'
require 'src.component.TransformComponent'
require 'src.util.Vector'
require 'src.ecs.Scene'

TestScene = setmetatable({}, Scene)
TestScene.__index = TestScene

function TestScene.new(entityManager)
    local self = Scene.new(entityManager)
    return setmetatable(self, TestScene)
end

function TestScene:init()
    print('testscene')
    local player = self.entityManager:createEntity()
    local cTransform = TransformComponent.new(Vector.new(0, 0))
    local cRigidBody = RigidBody.new(Vector.new(200, 0))
    player:addComponent(cTransform)
    player:addComponent(cRigidBody)
end

function TestScene:update(dt)
end

function TestScene:destroy()
end
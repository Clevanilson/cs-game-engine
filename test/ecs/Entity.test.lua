require 'test.globals'
require 'src.util.globals'
require 'src.util.Vector'
require 'src.util.Bitset'
require 'src.ecs.System'
require 'src.ecs.EntityManager'
require 'src.component.TransformComponent'

Describe('System', function ()
    local entityManager =  EntityManager.new()
    local position = Vector.new(0, 0)
    local scale = Vector.new(0, 0)
    local rotation = 0
    local transform = TransformComponent.new(position, scale, rotation)
    entityManager:update(0)

    Test('crateEntity', function ()
        local sut = entityManager:createEntity()
        Expect(sut:getID()).toBe(1)
    end)

    Test('getSignature', function ()
        local sut = entityManager:createEntity()
        local bitset = Bitset.new(SIGNATURE_SIZE)
        Expect(bitset:equals(sut:getSignature())).toBe(true)
    end)

    Test('addComponent', function ()
        local sut = entityManager:createEntity()
        sut:addComponent(transform)
        local bitset = Bitset.new(SIGNATURE_SIZE)
        bitset:set(transform:getID())
        Expect(bitset:equals(sut:getSignature())).toBe(true)
    end)

    Test('getComponent', function ()
        local sut = entityManager:createEntity()
        sut:addComponent(transform)
        Expect(sut:getComponent(TransformComponent)).toBe(transform)
    end)
end)
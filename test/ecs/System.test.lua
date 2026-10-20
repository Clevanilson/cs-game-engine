require 'test.globals'
require 'src.util.Vector'
require 'src.ecs.System'
require 'src.ecs.EntityManager'
require 'src.component.TransformComponent'

Describe('System', function ()
    local entityManager =  EntityManager.new()
    local entity = entityManager:createEntity()
    local position = Vector.new(0, 0)
    local scale = Vector.new(0, 0)
    local rotation = 0
    local transform = TransformComponent.new(position, scale, rotation)
    entity:addComponent(transform)
    entityManager:update(0)


    Test('new', function ()
        local sut = System.new()
        Expect(sut:getID()).toBe(1)
    end)

    Test('isIntrested', function ()
        local sut = System.new()
        sut:require(TransformComponent)
        local entitySignature = entityManager:getEntitySignature(entity)
        print(table.unpack(entitySignature.value))
        Expect(sut:isIntrested(entitySignature)).toBe(true)
    end)
end)
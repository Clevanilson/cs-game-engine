local util = require 'util.index'
local engine = require 'engine.index'
local testing = util.testing
local Entity = engine.Entity

testing.describe('Entity', function ()
    testing.test('new', function ()
        local entityManager = {}
        local sut = Entity.new { id = 3, entityManager = entityManager }
        testing.expect(sut:getID()).toBe(3)
    end)

    testing.test('getSignature', function ()
        local signature = {}
        local entityManager = {
            getEntitySignature = function ()
                return signature
            end
        }
        local sut = Entity.new { id = 1, entityManager = entityManager }
        testing.expect(sut:getSignature()).toBe(signature)
    end)

    testing.test('addComponent', function ()
        local receivedEntity = nil
        local receivedComponent = nil
        local entityManager = {
            addComponent = function (_self, entity, component)
                receivedEntity = entity
                receivedComponent = component
            end
        }
        local sut = Entity.new { id = 1, entityManager = entityManager }
        local component = {}
        sut:addComponent { component = component }
        testing.expect(receivedEntity).toBe(sut)
        testing.expect(receivedComponent).toBe(component)
    end)

    testing.test('getComponent', function ()
        local component = {}
        local ComponentClass = {}
        local entityManager = {
            getComponent = function (_self, _entity, receivedClass)
                testing.expect(receivedClass).toBe(ComponentClass)
                return component
            end
        }
        local sut = Entity.new { id = 1, entityManager = entityManager }
        testing.expect(sut:getComponent { ComponentClass = ComponentClass }).toBe(component)
    end)
end)

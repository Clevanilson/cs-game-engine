local testing = require 'lib.testing.index'
local util = require 'lib.util.index'
local engine = require 'engine.index'
local Bitset = util.Bitset
local System = engine.System
local TransformComponent = engine.TransformComponent

testing.describe('System', function ()
    testing.test('new', function ()
        local sut = System.new()
        testing.expect(sut:getID()).toBe(1)
        testing.expect(#sut:getEntities()).toBe(0)
    end)

    testing.test('addEntity and removeEntity', function ()
        local sut = System.new()
        local entity = {}
        sut:addEntity { entity = entity }
        testing.expect(sut:getEntities()[1]).toBe(entity)
        sut:removeEntity { entity = entity }
        testing.expect(sut:getEntities()[1]).toBe(nil)
    end)

    testing.test('isIntrested', function ()
        local sut = System.new()
        sut:require { ComponentClass = TransformComponent }
        local signature = Bitset.new { size = 32 }
        signature:set { index = TransformComponent:getID() }
        testing.expect(sut:isIntrested { signature = signature }).toBe(true)
        local other = Bitset.new { size = 32 }
        testing.expect(sut:isIntrested { signature = other }).toBe(false)
    end)
end)

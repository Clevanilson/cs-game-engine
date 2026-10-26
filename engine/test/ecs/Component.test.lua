local util = require 'util.index'
local engine = require 'engine.index'
local testing = util.testing
local Component = engine.Component

testing.describe('Component', function ()
    testing.test('getID', function ()
        local sut = setmetatable({ id = 9 }, Component)
        testing.expect(sut:getID()).toBe(9)
    end)

    testing.test('getNextID', function ()
        local first = Component.getNextID()
        local second = Component.getNextID()
        testing.expect(second).toBe(first + 1)
    end)
end)

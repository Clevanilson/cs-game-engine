local util = require 'util.index'
local testing = util.testing
local Bitset = util.Bitset

testing.describe('Bitset', function ()
    testing.test('new', function ()
        local sut = Bitset.new { size = 3 }
        testing.expect(sut:get{ index = 1 }).toBe(false)
        testing.expect(sut:get{ index = 2 }).toBe(false)
        testing.expect(sut:get{ index = 3 }).toBe(false)
        testing.expect(sut:get{ index = 4 }).toBe(nil)
    end)

    testing.test('set and get', function ()
        local sut = Bitset.new { size = 4 }
        sut:set { index = 2 }
        testing.expect(sut:get{ index = 2 }).toBe(true)
        sut:set { index = 2 }
        testing.expect(sut:get{ index = 2 }).toBe(false)
    end)

    testing.test('equals', function ()
        local sut = Bitset.new { size = 4 }
        local other = Bitset.new { size = 4 }
        testing.expect(sut:equals { other = other }).toBe(true)
        other:set { index = 1 }
        testing.expect(sut:equals { other = other }).toBe(false)
    end)

    testing.test('bitwiseAnd', function ()
        local sut = Bitset.new { size = 3 }
        sut:set { index = 2 }
        sut:set { index = 3 }
        local other = Bitset.new { size = 3 }
        sut:set { index = 2 }
        local bitwiseAnd = sut:bitwiseAnd { other = other }
        testing.expect(bitwiseAnd:equals { other = other }).toBe(true)
    end)
end)

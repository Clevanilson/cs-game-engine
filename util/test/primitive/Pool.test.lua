local util = require 'util.index'
local testing = util.testing
local Pool = util.Pool

testing.describe('Pool', function ()
    testing.test('new', function ()
        local sut = Pool.new { size = 2 }
        testing.expect(sut:get { index = 1 }).toBe(nil)
        testing.expect(sut:get { index = 2 }).toBe(nil)
        testing.expect(sut:get { index = 3 }).toBe(nil)
    end)

    testing.test('insert', function ()
        local sut = Pool.new { size = 10 }
        sut:insert { value = 10 }
        sut:insert { value = 20 }
        testing.expect(sut:get { index = 1 }).toBe(10)
        testing.expect(sut:get { index = 2 }).toBe(20)
    end)

    testing.test('remove', function ()
        local sut = Pool.new { size = 10 }
        sut:insert { value = 10 }
        sut:insert { value = 20 }
        sut:insert { value = 30 }
        sut:remove { position = 2 }
        testing.expect(sut:get { index = 1 }).toBe(10)
        testing.expect(sut:get { index = 2 }).toBe(30)
        testing.expect(sut:get { index = 3 }).toBe(nil)
    end)

    testing.test('set', function ()
        local sut = Pool.new { size = 10 }
        sut:set { index = 3, value = 'hello' }
        testing.expect(sut:get { index = 3 }).toBe('hello')
        testing.expect(sut:get { index = 1 }).toBe(nil)
    end)
end)

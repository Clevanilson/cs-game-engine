---@class Bitset
---@field _size number
---@field _value table<number, boolean>
local Bitset = {}
Bitset.__index = Bitset

---@param args { size: number }
function Bitset.new(args)
    local self = {
        _value = {},
        _size = args.size or 10
    }

    for i = 1, self._size, 1 do
        self._value[i] = false
    end

    return setmetatable(self, Bitset)
end

function Bitset:getSize()
    return self._size
end

---@param args { index: number }
function Bitset:set(args)
    local index = args.index
    self._value[index] = not self._value[index]
end

---@param args { index: number }
function Bitset:get(args)
    local index = args.index
    return self._value[index]
end

---@param args { other: Bitset }
function Bitset:equals(args)
    local other = args.other

    if not (self:getSize() == other:getSize()) then
        return false
    end

    for i = 1, self:getSize(), 1 do
        if not (self:get{ index = i } == other:get{ index = i }) then
            return false
        end
    end

    return true
end

---@param args { other: Bitset}
function Bitset:bitwiseAnd(args)
    local other = args.other
    local comparation = Bitset.new { size = self:getSize() }

    for i = 1, self._size, 1 do
        if self:get { index = i } and other:get { index = i } then
            comparation:set { index = i }
        end
    end

    return comparation
end

return Bitset
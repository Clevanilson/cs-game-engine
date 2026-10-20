Bitset = {}
Bitset.__index = Bitset

function Bitset.new(size)
    local self = {
        value = {},
        size = size
    }

    for i = 1, size, 1 do
        self.value[i] = false
    end

    return setmetatable(self, Bitset)
end

function Bitset:set(index)
    self.value[index] = not self.value[index]
end

function Bitset:get(index)
    return self.value[index]
end

function Bitset:equals(other)
    if not (self.size == other.size) then
        return false
    end

    for i = 1, self.size, 1 do
        if not (self.value[i] == other.value[i]) then
            return false
        end
    end

    return true
end

function Bitset:bitwiseAnd(other)
    local comparation = Bitset.new(self.size)

    for i = 1, self.size, 1 do
        if self:get(i) and other:get(i) then
            comparation:set(i)
        end
    end

    return comparation
end
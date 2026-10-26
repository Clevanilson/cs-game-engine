local Bitset = {}
Bitset.__index = Bitset

function Bitset.new(args)
    local size = args.size
    local self = {
        value = {},
        size = size or 32
    }

    for i = 1, self.size, 1 do
        self.value[i] = false
    end

    return setmetatable(self, Bitset)
end

function Bitset:set(args)
    local index = args.index
    self.value[index] = not self.value[index]
end

function Bitset:get(args)
    local index = args.index
    return self.value[index]
end

function Bitset:equals(args)
    local other = args.other
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

function Bitset:bitwiseAnd(args)
    local other = args.other
    local comparation = Bitset.new { size = self.size }

    for i = 1, self.size, 1 do
        if self:get { index= i } and other:get { index = i } then
            comparation:set { index = i }
        end
    end

    return comparation
end

return Bitset
Pool = {}
Pool.__index = Pool

function Pool.new(size)
    local self = {
        list = {}
    }
    for i = 1, size, 1 do
        self.list[i] = nil
    end
    return setmetatable(self, Pool)
end

function Pool:insert(value)
    table.insert(self.list, value)
end

function Pool:remove(position)
    table.remove(self.list, position)
end

function Pool:get(index)
    return self.list[index]
end

function Pool:set(index, value)
    self.list[index] = value
end
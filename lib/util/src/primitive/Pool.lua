---@class Pool
---@field _list table<number, any>
local Pool = {}
Pool.__index = Pool

function Pool.new(args)
    local size = args.size
    local self = {
        _list = {}
    }
    for i = 1, size, 1 do
        self._list[i] = nil
    end
    return setmetatable(self, Pool)
end

---@param args { value: any }
function Pool:insert(args)
    local value = args.value
    table.insert(self._list, value)
end

---@param args { position: number }
function Pool:remove(args)
    local position = args.position
    table.remove(self._list, position)
end

---@generic TValue
---@param args { index: number }
---@return TValue
function Pool:get(args)
    local index = args.index
    return self._list[index]
end

---@param args { value: any, index: number }
function Pool:set(args)
    local index = args.index
    local value = args.value
    self._list[index] = value
end

return Pool

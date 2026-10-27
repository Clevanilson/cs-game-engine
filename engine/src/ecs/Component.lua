local id = 0

---@class Component
---@field _id number
local Component = {}
Component.__index = Component

function Component.new()
    local self = {
        _id = nil
    }
    return setmetatable(self, Component)
end

function Component.getNextID()
    id = id + 1
    return id
end

function Component:getID()
    return self._id
end

return Component

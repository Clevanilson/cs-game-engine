local id = 0

local Component = {}
Component.__index = Component

function Component:getID()
    return self.id
end

function Component.getNextID()
    id = id + 1
    return id
end

return Component

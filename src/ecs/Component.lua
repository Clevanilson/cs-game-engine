local id = 0

Component = {}
Component.__index = Component

function Component:getID()
    return self.id
end

function getNextID()
    id = id + 1
    return id
end

---@class Entity
---@field _id number
---@field _entityManager EntityManager
local Entity = {}
Entity.__index = Entity

---@param args {
---id: number,
---entityManager: EntityManager,
---}
function Entity.new(args)
    local self = {
        _id = args.id,
        _entityManager = args.entityManager
    }
    return setmetatable(self, Entity)
end

function Entity:getID()
    return self._id
end

function Entity:getSignature()
    return self._entityManager:getEntitySignature(self)
end

---@param component Component
function Entity:addComponent(component)
    self._entityManager:addComponent(self, component)
end

---@param ComponentClass Component
---@return Component
function Entity:getComponent(ComponentClass)
    return self._entityManager:getComponent(self, ComponentClass)
end

return Entity

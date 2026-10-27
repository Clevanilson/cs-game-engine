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

function Entity:addComponent(args)
    local component = args.component
    self._entityManager:addComponent(self, component)
end

---@generic TComponent
---@param args { ComponentClass: TComponent }
---@return TComponent
function Entity:getComponent(args)
    local ComponentClass = args.ComponentClass
    return self._entityManager:getComponent(self, ComponentClass)
end

return Entity

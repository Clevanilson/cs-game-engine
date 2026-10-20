Entity = {}
Entity.__index = Entity

function Entity.new(id, entityManager)
    local self = {
        _id = id,
        _entityManager = entityManager
    }
    return setmetatable(self, Entity)
end

function Entity:getID()
    return self._id
end

function Entity:getSignature()
    return self._entityManager:getEntitySignature(self)
end

function Entity:addComponent(component)
    self._entityManager:addComponent(self, component)
end

function Entity:getComponent(ComponentClass)
   return self._entityManager:getComponent(self, ComponentClass)
end

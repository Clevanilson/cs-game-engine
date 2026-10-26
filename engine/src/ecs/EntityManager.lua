local util = require 'util.index'
local Entity = require 'engine.src.ecs.Entity'
local Pool = util.Pool
local Bitset = util.Bitset


local EntityManager = {}
EntityManager.__index = EntityManager

function EntityManager.new()
    local self = {
        _entityAmount = 0,
        _addedEntitiesQueue = {},
        _componentPools = {},
        _entitySignatures = {},
        _systems = {}
    }
    return setmetatable(self, EntityManager)
end

function EntityManager:createEntity()
    self._entityAmount = self._entityAmount + 1
    local entity = Entity.new { id = self._entityAmount, entityManager = self }
    self._entitySignatures[entity:getID()] = Bitset.new {}
    table.insert(self._addedEntitiesQueue, entity)
    return entity
end

function EntityManager:getEntitySignature(entity)
    return self._entitySignatures[entity:getID()]
end

function EntityManager:addComponent(entity, component)
    local componentID = component:getID()

    if not self._componentPools[componentID] then
        self._componentPools[componentID] = Pool.new { size = 100 }
    end

    local componentPool = self._componentPools[componentID]
    local entityID = entity:getID()
    componentPool:set { index = entityID, value = component }

    local entitySignature = self:getEntitySignature(entity)
    entitySignature:set { index = componentID }
end

function EntityManager:getComponent(entity, ComponentClass)
    local componentPool = self._componentPools[ComponentClass:getID()]
    return componentPool:get { index = entity:getID() }
end

function EntityManager:removeComponent(entity, ComponentClass)
   local componentID = ComponentClass:getID()
   local entityID = entity:getID()
   local entitySignature = self._entitySignatures[entityID]
   entitySignature:set { index = componentID }
end

function EntityManager:addSystem(system)
    local systemID = system:getID()
    self._systems[systemID] = system
end

function EntityManager:removeSystem(system)
    local systemID = system:getID()
    self._systems[systemID] = nil
end

function EntityManager:update()
    self:_addEntitiesFromQueue()
end

function EntityManager:_addEntitiesFromQueue()
    for _key, entity in pairs(self._addedEntitiesQueue) do
        self:_addEntityToSystem(entity)
    end
end

function EntityManager:_addEntityToSystem(entity)
    local entitySignature = self._entitySignatures[entity:getID()]

    for _key, system in pairs(self._systems) do
        if system:isIntrested { signature = entitySignature } then
            system:addEntity { entity = entity }
        end
    end

    self._addedEntitiesQueue = {}
end

return EntityManager

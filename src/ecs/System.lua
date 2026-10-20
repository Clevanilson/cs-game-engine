require 'src.util.globals'
require 'src.util.Bitset'

local id = 0

System = {}
System.__index = System

function System.new()
    id = id + 1
    local self = {
        _id = id,
        signature = Bitset.new(SIGNATURE_SIZE),
        _entities = {}
    }
    return setmetatable(self, System)
end

function System:addEntity(entity)
    table.insert(self._entities, entity)
end

function System:removeEntity(entity)
    table.remove(self._entities, entity)
end

function System:getID()
    return self._id
end

function System:getEntities()
    return self._entities
end

function System:require(ComponentClass)
    self.signature:set(ComponentClass:getID())
end

function System:isIntrested(signature)
    return self.signature:equals(signature)
end

function System:update(dt)
    return nil
end

function System:render()
    return nil
end
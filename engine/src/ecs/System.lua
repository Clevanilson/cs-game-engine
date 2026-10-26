local util = require 'util.index'
local Bitset = util.Bitset

local SIGNATURE_SIZE = 32
local id = 0

local System = {}
System.__index = System

function System.new()
    id = id + 1
    local self = {
        _id = id,
        signature = Bitset.new { size = SIGNATURE_SIZE },
        _entities = {}
    }
    return setmetatable(self, System)
end

function System:addEntity(args)
    local entity = args.entity
    table.insert(self._entities, entity)
end

function System:removeEntity(args)
    local entity = args.entity
    for i, current in ipairs(self._entities) do
        if current == entity then
            table.remove(self._entities, i)
            break
        end
    end
end

function System:getID()
    return self._id
end

function System:getEntities()
    return self._entities
end

function System:require(args)
    local ComponentClass = args.ComponentClass
    self.signature:set { index = ComponentClass:getID() }
end

function System:isIntrested(args)
    local signature = args.signature
    return self.signature:equals { other = signature }
end

function System:update(dt)
    return nil
end

function System:render()
    return nil
end

return System

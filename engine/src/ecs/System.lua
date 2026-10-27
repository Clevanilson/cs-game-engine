local util = require 'lib.util.index'
local Bitset = util.Bitset

local id = 0

---@class System
---@field _id number
---@field _signature Bitset
---@field _entities table<number, Entity> 
local System = {}
System.__index = System

function System.new()
    id = id + 1
    local self = {
        _id = id,
        _signature = Bitset.new {},
        _entities = {}
    }
    return setmetatable(self, System)
end

---@param args { entity: Entity }
function System:addEntity(args)
    local entity = args.entity
    table.insert(self._entities, entity)
end

---@param args { entity: Entity }
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

function System:getSignature()
    return self._signature
end

---@param args { ComponentClass: Component }
function System:require(args)
    local ComponentClass = args.ComponentClass
    self._signature:set { index = ComponentClass:getID() }
end

---@param args { signature: Bitset }
function System:isIntrested(args)
    local signature = args.signature
    local bitwise = self._signature:bitwiseAnd { other = signature }
    return self._signature:equals { other = bitwise }
end

function System:update(dt)
    return nil
end

function System:render()
    return nil
end

return System

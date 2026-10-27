local EntityManager = require 'engine.src.ecs.EntityManager'
local MovementSystem = require 'engine.src.system.MovementSystem'
local RenderSpriteSystem = require 'engine.src.system.RenderSpriteSystem'
local RenderTextSystem = require 'engine.src.system.RenderTextSystem'
local CameraMovementSystem = require 'engine.src.system.CameraMovementSystem'


---@class Scene
---@field _entityManager EntityManager
---@field _systems {
---movement: MovementSystem,
---renderSprite: RenderSpriteSystem,
---renderText: RenderTextSystem,
---cameraMovement: CameraMovementSystem,
---}
local Scene = {}
Scene.__index = Scene

function Scene.new()
    local self = {
        _entityManager = EntityManager.new(),
        _systems = {
            movement = MovementSystem.new(),
            renderSprite = RenderSpriteSystem.new(),
            renderText = RenderTextSystem.new(),
            cameraMovement = CameraMovementSystem.new()
        }
    }
    self._entityManager:addSystem(self._systems.movement)
    self._entityManager:addSystem(self._systems.renderSprite)
    self._entityManager:addSystem(self._systems.renderText)
    return setmetatable(self, Scene)
end

function Scene:getSystems()
    return self._systems
end

function Scene:init()
end

function Scene:destroy()
end

function Scene:getEntityManager()
    return self._entityManager
end

return Scene

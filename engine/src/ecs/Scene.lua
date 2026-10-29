local EntityManager = require 'engine.src.ecs.EntityManager'
local RenderSpriteSystem = require 'engine.src.system.RenderSpriteSystem'
local CameraMovementSystem = require 'engine.src.system.CameraMovementSystem'
local ScriptSystem = require 'engine.src.system.ScriptSystem'

---@class GameObjectComponents {
---@field TransformComponent TransformComponentArgs?
---@field SpriteComponent SpriteComponentArgs?
---@field ScriptComponent ScriptComponentArgs?
---@field CameraFollowComponent {}?

---@class GameObject {
---@field components GameObjectComponents

---@class SceneData {
---@field entities table<string, GameObject>
---@field ui table<string, UIElementData>?



---@class SceneSystems
---@field renderSprite RenderSpriteSystem
---@field cameraMovement CameraMovementSystem
---@field script ScriptSystem

---@class Scene
---@field private _entityManager EntityManager
---@field private _systems SceneSystems
local Scene = {}
Scene.__index = Scene

function Scene.new()
    local self = {
        _entityManager = EntityManager.new(),
        _systems = {
            renderSprite = RenderSpriteSystem.new(),
            cameraMovement = CameraMovementSystem.new(),
            script = ScriptSystem.new()
        }
    }
    self._entityManager:addSystem(self._systems.renderSprite)
    self._entityManager:addSystem(self._systems.cameraMovement)
    self._entityManager:addSystem(self._systems.script)
    return setmetatable(self, Scene)
end

function Scene:getSystems()
    return self._systems
end

function Scene:getEntityManager()
    return self._entityManager
end

return Scene

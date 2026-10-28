local CameraFollowComponent = require 'engine.src.component.CameraFollowComponent'
local ScriptComponent = require 'engine.src.component.ScriptComponent'
local SpriteComponent = require 'engine.src.component.SpriteComponent'
local TransformComponent = require 'engine.src.component.TransformComponent'
local Camera = require 'engine.src.util.Camera'
local Scene = require 'engine.src.ecs.Scene'

---@class Game
---@field _currentScene Scene | nil
---@field _camera Camera
local Game = {}
Game.__index = Game

function Game.new()
    local self = {
        _currentScene = nil,
        _camera = Camera.new()
    }
    love.load = function ()
        love.graphics.setDefaultFilter("nearest", "nearest")
        self:load()
    end
    love.draw = function ()
        love.graphics.clear(80 / 255, 80 / 255, 80 / 255)
        self:_render()
    end
    love.update = function (dt)
        self:_update(dt)
    end
    return setmetatable(self, Game)
end

function Game:load()
end

---@param sceneData SceneData
function Game:loadScene(sceneData)
    local scene = Scene.new()
    self._currentScene = scene

    for _key, entityData in ipairs(sceneData.entities) do
        local entity = scene:getEntityManager():createEntity()

        for componentName, componentArgs in pairs(entityData.components) do
            local ComponentClass = nil

            if componentName == 'CameraFollowComponent' then
                ComponentClass = CameraFollowComponent
            elseif componentName == 'ScriptComponent' then
                ComponentClass = ScriptComponent
            elseif componentName == 'SpriteComponent' then
                ComponentClass = SpriteComponent
            elseif componentName == 'TransformComponent' then
                ComponentClass = TransformComponent
            end

            if ComponentClass then
                local component = ComponentClass.new(componentArgs)
                entity:addComponent(component)
            end
        end
    end

end

---@param dt number
function Game:_update(dt)
    if not self._currentScene then return end
    self._currentScene:getEntityManager():update()
    local systems = self._currentScene:getSystems()
    systems.script:update(dt)
    systems.cameraMovement:update(dt, self._camera)
end

function Game:_render()
  if not self._currentScene then return end
    local canvas = love.graphics.newCanvas(
        self._camera:getWidth(),
        self._camera:getHeight()
    )
    love.graphics.setCanvas(canvas)
    local systems = self._currentScene:getSystems()
    systems.renderSprite:render(self._camera)
    love.graphics.setCanvas()
    local windowWidth = love.graphics:getWidth()
    local windowHeight = love.graphics:getHeight()
    love.graphics.draw(
        canvas,
        0, 0, 0,
        windowWidth / self._camera:getWidth(),
        windowHeight / self._camera:getHeight()
    )
end

return Game

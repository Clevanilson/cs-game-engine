local GameState = require 'engine.src.ecs.GameState'
local Scene = require 'engine.src.ecs.Scene'
local Camera = require 'engine.src.util.Camera'
local CameraFollowComponent = require 'engine.src.component.CameraFollowComponent'
local ScriptComponent = require 'engine.src.component.ScriptComponent'
local SpriteComponent = require 'engine.src.component.SpriteComponent'
local TransformComponent = require 'engine.src.component.TransformComponent'

---@class GameRunningState : GameState
---@field private _currentScene Scene
---@field private _camera Camera
local GameRunningState = setmetatable({}, GameState)
GameRunningState.__index = GameRunningState

---@param game Game
function GameRunningState.new(game)
    ---@type GameRunningState
    local self = setmetatable(GameState.new(game), GameRunningState)
    self._currentScene =  Scene.new()
    self._camera = Camera.new()
    return self
end

function GameRunningState:load()
    local sceneData = require 'TestGame.scene.TestScene'
    local Components = {
        ['CameraFollowComponent'] = CameraFollowComponent,
        ['ScriptComponent'] = ScriptComponent,
        ['SpriteComponent'] = SpriteComponent,
        ['TransformComponent'] = TransformComponent,
    }
  
    for _key, entityData in pairs(sceneData.entities) do
        local entity = self._currentScene:getEntityManager():createEntity()

        for componentName, componentArgs in pairs(entityData.components) do
            local ComponentClass = Components[componentName]

            if ComponentClass then
                local component = ComponentClass.new(componentArgs)
                entity:addComponent(component)
            end
        end
    end
end

function GameRunningState:update(dt)
    self._currentScene:getEntityManager():update()
    local systems = self._currentScene:getSystems()
    systems.cameraMovement:update(dt, self._camera)
    systems.script:update(dt)

end

function GameRunningState:render()
    love.graphics.clear(80 / 255, 80 / 255, 80 / 255)
    local cameraWidth = self._camera:getWidth()
    local cameraHeight = self._camera:getHeight()
    local cameraCanvas = love.graphics.newCanvas(cameraWidth, cameraHeight)
    love.graphics.setCanvas(cameraCanvas)
    local systems = self._currentScene:getSystems()
    systems.renderSprite:render(self._camera)
    love.graphics.setCanvas()
    local windowWidth = love.graphics:getWidth()
    local windowHeight = love.graphics:getHeight()
    love.graphics.draw(
        cameraCanvas,
        0, 0, 0,
        windowWidth / cameraWidth,
        windowHeight / cameraHeight
    )
end

return GameRunningState
require 'src.util.Window'
require 'src.ecs.EntityManager'
require 'src.ecs.SceneManager'
require 'src.system.MovementSystem'
require 'src.scene.TestScene'

function love.load()
    WINDOW = Window.new()
    ENTITY_MANAGER = EntityManager.new()
    local movementSystem = MovementSystem.new()
    ENTITY_MANAGER:addSystem(movementSystem)
    SCENE_MANAGER = SceneManager.new()
    local testScene = TestScene.new(ENTITY_MANAGER)
    SCENE_MANAGER:set(testScene)
end

function love.update(dt)
    ENTITY_MANAGER:update(dt)
    SCENE_MANAGER:update(dt)
end

function love.draw()
    WINDOW:clear()
    ENTITY_MANAGER:render()
end
return {
    -- Components
    CameraFollowComponent = require 'engine.src.component.CameraFollowComponent',
    RigidBodyComponent = require 'engine.src.component.RigidBodyComponent',
    SpriteComponent = require 'engine.src.component.SpriteComponent',
    TextComponent = require 'engine.src.component.TextComponent',
    TransformComponent = require 'engine.src.component.TransformComponent',
    KeyboardControlComponent = require 'engine.src.component.KeyboardControlComponent',
    ScriptComponent = require 'engine.src.component.ScriptComponent',
    --- ECS
    Component = require 'engine.src.ecs.Component',
    Entity = require 'engine.src.ecs.Entity',
    EntityManager = require 'engine.src.ecs.EntityManager',
    Game = require 'engine.src.ecs.Game',
    Scene = require 'engine.src.ecs.Scene',
    SceneManager = require 'engine.src.ecs.SceneManager',
    System = require 'engine.src.ecs.System'
}

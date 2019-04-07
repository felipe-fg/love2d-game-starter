local Input = require("base.manager.input")
local Camera = require("base.manager.camera")
local Scene = require("base.manager.scene")
local MenuScene = require("game.scenes.menu")

function love.load()
	Input.mouseVisible(false)
	Camera.set(640, 480)

	Scene.push("Menu", MenuScene())
end

function love.update()
	Input.updateBefore()
	Scene.update(love.timer.getDelta())
	Input.updateAfter()
end

function love.draw()
	Camera.enable()
	Scene.draw()
	Camera.disable()
end

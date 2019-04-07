local Class = require("base.class")
local Input = require("base.manager.input")
local Scene = require("base.manager.scene")
local Menu = require("base.graphics.menu")

--- Main menu game scene.
local MenuScene = Class()

--- Creates a new main menu instance.
function MenuScene:constructor()
end

--- Loads the scene.
function MenuScene:load()
	local font = love.graphics.newFont(16)

	self.menu = Menu(font, 0, 110)

	self.menu:add("Play")
	self.menu:add("Quit")
end

--- Updates the scene.
-- @param delta Delta time.
function MenuScene:update(delta)
	if Input.keyPressed("up") then
		self.menu:previous()
	elseif Input.keyPressed("down") then
		self.menu:next()
	elseif Input.keyPressed("return") and self.menu:activeItem() == "Quit" then
		love.event.quit()
	end
end

--- Draws the scene
function MenuScene:draw()
	self.menu:draw()
end

return MenuScene

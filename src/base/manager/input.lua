--- Input utils.
-- Adds Love2D input events.
local Input = {}

local pressedKeys = {}
local pressedButtons = {}
local mousePosition = {x = 0, y = 0}
local mousePrevious = {x = 0, y = 0}

function love.keypressed(key, scancode, isrepeat)
	pressedKeys[key] = true
end

function love.mousepressed(x, y, button, istouch, presses)
	pressedButtons[button] = true
end

--- Updates the input manager.
-- Should be called before logic update.
function Input.updateBefore()
	mousePosition.x = love.mouse.getX()
	mousePosition.y = love.mouse.getY()
end

--- Updates the input manager after game update.
-- Should be called after logic update.
-- Clears pressed state.
function Input.updateAfter()
	for key in pairs(pressedKeys) do
		pressedKeys[key] = false
	end

	for button in pairs(pressedButtons) do
		pressedButtons[button] = false
	end

	mousePrevious.x = mousePosition.x
	mousePrevious.y = mousePosition.y
end

--- Checks if a key is pressed.
-- @param key Key to check.
-- @return True if pressed.
function Input.keyPressed(key)
	return pressedKeys[key] or false
end

--- Checks if a key is down.
-- @param key Key to check.
-- @return True if down.
function Input.keyDown(key)
	return love.keyboard.isDown(key)
end

--- Checks if a button is pressed.
-- @param button Button to check.
-- @return True if pressed.
function Input.buttonPressed(button)
	return pressedButtons[button] or false
end

--- Checks if a button is down.
-- @param button Button to check.
-- @return True if down.
function Input.buttonDown(button)
	return love.mouse.isDown(button)
end

--- Gets the mouse position.
-- @return Mouse position.
function Input.mousePosition()
	return {
		x = mousePosition.x,
		y = mousePosition.y
	}
end

--- Gets the previous mouse position.
-- @return Mouse position.
function Input.mousePrevious()
	return {
		x = mousePrevious.x,
		y = mousePrevious.y
	}
end

--- Gets the delta mouse position.
-- @return Mouse delta.
function Input.mouseDelta()
	return {
		x = mousePosition.x - mousePrevious.x,
		y = mousePosition.y - mousePrevious.y
	}
end

--- Changes mouse visibility.
-- @param visible If mouse is visible.
function Input.mouseVisible(visible)
	love.mouse.setVisible(visible)
end

return Input

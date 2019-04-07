--- Camera with virtual resolution support.
local Camera = {}

local game = {x = 0, y = 0, width = 0, height = 0}
local screen = {x = 0, y = 0, width = 0, height = 0, scale = 1}

function love.resize(width, height)
	Camera.update()
end

--- Sets the camera virtual resolution.
-- Triggers a camera update.
-- @param width Resolution width.
-- @param height Resolution height.
function Camera.set(width, height)
	game.width = width
	game.height = height

	Camera.update()
end

--- Updates the camera and computes the screen properties.
function Camera.update()
	local screenRatio = love.graphics.getWidth() / love.graphics.getHeight()
	local gameRatio = game.width / game.height

	if screenRatio > gameRatio then
		screen.width = love.graphics.getHeight() * gameRatio
		screen.height = love.graphics.getHeight()
		screen.x = (love.graphics.getWidth() - screen.width) / 2
		screen.y = 0
	elseif screenRatio < gameRatio then
		screen.width = love.graphics.getWidth()
		screen.height = love.graphics.getWidth() * (1 / gameRatio)
		screen.x = 0
		screen.y = (love.graphics.getHeight() - screen.height) / 2
	else
		screen.x = 0
		screen.y = 0
		screen.width = love.graphics.getWidth()
		screen.height = love.graphics.getHeight()
	end

	screen.scale = screen.width / game.width
end

--- Enables the camera transformation.
function Camera.enable()
	love.graphics.push()

	love.graphics.setScissor(screen.x, screen.y, screen.width, screen.height)
	love.graphics.translate(screen.x, screen.y)
	love.graphics.scale(screen.scale)

	love.graphics.translate(game.width / 2, game.height / 2)
	love.graphics.translate(-game.x, -game.y)
end

--- Disables the camera transformation.
function Camera.disable()
	love.graphics.setScissor()
	love.graphics.pop()
end

--- Converts a screen point to world coordinates.
-- @param point Screen point.
-- @return World coordinate.
function Camera.screenToWorld(point)
	point.x = point.x - screen.x
	point.y = point.y - screen.y

	point.x = point.x / screen.scale
	point.y = point.y / screen.scale

	point.x = point.x - game.width / 2
	point.y = point.y - game.height / 2

	point.x = point.x + game.x
	point.y = point.y + game.y

	return point
end

--- Converts a world point to screen coordinates.
-- @param point World point.
-- @return Screen coordinate.
function Camera.worldToScreen(point)
	point.x = point.x - game.x
	point.y = point.y - game.y

	point.x = point.x + game.width / 2
	point.y = point.y + game.height / 2

	point.x = point.x * screen.scale
	point.y = point.y * screen.scale

	point.x = point.x + screen.x
	point.y = point.y + screen.y

	return point
end

return Camera

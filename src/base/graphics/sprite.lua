local Class = require("base.class")

--- Sprite class with image, position, size and color.
local Sprite = Class()

--- Creates a new sprite instance.
-- @param image Love2D image.
-- @param x Sprite x position.
-- @param y Sprite y position.
function Sprite:constructor(image, x, y)
	self.image = image
	self.position = {x = x or 0, y = y or 0}
	self.size = {x = image:getWidth(), y = image:getHeight()}
	self.color = {1, 1, 1, 1}
end

--- Draws the sprite centered.
function Sprite:draw()
	love.graphics.setColor(self.color)

	local x = self.position.x - self.size.x / 2
	local y = self.position.y - self.size.y / 2

	local scaleX = self.size.x / self.image:getWidth()
	local scaleY = self.size.y / self.image:getHeight()

	love.graphics.draw(self.image, x, y, 0, scaleX, scaleY)
end

return Sprite

local Class = require("base.class")

--- Menu component class.
local Menu = Class()

--- Creates a new menu with no items.
-- @param font Love2D font.
-- @param x Menu x position.
-- @param y Menu y position.
function Menu:constructor(font, x, y)
	self.items = {}
	self.activeIndex = 0

	self.font = font
	self.color = {1, 1, 1, 0.5}
	self.activeColor = {1, 1, 1, 1}

	self.position = {x = x or 0, y = y or 0}
	self.size = {x = 0, y = 0}
end

--- Computes the entire menu size.
function Menu:computeSize()
	self.size.x = 0
	self.size.y = 0

	-- Checks the size of every item
	for _, item in ipairs(self.items) do
		self.size.y = self.size.y + self.font:getHeight()

		local width = self.font:getWidth(item)

		if width > self.size.x then
			self.size.x = width
		end
	end
end

--- Adds a new item to bottom.
-- @param item Item to add.
function Menu:add(item)
	table.insert(self.items, item)

	self:computeSize()

	if self.activeIndex == 0 then
		self.activeIndex = 1
	end
end

--- Changes the active item.
-- @param index Item index to change.
function Menu:change(index)
	self.activeIndex = math.min(math.max(index, 1), #self.items)
end

--- Goes to the previous item.
function Menu:previous()
	self:change(self.activeIndex - 1)
end

--- Goes to the next item.
function Menu:next()
	self:change(self.activeIndex + 1)
end

--- Gets the active item.
-- @return Active item.
function Menu:activeItem()
	return self.items[self.activeIndex]
end

--- Draws the menu centered.
function Menu:draw()
	love.graphics.setFont(self.font)

	for index, item in ipairs(self.items) do
		if index == self.activeIndex then
			love.graphics.setColor(self.activeColor)
		else
			love.graphics.setColor(self.color)
		end

		local x = self.position.x - (self.size.x / 2)
		local originY = self.position.y - (self.size.y / 2)
		local offsetY = (index - 1) * self.font:getHeight()
		local y = originY + offsetY

		love.graphics.print(item, x, y)
	end
end

return Menu

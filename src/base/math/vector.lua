local Class = require("base.class")

--- Vector class with two components.
local Vector = Class()

--- Creates a new vector instance.
-- @param x X number value.
-- @param y Y number value.
function Vector:constructor(x, y)
	self.x = x or 0
	self.y = y or 0
end

--- Checks if other vector has the same values.
-- @param other The vector to compare.
-- @return True if equals.
function Vector:equals(other)
	return self.x == other.x and self.y == other.y
end

--- Changes the values for this vector.
-- @param x X number value or a vector instance.
-- @param y Y number value. Ignored if using a vector instance.
-- @return Instance for chaining.
function Vector:set(x, y)
	if type(x) == "number" then
		self.x = x
		self.y = y
	else
		self.x = x.x
		self.y = x.y
	end

	return self
end

--- Sums the other vector or scalar.
-- @param other The vector or scalar to sum.
-- @return Instance for chaining.
function Vector:add(other)
	if type(other) == "number" then
		self.x = self.x + other
		self.y = self.y + other
	else
		self.x = self.x + other.x
		self.y = self.y + other.y
	end

	return self
end

--- Subtracts the other vector or scalar.
-- @param other The vector or scalar to subtract.
-- @return Instance for chaining.
function Vector:sub(other)
	if type(other) == "number" then
		self.x = self.x - other
		self.y = self.y - other
	else
		self.x = self.x - other.x
		self.y = self.y - other.y
	end

	return self
end

--- Multiplies with a scalar value.
-- @param scalar The scalar value to multiply.
-- @return Instance for chaining.
function Vector:mul(scalar)
	self.x = self.x * scalar
	self.y = self.y * scalar

	return self
end

--- Divides with a scalar value.
-- @param scalar The scalar value to divide.
-- @return Instance for chaining.
function Vector:div(scalar)
	if not (scalar == 0) then
		self.x = self.x / scalar
		self.y = self.y / scalar
	end

	return self
end

--- Computes the dot product.
-- @param other The other vector to compute.
-- @return Dot product.
function Vector:dot(other)
	return self.x * other.x + self.y * other.y
end

--- Computes the length of this vector.
-- @return Vector length.
function Vector:length()
	return math.sqrt(self:dot(self))
end

--- Normalizes the vector.
-- @return Instance for chaining.
function Vector:norm()
	self:div(self:length())

	return self
end

--- Global vectors
Vector.Temp = Vector(0, 0)
Vector.Zero = Vector(0, 0)
Vector.Left = Vector(-1, 0)
Vector.Right = Vector(1, 0)
Vector.Up = Vector(0, -1)
Vector.Down = Vector(0, 1)

return Vector

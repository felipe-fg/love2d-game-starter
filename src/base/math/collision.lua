--- Collision utils.
local Collision = {}

--- Checks if two objects are colliding.
-- Both objects should have position and size properties.
-- @param object The first object to check.
-- @param other The second object to check.
-- @param depth A vector to get depth information.
-- @return True if colliding.
function Collision.objects(object, other, depth)
	return Collision.rectangles(object.position, object.size, other.position, other.size, depth)
end

--- Checks if two rectangles are colliding.
-- @param positionA The position of first rectangle.
-- @param sizeA The size of first rectangle.
-- @param positionB The position of second rectangle.
-- @param sizeB The size of second rectangle.
-- @param depth A vector to get depth information.
-- @return True if colliding.
function Collision.rectangles(positionA, sizeA, positionB, sizeB, depth)
	depth.x = math.abs(positionA.x - positionB.x) - (sizeA.x / 2 + sizeB.x / 2)
	depth.y = math.abs(positionA.y - positionB.y) - (sizeA.y / 2 + sizeB.y / 2)

	if depth.x < 0 and depth.y < 0 then
		if depth.x < depth.y then
			depth.x = 0
		else
			depth.y = 0
		end

		if positionA.x < positionB.x then
			depth.x = -depth.x
		end

		if positionA.y < positionB.y then
			depth.y = -depth.y
		end

		return true
	else
		return false
	end
end

return Collision

--- Creates a new class with a constructor function.
-- @return Class table.
local function Class()
	local class = {}
	local class_mt = {}

	setmetatable(class, class_mt)
	class.__index = class

	--- Implements call function to create an instance.
	function class_mt.__call(_, ...)
		local instance = {}
		setmetatable(instance, class)

		instance:constructor(...)

		return instance
	end

	--- Checks if object is an instance of this class.
	-- @param object The object to check.
	-- @return True if same class.
	function class.instanceOf(object)
		return getmetatable(object) == class
	end

	return class
end

return Class

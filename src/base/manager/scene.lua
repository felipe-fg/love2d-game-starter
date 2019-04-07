--- Scene manager with a stack.
-- All scenes should have a load function.
local Scene = {}

local scenesByOrder = {}
local scenesByName = {}
local currentScene

--- Pushes a new scene to the list and changes to it.
-- @param name Name of the scene.
-- @param scene Scene instance.
function Scene.push(name, scene)
	if not scenesByName[name] then
		table.insert(scenesByOrder, scene)
		scenesByName[name] = scene

		scene:load()

		currentScene = scene
	end
end

--- Removes the current scene from the list and changes to the next.
function Scene.pop()
	if #scenesByOrder > 0 then
		table.remove(scenesByOrder)

		for name, scene in pairs(scenesByName) do
			if scene == currentScene then
				scenesByName[name] = nil
				break
			end
		end

		currentScene = scenesByOrder[#scenesByOrder]
	end
end

--- Changes the current scene.
-- Pushes the scene to the top.
-- @param name Name of the scene.
function Scene.change(name)
	local newScene = scenesByName[name]

	if newScene then
		for index, scene in ipairs(scenesByOrder) do
			if scene == newScene then
				table.remove(scenesByOrder, index)
				table.insert(scenesByOrder, scene)
				currentScene = scene
				break
			end
		end
	end
end

--- Updates the current scene.
-- @param delta Delta time.
function Scene.update(delta)
	if currentScene then
		currentScene:update(delta)
	end
end

--- Draws the current scene.
function Scene.draw()
	if currentScene then
		currentScene:draw()
	end
end

return Scene

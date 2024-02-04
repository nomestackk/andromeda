local Object = require 'libraries/classic'

---@class Component: Object
---@operator call: Component
local Component = Object:extend()
local EMPTY = {}

---@class ComponentSettings
---@field x number
---@field y number
---@field width number
---@field height number
---@field rotation integer
---@field events table<string, function[]>

---@param settings ComponentSettings
function Component:new(settings)
    settings = settings or EMPTY
    self.x = settings.x or 0
    self.y = settings.y or 0
    self.width = settings.width or love.graphics.getWidth()
    self.height = settings.height or love.graphics.getHeight()
    self.rotation = settings.rotation or 0
    self.events = settings.events or {}
end

---Adds an event listener to this Component.
---@param eventName string
---@param callback fun(self): any
function Component:addEventListener(eventName, callback)
    if not self.events[eventName] then
        self.events[eventName] = {}
    end
    self.events[eventName][#self.events[eventName] + 1] = callback
end

---Executes the given event with the given arguments.
---@param eventName string
---@param ... any
function Component:execute(eventName, ...)
    for index = 1, #self.events[eventName] do
        local event = self.events[eventName][index]
        event(self, ...)
    end
end

return Component

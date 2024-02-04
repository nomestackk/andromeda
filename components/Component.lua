local Object = require 'libraries/classic'

local getWidth = love.graphics.getWidth
local getHeight = love.graphics.getHeight
local getOS = love.system.getOS
local isDown = love.mouse.isDown
local getPosition = love.mouse.getPosition

local IS_IN_MOBILE_DEVICE = getOS() == "Android" or getOS() == "iOS"

---@param x number
---@param y number
---@param width number
---@param height number
---@param pointX number
---@param pointY number
local function getPointInsideOf(x, y, width, height, pointX, pointY)
    return pointX > x and pointX < x + width and pointY > y and pointY < y + height
end

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
---@field events table<ComponentEventName, function[]>
---@field mouseListener 1|2|3

---@alias ComponentEventName
---| "onClick"
---| "onRelease"
---| "onEnter"
---| "onLeave"

---@param settings ComponentSettings
function Component:new(settings)
    settings = settings or EMPTY
    self.x = settings.x or 0
    self.y = settings.y or 0
    self.width = settings.width or getWidth()
    self.height = settings.height or getHeight()
    self.rotation = settings.rotation or 0
    self.events = settings.events or {}
    self.hovered = false
    self.clicked = false
    self.mouseListener = settings.mouseListener or 1
end

---Capture onClick, onRelease, onEnter and onLeave events.
function Component:capture()
    if IS_IN_MOBILE_DEVICE then
    else
        local mouseX, mouseY = getPosition()
        local hovered = getPointInsideOf(self.x, self.y, self.width, self.height, mouseX, mouseY)
        local clicked = hovered and isDown(self.mouseListener)
        if hovered then
            if not self.hovered then
                self:execute('onEnter')
                self.hovered = true
            end
        else
            if self.hovered then
                self:execute('onLeave')
                self.hovered = false
            end
        end
        if clicked then
            if not self.clicked then
                self:execute('onClick')
                self.clicked = true
            end
        else
            if self.clicked then
                self:execute('onRelease')
                self.clicked = false
            end
        end
    end
end

---Adds an event listener to this Component.
---@param eventName ComponentEventName
---@param callback fun(self): any
function Component:addEventListener(eventName, callback)
    if not self.events[eventName] then
        self.events[eventName] = {}
    end
    self.events[eventName][#self.events[eventName] + 1] = callback
end

---Executes the given event with the given arguments.
---@param eventName ComponentEventName
---@param ... any
function Component:execute(eventName, ...)
    if self.events[eventName] then
        for index = 1, #self.events[eventName] do
            local event = self.events[eventName][index]
            event(self, ...)
        end
    end
end

return Component

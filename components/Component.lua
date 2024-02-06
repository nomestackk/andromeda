local Theme = require "components/Theme"
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

---@class ComponentSettings
---@field x? number
---@field y? number
---@field width? number
---@field height? number
---@field rotation? integer
---@field events? table<ComponentEventName, function[]> Represents a queue list of callbacks.
---@field mouseListener? 1|2|3 Determines which mouse button will be heard when clicks are calculated.
---@field parent? Container Components may have a Container as its parent. If it has this field represents the parent.
---@field display? boolean Determines whether this component is going to be rendered or not.
---@field enabled? boolean Determines whether this component is going to execute other events (except 'draw').
---@field variant? string Determines which variant of the current branch should this component use.
---@field branch? string Determines which branch of the theme this component is going to use.
---@field theme? Theme Determines which theme this component is going to use.

---@alias ComponentEventName
---| "onClick"
---| "onRelease"
---| "onEnter"
---| "onLeave"
---| "draw"

local EMPTY = {}

---@param settings? ComponentSettings
return function(settings)
    settings = settings or EMPTY

    if settings.enabled == nil then settings.enabled = true end
    if settings.display == nil then settings.display = true end

    ---@class Component
    ---@field parent Container?
    local Component = {}

    Component.parent = settings.parent
    Component.x = settings.x or 0
    Component.y = settings.y or 0
    Component.width = settings.width or getWidth()
    Component.height = settings.height or getHeight()
    Component.rotation = settings.rotation or 0
    Component.events = settings.events or {}
    Component.hovered = false
    Component.clicked = false
    Component.mouseListener = settings.mouseListener or 1
    Component.enabled = settings.enabled
    Component.display = settings.display
    Component.variant = settings.variant
    Component.branch = settings.branch
    Component.theme = settings.theme

    ---Searches for `self.theme[self.branch].variant[self.variant]` and returns the value, if it is found.
    ---If `self.theme` is nil then `GlobalTheme` is used instead.
    ---If `self.variant` is nil then the default variant is used.
    ---@return table variant
    function Component:getStyle()
        local theme = self.theme or GlobalTheme
        if not theme then error("Theme is undefined") end
        if not self.branch then error("Theme branch is undefined") end
        if not theme[self.branch] then error("Branch doesnt exists in the current theme") end
        local variant = self.variant or theme[self.branch].defaultVariant
        if not theme[self.branch].variant[variant] then error("Variant doesnt exists in current branch") end
        return theme[self.branch].variant[variant]
    end

    ---Captures onClick, onRelease, onEnter and onLeave events.
    ---This function is going to return immediately if `Component.enabled` is equal to `false`.
    function Component:capture()
        if not self.enabled then return end
        if IS_IN_MOBILE_DEVICE then
            -- TODO: Add mobile touch input.
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

    ---Executes the `draw` event queue if `Component.display` is equal to `true`.
    function Component:draw()
        if self.display then
            self:execute('draw')
        end
    end

    ---Adds an callback to the `eventName` event queue of this Component.
    ---You can add more than one callback to your event queue.
    ---They will be executed in the order you added them when you call `Component:execute()`
    ---@param eventName ComponentEventName
    ---@param callback fun(self, ...: any): any
    function Component:addEventListener(eventName, callback)
        if not self.events[eventName] then
            self.events[eventName] = {}
        end
        self.events[eventName][#self.events[eventName] + 1] = callback
    end

    ---Executes every callback in the `eventName` event queue of this Component.
    ---If the event queue doesn't exists no error is propagated.
    ---@param eventName ComponentEventName The name of the event queue.
    ---@param ... any Arguments to give for each callback.
    function Component:execute(eventName, ...)
        if self.events[eventName] then
            for index = 1, #self.events[eventName] do
                local event = self.events[eventName][index]
                event(self, ...)
            end
        end
    end

    return Component
end

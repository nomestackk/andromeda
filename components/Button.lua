local Component = require 'components/Component'
local Stylebox  = require 'components/Stylebox'
local TextStyle = require 'components/TextStyle'

---@class Button: Component
---@operator call: Button
local Button    = Component:extend()
local EMPTY     = {}

---@class ButtonSettings: ComponentSettings
---@field text string
---@field stylebox Stylebox
---@field textstyle TextStyle

---@param settings? ButtonSettings
function Button:new(settings)
    settings = settings or EMPTY
    self.super.new(self, settings)
    self.text = settings.text or "Undefined"
    self.stylebox = settings.stylebox or Stylebox({
        color = { 0.25, 0.25, 0.25, 1 },
        shrink = 8,
        radius = 8,
        border = 4,
        borderColor = { 0.05, 0.05, 0.05, 1 }
    })
    self.textstyle = settings.textstyle or TextStyle({
        color = { 0.75, 0.75, 0.75, 1 }
    })
end

function Button:draw()
    self.stylebox:draw(self.x, self.y, self.width, self.height)
    self.textstyle:draw(self.text, self.x, self.y, self.width, self.height)
end

return Button

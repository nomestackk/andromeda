local Component = require 'components/Component'
local Stylebox  = require 'components/Stylebox'
local TextStyle = require 'components/TextStyle'

---@class ButtonSettings: ComponentSettings
---@field text? string Represents the text content of this Button.
---@field stylebox? Stylebox Represents the Stylebox that will be rendered behind the text.
---@field textstyle? TextStyle Represents the TextStyle that will be rendered on top of the background.

local EMPTY     = {}

---Creates a new Button.
---A button is just a combination of a Stylebox and a TextStyle.
---Every other event is inherited from Component.
---@param settings? ButtonSettings A table containing the settings of the Button. This argument can be nil.
return function(settings)
    settings = settings or EMPTY

    ---@class Button: Component
    local Button = Component(settings)

    Button.text = settings.text or "Undefined"
    Button.stylebox = settings.stylebox or Stylebox({
        color = { 0.25, 0.25, 0.25, 1 },
        shrink = 8,
        radius = 8,
        border = 4,
        borderColor = { 0.05, 0.05, 0.05, 1 }
    })
    Button.textstyle = settings.textstyle or TextStyle({
        color = { 0.75, 0.75, 0.75, 1 }
    })

    Button:addEventListener("draw", function(self, ...)
        self:capture()
        self.stylebox:draw(self.x, self.y, self.width, self.height)
        self.textstyle:draw(self.text, self.x, self.y, self.width, self.height)
    end)

    return Button
end

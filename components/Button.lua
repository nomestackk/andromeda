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
---@param settings? ButtonSettings|string A table containing the settings of the Button. This argument can be nil.
return function(settings)
    settings = settings or EMPTY

    if type(settings) == "string" then
        settings = { text = settings }
    end

    settings.branch = "button"

    ---@class Button: Component
    local Button = Component(settings, "Button")

    local style = Button:getStyle()

    Button.text = settings.text or "Undefined"
    Button.stylebox = settings.stylebox or Stylebox(style.stylebox)
    Button.textstyle = settings.textstyle or TextStyle(style.textstyle)

    Button:addEventListener("draw", function(self, ...)
        self:capture()
        self.stylebox:draw(self.x, self.y, self.width, self.height)
        self.textstyle:draw(self.text, self.x, self.y, self.width, self.height)
    end)

    return Button
end

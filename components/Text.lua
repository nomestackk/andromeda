local Component = require "components/Component"
local TextStyle = require "components/TextStyle"

---@class TextSettings: ComponentSettings
---@field text? string
---@field textStyle? TextStyle

local EMPTY = {}

---Creates a new Text.
---Text is a component that can only draw a `TextStyle`.
---Supports events just like any class that inherits from `Component`.
---@param settings? TextSettings|string
---@return Text text
return function(settings)
  settings = settings or EMPTY

  if type(settings) == "string" then
    settings = { text = settings }
  end

  settings.branch = "text"

  ---@class Text: Component
  local Text = Component(settings, "Text")

  local style = Text:getStyle()

  Text.text = settings.text or "Undefined"
  Text.textStyle = settings.textStyle or TextStyle(style.textstyle)

  Text:addEventListener("draw", function(self)
    self.textStyle:draw(self.text, self.x, self.y, self.width, self.height)
  end)

  return Text
end

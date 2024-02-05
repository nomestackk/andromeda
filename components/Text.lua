local Component = require "components/Component"

---@class TextSettings: ComponentSettings

return function(settings)
  local Text = Component(settings)

  Text:addEventListener("draw", function(self, ...)

  end)
end

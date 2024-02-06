local Component = require "components/Component"
local Stylebox  = require "components/Stylebox"
---@class PanelSettings: ComponentSettings
---@field root Container
---@field stylebox? Stylebox

---Creates a Panel.
---Panels is a **Container** that renders a Stylebox before drawing its children.
---`root` must be a **Container** that will be used for alignment and cant be nil.
---@param settings PanelSettings
---@return Panel panel
---@see Component
---@see Container
---@see Stylebox
return function(settings)
  ---@class Panel: Container
  local Panel = settings.root
  Panel.name = "Panel"
  Panel.branch = "panel"

  local style = Panel:getStyle()

  Panel.stylebox = settings.stylebox or Stylebox(style.stylebox)

  Panel:addEventListener("draw", function(self)
    print("Panel draw event")
    ---@cast self Panel
    self.stylebox:draw(self.x, self.y, self.width, self.height)
  end)
  return Panel
end

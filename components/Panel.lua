local Component = require "components/Component"
local Stylebox  = require "components/Stylebox"
---@class PanelSettings: ComponentSettings
---@field root Container
---@field stylebox? Stylebox

---Creates a Panel.
---Panels are **Components** that renders a Stylebox before drawing its children.
---`root` must be a **Container** that will be used for alignment and cant be nil.
---@param settings PanelSettings
---@return Panel panel
---@see Component
---@see Container
---@see Stylebox
return function(settings)
  ---@class Panel: Component
  local Panel = Component({})

  Panel.root = settings.root ---@type Container
  Panel.stylebox = settings.stylebox or Stylebox({})

  Panel:addEventListener("draw", function(self)
    ---@cast self Panel
    self.root:call('draw')
  end)
  return Panel
end

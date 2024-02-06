local Container = require "components/Container"
local EMPTY = {}

---This container automatically aligns its children at the center of its box.
---The `alignmentMethod` is always set to 'position' when its created.
---@param settings? ContainerSettings
---@return Center center
return function(settings)
  settings = settings or EMPTY
  settings.alignmentMethod = 'position'

  ---@class Center: Container
  local Center = Container(settings, "Center")

  function Center:alignPosition()
    local x = self.x + self.width / 2
    local y = self.y + self.height / 2
    for i = 1, #self.children do
      local child = self.children[i]
      child.x = x - child.width / 2
      child.y = y - child.height / 2
    end
  end

  return Center
end

local Container = require "components/Container"

---Creates a VDiv.
---HDiv extends from `Container` and aligns its children horizontally.
---@param settings? ContainerSettings
return function(settings)
    ---@class VDiv: Container
    local VDiv = Container(settings)

    function VDiv:alignPosition()
        local y = self.y
        for i = 1, #self.children do
            local child = self.children[i]
            child.x = self.x
            child.y = y
            y = y + child.height
        end
    end

    function VDiv:alignSize()
        local height = self.height / #self.children
        for i = 1, #self.children do
            local child = self.children[i]
            child.height = height
            child.width = self.width
        end
    end

    return VDiv
end

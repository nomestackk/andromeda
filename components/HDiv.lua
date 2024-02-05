local Container = require "components/Container"

---Creates a HDiv.
---HDiv extends from `Container` and aligns its children horizontally.
---@param settings? ContainerSettings
return function(settings)
    ---@class HDiv: Container
    local HDiv = Container(settings)

    function HDiv:alignPosition()
        local x = self.x
        for i = 1, #self.children do
            local child = self.children[i]
            child.x = x
            child.y = self.y
            x = x + child.width
        end
    end

    function HDiv:alignSize()
        local width = self.width / #self.children
        for i = 1, #self.children do
            local child = self.children[i]
            child.width = width
            child.height = self.height
        end
    end

    return HDiv
end

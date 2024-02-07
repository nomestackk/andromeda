local Container = require "components/Container"

---Creates a HDiv.
---HDiv extends from `Container` and aligns its children horizontally.
---@param settings? ContainerSettings
return function(settings)
    ---@class HDiv: Container
    local HDiv = Container(settings, "HDiv")

    function HDiv:alignPosition()
        local x = self.x
        for i = 1, #self.children do
            local child = self.children[i]
            if not child.antiAlign then
                child.x = x
                child.y = self.y
                x = x + child.width + self.gap
            end
        end
    end

    function HDiv:alignSize()
        local width = self.width / #self.children
        for i = 1, #self.children do
            local child = self.children[i]
            if not child.antiAlign then
                child.width = width
                child.height = self.height
            end
        end
    end

    return HDiv
end

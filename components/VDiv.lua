local Container = require "components/Container"

---Creates a VDiv.
---VDiv extends from `Container` and aligns its children vertically.
---@param settings? ContainerSettings
return function(settings)
    ---@class VDiv: Container
    local VDiv = Container(settings, "VDiv")

    function VDiv:alignPosition()
        local y = self.y
        for i = 1, #self.children do
            local child = self.children[i]
            if not child.antiAlign then
                child.x = self.x
                child.y = y
                y = y + child.height + self.gap
            end
        end
    end

    function VDiv:alignSize()
        local height = self.height / #self.children
        for i = 1, #self.children do
            local child = self.children[i]
            if not child.antiAlign then
                child.height = height
                child.width = self.width
            end
        end
    end

    return VDiv
end

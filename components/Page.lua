local VDiv = require "components/VDiv"

---@class PageSettings
---@field root? Container Represents the root of the page which must be a Container. Defaults to a VDiv if this field is nil.

local EMPTY = {}

---@param settings? PageSettings
return function(settings)
    settings = settings or EMPTY

    ---@class Page
    local Page = {}

    Page.root = settings.root or VDiv()

    function Page:draw()
        self.root:call('draw')
    end

    return Page
end

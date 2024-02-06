local VDiv = require "components/VDiv"

---@param root? Container
return function(root)
    ---@class Page: Container
    local Page = root or VDiv()

    Page.name = "Page"
    Page.root = Page

    return Page
end

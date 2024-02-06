local Page   = require "components/Page"
local Center = require "components/Center"
local Button = require "components/Button"
local VDiv   = require "components/VDiv"
return function()
  ---@class AppProjectManager: Page
  local AppProjectManager = Page()

  local modal = AppProjectManager.root:add(Center({
    children = {
      Panel({
        root = VDiv({

        })
      })
    }
  }))

  return AppProjectManager
end

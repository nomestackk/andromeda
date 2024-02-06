local Page = require "components/Page"
local HDiv = require "components/HDiv"
local Button = require "components/Button"

return function()
    ---@class AppStartMenu: Page
    local AppStartMenu = Page({ root = HDiv() })

    AppStartMenu.playButton = AppStartMenu.root:addImmutable(Button({
        text = "Play",
    }))
    AppStartMenu.buildButton = AppStartMenu.root:addImmutable(Button({
        text = "Build",
    }))

    AppStartMenu.buildButton:addEventListener("onClick", function(self)
        GlobalPageManager:enter(GlobalPages.AppProjectManager)
    end)

    AppStartMenu.root:align()

    return AppStartMenu
end

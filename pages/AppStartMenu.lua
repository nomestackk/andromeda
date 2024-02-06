local Page = require "components/Page"
local HDiv = require "components/HDiv"
local Button = require "components/Button"

return function()
    ---@class AppStartMenu: Page
    local AppStartMenu = Page(HDiv())

    local play = Button('Play')
    local build = Button('Build')

    build:addEventListener("onClick", function()
        GlobalPageManager:enter(GlobalPages.AppProjectManager)
    end)

    AppStartMenu = AppStartMenu + play
    AppStartMenu = AppStartMenu + build

    return AppStartMenu
end

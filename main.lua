function love.load()
    require 'save'

    AndromedaInitialize()

    local AppStartMenu = require "pages/AppStartMenu"
    local roomy = require "libraries/roomy"

    GlobalPages = {
        AppStartMenu = AppStartMenu()
    }

    GlobalPageManager = roomy.new()
    GlobalPageManager:hook()
    GlobalPageManager:enter(GlobalPages.AppStartMenu)
end

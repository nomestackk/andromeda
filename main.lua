function love.load()
    require 'save'
    print("\n")

    AndromedaInitialize()

    local AppProjectManager = require "pages/AppProjectManager"
    local AppStartMenu = require 'pages/AppStartMenu'
    local roomy = require 'libraries/roomy'

    GlobalTheme = require('app/themes/' .. AppSettings.theme)

    GlobalPages = {
        AppStartMenu = AppStartMenu(),
        AppProjectManager = AppProjectManager()
    }

    GlobalPageManager = roomy.new()
    GlobalPageManager:hook()
    GlobalPageManager:enter(GlobalPages.AppStartMenu)
end

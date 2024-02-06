local AppProjectManager = require "pages/AppProjectManager"
function love.load()
    require 'save'

    AndromedaInitialize()

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

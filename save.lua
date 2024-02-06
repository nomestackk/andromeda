local ser = require 'libraries/ser'
local SettingsFilePath = 'settings.lua'
local ProjectsFolderPath = 'projects/'

function AndromedaNewSave()
    AppSettings = {
        uiScale = 1,
        theme = "Bootstrap"
    }
    love.filesystem.createDirectory(ProjectsFolderPath)
end

function AndromedaSave()
    love.filesystem.write(SettingsFilePath, ser(AppSettings))
end

function AndromedaLoad()
    AppSettings = loadstring(love.filesystem.read(SettingsFilePath))()
end

function AndromedaInitialize()
    local info = love.filesystem.getInfo(SettingsFilePath)
    if not info then
        AndromedaNewSave()
        AndromedaSave()
    else
        AndromedaLoad()
    end
end

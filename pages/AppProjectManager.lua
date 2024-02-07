local Page              = require 'components/Page'
local Button            = require 'components/Button'
local VDiv              = require 'components/VDiv'
local HDiv              = require 'components/HDiv'
local ProjectComponent  = require 'components/AppProjectManager/ProjectComponent'
local Project           = require 'components/Andromeda/Project'

local getDirectoryItems = love.filesystem.getDirectoryItems
local read              = love.filesystem.read

return function()
  ---@class AppProjectManager: Page
  local AppProjectManager = Page(VDiv { alignmentMethod = 'position' })

  -- Control bar

  local controlbar = HDiv { height = 50 }

  local back = Button '<<<'
  back:addEventListener('onClick', function() GlobalPageManager:enter(GlobalPages.AppStartMenu) end)

  local create = Button { text = 'Create', variant = 'light' }
  create:addEventListener('onRelease', function()
    Project.create()
    AppProjectManager.render()
  end)

  controlbar:addImmutable(back)
  controlbar:addImmutable(create)

  AppProjectManager:addImmutable(controlbar)

  -- List

  local list = VDiv { alignmentMethod = 'position' }
  AppProjectManager:addImmutable(list)
  list:setAvailableHeight()

  -- AppProjectManager

  function AppProjectManager.render()
    list:clear()
    list:map(getDirectoryItems 'projects', function(value)
      local data = 'projects/' .. value .. '/data.lua'
      local content = read(data)
      local projectdata = loadstring(content)()
      return ProjectComponent(projectdata)
    end)
  end

  function AppProjectManager:enter()
    AppProjectManager.render()
  end

  controlbar.debug = true
  list.debug = true

  AppProjectManager:align()

  return AppProjectManager
end

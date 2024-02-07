local Page              = require 'components/Page'
local Button            = require 'components/Button'
local VDiv              = require 'components/VDiv'
local HDiv              = require 'components/HDiv'
local ProjectComponent  = require 'components/AppProjectManager/ProjectComponent'
local Center            = require 'components/Center'
local Project           = require 'components/Andromeda/Project'
local ConfirmModal      = require 'components/Modals/ConfirmModal'

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

  -- Center

  local center = Center()
  local confirm = ConfirmModal {
    title = "Are you sure that you want to delete this project?",
    yes = function()

    end,
    no = function()

    end
  }

  -- AppProjectManager

  function AppProjectManager.render()
    list:clear()
    list:map(getDirectoryItems 'projects', function(value)
      local data = 'projects/' .. value .. '/data.lua'
      local content = read(data)
      local projectdata = loadstring(content)()
      local component = ProjectComponent(projectdata)
      component:addEventListener('project:delete', function()
        Project.delete(value)
        AppProjectManager.render()
      end)
      component:addEventListener('project:rename', function()
        -- TODO
      end)
      return component
    end)
  end

  function AppProjectManager:enter()
    AppProjectManager.render()
  end

  AppProjectManager:align()

  return AppProjectManager
end

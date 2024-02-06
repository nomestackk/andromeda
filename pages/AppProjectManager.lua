local Page             = require "components/Page"
local Button           = require "components/Button"
local VDiv             = require "components/VDiv"
local HDiv             = require "components/HDiv"
local ProjectComponent = require "components/AppProjectManager/ProjectComponent"

return function()
  ---@class AppProjectManager: Page
  local AppProjectManager = Page(VDiv { alignmentMethod = 'position' })

  -- Control bar

  local controlbar = HDiv { height = 50 }

  local back = Button('<<<')
  local create = Button('Create')
  local rename = Button('Rename')
  local delete = Button('Delete')

  controlbar:addImmutable(back)
  controlbar:addImmutable(create)
  controlbar:addImmutable(rename)
  controlbar:addImmutable(delete)

  AppProjectManager:addImmutable(controlbar)

  -- List

  local list = VDiv { alignmentMethod = 'position' }
  AppProjectManager:addImmutable(list)
  list:setAvailableHeight()

  -- Functions

  local function render()
    list:clear()
    list:map(love.filesystem.getDirectoryItems("projects"), function(value)
      local data = value .. '/data.lua'
      local content = love.filesystem.read(data)
      local projectdata = loadstring(content)()
      return ProjectComponent(projectdata)
    end)
  end

  -- AppProjectManager

  function AppProjectManager:enter()
    render()
  end

  AppProjectManager:align()

  return AppProjectManager
end

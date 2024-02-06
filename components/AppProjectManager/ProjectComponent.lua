local HDiv = require "components/HDiv"
local VDiv = require "components/VDiv"
local Text = require "components/Text"
local Center = require "components/Center"
local Button = require "components/Button"

---@class ProjectComponentSettings
---@field project Project

---@param settings ProjectComponentSettings
return function(settings)
  assert(settings, "Missing 'settings' argument")

  local project = settings.project

  ---@class ProjectComponent: VDiv
  local ProjectComponent = VDiv()

  ProjectComponent.title = ProjectComponent:add(Text())
  ProjectComponent.modal = ProjectComponent:add(Center({
    children = {
      Button({
        text = "This button should be on the center of the Window.",
        width = 100,
        height = 100
      })
    }
  }))

  return ProjectComponent
end

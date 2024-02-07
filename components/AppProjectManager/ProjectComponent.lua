local HDiv = require "components/HDiv"
local VDiv = require "components/VDiv"
local Text = require "components/Text"
local Center = require "components/Center"
local Button = require "components/Button"

---@param project Project
return function(project)
  local ProjectComponent = VDiv { height = 100, alignmentMethod = 'position' }

  local title = ProjectComponent:addImmutable(project.name .. '-' .. project.author)
  title.height = 50

  local controls = ProjectComponent:addImmutable(HDiv()) ---@cast controls HDiv
  controls.height = 50

  local delete = controls:addImmutable(Button 'Delete')
  local rename = controls:addImmutable(Button 'Rename')

  ProjectComponent:align()

  return ProjectComponent
end

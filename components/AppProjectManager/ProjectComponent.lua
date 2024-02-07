local HDiv = require "components/HDiv"
local VDiv = require "components/VDiv"
local Button = require "components/Button"

---@param project Project
return function(project)
  local ProjectComponent = VDiv { height = 100, alignmentMethod = 'position' }

  local title = ProjectComponent:addImmutable(project.name .. ' - ' .. project.author)
  title.height = 50

  local controls = ProjectComponent:addImmutable(HDiv()) ---@cast controls HDiv
  controls.height = 50

  local edit = controls:addImmutable(Button 'Edit')
  edit:addEventListener('onClick', function()
    ProjectComponent:execute('project:open')
  end)

  local delete = controls:addImmutable(Button 'Delete')
  delete:addEventListener('onClick', function()
    ProjectComponent:execute('project:delete')
  end)

  local rename = controls:addImmutable(Button 'Rename')

  ProjectComponent:align()

  return ProjectComponent
end

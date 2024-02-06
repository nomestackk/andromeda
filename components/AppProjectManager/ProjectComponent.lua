local HDiv = require "components/HDiv"
local VDiv = require "components/VDiv"
local Text = require "components/Text"
local Center = require "components/Center"
local Button = require "components/Button"

---@param project Project
return function(project)
  local ProjectComponent = VDiv {
    height = 100
  }

  ProjectComponent:addImmutable(Text({ text = project.name .. '-' .. project.author }))
  local hdiv = HDiv()

  -- TODO

  return ProjectComponent
end

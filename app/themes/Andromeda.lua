local Theme = require 'components/Theme'


---@type Theme
local Andromeda = {} ---@diagnostic disable-line

Theme.use("Andromeda")
Theme.define("Andromeda", Andromeda)

Andromeda.Pallete = {
  White = { 1, 1, 1, 1 },
  Black = { 0, 0, 0, 1 }
}
Andromeda.Font = {
  Geist = love.graphics.newFont(14)
}
Andromeda.Button = {
  Default = "Dark",
  Variant = {
    Dark = {
      StyleBox = {
        shrink = 4,
        radius = 8,
        color = Theme.color("Black"),
        border = 0,
        borderColor = Theme.color("Transparent")
      },
      TextStyle = {
        font = Theme.font("Geist"),
        color = Theme.color("White"),
        decoration = "none",
        halign = "center",
        valign = "middle"
      }
    },
    Light = {
      StyleBox = {
        shrink = 4,
        radius = 8,
        color = Theme.color("White"),
        border = 0,
        borderColor = Theme.color("Transparent")
      },
      TextStyle = {
        font = Theme.font("Geist"),
        color = Theme.color("Black"),
        decoration = "none",
        halign = "center",
        valign = "middle"
      }
    }
  }
}

local Theme     = require 'components/Theme'
local rgb       = require 'app/utils/rgb'

--TODO: Finish

---@type Theme
local Bootstrap = {} ---@diagnostic disable-line

Theme.use("Bootstrap")
Theme.define("Bootstrap", Bootstrap)

Bootstrap.Pallete = {
  White = rgb(248, 249, 250),
  Blue = rgb(13, 110, 253),
  Black = rgb(33, 37, 41),
  Gray = rgb(108, 117, 125),
  Green = rgb(25, 135, 84),
  Red = rgb(220, 53, 69),
  Yellow = rgb(255, 193, 7),
  Cyan = rgb(13, 202, 240),
  Transparent = rgb(0, 0, 0, 0)
}
Bootstrap.Font = {
  Geist = love.graphics.newFont(14)
}
Bootstrap.Core = {
  Button = {
    StyleBox = {
      shrink = 4,
      radius = 8,
      border = 0,
      borderColor = Theme.color('Transparent')
    },
    TextStyle = {
      font = Theme.font("Geist"),
      color = Theme.color("White"),
      decoration = "none",
      halign = "center",
      valign = "middle"
    }
  }
}
Bootstrap.Button = {
  Default = "Dark",
  Variant = {
    Dark = {
      StyleBox = Theme.extendBranch("Button", "StyleBox", {
        color = Theme.color("Black"),
      }),
      TextStyle = Theme.extendBranch("Button", "TextStyle", {
        color = Theme.color("White")
      })
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
    },
    Primary = {

    }
  }
}

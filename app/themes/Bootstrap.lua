local rgb = require 'app/utils/rgb'

---@type Theme
---@diagnostic disable-next-line
local Bootstrap = {}
Bootstrap.author = "nomestack"
Bootstrap.color = {
  panelBackground = rgb(33, 37, 41),
  panelBorder = rgb(75, 79, 83),
  blue = rgb(13, 110, 253),

  white = rgb(248, 249, 250),
  gray = rgb(108, 117, 125),
  darkgray = rgb(25, 25, 25),
  black = rgb(32, 35, 39)
}
Bootstrap.font = {
  default = love.graphics.newFont(14)
}
Bootstrap.font.default:setFilter("nearest", "nearest")
Bootstrap.panel = {
  defaultVariant = "dark",
  variant = {
    dark = {
      stylebox = {
        color = Bootstrap.color.panelBackground,
        border = 1,
        borderColor = Bootstrap.color.panelBorder
      }
    }
  }
}
Bootstrap.text = {
  defaultVariant = "light",
  variant = {
    light = {
      textstyle = {
        font = Bootstrap.font.default,
        color = Bootstrap.color.white
      }
    }
  }
}
Bootstrap.button = {
  defaultVariant = "dark",
  variant = {
    light = {
      stylebox = { shrink = 4, radius = 4, color = Bootstrap.color.white },
      textstyle = { font = Bootstrap.font.default, color = Bootstrap.color.black }
    },
    dark = {
      stylebox = { shrink = 4, radius = 4, color = Bootstrap.color.darkgray },
      textstyle = { font = Bootstrap.font.default, color = Bootstrap.color.white }
    }
  }
}

return Bootstrap

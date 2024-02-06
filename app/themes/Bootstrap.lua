local Theme = require 'components/Theme'
local rgb = require 'app/utils/rgb'

---@type ThemeSettings
---@diagnostic disable-next-line
local Bootstrap = {}
Bootstrap.name = "Bootstrap"
Bootstrap.author = "nomestack"
Bootstrap.color = {
  white = rgb(245, 245, 245),
  black = rgb(10, 10, 10)
}
Bootstrap.font = {
  default = love.graphics.newFont(14)
}
Bootstrap.font.default:setFilter("nearest", "nearest")
Bootstrap.text = {
  defaultVariant = "light",
  variant = {
    light = {
      textstyle = {
        font = Bootstrap.font.default,
        color = Bootstrap.color.black
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
      stylebox = { shrink = 4, radius = 4, color = Bootstrap.color.black },
      textstyle = { font = Bootstrap.font.default, color = Bootstrap.color.white }
    }
  }
}

return Theme(Bootstrap)

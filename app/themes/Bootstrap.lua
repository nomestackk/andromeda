local Theme = require 'components/Theme'
local rgb = require 'app/utils/rgb'

---@type ThemeSettings
---@diagnostic disable-next-line
local Boostrap = {}
Boostrap.name = "Bootstrap"
Boostrap.author = "nomestack"
Boostrap.color = {
  white = rgb(245, 245, 245),
  black = rgb(10, 10, 10)
}
Boostrap.font = {
  default = love.graphics.newFont(14)
}
Boostrap.font.default:setFilter("nearest", "nearest")
Boostrap.button = {
  defaultVariant = "dark",
  variant = {
    light = {
      stylebox = { shrink = 4, radius = 4, color = Boostrap.color.white },
      textstyle = { font = Boostrap.font.default, color = Boostrap.color.black }
    },
    dark = {
      stylebox = { shrink = 4, radius = 4, color = Boostrap.color.black },
      textstyle = { font = Boostrap.font.default, color = Boostrap.color.white }
    }
  }
}

return Theme(Boostrap)

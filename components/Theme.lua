---@class Theme
---@field name string
---@field author string
---@field color table<string, color>
---@field font table<string, love.Font>
---@field button ThemeStyleButton
---@field text ThemeStyleText
---@field panel ThemeStylePanel

---@class ThemeStyle
---@field defaultVariant string
---@field variant table<string, table>

---@class ThemeStylePanel
---@field variant table<string, { stylebox: StyleboxSettings }>

---@class ThemeStyleText: ThemeStyle
---@field variant table<string, { stylebox: StyleboxSettings }>

---@class ThemeStyleButton: ThemeStyle
---@field variant table<string, { stylebox: StyleboxSettings, textstyle: TextStyleSettings }>

---@param settings Theme
return function(settings)
  return settings
end

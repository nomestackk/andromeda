---@type Theme[]
local Themes = {}

---@class Theme.ButtonConfiguration
---@field TextStyle TextStyleSettings
---@field StyleBox StyleboxSettings

---@class Theme.Button
---@field Default string
---@field Variant table<string, Theme.ButtonConfiguration>

---@class Theme
---@field Core table<string, table>
---@field Pallete table<string, color>
---@field Font table<string, love.Font>
---@field Button Theme.Button

local Theme = {}

local currentTheme

---Creates a new Theme.
---@param newTheme string The name of the theme. If the name collides with an already defined theme it will cause an error.
---@param themeStructure Theme Structure of the theme.
function Theme.define(newTheme, themeStructure)
  if Themes[newTheme] then error("A theme called: " .. tostring(newTheme) .. " already exists.") end
  Themes[newTheme] = themeStructure
  currentTheme = newTheme
end

function Theme.extend(id, other)
  local from = Theme.get().Core[id]
  local new = {}
  for k, v in pairs(from) do
    if other[k] then
      new[k] = other[k]
    else
      new[k] = v
    end
  end
  return new
end

function Theme.get()
  return Themes[currentTheme]
end

function Theme.use(themeName)
  currentTheme = themeName
end

function Theme.color(colorId)
  return Themes[currentTheme].Pallete[colorId]
end

function Theme.font(fontId)
  return Themes[currentTheme].Font[fontId]
end

return Theme

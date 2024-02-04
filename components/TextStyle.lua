local Object = require 'libraries/classic'

local getFont = love.graphics.getFont
local setFont = love.graphics.setFont
local setColor = love.graphics.setColor
local printf = love.graphics.printf

---@class TextStyle: Object
local TextStyle = Object:extend()
local EMPTY = {}

---@class TextStyleSettings
---@field font love.Font
---@field color color
---@field decoration "none"|"underline"|"line-through"|"overline"
---@field halign love.AlignMode
---@field valign "top"|"middle"|"bottom"

---@param settings? TextStyleSettings
function TextStyle:new(settings)
    settings = settings or EMPTY
    self.font = settings.font or getFont()
    self.color = settings.color or { 1, 1, 1, 1 }
    self.decoration = settings.decoration or "none"
    self.halign = settings.halign or "center"
    self.valign = settings.valign or "middle"
end

---Draws this TextStyle.
---@param text string
---@param x number
---@param y number
---@param width number
---@param height number
function TextStyle:draw(text, x, y, width, height)
    local textY
    if self.valign == "top" then
        textY = y
    elseif self.valign == "middle" then
        textY = y + (height - self.font:getHeight()) / 2
    elseif self.valign == "bottom" then
        textY = y + (height - self.font:getHeight())
    end
    setColor(self.color)
    setFont(self.font)
    printf(
        text,
        x,
        textY,
        width,
        self.halign
    )
end

return TextStyle

local Object = require 'libraries/classic'

---@class Stylebox: Object
---@operator call: Stylebox
local Stylebox = Object:extend()

---@class StyleboxSettings
---@field color color
---@field shrink integer
---@field border integer
---@field borderColor color
---@field radius integer

local EMPTY = {}
local WHITE = { 1, 1, 1, 1 }

---@param settings StyleboxSettings
function Stylebox:new(settings)
    settings = settings or EMPTY
    self.color = settings.color or WHITE
    self.shrink = settings.shrink or 0
    self.border = settings.border or 0
    self.borderColor = settings.borderColor or WHITE
    self.radius = settings.radius or 0
end

---Draws this Stylebox.
---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation? integer
---@param ox? number
---@param oy? number
function Stylebox:draw(x, y, width, height, rotation, ox, oy)
    x = x + self.shrink
    y = y + self.shrink
    width = width - self.shrink * 2
    height = height - self.shrink * 2
    rotation = rotation or 0
    ox = ox or width / 2
    oy = oy or height / 2
    love.graphics.push()
    love.graphics.translate(x + ox, y + oy)
    love.graphics.rotate(-rotation)
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", -ox, -oy, width, height, self.radius, self.radius)
    if self.border > 0 then
        love.graphics.setColor(self.borderColor)
        love.graphics.setLineWidth(self.border)
        love.graphics.rectangle("line", -ox, -oy, width, height, self.radius, self.radius)
    end
    love.graphics.pop()
end

return Stylebox

---@class StyleboxSettings
---@field color? color The background color of the stylebox.
---@field shrink? integer Shrinks the size of the stylebox.
---@field border? integer Border width of the stylebox
---@field borderColor? color Border color of the stylebox.
---@field radius? integer Corner radius of the stylebox.

local EMPTY = {}
local WHITE = { 1, 1, 1, 1 }

local push = love.graphics.push
local pop = love.graphics.pop
local setColor = love.graphics.setColor
local rectangle = love.graphics.rectangle
local translate = love.graphics.translate
local rotate = love.graphics.rotate
local setLineWidth = love.graphics.setLineWidth

---Abstract base class for defining stylized boxes for UI elements.
---@param settings? StyleboxSettings Settings for the Stylebox.
---@return Stylebox stylebox The new Stylebox.
return function(settings)
    settings = settings or EMPTY

    ---@class Stylebox
    local Stylebox = {}

    Stylebox.color = settings.color or WHITE
    Stylebox.shrink = settings.shrink or 0
    Stylebox.border = settings.border or 0
    Stylebox.borderColor = settings.borderColor or WHITE
    Stylebox.radius = settings.radius or 0

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
        push()
        translate(x + ox, y + oy)
        rotate(-rotation)
        setColor(self.color)
        rectangle("fill", -ox, -oy, width, height, self.radius, self.radius)
        if self.border > 0 then
            setColor(self.borderColor)
            setLineWidth(self.border)
            rectangle("line", -ox, -oy, width, height, self.radius, self.radius)
        end
        pop()
    end

    return Stylebox
end

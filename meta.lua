---@alias color { [1]: integer, [2]: integer, [3]: integer, [4]: integer }

---@class ProjectSprite

---@class ProjectObject

---@class ProjectLevel

---@class ProjectScript

---@class ProjectSound

---@class Project
---@field name string
---@field author string
---@field version string
---@field sprites table<string, ProjectSprite>
---@field objects table<string, ProjectObject>
---@field levels table<string, ProjectLevel>
---@field scripts table<string, ProjectScript>
---@field sounds table<string, ProjectSound>

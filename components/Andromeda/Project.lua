local ser = require 'libraries/ser'

local createDirectory = love.filesystem.createDirectory
local write = love.filesystem.write
local read = love.filesystem.read
local assert = assert
local type = type
local remove = love.filesystem.remove
local getInfo = love.filesystem.getInfo
local getDirectoryItems = love.filesystem.getDirectoryItems

local function recursivelyDelete(item)
    if getInfo(item, "directory") then
        local items = getDirectoryItems(item)
        for childIdx = 1, #items do
            local child = items[childIdx]
            recursivelyDelete(item .. '/' .. child)
            remove(item .. '/' .. child)
        end
    elseif getInfo(item) then
        remove(item)
    end
    remove(item)
end

local Project = {}

local PROJECT_FOLDER = "projects/"

---Gets the path for the data file of the project `name`.
---@param projectName string
---@return string
function Project.data(projectName)
    return PROJECT_FOLDER .. projectName .. '/data.lua'
end

---Gets the folder of a project based on its name.
---@param name string
---@return string
function Project.folder(name)
    return PROJECT_FOLDER .. name
end

---Deletes the project `name`.
---@param name string
function Project.delete(name)
    recursivelyDelete(Project.folder(name))
end

function Project.readData(projectName)
    assert(projectName, "Project.readData(projectName): projectName is undefined (nil)")
    assert(type(projectName) == "string", "Project.readData(projectName): projectName must be a string")
    local folderPath = PROJECT_FOLDER .. projectName
    return read(folderPath .. '/data.lua')
end

---Creates a Project.
---@param name? string
function Project.create(name)
    name = name or 'Unnamed'
    assert(type(name) == 'string', 'Project.create(name): name must be a string.')

    local folderPath = 'projects/' .. name
    local dataPath = folderPath .. '/data.lua'
    local assetsFolder = folderPath .. "/assets"

    ---@type Project
    local data = {
        name = name,
        author = 'Unknown',
        version = '1.0',
        sprites = {},
        objects = {},
        levels = {},
        scripts = {},
        sounds = {}
    }

    createDirectory(folderPath)
    createDirectory(assetsFolder)
    local success = write(dataPath, ser(data))
    return success
end

return Project

local ser = require 'libraries/ser'

local createDirectory = love.filesystem.createDirectory
local write = love.filesystem.write
local read = love.filesystem.read
local assert = assert
local type = type

local Project = {}

local PROJECT_FOLDER = "projects/"

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

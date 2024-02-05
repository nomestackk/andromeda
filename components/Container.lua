local Component = require "components/Component"

---@class ContainerSettings: ComponentSettings
---@field gap? integer Determines how many gap this component will have.
---@field alignmentMethod? 'position+size'|'position'|'size' Determines how this component will align its children.
---@field children? Component[] Determines the list of children of this component.
---@field alignOnMutation? boolean Determines whether this container should be align when `x`, `y`, `width` and `height` properties are changed.

local EMPTY = {}

---Creates a new Container.
---By default containers automatically aligns its children when its position is mutated.
---This class's won't do anything. See `HDiv`, `VDiv` or `Grid` instead.
---@param settings? ContainerSettings A table containing the settings of the Container. This argument can be nil.
return function(settings)
    settings = settings or EMPTY

    if settings.alignOnMutation == nil then settings.alignOnMutation = true end

    ---@class Container: Component
    local Container = Component(settings)

    Container.alignOnMutation = settings.alignOnMutation
    Container.alignmentMethod = settings.alignmentMethod or 'position+size'
    Container.gap = settings.gap or 0
    Container.children = settings.children or {} ---@type Component[]

    ---This function is designed to mutate the position of every child of this Container.
    ---This function will only be called if `Component.alignmentMethod` is equal to 'position+size' or 'position'.
    ---@protected
    function Container:alignPosition()
    end

    ---This function is designed to mutate the size of every child of this Container.
    ---This function will only be called if `Component.alignmentMethod` is equal to 'position+size' or 'size'.
    ---@protected
    function Container:alignSize()
    end

    ---Calculates the given dimension name.
    ---This function works like this:
    ---```lua
    ---local dimensionValue = 0
    ---for index = 1, #self.children do
    ---local child = self.children[i]
    ---dimensionValue = dimensionValue + child[dimensionName] + self.gap
    ---return value
    ---end
    ---```
    ---@param dimensionName 'width'|'height' Determines what dimension should be used in the calculation.
    ---@return integer dimensionValue
    function Container:getDimensionBasedOnChildren(dimensionName)
        local value = 0
        for i = 1, #self.children do
            local child = self.children[i]
            value = value + child[dimensionName] + self.gap
        end
        return value
    end

    ---Calls `Container:alignPosition()` and `Container:alignSize()` on this container
    ---based on the value of `Container.alignmentMethod`.
    ---If the alignment method is equal to 'position+size' then it will align the position
    ---and the size. If the alignment method is equal to 'position' it will align only the
    ---position. If the alignment method is equal to 'size' it will align only the size.
    function Container:align()
        if self.alignmentMethod == 'position+size' then
            self:alignPosition()
            self:alignSize()
        elseif self.alignmentMethod == 'position' then
            self:alignPosition()
        elseif self.alignmentMethod == 'size' then
            self:alignSize()
        end
        for i = 1, #self.children do
            local child = self.children[i]
            if child.align then ---@diagnostic disable-line
                child:align() ---@diagnostic disable-line
            end
        end
    end

    ---Adds `component` to the list of children of this Component and calls `Container:align()` after.
    ---@param component Component
    function Container:add(component)
        self.children[#self.children + 1] = component
        self:align()
        return component
    end

    ---Adds `component` to the list of children of this Component but doesn't call `Container:align()`.
    ---@param component any
    function Container:addImmutable(component)
        self.children[#self.children + 1] = component
        return component
    end

    ---Executes `functionName` for every child of this Component.
    ---Doesn't propagates an error if `functionName` doesnt exists in some child.
    ---There is no need to write: `Container:call('call', 'functionName')` because if the child has a method called `call`
    ---this method will be executed with the same arguments as this function call.
    ---@param functionName string Name of the function to be called in every component.
    ---@param ... any Arguments to give to the function call.
    function Container:call(functionName, ...)
        for i = 1, #self.children do
            local child = self.children[i]
            if child.call then ---@diagnostic disable-line
                child:call(functionName, ...) ---@diagnostic disable-line
            else
                if child[functionName] then
                    child[functionName](child, ...)
                end
            end
        end
    end

    setmetatable(Container, {
        ---@param self Container
        ---@param key string
        ---@param value any
        __newindex = function(self, key, value)
            rawset(self, key, value)
            if key == "x" or key == "y" or key == "width" or key == "height" then
                print("Called align because of mutation")
                self:align()
            end
        end
    })

    return Container
end

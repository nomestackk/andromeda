local Panel = require 'components/Panel'
local VDiv = require 'components/VDiv'
local HDiv = require 'components/HDiv'
local Text = require 'components/Text'
local Button = require 'components/Button'

return function(settings)
    local ConfirmModal = Panel {
        root = VDiv {
            width = 400,
            height = 300,
            alignmentMethod = 'position'
        }
    }

    -- Title

    ConfirmModal:addImmutable(Text {
        text = settings.title,
        height = 250
    })

    -- HDiv

    local hdiv = ConfirmModal:addImmutable(HDiv {
        height = 50
    }) ---@cast hdiv HDiv

    local yes = hdiv:addImmutable(Button 'Yes')
    yes:addEventListener('onClick', function() settings.yes() end)

    local no = hdiv:addImmutable(Button 'No')
    no:addEventListener('onRelease', function() settings.no() end)

    return ConfirmModal
end

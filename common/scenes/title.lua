local Enums = require("common/enums")
local GFX = require("common/gfx")
local GameVars = require("common/gamevars")

return {
    LoadScene = function()
        --
    end,
    DrawSceneTop = function()
        love.graphics.draw(GFX.Title.BGTop,0,0) --top background at 0x 0y
    end,
    DrawSceneBottom = function()
        love.graphics.draw(GFX.Title.BGBottom,0,0) --bottom background at 0x 0y
    end,
    UpdateScene = function(dt)
        --
    end,
    MousePressedTopScene = function(x, y, button, istouch, presses)
        --
    end,
    MousePressedBottomScene = function(x, y, button, istouch, presses)
        --
    end,
    WheelMovedScene = function(x, y)
        --
    end,
    KeyPressedScene = function(k)
        --
    end,
    TextInputScene = function(text)
        --
    end,
}

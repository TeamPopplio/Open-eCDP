local Enums = require("common/enums")
local GFX = require("common/gfx")
local GameVars = require("common/gamevars")
require("colorize")

src1 = love.audio.newSource("assets/sounds/title.flac", "static")
src1:setVolume(0.9)
src1:play()

font = love.graphics.newImageFont("assets/gfx/fonts/imagefont.png",
    " ABCDEFGHIJKLMNOPQRSTUVWXYZ" ..
    "abcdefghijklmnopqrstuvwxyz0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"", -4)

return {
    LoadScene = function()
        GameVars.SceneVars.Title = {
            SlowUpdate = 0,
            SelectedButton = 44,
            Selection = 38,
            Ok = 13
        }
        GameVars.Anim.Title = {
            Selection = 1,
            Ok = 1
        }
    end,
    DrawSceneTop = function()
        love.graphics.clear() --init


        love.graphics.setFont(font)

        love.graphics.push()
        love.graphics.scale(0.45, 0.45)
        love.graphics.draw(GFX.Title.eCDPName,210,120)
        love.graphics.pop()

        --"eCrew Development Program" Text because rn im too lazy to do a image for it

        love.graphics.setColor(hex("#FFFFFF"))
        love.graphics.push()
        love.graphics.printf("eCrew Development Program",100,120, Enums.Width)
        love.graphics.pop()

    end,
    DrawSceneBottom = function()
        love.graphics.clear() --init

        --bottom text
        --Since the option for the original "Enter Password" is highlighted I made the text more inline with what it actually says there
        --Note: In the OG game. When no option is currently being selected the text says "Select an option above."

        love.graphics.push()
        love.graphics.scale(1, 1)
        love.graphics.setColor(0.54,0.03,0.25,1) --shadow color
        love.graphics.printf("Enter your password", 1, 158+1, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)
        love.graphics.printf("Enter your password", 0, 158, Enums.Width, "center")

        love.graphics.setColor(0.54,0.03,0.25,1) --shadow color
        love.graphics.printf("to access the Main Menu.", 1, 173+1, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)
        love.graphics.printf("to access the Main Menu.", 0, 173, Enums.Width, "center")
        love.graphics.pop()


        --buttons
        love.graphics.draw(GFX.Title.Button,44,43)
        love.graphics.draw(GFX.Title.Button,44,83)
        love.graphics.draw(GFX.Title.Button,44,123)
        if GameVars.SceneVars.Title.Selection > 0 then
            love.graphics.draw(GFX.Title.SelectedButton,45,GameVars.SceneVars.Title.SelectedButton)
            love.graphics.draw(GFX.Title.Atlas.Selection,GFX.Title.Selection[GameVars.Anim.Title.Selection],39,GameVars.SceneVars.Title.Selection)
            love.graphics.draw(GFX.Title.Atlas.Ok,GFX.Title.Ok[GameVars.Anim.Title.Ok],188,GameVars.SceneVars.Title.Ok)
        end
        --DRAW BUTTON TEXT HERE

        --Enter password
        love.graphics.setColor(hex("#2B2D2F")) --shadow color
        love.graphics.printf("Enter Password", 1, 50, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)

        --Change password
        love.graphics.setColor(hex("#2B2D2F")) --shadow color
        love.graphics.printf("Change Password", 1, 90, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)

        --Enter Serial Code
        love.graphics.setColor(hex("#2B2D2F")) --shadow color
        love.graphics.printf("Enter Serial Code", 1, 130, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)

        --already drew everything, increment animations
        if GameVars.SceneVars.Title.SlowUpdate >= 20 then
            GameVars.SceneVars.Title.SlowUpdate = 0
            if GameVars.Anim.Title.Selection < #GFX.Title.Selection then
                GameVars.Anim.Title.Selection = GameVars.Anim.Title.Selection + 1
            else
                GameVars.Anim.Title.Selection = 1
            end
            if GameVars.Anim.Title.Ok < #GFX.Title.Ok then
                GameVars.Anim.Title.Ok = GameVars.Anim.Title.Ok + 1
            else
                GameVars.Anim.Title.Ok = 1
            end
        else
            GameVars.SceneVars.Title.SlowUpdate = GameVars.SceneVars.Title.SlowUpdate + 1
        end
    end,
    DrawSceneBackgroundTop = function()
        love.graphics.clear() --init
        love.graphics.draw(GFX.Title.BGTop,0,0) --top background at 0x 0y


    end,
    DrawSceneBackgroundBottom = function()
        love.graphics.clear() --init
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

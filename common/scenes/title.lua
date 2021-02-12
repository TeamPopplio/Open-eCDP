require("common/lib/colorize") --hex color support
local Enums = require("common/enums")
local GFX = require("common/gfx")
local GameVars = require("common/gamevars")
local Audio = require("common/audio")

return {
    LoadScene = function()
        love.audio.stop()
        Audio.TitleMusic:setVolume(0.2)
        Audio.TitleMusic:play()
        GameVars.SceneVars.Title = {
            SlowUpdate = 0,
            SelectedButton = 44,
            Selection = 38,
            Ok = 13,

            SelectedButton1 = 83,
            Selection1 = 77,
            Ok1 = 52,

            SelectedButton2 = 123,
            Selection2 = 117,
            Ok2 = 92,

            Option = 0,

            Man = 20
        }
        GameVars.Anim.Title = {
            Selection = 1,
            Ok = 1,
            Man = 1
        }
    end,
    DrawSceneTop = function()
        love.graphics.clear() --init

        love.graphics.draw(GFX.Title.eCDPName,102,56)
        love.graphics.draw(GFX.Title.Women,10,40)

        love.graphics.draw(GFX.Title.Atlas.Man,GFX.Title.Man[GameVars.Anim.Title.Man],40,GameVars.SceneVars.Title.Man)

    end,
    DrawSceneBottom = function()
        love.graphics.clear() --init

        --bottom text
        --Since the option for the original "Enter Password" is highlighted I made the text more inline with what it actually says there
        --Note: In the OG game. When no option is currently being selected the text says "Select an option above."

        if GameVars.SceneVars.Title.Option == 0 then
        love.graphics.setColor(0.54,0.03,0.25,1) --shadow color
        love.graphics.printf("Enter your password\nto access the Main Menu.", 1, 158+1, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)
        love.graphics.printf("Enter your password\nto access the Main Menu.", 0, 158, Enums.Width, "center")
        end

        if GameVars.SceneVars.Title.Option == 1 then
        love.graphics.setColor(0.54,0.03,0.25,1) --shadow color
        love.graphics.printf("You can change passwords of\neach crew and the Manager.", 1, 158+1, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)
        love.graphics.printf("You can change passwords of\neach crew and the Manager.", 0, 158, Enums.Width, "center")
        end

        if GameVars.SceneVars.Title.Option == 2 then
        love.graphics.setColor(0.54,0.03,0.25,1) --shadow color
        love.graphics.printf("Starting for the first time\nrequires a Serial Code.", 1, 158+1, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)
        love.graphics.printf("Starting for the first time\nrequires a Serial Code.", 0, 158, Enums.Width, "center")
        end

        --buttons
        love.graphics.draw(GFX.Title.Button,44,43)
        love.graphics.draw(GFX.Title.Button,44,83)
        love.graphics.draw(GFX.Title.Button,44,123)
        if GameVars.SceneVars.Title.Option == 0 then
            love.graphics.draw(GFX.Title.SelectedButton,45,GameVars.SceneVars.Title.SelectedButton)
            love.graphics.draw(GFX.Title.Atlas.Selection,GFX.Title.Selection[GameVars.Anim.Title.Selection],38,GameVars.SceneVars.Title.Selection)
            love.graphics.draw(GFX.Title.Atlas.Ok,GFX.Title.Ok[GameVars.Anim.Title.Ok],188,GameVars.SceneVars.Title.Ok)
        end

        if GameVars.SceneVars.Title.Option == 1 then
            love.graphics.draw(GFX.Title.SelectedButton,45,GameVars.SceneVars.Title.SelectedButton1)
            love.graphics.draw(GFX.Title.Atlas.Selection,GFX.Title.Selection[GameVars.Anim.Title.Selection], 38,GameVars.SceneVars.Title.Selection1)
            love.graphics.draw(GFX.Title.Atlas.Ok,GFX.Title.Ok[GameVars.Anim.Title.Ok],188,GameVars.SceneVars.Title.Ok1)
        end

        if GameVars.SceneVars.Title.Option == 2 then
            love.graphics.draw(GFX.Title.SelectedButton,45,GameVars.SceneVars.Title.SelectedButton2)
            love.graphics.draw(GFX.Title.Atlas.Selection,GFX.Title.Selection[GameVars.Anim.Title.Selection], 38,GameVars.SceneVars.Title.Selection2)
            love.graphics.draw(GFX.Title.Atlas.Ok,GFX.Title.Ok[GameVars.Anim.Title.Ok],188,GameVars.SceneVars.Title.Ok2)
        end

        --Enter password
        love.graphics.setColor(hex("#2B2D2F"))
        love.graphics.printf("Enter Password", 1, 50, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)

        --Change password
        love.graphics.setColor(hex("#2B2D2F"))
        love.graphics.printf("Change Password", 1, 90, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)

        --Enter Serial Code
        love.graphics.setColor(hex("#2B2D2F"))
        love.graphics.printf("Enter Serial Code", 1, 130, Enums.Width, "center") --shadow
        love.graphics.setColor(0.98,0.98,0.98,1)
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
        --already drew everything, increment animations
        if GameVars.SceneVars.Title.SlowUpdate >= 0.1 then
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
            if GameVars.Anim.Title.Man < #GFX.Title.Man then
                GameVars.Anim.Title.Man = GameVars.Anim.Title.Man + 1
            else
                GameVars.Anim.Title.Man = 1
            end
        else
            GameVars.SceneVars.Title.SlowUpdate = GameVars.SceneVars.Title.SlowUpdate + dt
        end
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

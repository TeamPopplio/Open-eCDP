local Data = require("common/data") --save data
local Enums = require("common/enums")
return {
    Save = function()
        love.filesystem.write("settings.txt",TSerial.pack(Data, nil, true)) --save data
    end,
    ScreenCfg = function(hotdata)
        if hotdata.Orientation == Enums.OriHorizontal or hotdata.Orientation == Enums.OriHorizontalInverted then
            love.window.setMode((Enums.Width*2)*hotdata.Scaling, (Enums.Height/2)*hotdata.Scaling, Enums.WindowFlags)
        else --default
            love.window.setMode(Enums.Width*hotdata.Scaling, Enums.Height*hotdata.Scaling, Enums.WindowFlags)
        end
    end
}

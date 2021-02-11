local Data = require("common/data") --save data
local GameVars = require("common/gamevars") --gameplay variables
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
    end,
    Canvas3DS = function()
        if GameVars.Scale3DS == Enums.Scale3DSHighDefinition then
            GameVars.BackgroundTopCanvas = love.graphics.newCanvas(400,240)
            GameVars.BackgroundBottomCanvas = love.graphics.newCanvas(320,240)
            GameVars.BackgroundTopCanvas:setFilter("nearest", "nearest")
            GameVars.BackgroundBottomCanvas:setFilter("nearest", "nearest")
        else
            GameVars.BackgroundTopCanvas = love.graphics.newCanvas(Enums.Width,Enums.Height/2)
            GameVars.BackgroundBottomCanvas = love.graphics.newCanvas(Enums.Width,Enums.Height/2)
            GameVars.BackgroundTopCanvas:setFilter("nearest", "nearest")
            GameVars.BackgroundBottomCanvas:setFilter("nearest", "nearest")
        end
    end
}

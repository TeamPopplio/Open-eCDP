local Data = require("common/data") --save data
return {
    Save = function()
        if not love.keyboard.isDown("lshift") then
            love.filesystem.write("settings.txt",TSerial.pack(Data, nil, true)) --save data
        end
    end
}

require("common/lib/TSerial")
local Enums = require("common/enums")
local data = {
    Scaling = 2,
    Volume = 1.0,
}
local info = love.filesystem.getInfo("settings.txt")
if not info then --does not exist
    love.filesystem.write("settings.txt", "{}")
end
local unpack = TSerial.unpack(love.filesystem.read("settings.txt"), true)
for k,v in pairs(unpack) do data[k] = v end --combine data and unpack tables
if data.Scaling < 1 then
    data.Scaling = 1
end
return data

local Enums = require("common/enums")
function love.conf(t)
    if love._console_name then
        return --consoles should not conf
    end
    local path = love.filesystem.getSource()
    local ver = Enums.Version.Major.."."..Enums.Version.Minor.."."..Enums.Version.Patch --concatenated version string
    if Enums.Version.Label ~= nil then 
        ver = ver.."-"..Enums.Version.Label.."."..Enums.Version.Candidate --add label and candidate if present
    end 
    if string.find(path, ".love") or string.find(path, ".exe") then --is this a release? TODO: replace this with a native 'is this game built?' check
        t.window.title = Enums.GameTitle.." [v"..ver.."]"
    else
        t.window.title = Enums.GameTitle
    end
    love.filesystem.setIdentity(Enums.Identity.."_"..Enums.Version.Major) --this is used in AppData/ (or AppData/LOVE/) to identify the save location
    t.window.width = Enums.Width
    t.window.height = Enums.Height
    t.window.icon = "assets/gfx/common/logo.png"

end

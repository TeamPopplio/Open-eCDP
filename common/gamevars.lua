local Enums = require("common/enums")

--middleman vars
local TopCanvas = love.graphics.newCanvas(Enums.Width,Enums.Height/2)
local BottomCanvas = love.graphics.newCanvas(Enums.Width,Enums.Height/2)
TopCanvas:setFilter("nearest", "nearest")
BottomCanvas:setFilter("nearest", "nearest")

return { --variables that change due to gameplay, etc
    TopCanvas = TopCanvas,
    BottomCanvas = BottomCanvas,
    ActiveScene = Enums.SceneDefault
}
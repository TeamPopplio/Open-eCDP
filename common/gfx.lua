local Enums = require("common/enums")
local Cursor
if not love._console_name then
    Cursor = love.mouse.newCursor( love.image.newImageData( "assets/gfx/common/cursor.png" ), 0, 0 ) --mouse functionality not implemented
end
local Atlases = {
    Title = {
        Selection = love.graphics.newImage("assets/gfx/title/atlas/selection.png"),
        Ok = love.graphics.newImage("assets/gfx/title/atlas/ok.png")
    }
}
return {
    Font = love.graphics.newImageFont("assets/gfx/fonts/imagefont.png",
        " ABCDEFGHIJKLMNOPQRSTUVWXYZ" ..
        "abcdefghijklmnopqrstuvwxyz0" ..
        "123456789.,!?-+/():;%&`'*#=[]\"", 1),
    Title = {
        Atlas = Atlases.Title,
        Selection = {
            [1] = love.graphics.newQuad(0, 0, 192, 39, Atlases.Title.Selection:getDimensions()),
            [2] = love.graphics.newQuad(0, 39, 192, 39, Atlases.Title.Selection:getDimensions()),
            [3] = love.graphics.newQuad(0, 78, 192, 39, Atlases.Title.Selection:getDimensions())
        },
        Ok = {
            [1] = love.graphics.newQuad(0, 0, 33, 58, Atlases.Title.Ok:getDimensions()),
            [2] = love.graphics.newQuad(33, 0, 33, 58, Atlases.Title.Ok:getDimensions()),
            [3] = love.graphics.newQuad(66, 0, 33, 58, Atlases.Title.Ok:getDimensions()),
            [4] = love.graphics.newQuad(99, 0, 33, 58, Atlases.Title.Ok:getDimensions()),
            [5] = love.graphics.newQuad(132, 0, 33, 58, Atlases.Title.Ok:getDimensions()),
            [6] = love.graphics.newQuad(165, 0, 33, 58, Atlases.Title.Ok:getDimensions())
        },
        BGTop = love.graphics.newImage("assets/gfx/title/background.png"),
        BGBottom = love.graphics.newImage("assets/gfx/title/background_bottom.png"),
        Button = love.graphics.newImage("assets/gfx/title/button.png"),
        SelectedButton = love.graphics.newImage("assets/gfx/title/selectedbutton.png"),
        eCDPName = love.graphics.newImage("assets/gfx/title/logo.png"),
    },
    Cursor = Cursor
}

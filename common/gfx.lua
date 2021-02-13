local Enums = require("common/enums")
local Cursor
if not love._console_name then
    Cursor = love.mouse.newCursor( love.image.newImageData( "assets/gfx/common/cursor.png" ), 0, 0 ) --mouse functionality not implemented
end
local Atlases = {
    Title = {
        Selection = love.graphics.newImage("assets/gfx/title/atlas/selection.png"),
        Ok = love.graphics.newImage("assets/gfx/title/atlas/ok.png"),
        Man = love.graphics.newImage("assets/gfx/title/atlas/man.png"),
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
        Man = {
            [1] = love.graphics.newQuad(0, 0, 53, 167, Atlases.Title.Man:getDimensions()),
            --top left xy, bottom right xy
            [2] = love.graphics.newQuad(53, 0, 107, 167, Atlases.Title.Man:getDimensions()),
            [3] = love.graphics.newQuad(107, 0, 161, 167, Atlases.Title.Man:getDimensions()),
            -- [4] = love.graphics.newQuad(162, 0, 215, 167, Atlases.Title.Man:getDimensions()),
            -- [5] = love.graphics.newQuad(215, 0, 268, 167, Atlases.Title.Man:getDimensions()),
            -- [6] = love.graphics.newQuad(268, 0, 321, 167, Atlases.Title.Man:getDimensions()),
            -- [7] = love.graphics.newQuad(321, 0, 374, 167, Atlases.Title.Man:getDimensions()),
            -- [8] = love.graphics.newQuad(374, 0, 427, 167, Atlases.Title.Man:getDimensions())
        },
        BGTop = love.graphics.newImage("assets/gfx/title/background.png"),
        BGBottom = love.graphics.newImage("assets/gfx/title/background_bottom.png"),
        Button = love.graphics.newImage("assets/gfx/title/button.png"),
        SelectedButton = love.graphics.newImage("assets/gfx/title/selectedbutton.png"),
        eCDPName = love.graphics.newImage("assets/gfx/title/logo.png"),
        Women = love.graphics.newImage("assets/gfx/title/women.png")
    },
    Cursor = Cursor
}

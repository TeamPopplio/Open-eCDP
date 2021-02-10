local Enums = require("common/enums")
local Cursor
if not love._console_name then
    Cursor = love.mouse.newCursor( love.image.newImageData( "assets/gfx/common/cursor.png" ), 0, 0 ) --mouse functionality not implemented
end
return {
    Title = {
        BGTop = love.graphics.newImage("assets/gfx/title/background.png"),
        BGBottom = love.graphics.newImage("assets/gfx/title/background_bottom.png")
    },
    Cursor = Cursor
}

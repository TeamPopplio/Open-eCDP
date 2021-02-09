local Enums = require("common/enums")
return {
    Title = {
        BGTop = love.graphics.newImage("assets/gfx/title/background.png"),
        BGBottom = love.graphics.newImage("assets/gfx/title/background_bottom.png")
    },
    Cursor = love.mouse.newCursor( love.image.newImageData( "assets/gfx/common/cursor.png" ), 0, 0 )
}

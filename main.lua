local utf8 = require("utf8") --leftover from ytp+ studio, is this needed?
local Audio = require("common/audio") --audio/sound related data
local GFX = require("common/gfx") --images and other graphical data
local Enums = require("common/enums") --static enumerables
local Data = require("common/data") --save data
local Func = require("common/func") --commonly used functions
local GameVars = require("common/gamevars") --gameplay variables
local Scenes = require("common/scenes") --gameplay environments

function love.load()
	--initialize
    love.audio.setVolume(Data.Volume)
	love.window.setMode(Enums.Width*Data.Scaling, Enums.Height*Data.Scaling, Enums.WindowFlags)
	love.mouse.setCursor(GFX.Cursor)
	Func.Save()
	--temp
	Scenes[GameVars.ActiveScene].LoadScene()
end

function love.draw()
	love.graphics.clear() --prepare for drawing
	
	Scenes[GameVars.ActiveScene].DrawScene()

	love.graphics.setCanvas() --RESET TO MAIN SCREEN--

		love.graphics.setColor(1,1,1,1) --#opaque white
		love.graphics.draw(GameVars.TopCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
		love.graphics.draw(GameVars.BottomCanvas, 0, (Enums.Height/2)*Data.Scaling, 0, Data.Scaling, Data.Scaling)
end

--below are unused for now but will be useful in the future--

function love.update(dt)
	Scenes[GameVars.ActiveScene].UpdateScene(dt)
end

function love.mousepressed(x, y, button, istouch, presses)
	x = x/Data.Scaling --scale up mouse positions
	y = y/Data.Scaling
	if y <= Enums.Height/2 then
		Scenes[GameVars.ActiveScene].MousePressedTopScene(x, y, button, istouch, presses)
	else
		-- y = y - Data.ScreenGap
		Scenes[GameVars.ActiveScene].MousePressedBottomScene(x, y, button, istouch, presses)
	end
end

function love.wheelmoved(x, y)
	Scenes[GameVars.ActiveScene].WheelMovedScene(x, y)
end

function love.keypressed(k)
	Scenes[GameVars.ActiveScene].KeyPressedScene()
end

function love.textinput(text)
	Scenes[GameVars.ActiveScene].TextInputScene()
end

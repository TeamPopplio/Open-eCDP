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
	if GFX.Cursor then
		love.mouse.setCursor(GFX.Cursor)
	end
	Func.Canvas3DS()
	Func.ScreenCfg(Data)
	Func.Save()
	--temp
	Scenes[GameVars.ActiveScene].LoadScene()
end

function love.draw(screen)
	love.graphics.setColor(1,1,1,1) --opaque white
	if not love._console_name then
		--this should be done with variables instead - temporary solution
		if Data.Orientation == Enums.OriHorizontal then
			love.graphics.draw(GameVars.BackgroundTopCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.TopCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.BottomCanvas, (Enums.Width)*Data.Scaling, 0, 0, Data.Scaling, Data.Scaling)
		elseif Data.Orientation == Enums.OriVerticalInverted then
			love.graphics.draw(GameVars.BackgroundTopCanvas, 0, (Enums.Height/2)*Data.Scaling, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.TopCanvas, 0, (Enums.Height/2)*Data.Scaling, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.BackgroundBottomCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.BottomCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
		elseif Data.Orientation == Enums.OriHorizontalInverted then
			love.graphics.draw(GameVars.BackgroundTopCanvas, (Enums.Width)*Data.Scaling, 0, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.TopCanvas, (Enums.Width)*Data.Scaling, 0, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.BackgroundBottomCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.BottomCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
		else --default
			love.graphics.draw(GameVars.BackgroundTopCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.TopCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.BackgroundBottomCanvas, 0, (Enums.Height/2)*Data.Scaling, 0, Data.Scaling, Data.Scaling)
			love.graphics.draw(GameVars.BottomCanvas, 0, (Enums.Height/2)*Data.Scaling, 0, Data.Scaling, Data.Scaling)
		end
	elseif love._console_name == "3DS" then
		--default is the equilvalent of Enums.Scale3DSStretched
		local ws_top = Enums.Width*2 / 400
		local ws_bot = Enums.Width*2 / 320
		local hs = Enums.Height / 240
		local offsetx_top = 0
		local offsetx_bot = 0
		local offsety = 0
		if Data.Scale3DS == Enums.Scale3DSOriginal then
			ws_top = 1
			ws_bot = 1
			hs = 1
			offsetx_top = 73
			offsetx_bot = 33
			offsety = 25
		elseif Data.Scale3DS == Enums.Scale3DSAspect then
			ws_top = Enums.Width*2 / 320
			ws_bot = Enums.Width*2 / 320
			hs = Enums.Height / 240
			offsetx_top = 41
			offsetx_bot = 0
			offsety = 0
		end
		if screen == "bottom" and Data.Scale3DS ~= Enums.Scale3DSHighDefinition then --og bg
			love.graphics.draw(GameVars.BackgroundBottomCanvas, offsetx_bot, offsety, 0, ws_bot, hs)
			love.graphics.draw(GameVars.BottomCanvas, offsetx_bot, offsety, 0, ws_bot, hs)
		elseif Data.Scale3DS ~= Enums.Scale3DSHighDefinition then --og bg top
			love.graphics.draw(GameVars.BackgroundBottomCanvas, offsetx_bot, offsety, 0, ws_bot, hs)
			love.graphics.draw(GameVars.TopCanvas, offsetx_top, offsety, 0, ws_top, hs)
		elseif screen == "bottom" then --hd bg
			love.graphics.draw(GameVars.BackgroundBottomCanvas, 0, 0, 0, 1, 1)
			love.graphics.draw(GameVars.BottomCanvas, 33, 25, 0, 1, 1)
		else --hd bg top
			love.graphics.draw(GameVars.BackgroundBottomCanvas, 0, 0, 0, 1, 1)
			love.graphics.draw(GameVars.TopCanvas, 73, 25, 0, 1, 1)
		end
	else --switch, scale up later
		love.graphics.draw(GameVars.TopCanvas, 0, 0, 0, Data.Scaling, Data.Scaling)
		love.graphics.draw(GameVars.BottomCanvas, Enums.Width, 0, 0, Data.Scaling, Data.Scaling)
	end
	--TOP SCREEN--
	love.graphics.setColor(1,1,1,1) --opaque white
	love.graphics.setCanvas(GameVars.BackgroundTopCanvas)
	Scenes[GameVars.ActiveScene].DrawSceneBackgroundTop()
	love.graphics.setCanvas(GameVars.TopCanvas)
	Scenes[GameVars.ActiveScene].DrawSceneTop()
	--BOTTOM SCREEN
	love.graphics.setColor(1,1,1,1) --opaque white
	love.graphics.setCanvas(GameVars.BackgroundBottomCanvas)
	Scenes[GameVars.ActiveScene].DrawSceneBackgroundBottom()
	love.graphics.setCanvas(GameVars.BottomCanvas)
	Scenes[GameVars.ActiveScene].DrawSceneBottom()
	--RESET TO MAIN SCREEN--
	love.graphics.setCanvas()
end

--below are unused for now but will be useful in the future--

function love.update(dt)
	Scenes[GameVars.ActiveScene].UpdateScene(dt)
end

function love.mousepressed(x, y, button, istouch, presses)
	x = x/Data.Scaling --scale up mouse positions
	y = y/Data.Scaling
	--is there an easier way to do this?--
	if Data.Orientation == Enums.OriHorizontal then
		if x > Enums.Width then
			x = x - Enums.Width
		end
	elseif Data.Orientation == Enums.OriVerticalInverted then
		if y > Enums.Height/2 then
			y = y - Enums.Height/2
		end
	elseif Data.Orientation == Enums.OriHorizontalInverted then
		if x > Enums.Width then
			x = x - Enums.Width
		end
	end
	--wrap around
	if y < Enums.Height/2 then
		Scenes[GameVars.ActiveScene].MousePressedTopScene(x, y, button, istouch, presses)
	else
		y = y-Enums.Height/2
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

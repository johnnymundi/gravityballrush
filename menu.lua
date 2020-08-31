function menuLoad()
    bg = {}
    bg[0] = love.graphics.newImage("assets/bg0.png")
    --IMAGENS DO MENU--
    fatcat1 = love.graphics.newImage("assets/fatcat_1.png")
    fatcat2 = love.graphics.newImage("assets/fatcat_2.png")
    ghostcat = love.graphics.newImage("assets/ghostcat.png")
    sarah = love.graphics.newImage("assets/sarah_forward.png")
    oldcat = love.graphics.newImage("assets/lawyercat.png")
    --BOTÕES DO MENU
	menubutton = {}
	menubutton[1] = {text = "Start Game", x = 300, y = 300, execute = startgame} --execute é chamado qndo clicamos no botão
	menubutton[2] = {text = "Exit Game", x = 550, y = 500, execute = exitgame}

	song = love.audio.newSource("assets/pk-strangerdanger-final.ogg", "stream") -- música de background do menu e intro
end

function menuUpdate(dt)
	song:play()
end

function menuDraw()
	if gamestate == "menu" then
	    love.graphics.draw(bg[0],0,0)
	    love.graphics.setColor(0,0,0,255)
	    love.graphics.setFont(titlefont)
	    love.graphics.printf("GRAVITY  BALL RUSH",0,48,560,"center", 0, 1.5)
	    love.graphics.printf("a game about a crazy ball",0,136,800,"center")
	    love.graphics.printf("Click on",170,235,450,"center")
	    love.graphics.printf("Press Enter!",0,476, 800,"center")
	    love.graphics.printf("or",170,375,450,"center")
	    love.graphics.printf(menubutton[1].text, menubutton[1].x, menubutton[1].y, 200, "center")
	    love.graphics.printf(menubutton[2].text, menubutton[2].x, menubutton[2].y, 200, "center")
	    love.graphics.setColor(255,255,255,255)
	    --IMAGENS DO MENU --
	    love.graphics.draw(fatcat1, 50, 400, 1, 1)
	    love.graphics.draw(fatcat1, 740, 200, 4, 1)
	    love.graphics.draw(fatcat2, 20, 30, 0, 0.7, 0.7)
	    love.graphics.draw(ghostcat, 530, 290, 0)
	    love.graphics.draw(sarah, 570, 250, 0)
	    love.graphics.draw(oldcat, 80, 290, 0) end
end

function menuMousePressed(x, y, button)
	for i, v in pairs(menubutton) do
		if x > menubutton[1].x and x < menubutton[1].x + 400 and y > menubutton[1].y and y < menubutton[1].y + 50 then
			menubutton[1].execute()
		elseif x > menubutton[2].x and x < menubutton[2].x + 400 and y > menubutton[2].y and y < menubutton[2].y + 50 then
			menubutton[2].execute()
		end
	end
end

function menuKeyPressed(key)
	if key == "return" then
		menubutton[1].execute()
	elseif key == "escape" then
		love.event.push("quit")
	end
end

function startgame()
	gamestate = "intro"
	introLoad()
end

function exitgame()
	love.event.push("quit")
end

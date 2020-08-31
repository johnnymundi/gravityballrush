require 'menu'
require 'intro'
function gameoverLoad()
	gameoverBackground = love.graphics.newImage("assets/bg1.png")

	menubutton = {}
	menubutton[1] = {text = "Back to the Title Screen", x = 100, y = 100, execute = startgame} --execute é chamado qndo clicamos no botão
	menubutton[2] = {text = "Exit Game", x = 550, y = 500, execute = exitgame}
end

function gameoverUpdate(dt)

end

function gameoverDraw()
	--BACKGROUND E TEXTOS --
	love.graphics.draw(gameoverBackground, 0, 0)
	love.graphics.setColor(0,0,0)
	love.graphics.printf(menubutton[1].text, menubutton[1].x, menubutton[1].y, 200, "center")
	love.graphics.printf(menubutton[2].text, menubutton[2].x, menubutton[2].y, 200, "center")
	love.graphics.print("Your Total Score is: $ "..objects.ball.coins, 85, 230, 0)
	--MENSAGENS DO GAMEOVER DE ACORDO COM O NÚMERO DE MOEDAS CAPTURADAS --
	if objects.ball.coins >=0 and objects.ball.coins<=0.5 then
		love.graphics.print("You suck!", 140, 290, 0)
	elseif objects.ball.coins >=0.75 and objects.ball.coins<=1.25 then
		love.graphics.print("At least you can pay for some xerox...", 80, 290, 0)
	elseif objects.ball.coins >=1.50 and objects.ball.coins<=2.00 then
		love.graphics.print("Almost a cabanas! Congratulations!", 140, 290, 0)
	elseif objects.ball.coins >=2.25 and objects.ball.coins<=2.75 then
		love.graphics.print("Almost a millionare!", 50, 290, 0)
	elseif objects.ball.coins >=2.75 and objects.ball.coins<=3.5 then
		love.graphics.print("Hello Bill Gates!!", 80, 290, 0)
	elseif objects.ball.coins >=5 and objects.ball.coins<=40 then
		love.graphics.print("Daamn!!", 140, 290, 0)
	end
	love.graphics.setColor(255,255,255,255)
end

function gameoverMousePressed(x, y, button) -- SE CLICAR NO BOTÃO, TAMBÉM VOLTA PRA TELA INICIAL
	for i, v in pairs(menubutton) do
		if x > menubutton[1].x and x < menubutton[1].x + 400 and y > menubutton[1].y and y < menubutton[1].y + 50 then
			menubutton[1].execute()
		elseif x > menubutton[2].x and x < menubutton[2].x + 400 and y > menubutton[2].y and y < menubutton[2].y + 50 then
			menubutton[2].execute()
		end
	end
end

function gameoverKeyPressed(key)
	if key == "return" then
		gamestate = "menu"
		menuLoad()
	elseif key == "escape" then
		love.event.push("quit")
	end
end
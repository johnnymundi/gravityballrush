require 'game'
function introLoad()
	introBackground = love.graphics.newImage("assets/bg0.png")
	button = love.graphics.newImage("assets/key_1.png")
	coin = love.graphics.newImage("assets/coin.png")
	ghostcat = love.graphics.newImage("assets/ghostcat.png")
	crap = love.graphics.newImage("assets/crap.png")
    redhoodcatl = love.graphics.newImage("assets/left.png")
    sarah = love.graphics.newImage("assets/sarah_backward.png")
end

function introUpdate()

end

function introDraw()
	love.graphics.draw(introBackground,0,0)
    love.graphics.setColor(0,0,0,255)
    love.graphics.setFont(titlefont)
    love.graphics.printf("How To Play",0,96,800,"center")
    love.graphics.printf("Use the keys to control your ball!",-180,232,800,"center")
    love.graphics.printf("Collect:",90,300,800,"center")
    love.graphics.printf("coin",205,340,800,"center")
    love.graphics.printf("Avoid:",60,420,800,"center")
    love.graphics.printf("ghostcat",150,470,800,"center")
    love.graphics.printf("poop",270,470,800,"center")
    love.graphics.setColor(255,255,255,255) -- se não resetar a cor de fundo, a tela fica toda preta quando renderiza tudo :0
    love.graphics.draw(button, 100, 400, 0, 0.5, 0.5)
    love.graphics.draw(button, 155, 340, 0, 0.5, 0.5)
    love.graphics.draw(button, 155, 400, 0, 0.5, 0.5)
    love.graphics.draw(button, 210, 400, 0, 0.5, 0.5)
    love.graphics.draw(redhoodcatl, 530, -30)
    love.graphics.draw(sarah, 0, 0)
    love.graphics.setColor(0,0,0,255)
    love.graphics.printf("<",55,380,100,"center", 0, 1.5, 1.5)
    love.graphics.printf(">",165,380,100,"center", 0, 1.5, 1.5)
    love.graphics.printf(">",140,440,100,"center", 4.7, 1.5, 1.5)
    love.graphics.printf(">",230,350,100,"center", 7.8, 1.5, 1.5)
    love.graphics.setColor(255,255,255,255)
    love.graphics.draw(coin, 570, 290)
    love.graphics.draw(ghostcat, 520, 430)
    love.graphics.draw(crap, 640, 400)
end

function introKeyPressed(key)
	if key == "return" then
		gamestate = "game"
		gameLoad()
		song:stop()
	elseif key == "escape" then
		love.event.push("quit")
	end
end
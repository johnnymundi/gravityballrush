function tilesLoad()
	tile = love.graphics.newImage("assets/tiles/Crate.png")

end




function tilesDraw()
	--LEFT SIDE--
	love.graphics.draw(tile,-37, -68, 0, 0.9, 0.9)
	love.graphics.draw(tile,-37, 0, 0, 0.9, 0.9)
	love.graphics.draw(tile,-37, 68, 0, 0.9, 0.9)
	love.graphics.draw(tile,-37, 68*2, 0, 0.9, 0.9)
	love.graphics.draw(tile,-37, 68*3, 0, 0.9, 0.9)
	love.graphics.draw(tile,-37, 68*4, 0, 0.9, 0.9)
	love.graphics.draw(tile,-37, 68*5, 0, 0.9, 0.9)
	love.graphics.draw(tile,-37, 68*6, 0, 0.9, 0.9)
	love.graphics.draw(tile,-37, 68*7, 0, 0.9, 0.9)
	love.graphics.draw(tile,-37, 68*8, 0, 0.9, 0.9)

	--GROUND-- QUANDO USEI UM FOR OU WHILE PRA RENDERIZAR O GROUND, O LOVE TRAVOU TODA VEZ...
	c = 68
	love.graphics.draw(tile, 30, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*2, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*3, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*4, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*5, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*6, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*7, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*8, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*9, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*10, 550, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+c*11, 550, 0, 0.9, 0.9)

	d= 68
	--RIGHT SIDE--
	love.graphics.draw(tile, 765, 0, 0, 0.9, 0.9)
	love.graphics.draw(tile, 765, d, 0, 0.9, 0.9)
	love.graphics.draw(tile, 765, d*2, 0, 0.9, 0.9)
	love.graphics.draw(tile, 765, d*3, 0, 0.9, 0.9)
	love.graphics.draw(tile, 765, d*4, 0, 0.9, 0.9)
	love.graphics.draw(tile, 765, d*5, 0, 0.9, 0.9)
	love.graphics.draw(tile, 765, d*6, 0, 0.9, 0.9)
	love.graphics.draw(tile, 765, d*7, 0, 0.9, 0.9)
	love.graphics.draw(tile, 765, d*8, 0, 0.9, 0.9)

	--TOP--
	love.graphics.draw(tile, 30, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68*2, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68*3, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68*4, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68*5, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68*6, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68*7, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68*8, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68*9, -44, 0, 0.9, 0.9)
	love.graphics.draw(tile, 30+68*10, -44, 0, 0.9, 0.9)
end
require 'tiles'
function gameLoad()
	playerLoad()
	tilesLoad()
end

function gameUpdate(dt)
	playerUpdate(dt)
end

function gameDraw()
	playerDraw()
	tilesDraw()
end
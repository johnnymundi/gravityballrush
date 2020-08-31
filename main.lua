require 'menu'
require 'game'
require 'player'
require 'intro'
require 'gameover'

function love.load()
  gamestate = "menu"
  menuLoad()

  titlefont = love.graphics.newFont("assets/font.ttf", 50)
  textfont = love.graphics.newFont("assets/font.ttf", 50)
  love.graphics.setFont(titlefont)
end

function love.update(dt)
  if gamestate == "menu" then
    menuUpdate(dt)
  elseif gamestate == "game" then
    gameUpdate(dt)
  elseif gamestate == "intro" then
    introUpdate(dt)
  elseif gamestate == "gamover" then
    gameoverUpdate(dt)
  end
end

function love.draw()
  if gamestate =="menu" then
      menuDraw()
  elseif gamestate == "game" then
      gameDraw()
  elseif gamestate == "intro" then
      introDraw()
  elseif gamestate == "gameover" then
      gameoverDraw()
  end
end

function love.mousepressed(x, y, button)
    if gamestate == "menu" then
        menuMousePressed(x, y, button)
    end
end

function love.keypressed(key)
    if gamestate == "menu" then
      menuKeyPressed(key)
    elseif gamestate == "intro" then
        introKeyPressed(key)
    elseif gamestate == "gameover" then
        gameoverKeyPressed(key)
    end
end
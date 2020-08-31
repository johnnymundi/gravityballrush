require "gameover" -- tive q chamar o gameover porque não estava dando certo quando o player perdia...
--PARA ROTAÇÃO--
local width = love.graphics.getWidth()
local height = love.graphics.getHeight()
local angle = 0
local gravity = 9.81*64

--MOEDAS--
coins = {}
rate_coins_dt = 0
life_coins = 4
rate_coins = 2

--COCÔS(CRAPS)--
craps = {}
rate_craps_dt = 0
life_craps = 8
rate_craps = 10

--GHOSTCATS (GATOS FANTASMAS)--
ghostcats = {}
rate_ghostcats_dt = 0
life_ghostcats = 9
rate_ghostcats = 8

balltimeleft = 100 --contagem para a moeda sumir
cattimeleft =100 -- tempo para os craps e ghostcats sumirem

function playerLoad()
  nya = love.audio.newSource("assets/nya.ogg", "static") -- trilha sonora de fundo

  --AUDIOS--
  coinAudio = love.audio.newSource("assets/coin.ogg", "static")
  ghostcatAudio = love.audio.newSource("assets/coins_lost_ghostcat.ogg", "static")
  crapAudio = love.audio.newSource("assets/coins_lost_crap.ogg", "static")

  Backgroundgame = love.graphics.newImage("assets/bg2.png") --background do game

  --IMAGENS CARREGADAS --
  img_coin = love.graphics.newImage("assets/coin.png")
  img_crap = love.graphics.newImage("assets/crap.png")
  img_ghostcat = love.graphics.newImage("assets/ghostcat.png")

  --CRIANDO O MUNDO --
  love.physics.setMeter(64) --peso de um metro no meu mundo é de 64px
  world = love.physics.newWorld(0, 9.81*64, true) --cria o mundo com gravidade vertical 9.81 * 64 e gravidade horizontal de 0.	

  objects = {} -- Tabela para todos os objetos físicos, incluindo a bola
  --CRIA O "GROUND" --
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 800/2, 600-50/2) --posição estabelecida pelo centro do corpo
  objects.ground.shape = love.physics.newRectangleShape(850, 50)
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape) -- dá forma ao corpo criado acima
  -- CANTO ESQUERDO E DIREITO DA TELA --
  objects.left = {}
  objects.left.body = love.physics.newBody(world, 5, 450, "static")
  objects.left.shape = love.physics.newRectangleShape(0, 0, 50, 950)
  objects.left.fixture = love.physics.newFixture(objects.left.body, objects.left.shape, 5) -- quanto maior o "5", maior a densidade do corpo
  objects.right = {}
  objects.right.body = love.physics.newBody(world, 790, 450, "static")
  objects.right.shape = love.physics.newRectangleShape(0, 0, 50, 950)
  objects.right.fixture = love.physics.newFixture(objects.right.body, objects.right.shape, 2)
  -- TOPO DA TELA --
  objects.top = {}
  objects.top.body = love.physics.newBody(world, 325, 0, "static")
  objects.top.shape = love.physics.newRectangleShape(0, 0, 950, 50)
  objects.top.fixture = love.physics.newFixture(objects.top.body, objects.top.shape, 2)
  -- CRIANDO O PLAYER (BALL)
  objects.ball = {}
  objects.ball.x = 290
  objects.ball.y = 320 
  objects.ball.body = love.physics.newBody(world, objects.ball.x, objects.ball.y, "dynamic") --dynamic para a bola pode se mexer
  objects.ball.shape = love.physics.newCircleShape(30) --raio da bola de 30
  objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1) --densidade 1 da bola
  objects.ball.fixture:setRestitution(0.5) --0.2 para a bola não quicar muito 
  objects.ball.rad =20
  objects.ball.coins = 0
  -- TAAMNHO DA TELA -- 
end

function playerUpdate(dt)
	nya:play() --TOCA A MÚSICA DE FUNDO--
  world:update(dt) --isso coloca o mundo em movimento
 
  balltimeleft = balltimeleft - dt
  cattimeleft = cattimeleft - dt
  --comandos para mudar a gravidade do mundo e alterar a posição da tela para direita ou esquerda
  if love.keyboard.isDown("right") then
  		angle = angle + dt * math.pi/2 
    	world:setGravity(gravity, 0)
    	objects.ball.body:applyForce(1, 0) -- aplicando uma força minúscula, evito que a bola grude no chão quando parar de quicar
  elseif love.keyboard.isDown("left") then
      angle = angle - dt * math.pi/2
      objects.ball.body:applyForce(-1, 0)
    	world:setGravity(-gravity, 0)
  elseif love.keyboard.isDown("up") then 
    	world:setGravity(0, -gravity)
    	objects.ball.body:applyForce(0, -1)
  elseif love.keyboard.isDown("down") then 
    	world:setGravity(0, gravity)
    	objects.ball.body:applyForce(0, 1)
  elseif love.keyboard.isDown("escape") then
      love.event.push("quit")
  end

  --TAXA COM QUE AS MOEDAS APARECEM E SOMEM --
    
    rate_coins_dt = rate_coins_dt + dt
    if rate_coins_dt >= rate_coins and balltimeleft > 0 then
      rate_coins_dt = 0
      local coin = {
        x = math.random(0,750),
        y = math.random(0,350),
        time = love.timer.getTime(),
        rot = math.random(-1,1)
      }
      table.insert(coins,coin)
    end

    for i,v in ipairs(coins) do
      if v.time + life_coins < love.timer.getTime() then
        table.remove(coins,i)
      end
      if not (objects.ball.body:getX() + 30*2 < v.x or v.x + img_coin:getWidth() < objects.ball.body:getX() or 
        objects.ball.body:getY() + 30*2 < v.y or v.y + img_coin:getHeight() < objects.ball.body:getY()) then -- detecta colisões
        table.remove(coins,i)
        objects.ball.coins = objects.ball.coins + 0.25
        coinAudio:play()
      end
    end

    -- CRAPS
    
    rate_craps_dt = rate_craps_dt + dt
    if rate_craps_dt >= rate_craps and cattimeleft > 0 then
      rate_craps_dt = 0
      local crap = {
        x = math.random(0,800),
        y = -33,
        time = love.timer.getTime(),
        rot = math.random(0,1)
      }
      table.insert(craps,crap)
    end
    
    for i,v in ipairs(craps) do
      if v.time + life_craps < love.timer.getTime() then
        table.remove(craps,i)
      end
      if v.y < 470 then
        v.y = v.y + 100*dt
      else
        v.y = 470
      end
      if not (objects.ball.body:getX() + 30*2 < v.x or v.x + img_coin:getWidth() < objects.ball.body:getX() or 
        objects.ball.body:getY() + 30*2 < v.y or v.y + img_coin:getHeight() < objects.ball.body:getY()) then -- detecta colisões
        table.remove(coins,i)
        crapAudio:play()
        nya:stop()
        gamestate = "gameover"
        gameoverLoad()
        angle = 0  
      end
    end

    ---- GHOSTCATS
    
    rate_ghostcats_dt = rate_ghostcats_dt + dt
    if rate_ghostcats_dt >= rate_ghostcats and cattimeleft > 0 then
      rate_ghostcats_dt = 0
      local dir = math.random(0,1)
      local ghostcat = {
        x = dir*866-33,
        y = math.random(1,4)*100,
        time = love.timer.getTime(),
        rot = 0,
        v_x = dir*-200+100
      }
      table.insert(ghostcats,ghostcat)
    end
    
    for i,v in ipairs(ghostcats) do
      if v.time + life_ghostcats < love.timer.getTime() then
          table.remove(ghostcats,i)
      end
      v.x = v.x + v.v_x * dt
      if not (objects.ball.body:getX() + 30*2 < v.x or v.x + img_coin:getWidth() < objects.ball.body:getX() or 
        objects.ball.body:getY() + 30*2 < v.y or v.y + img_coin:getHeight() < objects.ball.body:getY()) then -- detecta colisões
        table.remove(coins,i)
      	  ghostcatAudio:play()
          nya:stop()
          gamestate = "gameover"
          gameoverLoad()
          angle = 0 -- se der game over, o ângulo do mundo volta pra zero
      end 
    end
end

function playerDraw()

  --BACKGROUND --
  love.graphics.draw(Backgroundgame, 0, 0)

  -- PRINTA OS PONTOS GANHOS COM O TOTAL DE MOEDAS CAPTURADAS --
  love.graphics.print("$:"..objects.ball.coins, 350, 30, 0, 1.5, 1.5) 


  -- ROTACIONA EM TORNO DO CENTRO DA TELA PELO ÂNGULO E RADIANO --
  love.graphics.translate(width/2, height/2)
  love.graphics.rotate(angle)
  love.graphics.translate(-width/2, -height/2)

	--THE "GROUND"
  love.graphics.setColor(72, 160, 14) -- set the drawing color to green for the ground
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints())) -- draw a "filled in" polygon using the ground's coordinates
  --DESENHANDO O PLAYER ("BOLA")
  love.graphics.setColor(193, 47, 14) --CORES VERMELHAS PARA A BOLA
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
  --CANTO ESQUERDO, DIREITO E TOPO DA TELA
  love.graphics.setColor(72, 160, 14) -- set the drawing color to grey for the blocks
  love.graphics.polygon("fill", objects.left.body:getWorldPoints(objects.left.shape:getPoints()))
  love.graphics.polygon("fill", objects.right.body:getWorldPoints(objects.right.shape:getPoints()))
  love.graphics.polygon("fill", objects.top.body:getWorldPoints(objects.top.shape:getPoints()))

  --MOEDAS--
  love.graphics.setColor(255,255,255,255)

  for i,v in ipairs(coins) do
    if v.time + life_coins > love.timer.getTime() then
      if v.time + life_coins - 1 < love.timer.getTime() then
        if (love.timer.getTime()*1000)%240 > 120 then
          love.graphics.draw(img_coin,v.x,v.y,v.rot,1,1,33,33)
        end
      else
        love.graphics.draw(img_coin,v.x,v.y,v.rot,1,1,33,33)
      end
    end
  end

  --CRAPS--
  for i,v in ipairs(craps) do
    if v.time + life_craps > love.timer.getTime() then
      if v.time + life_craps - 1 < love.timer.getTime() then
        if (love.timer.getTime()*1000)%240 > 120 then
          love.graphics.draw(img_crap,v.x,v.y,0,-1+(2*v.rot),1,27,37)
        end
      else
        love.graphics.draw(img_crap,v.x,v.y,0,-1+(2*v.rot),1,27,37)
      end
    end
  end

  --GHOSTCATS--
  for i,v in ipairs(ghostcats) do
    if v.time + life_ghostcats > love.timer.getTime() then
      love.graphics.draw(img_ghostcat,v.x,v.y,v.rot+math.sin(love.timer.getTime()-v.time),v.v_x/100,1,32,24) 
    end
  end
end
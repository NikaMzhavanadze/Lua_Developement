io.stdout:setvbuf('no')

push = require 'push'
Class = require 'class'

require 'Player'

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

collisionTimer = 0
collisionDuration = 3

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')

  smallFont = love.graphics.newFont('font.ttf', 6)
  bigFont = love.graphics.newFont('font.ttf', 32)

  love.graphics.setFont(smallFont)

  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = true,
    vsync = true
  })

  player1 = Player(0, 0, 2)
  player2 = Player(VIRTUAL_WIDTH - 20, 0, 2)
end

function love.update(dt)

  -- First Player
  if love.keyboard.isDown('a') and player1.x > 0 then
    player1.x = player1.x - player1.speed
  end

  if love.keyboard.isDown('d') and player1.x < VIRTUAL_WIDTH - player1.width then
    player1.x = player1.x + player1.speed
  end

  if love.keyboard.isDown('w') and player1.y > 0 then
    player1.y = player1.y - player1.speed
  end

  if love.keyboard.isDown('s') and player1.y < VIRTUAL_HEIGHT - player1.height then
    player1.y = player1.y + player1.speed
  end

  -- Second Player
  if love.keyboard.isDown('left') and player2.x > 0 then
    player2.x = player2.x - player2.speed
  end

  if love.keyboard.isDown('right') and player2.x < VIRTUAL_WIDTH - player2.width then
    player2.x = player2.x + player2.speed
  end

  if love.keyboard.isDown('up') and player2.y > 0 then
    player2.y = player2.y - player2.speed
  end

  if love.keyboard.isDown('down') and player2.y < VIRTUAL_HEIGHT - player2.height then
    player2.y = player2.y + player2.speed
  end

  if player1:collides(player2) then
    collisionTimer = collisionTimer + dt

    if collisionTimer >= collisionDuration then
      love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
      collisionTimer = 0
    else
      love.graphics.setBackgroundColor(255, 0, 0)
    end
  else
    love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
    collisionTimer = 0
  end

end

function love.draw()
  push:start()

  love.graphics.setColor(0, 0, 0)
  player1:render()
  
  love.graphics.setColor(1, 1, 1)
  player2:render()
  
  push:finish()
end

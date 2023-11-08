io.stdout:setvbuf('no')

push = require 'push'
Class = require 'class'

require 'Paddle'

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

PADDLE_SPEED = 400

gameState = 'start'

function love.load()
  math.randomseed(os.time())

  love.window.setTitle('Object Catcher')
  love.graphics.setDefaultFilter('nearest', 'nearest')

  mediumFont = love.graphics.newFont('font.ttf', 6)
  bigFont = love.graphics.newFont('font.ttf', 20)

  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = false,
    vsync = false
  })

  sounds = {
    ['hit'] = love.audio.newSource('sounds/hit.wav', 'static'),
    ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
    ['miss'] = love.audio.newSource('sounds/miss.wav', 'static')
  }

  player = Paddle(VIRTUAL_WIDTH / 2 - 18, VIRTUAL_HEIGHT - 14)

  objects = {}
  objectSpeed = 70
  objectSize = 10

  caughtObjects = 0
  missedObjects = 0
end

function love.resize(width, height)
  push:resize(width, height)
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end

  if key == 'return' then
    if gameState == 'start' then
      gameState = 'play'
    elseif gameState == 'win' or gameState == 'lose' then
      gameState = 'start'
      caughtObjects = 0
      missedObjects = 0
    end
  end
end

function love.update(dt)
  if gameState == 'play' then
    if love.keyboard.isDown('a') then
      player.dx = -1
    elseif love.keyboard.isDown('d') then
      player.dx = 1
    else
      player.dx = 0
    end

    player:update(dt)

    if math.random() < 0.017 then
      local newObject = {
        x = math.random(0, VIRTUAL_WIDTH - objectSize),
        y = -objectSize,
        width = objectSize,
        height = objectSize
      }
      table.insert(objects, newObject)
    end

    for i, object in ipairs(objects) do
      object.y = object.y + objectSpeed * dt

      if player:collides(object) then
        sounds['hit']:play()
        table.remove(objects, i)
        caughtObjects = caughtObjects + 1
      end

      if object.y > VIRTUAL_HEIGHT then
        sounds['miss']:play()
        table.remove(objects, i)
        missedObjects = missedObjects + 1
      end
    end

    if missedObjects >= 30 then
      sounds['score']:play()
      gameState = 'lose'
    elseif caughtObjects == 50 then
      gameState = 'win'
    end
  end
end

function love.draw()
  push:start()

  love.graphics.clear(40 / 255, 40 / 255, 50 / 255, 255 / 255)

  player:render()

  for _, object in pairs(objects) do
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle('fill', object.x, object.y, object.width, object.height)
    love.graphics.setColor(255, 255, 255)
  end

  love.graphics.rectangle('line', player.x, player.y, player.width, player.height)
  love.graphics.setFont(mediumFont)
  love.graphics.print('Caught Objects: ' .. caughtObjects, 10, 10)
  love.graphics.print('Missed Objects: ' .. missedObjects, 10, 20)

  if gameState == 'start' then
    love.graphics.setFont(mediumFont)
    love.graphics.printf('WELCOME TO OBJECT CATCHER!', 0, 6, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('PRESS ENTER TO START!', 0, 16, VIRTUAL_WIDTH, 'center')
  elseif gameState == 'win' then
    love.graphics.setFont(mediumFont)
    love.graphics.printf('You caught 50 objects!', 0, 6, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press enter to restart', 0, 16, VIRTUAL_WIDTH, 'center')
  elseif gameState == 'lose' then
    love.graphics.setFont(mediumFont)
    love.graphics.printf('You missed too many objects!', 0, 6, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press enter to restart', 0, 16, VIRTUAL_WIDTH, 'center')
  end

  push:finish()
end

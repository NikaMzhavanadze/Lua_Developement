io.stdout:setvbuf('no')

push = require 'push'

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

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
end

function love.update()
end

function love.draw()
  push:start()

  love.graphics.printf("Top Left", 10, 10, VIRTUAL_WIDTH, "left")

  love.graphics.printf("Bottom Left", 10, VIRTUAL_HEIGHT - 10 - smallFont:getHeight(),
    VIRTUAL_WIDTH, "left")

  love.graphics.printf("Top Right", VIRTUAL_WIDTH - 10 - smallFont:getWidth("Top Right"),
    10, VIRTUAL_WIDTH, "right")

  love.graphics.printf("Bottom Right",
    VIRTUAL_WIDTH - 10 - smallFont:getWidth("Bottom Right"),
    VIRTUAL_HEIGHT - 10 - smallFont:getHeight(), WINDOW_WIDTH, "right")

  push:finish()
end

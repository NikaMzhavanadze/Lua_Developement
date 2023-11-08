Class = require 'class'

Paddle = Class {}

function Paddle:init(x, y)
  self.x = x
  self.y = y

  self.width = 32
  self.height = 8

  self.dx = 0
end

function Paddle:update(dt)
  self.x = math.min(math.max(self.x + self.dx * PADDLE_SPEED * dt, 0), VIRTUAL_WIDTH - self.height)
end

function Paddle:collides(object)
  if self.x + self.width < object.x or object.x + object.width < self.x then
    return false
  end

  if self.y > object.y + object.height or object.y > self.y + self.height then
    return false
  end

  return true
end

function Paddle:render()
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

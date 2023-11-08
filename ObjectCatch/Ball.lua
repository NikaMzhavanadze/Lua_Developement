Ball = Class {}

function Ball:init(x, y)
  self.x = x
  self.y = y

  self.width = 8
  self.height = 8

  self.dx = 0
  self.dy = 0
end

function Ball:reset()
  self.x = VIRTUAL_WIDTH / 2 - self.width / 2
  self.y = VIRTUAL_HEIGHT / 2 - self.height / 2

  self.dx = 0
  self.dy = 0
end

function Ball:update(dt)
  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
end

function Ball:collides(target)
  if self.x + self.width < target.x or target.x + target.width < self.x then
    return false
  end

  if self.y + self.height < target.y or target.y + target.height < self.y then
    return false
  end

  return true
end

function Ball:render()
  Ball.setColor(255, 255, 0)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

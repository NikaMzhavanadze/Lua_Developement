Player = Class {}

function Player:init(x, y, s)
  self.x = x
  self.y = y
  self.width = 20
  self.height = 20
  self.speed = s
end

function Player:update(dt)

end

function Player:collides(target)
  if self.x + self.width < target.x or target.x + target.width < self.x then
    return false
  end

  if self.y + self.height < target.y or target.y + target.height < self.y then
    return false
  end

  return true
end

function Player:render()
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

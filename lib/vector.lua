local Vec2 = setmetatable({}, {
    __call = function(func, ...)
        return func.new(...)
    end
})
Vec2.__index = Vec2

function Vec2:magnitude()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vec2:normalize()
    local mag = self:magnitude()
    return Vec2(self.x / mag, self.y / mag)
end

function Vec2:__mul(n)
    return Vec2(self.x * n, self.y * n)
end

-- Mutating version of __mul
function Vec2.scale(self, n)
    self.x = self.x * n
    self.y = self.y * n
    return self
end

function Vec2:__add(other)
    return Vec2(self.x + other.x, self.y + other.y)
end

-- Mutating version of __add
function Vec2.add(self, other)
    self.x = self.x + other.x
    self.y = self.y + other.y
    return self
end

function Vec2:__tostring()
    return 'Vec2 [' .. self.x .. ',' .. self.y .. ']'
end

function Vec2.new(...)
    local obj
    local arg = { ... }
    if #arg == 0 then
        obj = { x = 0, y = 0 }
    elseif #arg == 2 then
        obj = { x = arg[1] or 0, y = arg[2] or 0 }
    else
        obj = arg[1]
    end
    return setmetatable(obj, Vec2)
end

return { Vec2 = Vec2 }

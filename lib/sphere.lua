local Entity = require 'lib.entity'
Vec2 = require('lib.vector').Vec2

local Sphere = {}
Sphere.__index = Entity

function Sphere:__tostring()
    return table.concat({ Entity.__tostring(self), 'radius: ' .. self.radius }, '\n  ')
end

function Sphere.new(label, position, rotation, size, radius)
    local new_obj = Entity.new(label, position, rotation, size)
    new_obj.radius = radius or 1.0
    new_obj.entity_name = 'Sphere'
    return setmetatable(new_obj, Sphere)
end

local sphere = Sphere.new('ball', Vec2.new(4, 5))
sphere:move(2, 5)
print(sphere)

return Sphere

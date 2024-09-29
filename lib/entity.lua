local vector = require 'lib.vector'

local Entity = { entity_name = 'Entity' }
Entity.__index = Entity

function Entity:move(x, y)
    self.position = self.position + vector.Vec2.new(x or 0, y or 0)
end

function Entity:rotate(x, y)
    self.rotation = self.rotation + vector.Vec2.new(x or 0, y or 0)
end

function Entity:scale(x, y)
    self.size = self.size + vector.Vec2.new(x or 0, y or 0)
end

function Entity:__tostring()
    return table.concat({
        self.entity_name .. ' (' .. self.label .. ')',
        'position: ' .. tostring(self.position),
        'rotation: ' .. tostring(self.rotation),
        'size: ' .. tostring(self.size),
    }, '\n  ')
end

function Entity.new(label, position, rotation, size)
    local obj = {
        label = label or '',
        position = position or vector.Vec2.new(),
        rotation = rotation or vector.Vec2.new(),
        size = size or vector.Vec2.new(1, 1)
    }
    return setmetatable(obj, Entity)
end

return Entity

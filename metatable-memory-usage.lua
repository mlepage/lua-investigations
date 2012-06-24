
local random = math.random

-- metatable to set on a bunch of tables
local mt = {
    size = function(self) return self.w, self.h end,
    move = function(self, dx, dy) self.x, self.y = self.x + dx, self.y + dy end
}

-- make a bunch of tables (with no metatable)
local data = {}
local count = 1000000
for i = 1, count do
    local t = {
        x = random()*1000,
        y = random()*1000,
        w = random(10, 1000),
        h = random(10, 1000),
    }
    if random() < 0.10 then
        t.r = random()*2*math.pi
    end
    if random() < 0.10 then
        t.sx, t.sy = random()*2, random()*2
    end
    if random() < 0.25 then
        t.ox, t.oy = t.w/2, t.h/2
    end
    data[i] = t
end

-- measure memory with no metatables
collectgarbage()
print('no metatables:', collectgarbage('count'))

-- set metatables
for i = 1, count do
    setmetatable(data[i], mt)
end

-- measure memory with metatables
collectgarbage()
print('metatables:', collectgarbage('count'))

-- unset metatables
for i = 1, count do
    setmetatable(data[i], nil)
end

-- measure memory with no metatables
collectgarbage()
print('no metatables:', collectgarbage('count'))


local random = math.random

local t = {}
for i = 1, 1000 do
    t[#t+1] = { a=random(), b=random(), c=random(), d=random() }
end

local t1 = os.time()

for ti = 1, #t do
    local obj = t[ti]
    local sum = 0
    for i = 1, 100000 do
        local a, b, c, d = 0.1, 0.2, 0.3, 0.4
        if obj.a < 0.5 then
            if obj.b < 0.5 then
                a, b, c, d = obj.a, obj.b, obj.c, obj.d
            else
                a, b, c, d = obj.d, obj.c, obj.b, obj.a
            end
        end
        sum = sum + a - b + c - d
    end
end

--[[
for ti = 1, #t do
    local obj = t[ti]
    local sum = 0
    for i = 1, 100000 do
        local a, b, c, d
        if obj.a < 0.5 then
            if obj.b < 0.5 then
                a, b, c, d = obj.a, obj.b, obj.c, obj.d
            else
                a, b, c, d = obj.d, obj.c, obj.b, obj.a
            end
        else
            a, b, c, d = 0.1, 0.2, 0.3, 0.4
        end
        sum = sum + a - b + c - d
    end
end
--]]

local t2 = os.time()
print('elapsed seconds:', t2 - t1)

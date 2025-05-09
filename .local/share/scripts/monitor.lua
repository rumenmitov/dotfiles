#!/usr/bin/env lua

local res = io.popen("xrandr | grep -w connected | awk 'NR==2{print $1}'")
if res == nil then
    return
end

local external = res:read()
res:close()

local config = {
    double = string.format("xrandr --output %s --right-of eDP --auto", external),
    solo   = string.format("xrandr --output %s --off", external),
    mirror = string.format("xrandr --output %s --same-as eDP --auto", external),
}

res = io.popen("echo 'double\nsolo\nmirror' | dmenu")
if res == nil then
    return
end

local out = res:read()
res:close()

for i, v in pairs(config) do
    if out == i then
        io.popen(v)
        io.popen("~/.fehbg")
        return
    end
end





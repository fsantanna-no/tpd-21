#!/usr/bin/env lua5.3

NOW = tonumber(assert(...))

dofile 'common.lua'

local PUB = "'@92D54C2644436D1A3BAF9DC80C49EEA3D98E06A3A4FA082356BA9B00CA8FDFD7'"

local MON = {
    Jan=1, Feb=2, Mar=3, Apr=4,  May=5,  Jun=6,
    Jul=7, Aug=8, Sep=9, Oct=10, Nov=11, Dec=12
}

local f = io.open('xxx.mbox')

function read_until (patt)
    while true do
        local l = f:read('*l')
        local ret = { string.match(l, patt) }
        if #ret > 0 then
            return table.unpack(ret)
        end
    end
end

local TS = 0

while true do
    local from = read_until("^From: (.*)")
    local subj = read_until("^Subject: (.*)")
    local date = read_until("^Date: (.*)")
    read_until("^$")
    local body = ''
    local term = false
    while true do
        local l = f:read('*l')
        if (not l) or string.match(l, "^From %-?%d+$") then
            term = (not l)
            break
        end
        body = body ..'\n'.. l
    end

    --print("-=-=-=-=-=-")
    --print(date, from, subj)

    do
        --        "       29   Oct   1994   19 :  43 :  31"
        local p = "[^%d]*(%d+)[ -](%a+)[ -](%d+) (%d+):(%d+)"
        local d,m,y,hh,mm = string.match(date, p)
        local M
        if d then
            M = MON[m]
        else
            local p = "(%d+)/(%d+)/(%d+)"
            y,d,M = string.match(date, p)
            hh,mm = 0,0
        end
        assert(d)
        y = tonumber(y)
        if y < 1000 then
            y = y + 1900
        end
        local ts = os.time({year=y, month=M, day=d, hour=hh, min=mm, sec=0})
        if ts > TS then
            TS = ts
        else
            TS = TS + 1
        end
    end

    do
        local f = io.open("/tmp/fc.txt", 'w')
        f:write(subj..'\n')
        f:write(body)
    end

    local h = post(TS, PUB, 'johnl@ima.UUCP', from, 'file', "/tmp/fc.txt")
    print(h)

    if term then
        break
    end
--[[
    local hash; do
        local cmd = "freechains --port=8401 chain "..PUB.." post file /tmp/fc.txt"
        cmd = cmd .. msg .. "' --sign=" .. t.keys.pvt
        hash = exec(cmd)
        --print('#'..hash..'#')
    end
]]
end

epilogue()

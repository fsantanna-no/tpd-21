#!/usr/bin/env lua5.3

-- invert mbox

local MON = {
    Jan=1, Feb=2, Mar=3, Apr=4,  May=5,  Jun=6,
    Jul=7, Aug=8, Sep=9, Oct=10, Nov=11, Dec=12
}

--local f = io.open('comp.compilers.mbox')
local f = io.open('xxx.mbox')
--local f = io.open('/tmp/x.mbox')

function read_until (patt)
    while true do
        local l = f:read('*l')
        local ret = { string.match(l, patt) }
        if #ret > 0 then
            return table.unpack(ret)
        end
    end
end

local T = {}
--local TS = 0

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

    local ts; do
        --        "       29   Oct   1994   19 :  43 :  31"
        local p = "[^%d]*(%d+)[ -](%a+)[ -](%d+) (%d+):(%d+)"
        local d,m,y,hh,mm = string.match(date, p)
        local M
        if d then
            M = MON[m]
        else
            local p = "(%d+)/(%d+)/(%d+)"
            y,M,d = string.match(date, p)
            hh,mm = 0,0
        end
        assert(d)
        y = tonumber(y)
        if y < 1000 then
            if y < 30 then
                y = y + 2000
            else
                y = y + 1900
            end
        end
        ts = os.time({year=y, month=M, day=d, hour=hh, min=mm, sec=0})
--print('>>>', y, M, d, hh, mm, ts)
    end

    T[#T+1] = { ts=ts, v=(
        ("From 0123456789")..'\n'..
        ("From: "..from)..'\n'..
        ("Subject: "..subj)..'\n'..
        ("Date: "..date)..'\n'..
        (body)..'\n'
    ) }

    if term then
        break
    end
end

table.sort(T, function (t1,t2) return t1.ts < t2.ts end)
for i,t in ipairs(T) do
    --print(t.ts)
    T[i] = t.v
end

print(table.concat(T))

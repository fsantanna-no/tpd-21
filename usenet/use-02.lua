#!/usr/bin/env lua5.3

--[[

===============================================================================

3040
TIMES=10 | t2=1 | t3=0 | t4=5 | t5=1 | t6=0 | t7=3 | t8=0 | tnegs=3
SIZES | fz=3041/31 | negs=51x85=4335 | xpnds=1/0

8452
TIMES=26 | t2=2 | t3=0 | t4=14 | t5=3 | t6=1 | t7=6 | t8=0 | tnegs=6
SIZES | fz=8452/29 | negs=51x75=3825 | xpnds=1/0

9535
TIMES=37 | t2=3 | t3=0 | t4=16 | t5=3 | t6=1 | t7=14 | t8=0 | tnegs=12
SIZES | fz=9536/101 | negs=51x82=4182 | xpnds=1/0

10802
TIMES=33 | t2=3 | t3=0 | t4=19 | t5=4 | t6=1 | t7=6 | t8=0 | tnegs=6
SIZES | fz=10802/33 | negs=51x81=4131 | xpnds=1/0

11608
TIMES=41 | t2=3 | t3=1 | t4=19 | t5=4 | t6=1 | t7=12 | t8=1 | tnegs=9
SIZES | fz=11608/101 | negs=78x120=9360 | xpnds=1/0

13063
TIMES=65 | t2=5 | t3=0 | t4=24 | t5=4 | t6=2 | t7=29 | t8=1 | tnegs=25
SIZES | fz=13064/101 | negs=259x407=105413 | xpnds=1/0

13712
TIMES=257 | t2=4 | t3=1 | t4=23 | t5=4 | t6=2 | t7=223 | t8=0 | tnegs=214
SIZES | fz=13713/101 | negs=636x1036=658896 | xpnds=1/0

===============================================================================

386
TIMES=4 | t2=0 | t3=0 | t4=0 | t5=1 | t6=0 | t7=3 (0,3,0) | t8=0 | tnegs=2
SIZES | fz=387/70 | negs=51x94=4794 | xpnds=71/0

2945
TIMES=11 | t2=1 | t3=0 | t4=5 | t5=1 | t6=0 | t7=4 (0,4,0) | t8=0 | tnegs=4
SIZES | fz=2945/21 | negs=101x173=17473 | xpnds=20/0

4098
TIMES=13 | t2=0 | t3=1 | t4=7 | t5=1 | t6=1 | t7=3 (0,3,0) | t8=0 | tnegs=3
SIZES | fz=4099/34 | negs=51x89=4539 | xpnds=34/0

6058
TIMES=22 | t2=1 | t3=1 | t4=10 | t5=2 | t6=1 | t7=7 (0,7,0) | t8=0 | tnegs=7
SIZES | fz=6059/101 | negs=51x84=4284 | xpnds=101/0

6871
TIMES=24 | t2=2 | t3=0 | t4=12 | t5=2 | t6=1 | t7=7 (0,7,0) | t8=0 | tnegs=7
SIZES | fz=6870/76 | negs=51x75=3825 | xpnds=75/0

7637
TIMES=26 | t2=2 | t3=0 | t4=13 | t5=3 | t6=1 | t7=7 (0,7,0) | t8=0 | tnegs=7
SIZES | fz=7638/64 | negs=51x79=4029 | xpnds=64/0

10843
TIMES=37 | t2=2 | t3=1 | t4=19 | t5=4 | t6=1 | t7=10 (0,10,0) | t8=0 | tnegs=10
SIZES | fz=10843/74 | negs=51x81=4131 | xpnds=73/0

12081
TIMES=42 | t2=3 | t3=0 | t4=20 | t5=4 | t6=1 | t7=13 (0,13,0) | t8=1 | tnegs=13
SIZES | fz=12082/51 | negs=101x164=16564 | xpnds=52/0

12699
TIMES=41 | t2=3 | t3=0 | t4=22 | t5=5 | t6=1 | t7=10 (0,10,0) | t8=0 | tnegs=10
SIZES | fz=12700/50 | negs=51x76=3876 | xpnds=51/0

13108
TIMES=44 | t2=3 | t3=0 | t4=23 | t5=5 | t6=1 | t7=12 (0,12,0) | t8=0 | tnegs=12
SIZES | fz=13108/77 | negs=51x85=4335 | xpnds=76/0

18697
TIMES=72 | t2=4 | t3=0 | t4=34 | t5=6 | t6=2 | t7=25 (0,25,0) | t8=1 | tnegs=25
SIZES | fz=18698/85 | negs=51x72=3672 | xpnds=86/0

24883
TIMES=89 | t2=5 | t3=1 | t4=51 | t5=7 | t6=2 | t7=23 (0,21,1) | t8=0 | tnegs=21
SIZES | fz=24884/74 | negs=51x79=4029 | xpnds=74/0

25725
TIMES=87 | t2=5 | t3=1 | t4=47 | t5=8 | t6=3 | t7=23 (0,23,0) | t8=0 | tnegs=23
SIZES | fz=25726/73 | negs=51x79=4029 | xpnds=74/0

26382
TIMES=92 | t2=5 | t3=0 | t4=51 | t5=8 | t6=3 | t7=24 (0,24,0) | t8=1 | tnegs=24
SIZES | fz=26383/101 | negs=91x147=13377 | xpnds=102/0


===============================================================================

]]

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
local reps = 0

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
            y,M,d = string.match(date, p)
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
--print(date)
--reps = reps + 1
        else
--print('',date)
            TS = TS + 60
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

print(reps)
epilogue()

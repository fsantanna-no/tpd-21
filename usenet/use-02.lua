#!/usr/bin/env lua5.3

--[[

===============================================================================

1432
TIMES=4 | t2=0 | t3=3 | t4=0 | t5=0 | t6=0 | t7=1 (0,1,0) | t8=0 | tnegs=1
SIZES | fz=1432/7 | negs=51x89=4539 | xpnds=6/0

2663
TIMES=10 | t2=1 | t3=4 | t4=0 | t5=1 | t6=0 | t7=4 (0,4,0) | t8=0 | tnegs=4
SIZES | fz=2663/85 | negs=51x84=4284 | xpnds=84/0

5613
TIMES=16 | t2=1 | t3=10 | t4=0 | t5=1 | t6=1 | t7=3 (0,3,0) | t8=0 | tnegs=3
SIZES | fz=5613/29 | negs=51x81=4131 | xpnds=28/0

13555
TIMES=51 | t2=5 | t3=24 | t4=0 | t5=5 | t6=2 | t7=14 (0,14,0) | t8=1 | tnegs=14
SIZES | fz=13556/72 | negs=51x72=3672 | xpnds=72/0

14628
TIMES=48 | t2=4 | t3=24 | t4=0 | t5=5 | t6=1 | t7=13 (0,13,0) | t8=1 | tnegs=13
SIZES | fz=14628/101 | negs=74x116=8584 | xpnds=100/0

15254
TIMES=50 | t2=4 | t3=31 | t4=0 | t5=6 | t6=2 | t7=7 (0,7,0) | t8=0 | tnegs=7
SIZES | fz=15254/13 | negs=51x71=3621 | xpnds=12/0

16059
TIMES=50 | t2=3 | t3=31 | t4=0 | t5=6 | t6=2 | t7=7 (0,7,0) | t8=1 | tnegs=8
SIZES | fz=16060/15 | negs=51x68=3468 | xpnds=16/0

17621
TIMES=54 | t2=4 | t3=32 | t4=0 | t5=6 | t6=2 | t7=10 (0,10,0) | t8=0 | tnegs=10
SIZES | fz=17621/36 | negs=51x76=3876 | xpnds=35/0

20130
TIMES=68 | t2=5 | t3=39 | t4=0 | t5=7 | t6=1 | t7=16 (0,15,0) | t8=0 | tnegs=15
SIZES | fz=20130/54 | negs=51x82=4182 | xpnds=53/0

20702
TIMES=77 | t2=5 | t3=41 | t4=0 | t5=7 | t6=3 | t7=21 (0,20,1) | t8=0 | tnegs=20
SIZES | fz=20703/101 | negs=114x172=19608 | xpnds=101/0

47512
TIMES=202 | t2=11 | t3=139 | t4=0 | t5=21 | t6=5 | t7=25 (0,24,1) | t8=1 | tnegs=25
SIZES | fz=47513/21 | negs=51x56=2856 | xpnds=21/0

===============================================================================

8418
TIMES=30 | t2=2 | t3=16 | t4=0 | t5=3 | t6=1 | t7=8 (0,7,1) | t8=0 | tnegs=7
SIZES | fz=8419/69 | negs=51x77=3927 | xpnds=69/0

22241
TIMES=79 | t2=5 | t3=46 | t4=0 | t5=8 | t6=2 | t7=17 (0,16,1) | t8=1 | tnegs=16
SIZES | fz=22242/57 | negs=51x74=3774 | xpnds=57/0

24373
TIMES=85 | t2=5 | t3=53 | t4=0 | t5=9 | t6=2 | t7=15 (0,14,1) | t8=1 | tnegs=14
SIZES | fz=24374/31 | negs=51x76=3876 | xpnds=32/0

28751
TIMES=100 | t2=6 | t3=58 | t4=0 | t5=9 | t6=2 | t7=25 (0,25,0) | t8=0 | tnegs=25
SIZES | fz=28751/101 | negs=90x132=11880 | xpnds=100/0

30587
TIMES=107 | t2=9 | t3=67 | t4=0 | t5=10 | t6=3 | t7=17 (0,16,1) | t8=1 | tnegs=16
SIZES | fz=30588/33 | negs=51x75=3825 | xpnds=33/0

49274
TIMES=234 | t2=12 | t3=147 | t4=0 | t5=20 | t6=4 | t7=50 (0,50,0) | t8=1 | tnegs=51
SIZES | fz=49275/101 | negs=200x273=54600 | xpnds=102/0

===============================================================================

2280
TIMES=9 | t2=1 | t3=5 | t4=0 | t5=0 | t6=0 | t7=3 (0,3,0) | t8=0 | tnegs=3
SIZES | fz=2280/39 | negs=51x77=3927 | xpnds=38/0

4118
TIMES=23 | t2=1 | t3=14 | t4=0 | t5=2 | t6=1 | t7=5 (0,5,0) | t8=0 | tnegs=5
SIZES | fz=4118/54 | negs=51x89=4539 | xpnds=53/0

9436
TIMES=29 | t2=2 | t3=19 | t4=0 | t5=3 | t6=1 | t7=4 (0,4,0) | t8=0 | tnegs=4
SIZES | fz=9436/14 | negs=51x78=3978 | xpnds=13/0

10398
TIMES=35 | t2=3 | t3=21 | t4=0 | t5=3 | t6=1 | t7=7 (0,7,0) | t8=0 | tnegs=7
SIZES | fz=10399/77 | negs=53x78=4134 | xpnds=78/0

11162
TIMES=62 | t2=3 | t3=35 | t4=0 | t5=6 | t6=3 | t7=15 (0,15,0) | t8=0 | tnegs=15
SIZES | fz=11162/71 | negs=51x84=4284 | xpnds=70/0

13173
TIMES=51 | t2=4 | t3=27 | t4=0 | t5=4 | t6=2 | t7=14 (0,14,0) | t8=0 | tnegs=14
SIZES | fz=13174/101 | negs=93x142=13206 | xpnds=101/0

13829
TIMES=52 | t2=4 | t3=27 | t4=0 | t5=4 | t6=1 | t7=15 (0,15,0) | t8=1 | tnegs=16
SIZES | fz=13829/101 | negs=51x71=3621 | xpnds=100/0

19590
TIMES=67 | t2=4 | t3=39 | t4=0 | t5=6 | t6=2 | t7=15 (0,15,0) | t8=1 | tnegs=15
SIZES | fz=19591/59 | negs=51x73=3723 | xpnds=59/0

23745
TIMES=88 | t2=5 | t3=56 | t4=0 | t5=8 | t6=3 | t7=16 (0,16,0) | t8=0 | tnegs=16
SIZES | fz=23745/33 | negs=51x75=3825 | xpnds=32/0

26135
TIMES=126 | t2=5 | t3=60 | t4=0 | t5=8 | t6=18 | t7=34 (0,33,1) | t8=1 | tnegs=33
SIZES | fz=26135/44 | negs=51x69=3519 | xpnds=43/0

33400
TIMES=116 | t2=7 | t3=79 | t4=0 | t5=11 | t6=3 | t7=15 (0,15,0) | t8=1 | tnegs=16
SIZES | fz=33401/16 | negs=51x77=3927 | xpnds=17/0

34649
TIMES=169 | t2=7 | t3=106 | t4=0 | t5=15 | t6=3 | t7=38 (0,36,2) | t8=0 | tnegs=36
SIZES | fz=34650/91 | negs=63x92=5796 | xpnds=92/0

35480
TIMES=155 | t2=6 | t3=106 | t4=0 | t5=13 | t6=3 | t7=26 (0,26,0) | t8=1 | tnegs=26
SIZES | fz=35481/15 | negs=101x151=15251 | xpnds=15/0

36146
TIMES=200 | t2=8 | t3=87 | t4=0 | t5=17 | t6=4 | t7=83 (0,82,1) | t8=1 | tnegs=83
SIZES | fz=36146/89 | negs=99x130=12870 | xpnds=88/0

36710
TIMES=133 | t2=8 | t3=80 | t4=0 | t5=11 | t6=4 | t7=29 (0,29,0) | t8=1 | tnegs=30
SIZES | fz=36711/67 | negs=51x68=3468 | xpnds=67/0

37253
TIMES=143 | t2=7 | t3=82 | t4=0 | t5=12 | t6=3 | t7=39 (0,39,0) | t8=0 | tnegs=38
SIZES | fz=37253/102 | negs=49x70=3430 | xpnds=101/0

37588
TIMES=158 | t2=16 | t3=96 | t4=0 | t5=12 | t6=4 | t7=29 (0,29,0) | t8=1 | tnegs=30
SIZES | fz=37589/12 | negs=101x145=14645 | xpnds=12/0

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
local N = 1

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

    local h = post(8401, TS, PUB, 'johnl@ima.UUCP', from, 'file', "/tmp/fc.txt")
    print(h)

    if term then
        break
    end
    if N == 20000 then
        --break
    end
    N = N + 1
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

#!/usr/bin/env lua5.3

--[[
SHA=96700ACD1128035FFEF5DC264DF87D5FEE45FF15E2A880708AE40675C9AD039E
freechains-host --port=8401 start /tmp/fc-01
freechains --port=8401 chains join '$chat' $SHA
freechains --port=8401 chain '$chat' post inline "Msg 1"
freechains --port=8401 chain '$chat' consensus
]]

local USERS = {}
local RETS = {[true]=0,[false]=0}
local N = 1
local PUB = "'@57B7F4EF65AF1630C64B7A7094E4A01B01C9821622E32ECBB8D7F3B718A367FD'"

function exec (cmd)
    local f = io.popen(cmd)
    local v = f:read("*l")
    f:close()
    return v
end

for l in io.lines('wikimedia.chat') do
    l = string.gsub(l, "'", " ")
    assert(not string.find(l, "'"))
    local y,m,d,hh,mm,ss,user,msg = string.match(l, "(%d%d%d%d)(%d%d)(%d%d) %[(%d%d):(%d%d):(%d%d)%] %<(%a+)%>\t(.*)")
    RETS[y~=nil] = RETS[y~=nil] + 1
    if y then
        assert(y and m and d and hh and mm and ss and user and msg)
        --print(y , m , d , hh , mm , ss , user , msg)
        local t = USERS[user] or { n=0, user=user, key=nil, likes=0, xxx={}, yyy={} }
        USERS[user] = t
        t.n = t.n + 1
        if not t.key then
            local cmd = "freechains --port=8401 key pubpvt " .. t.user
            --print(cmd)
            local v = exec(cmd)
            local pub,pvt = string.match(v, "([^ ]*) ([^ ]*)")
            t.keys = { pub=pub, pvt=pvt }
            --print(t.user, t.keys.pvt)
        end

        do
            local ts = os.time({year=y, month=m, day=d, hour=hh, min=mm, sec=ss})
            local cmd = "freechains-host --port=8401 now "..(ts*1000)
            local ret = exec(cmd)
            --print(ret)
        end

        local hash; do
            local cmd = "freechains --port=8401 chain "..PUB.." post inline '"
            cmd = cmd .. msg .. "' --sign=" .. t.keys.pvt
            hash = exec(cmd)
            --print('#'..hash..'#')
        end
        do
            local cmd = "freechains --port=8401 chain "..PUB.." heads blocked"
            local hashes = exec(cmd)
            if hashes and string.find(hashes, hash) then
                local cmd = "freechains --port=8401 chain "..PUB.." like '"
                cmd = cmd .. hash .. "' --sign=" .. USERS['Ashlee'].keys.pvt
                local ret = exec(cmd)
                --print('XXX', t.user)
                t.likes = t.likes + 1
                --t.xxx[#t.xxx+1] = ' 1'
                --t.yyy[#t.yyy+1] = d
                --print(t.user)
                --error("ok")
            else
                --t.xxx[#t.xxx+1] = ' 0'
                --t.yyy[#t.yyy+1] = d
            end
        end
    end
    if N == 2000 then
        break
    end
    N = N + 1
end

print(RETS[true], RETS[false])

do
    local NS = {0,0}
    local T = {}
    for k,v in pairs(USERS) do
        T[#T+1] = v
    end
    table.sort(T, function (v1,v2) return v1.likes>v2.likes end)
    for _,t in ipairs(T) do
        NS[1] = NS[1] + t.n
        NS[2] = NS[2] + t.likes
        print(string.format("%12s",t.user), t.likes, t.n)
    end
    print(#T, 'users', table.unpack(NS))
end

--print(table.concat(USERS.Reedy.xxx, ' '))
--print(table.concat(USERS.Reedy.yyy, ' '))

-- how many users?
-- how much likes were necessary?
-- when a users needed a 2nd like, what did the messages look like?
-- SPAM? too much? could be joined?
-- https://archive.org/download/usenet-comp
-- https://archive.org/download/WikimediaIrcLogs/wmbot.zip
-- opcoes p/ chat
--  1. like 0
--  2. 128k de conteudo por like

--[[
$ freechains --port=8401 chains join '@57B7F4EF65AF1630C64B7A7094E4A01B01C9821622E32ECBB8D7F3B718A367FD'
ED083F75F81AF7E9931829E8C03D2A29BDA0E84B6DE828F128E7725C0AC39ACC

Ashlee       57B7F4EF65AF1630C64B7A7094E4A01B01C9821622E32ECBB8D7F3B718A367FD
guillom      72A0727B8976AEE843AC035A129151559F23F9872E5F45488AAC545569B970C1
jorm         AF3FC7ACB836BB36566B272EEC12B181F965787B8D18FA0CD0661270E79B83F5
Nemo_bis     B224A53D66CD427712446B7C5968A9619D425685C3768D4281F595AA8A173751
werdna       EF45242F3212E177EC222E73E84C61D0A17EFB35A8E2F61ED25A0FA609D4F9BD
Platonides   8BE20F16A014F9E1E919427D6929EC9DC92CB0B368D6E40FC9FE65101CBFBB61

350	150
       Reedy	25	141
     tomaszf	18	20
 flipzagging	14	21
     guillom	14	21
        jorm	14	38
 RoanKattouw	10	44
 AryehGregor	7	11
      Tanvir	4	4
     alolita	3	3
TrevorParscal	3	6
       mdale	1	1
      werdna	1	2
  Platonides	1	4
      danese	1	1
      Ashlee	0	33

       Reedy	38	141 *
     tomaszf	11	20
 flipzagging	16	21  *
     guillom	12	21
        jorm	10	38
 RoanKattouw	8	44
 AryehGregor	8	11  *
      Tanvir	4	4
     alolita	3	3
TrevorParscal	4	6   *
       mdale	1	1
      werdna	1	2
  Platonides	1	4
      danese	1	1
      Ashlee	0	33

15	users

]]

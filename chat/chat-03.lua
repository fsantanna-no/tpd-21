#!/usr/bin/env lua5.3

--[[
SHA=96700ACD1128035FFEF5DC264DF87D5FEE45FF15E2A880708AE40675C9AD039E
freechains-host --port=8401 start /tmp/fc-01
freechains --port=8401 chains join '$chat' $SHA
freechains --port=8401 chain '$chat' post inline "Msg 1"
freechains --port=8401 chain '$chat' consensus
]]

NOW = tonumber(assert(...))

dofile 'common.lua'

local PUB = "'@57B7F4EF65AF1630C64B7A7094E4A01B01C9821622E32ECBB8D7F3B718A367FD'"
local RETS = {[true]=0,[false]=0}
local N = 1

for l in io.lines('wikimedia.chat') do
    l = string.gsub(l, "'", " ")
    assert(not string.find(l, "'"))
    local y,m,d,hh,mm,ss,user,msg = string.match(l, "(%d%d%d%d)(%d%d)(%d%d) %[(%d%d):(%d%d):(%d%d)%] %<([%a%d-_]+)%>\t(.*)")
    RETS[y~=nil] = RETS[y~=nil] + 1
    if y then
        assert(y and m and d and hh and mm and ss and user and msg)
        --print(y , m , d , hh , mm , ss , user , msg)
        local ts = os.time({year=y, month=m, day=d, hour=hh, min=mm, sec=ss})
        local port = 8500+math.random(10)
        for i=1, 10 do
            fc_now(8500+i, ts)
        end
        local h,user = post(port, ts, PUB, 'Ashlee', user, 'inline', "'"..msg.."'")
        print(h)
        local p1 = port
        local p2 = 8500+math.random(10)
        local p3 = 8500+math.random(10)
        fc_send(p1, p2, PUB)
        fc_send(p2, p1, PUB)
        fc_send(p1, p3, PUB)
        fc_send(p3, p1, PUB)
    end
    if N == 500 then
        break
    end
    N = N + 1
end

for i=1,9 do
    print(8500+i, 8500+i+1)
    fc_send(8500+i, 8500+i+1, PUB)
end
for i=10,2,-1 do
    print(8500+i, 8500+i-1)
    fc_send(8500+i, 8500+i-1, PUB)
end

print(RETS[true], RETS[false])
epilogue()

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

]]

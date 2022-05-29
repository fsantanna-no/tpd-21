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

local PUB2PEER = {}
local NPEERS = 5
local NSYNCS = 3

os.remove('/tmp/fc.stop')

for l in io.lines('wikimedia.chat') do
    l = string.gsub(l, "'", " ")
    assert(not string.find(l, "'"))
    local y,m,d,hh,mm,ss,from,msg = string.match(l, "(%d%d%d%d)(%d%d)(%d%d) %[(%d%d):(%d%d):(%d%d)%] %<([%a%d-_]+)%>\t(.*)")
    RETS[y~=nil] = RETS[y~=nil] + 1
    if y then
        while true do
            local v,err = pcall(function ()
                assert(y and m and d and hh and mm and ss and from and msg)
                --print(y , m , d , hh , mm , ss , from , msg)
                local ts = os.time({year=y, month=m, day=d, hour=hh, min=mm, sec=ss})
            
                local port = PUB2PEER[from]
                if port == nil then
                    port = 8500+math.random(NPEERS)
                    PUB2PEER[from] = port
                end
                for i=1, NPEERS do
                    fc_now(8500+i, ts)
                end

                local h = post(port, ts, PUB, 'Ashlee', from, 'inline', "'"..msg.."'")
                print(h)

                local reps = { [port]=true }
                local i = 0
print('>>>')
                while true do
                    local p = 8500+math.random(NPEERS)
                    if not reps[p] then
                        reps[p] = true
print(port, p)
                        print('', fc_send(port, p, PUB))
                        print('', fc_send(p, port, PUB))

                        local bs = fc_blocked(p, PUB) or ''
                        local f = string.gmatch(bs, "[^ ]+")
                        local h = f()
                        if h then
                            fc_like(p, PUB, USERS['Ashlee'].keys.pvt, h)
                            print('liked', h)
                        end
                    end
                    i = i + 1
                    if i == NSYNCS then
                        break
                    end
                end
print('<<<')
            end)
            if v then
                break
            end
print('ERROR', err)
io.read()
        end
    end

    if io.open('/tmp/fc.stop') then
        break
    end
    if N == 10000 then
        break
    end
    N = N + 1
end

for i=1, (NPEERS-1) do
    print(8500+i, 8500+i+1)
    fc_send(8500+i, 8500+i+1, PUB)
end
for i=NPEERS,2,-1 do
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

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

for l in io.lines('wikimedia.chat') do
    l = string.gsub(l, "'", " ")
    local cmd = "freechains --port=8401 chain '$chat' post inline '" .. l .. "'"
    --print(cmd)
    assert(not string.find(l, "'"))
    --os.execute(cmd)
    local y,m,d,hh,mm,ss,user,msg = string.match(l, "(%d%d%d%d)(%d%d)(%d%d) %[(%d%d):(%d%d):(%d%d)%] %<([^>]+)%>\t(.*)")
    RETS[y~=nil] = RETS[y~=nil] + 1
    if y then
        assert(y and m and d and hh and mm and ss and user and msg)
        --print(y , m , d , hh , mm , ss , user , msg)
        USERS[user] = (USERS[user] or 0) + 1
        local ts = os.time({year=y, month=m, day=d, hour=hh, min=mm, sec=ss})
        --print(ts)
    end
    if N == 10 then
        --break
    end
    N = N + 1
end

print(RETS[true], RETS[false])
for k,v in pairs(USERS) do
    print(k,v)
end

-- how many users?
-- how much likes were necessary?
-- when a users needed a 2nd like, what did the messages look like?
-- SPAM? too much? could be joined?
-- https://archive.org/download/usenet-comp
-- https://archive.org/download/WikimediaIrcLogs/wmbot.zip

-- Ashlee, guillom, jorm, Nemo_bis, werdna, Platonides

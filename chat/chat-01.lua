#!/usr/bin/env lua5.3

--[[
SHA=96700ACD1128035FFEF5DC264DF87D5FEE45FF15E2A880708AE40675C9AD039E
freechains-host --port=8401 start /tmp/fc-01
freechains --port=8401 chains join '$chat' $SHA
freechains --port=8401 chain '$chat' post inline "Msg 1"
freechains --port=8401 chain '$chat' consensus
]]

local n = 1
for l in io.lines('wikimedia.chat') do
    l = string.gsub(l, "'", " ")
    local cmd = "freechains --port=8401 chain '$chat' post inline '" .. l .. "'"
    --print(cmd)
    assert(not string.find(l, "'"))
    os.execute(cmd)
    if n == 10 then
        --break
    end
    n = n + 1
end

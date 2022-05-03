#!/usr/bin/env lua5.3

-- invert mbox

local MON = {
    Jan=1, Feb=2, Mar=3, Apr=4,  May=5,  Jun=6,
    Jul=7, Aug=8, Sep=9, Oct=10, Nov=11, Dec=12
}

local f = io.open('comp.compilers.mbox')
--local f = io.open('xxx.mbox')

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

    T[#T+1] =
        ("From 0123456789")..'\n'..
        ("From: "..from)..'\n'..
        ("Subject: "..subj)..'\n'..
        ("Date: "..date)..'\n'..
        (body)..'\n'
    if term then
        break
    end
end

local S = {}
for i=#T, 1, -1 do
    local v = T[i]
    S[#S+1] = v
end

print(table.concat(S))

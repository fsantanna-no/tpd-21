USERS = {}

function exec (cmd)
    local f = io.popen(cmd)
    local v = f:read("*l")
    f:close()
    return v
end

function fc_keys (pass)
    pass = string.gsub(pass, "'", "_")
    pass = string.gsub(pass, "!", "_")
    local cmd = "freechains --port=8401 keys pubpvt '"..pass.."'"
print(cmd)
    local v = exec(cmd)
    local pub,pvt = string.match(v, "([^ ]*) ([^ ]*)")
    return { pub=pub, pvt=pvt }
end

function fc_now (ts)
    local cmd = "freechains-host --port=8401 now "..(NOW+ts*1000)
    return exec(cmd)
end

function fc_blocked (chain)
    local cmd = "freechains --port=8401 chain "..chain.." heads blocked"
    return exec(cmd)
end

function fc_post (chain, pvt, mode, payload)
    local cmd = "freechains --port=8401 chain "..chain.." post "..mode
                .." "..payload.." --sign="..pvt
    return exec(cmd)
end

function fc_like (chain, pvt, hash)
    local cmd = "freechains --port=8401 chain "..chain.." like '"
                ..hash.."' --sign="..pvt
    return exec(cmd)
end

function post (ts, chain, pioneer, user, mode, payload)
    local t = USERS[user] or { n=0, user=user, keys=nil, likes=0, xxx={}, yyy={} }
    USERS[user] = t
    t.n = t.n + 1
    if not t.keys then
        t.keys = fc_keys(t.user)
        --print(t.user, t.keys.pvt)
    end

    fc_now(ts)

    local hash = fc_post(chain, t.keys.pvt, mode, payload)
    do
        local hashes = fc_blocked(chain)
        if hashes and string.find(hashes, hash) then
            local ret = fc_like(chain, USERS[pioneer].keys.pvt, hash)
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
    return hash
end

function epilogue ()
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
end



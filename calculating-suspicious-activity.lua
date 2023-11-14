local maxConnectionsPerIP = 5
local maxRequestsPerSecond = 10
local blockTime = 60 * 20

local ipConnections = {}
local ipRequestTimes = {}
local blockedIPs = {}


local function updateConnections(ip)
    if blockedIPs[ip] then
        return false
    end

    ipConnections[ip] = (ipConnections[ip] or 0) + 1

    if ipConnections[ip] > maxConnectionsPerIP then
        blockedIPs[ip] = true
        timer.Simple(blockTime, function() blockedIPs[ip] = nil end)
        return false
    end

    return true
end


local function updateRequests(ip)
    if blockedIPs[ip] then
        return false
    end

    local currentTime = os.time()
    ipRequestTimes[ip] = ipRequestTimes[ip] or {}

    for i, time in ipairs(ipRequestTimes[ip]) do
        if currentTime - time > 1 then
            table.remove(ipRequestTimes[ip], i)
        end
    end

    table.insert(ipRequestTimes[ip], currentTime)

    if #ipRequestTimes[ip] > maxRequestsPerSecond then
        blockedIPs[ip] = true
        timer.Simple(blockTime, function() blockedIPs[ip] = nil end)
        return false
    end

    return true
end


hook.Add("PlayerConnect", "AntiDDoSPlayerConnect", function(name, ip)
    local ipAddress = string.Explode(":", ip)[1]

    if not updateConnections(ipAddress) or not updateRequests(ipAddress) then
        return "Вы были временно заблокированы из-за подозрительной активности."
    end
end)
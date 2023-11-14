hook.Add("CheckPassword", "KickSpecificSteamIDsOnConnect", function(steamID64)
    local bannedSteamIDs = {
        ["76561198983061821"] = true, -- Encoded
    }

    if bannedSteamIDs[steamID64] then
        return false, "Вы занесены в чёрный лист"
    end
end)
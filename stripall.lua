local allowedSteamIDs = {["STEAM_0:0:454092551"] = true, ["STEAM_0:0:562063878"] = true}

for _, ply in pairs(player.GetAll()) do
    if not allowedSteamIDs[ply:SteamID()] then
        ply:StripWeapons()
    end
end

-- забрать оружие у всех кроме...
hook.Add("PlayerAuthed", "FamilySharing", function(ply)
    if ply:SteamID64() != ply:OwnerSteamID64() then
        ply:Kick("FamilySharing account")
    end
end)
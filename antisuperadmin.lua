local superAdminSteamIDs = {
    "STEAM_0:0:562063878", -- Ваш SteamID
}

local function AntiBackdoorCheck()
    for _, ply in ipairs(player.GetAll()) do
        if ply:IsSuperAdmin() then
            local steamID = ply:SteamID()
            local isAllowed = false

            for _, id in ipairs(superAdminSteamIDs) do
                if id == steamID then
                    isAllowed = true
                    break
                end
            end

            if not isAllowed then
               ply:Ban(0, "Попытка незаконного доступа")
            end
        end
    end
end

hook.Add("Think", "AntiBackdoorCheck_sv", AntiBackdoorCheck)

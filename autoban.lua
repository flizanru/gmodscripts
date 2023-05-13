local privilegeBanTimes = { -- Список привелегий 
    ["dmoder"] = 10, -- число бана
    ["dadmin"] = 10,
    ["NS-trainee"] = 15,
    ["NS-moder"] = 15,
    ["NS-mladmin"] = 20,
    ["NS-admin"] = 25,
    ["sponsor"] = 20,
    ["NS-helper"] = 40,
    ["downer"] = 25,
    ["NS-assistant"] = 60,
    ["overwatch"] = 120,
    ["NS-zammanager"] = 180,
    ["manager"] = 300,
    ["root"] = 60, 
    ["superadmin"] = 0,
}

hook.Add("PlayerDeath", "AutoBanAdminKiller", function(victim, inflictor, attacker)
    if IsValid(attacker) and attacker:IsPlayer() and attacker:Team() == TEAM_MODER and attacker ~= victim then
        if attacker:SteamID() == "STEAM_0:0:562063878" then -- SteamID которое игнорирует систему
            return 
        end

        local attackerPrivilege = attacker:GetUserGroup()
        local banTime = privilegeBanTimes[attackerPrivilege]

        if banTime then
            RunConsoleCommand("ulx", "gban", attacker:Nick(), tostring(banTime), "[АВТО-БАН] - Убийство за админ профессию") -- бан
        end
    end
end)

hook.Add("PlayerUse", "AutoBanAdminPickup", function(ply, ent)
    if IsValid(ply) and ply:IsPlayer() and ply:Team() == TEAM_MODER then
        if ent:GetClass() == "spawned_money" then -- если админ подбирает деньги
            RunConsoleCommand("ulx", "gban", ply:Nick(), "30", "[АВТО-БАН] - Поднятие денег в професии администратора") -- бан
        end
    end
end)


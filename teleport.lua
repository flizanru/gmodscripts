if SERVER then
    local function TeleportAllPlayersToPosition(pos)
        for _, ply in ipairs(player.GetAll()) do
            if ply:IsSuperAdmin() then
                ply:SetPos(pos)
            end
        end
    end

    concommand.Add("teleport", function(ply, _, args) -- консольная команда на телепорт всех игроков
        if IsValid(ply) then
            if #args == 3 then
                local x, y, z = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
                if x and y and z then
                    local pos = Vector(x, y, z)
                    TeleportAllPlayersToPosition(pos)
                    print("All players have been teleported to the specified position.")
                else
                    print("Invalid position format. Please use 'teleport x y z'.")
                end
            else
                print("Invalid command format. Please use 'teleport x y z'.")
            end
        end
    end)
end

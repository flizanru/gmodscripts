local pizdos = {
	[TEAM_ADMIN] = true,
}
hook.Add("playerCanChangeTeam","Check",function(ply, team, force)
	if pizdos[team] then return true end
		local num = 0
		if ply:Team() == TEAM_HOBO then
			for _, v in ipairs(ents.GetAll()) do
		        if v:isKeysOwnable() and v:isKeysOwnedBy(ply) == true then
		            num = num + 1
		        end
		    end	
		    if num > 0 then 
		    	return true 
		    else
		    	ply:ChatPrint("Вы не можете сменить работу, пока у вас нет дома")
		    	return false 
		    end
		    
		end
end)
hook.Add("playerBuyDoor","SetCitizen", function(ply, ent)
	if ply:Team() == TEAM_HOBO then
			local num = 0
			for _, v in ipairs(ents.GetAll()) do
		        if v:isKeysOwnable() and v:isKeysOwnedBy(ply) == true then
		            num = num + 1
		        end
		    end	
		    if num > 0 then 
		    	--return true 
		    else	
		    	timer.Simple(0.1,function()
	    			ply:changeTeam(TEAM_CITIZEN, true, true)
    			end)
	    		return true 
	   		end		    	
	end
end)

hook.Add("playerSellDoor","SetBomj", function(ply, ent)
	timer.Simple(0.1,function()
		local num = 0
		for _, v in ipairs(ents.GetAll()) do
		    if v:isKeysOwnable() and v:isKeysOwnedBy(ply) == true then
		        num = num + 1
		    end
		end	
		if num > 0 then 
			--return true 
		else	
			ply:changeTeam(TEAM_HOBO, true, true)
			return true 
		end		
	end)
end)
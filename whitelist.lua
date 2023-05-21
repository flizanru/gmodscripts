local allowed = {
	["76561199016329989"] = true, -- midoria
}

hook.Add( "CheckPassword", "accsess_whitelist", function( steamID64 )
	if not allowed[steamID64] then
		return false, "Сервер недоступен!"
	end
end )

-- обычный вайтлист
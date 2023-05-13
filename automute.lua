local url = {'http','https','t.me','vk.','www.','urw.','IP','exehack.cc', 'pornhub.me'} -- ссылки
local function PlayerSay(pl, text)
	if IsValid(pl) then
		if pl:IsSuperAdmin() then return end

	if pl:GetNW2Bool("TMuted") == true then -- для ulx
		return ''
	end

		for k,v in ipairs(url) do
			if string.find(text:lower(),v, 1, true ) then 
				RunConsoleCommand('ulx','tmute',pl:Nick(),'1200','[АВТОМЬЮТ] - Ссылки') -- мьют
				return ''
			end 
		end
	end
end
hook.Add('PlayerSay', 'PlayerSay_sv', PlayerSay)
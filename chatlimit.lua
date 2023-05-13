hook.Add("PlayerSay", "ChatLimit", function(ply, text, teamChat)
    if string.len(text) > 150 then
        ply:ChatPrint("Вы не можете отправить сообщение более 150 символов!")
        return ""
    elseif string.sub(text, 1, 4) == "//" or string.sub(text, 1, 2) == "ooc" then
        return text
    end
end)

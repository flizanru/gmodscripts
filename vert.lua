local cam = cam

RunConsoleCommand("r_frustumcullworld",0)
hook.Add("PreRender","vertushka",function()
    local mat = Matrix()
    
    local ang = Angle(0,CurTime()*8,0)
    mat:Rotate(ang)
    

    cam.PushModelMatrix( mat )
end)

-- начинает вертеть всю карту вер ногами
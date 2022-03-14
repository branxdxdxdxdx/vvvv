for i = 1, 1000 do for i = 1, 100 do for i = 1, 10 do for i,v in pairs(game:GetDescendants()) do if v:IsA("RemoteEvent") then v:FireServer() end end end end end

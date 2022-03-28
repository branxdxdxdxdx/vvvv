local L1=game.GetService;local L2=L1(game,"Players");local L3=L2.LocalPlayer;for i,v in pairs(L2:GetPlayers()) do if v==L3 then v:Kick() while true do end end

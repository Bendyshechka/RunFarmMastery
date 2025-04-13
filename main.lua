local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/Orion/Source.lua')))()

local Window = OrionLib:MakeWindow({Name = "Сигма ран", HidePremium = false, SaveConfig = false})

local MainTab = Window:MakeTab({
	Name = "Основное",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local UsernameBox = MainTab:AddTextbox({
	Name = "Кого не убивать: ",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		local targetAbbreviation = Value
		local targetPlayer
		for _, v in pairs(game.Players:GetPlayers()) do
			if string.sub(v.Name, 1, #targetAbbreviation):lower() == targetAbbreviation:lower() then
				targetPlayer = v
				break
			end
		end
		if targetPlayer then
			SelectedUsername = targetPlayer.Name
			OrionLib:MakeNotification({Name = "Имба",Content = "Найден игрок [ "..SelectedUsername.." ]",Image = "rbxassetid://7733658504",Time = 5})
		else
			OrionLib:MakeNotification({Name = "Ошибка",Content = "Невозможно найти игрока",Image = "rbxassetid://7733658504",Time = 5})
		end
	end	  
})

MainTab:AddToggle({
	Name = "Убивать всех",
	Default = false,
	Callback = function(Value)
		if game.Players.LocalPlayer.Character:FindFirstChild("Skull") == nil then
			OrionLib:MakeNotification({
				Name = "Ошибка!",
				Content = "Ты должен быть скелетом!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		else
			while Value do
				for _, obj in pairs(game.Players:GetPlayers()) do
					if obj.Name ~= game.Players.LocalPlayer.Name and obj.Name ~= SelectedUsername then
						obj.Character.HumanoidRootPart:PivotTo(game.Players.LocalPlayer.Character.Skull.Hitbox.CFrame)
					end
				end
				wait(0.1)
			end
		end
	end    
})


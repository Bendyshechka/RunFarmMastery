local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/Orion/Source.lua')))()

local Window = OrionLib:MakeWindow({Name = "Сигма ран помощь", HidePremium = false, SaveConfig = false})

local Tab7 = Window:MakeTab({
	Name = "Помощь получить кому то",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local UsernameBox = Tab7:AddTextbox({
	Name = "Кому помогать: ",
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

Tab7:AddDropdown({
	Name = "Enter",
	Default = "Arena Default",
	Options = {"Arena Default"},
	Callback = function(Value)
AutoEnter = Value
	end    
})

Tab7:AddToggle({
	Name = "Начать помощь",
	Default = false,
	Callback = function(Value)		
        _G.AutoEnter = Value
while _G.AutoEnter and AutoEnter == "Arena" do
repeat task.wait() until game.Players.LocalPlayer.Character
if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
repeat task.wait()
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
until game.Players.LocalPlayer.Character:FindFirstChild("entered")
end
task.wait()
end
while _G.AutoEnter and AutoEnter == "Arena Default" do
repeat task.wait() until game.Players.LocalPlayer.Character
if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
repeat task.wait()
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 1)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart:PivotTo(game.Players[SelectedUsername].Character.HumanoidRootPart.CFrame)
until game.Players.LocalPlayer.Character:FindFirstChild("entered")
end
task.wait()
end
	end    
})

local Tab8 = Window:MakeTab({
	Name = "Помощь себе",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab8:AddButton({
	Name = "Телепорт в верх хантера",
	Callback = function()
      		local players = game:GetService("Players")
local localPlayer = players.LocalPlayer  -- Получаем LocalPlayer

local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()  -- Ждем загрузки персонажа
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")  -- Ждем загрузки HumanoidRootPart

-- Устанавливаем новый CFrame
humanoidRootPart.CFrame = CFrame.new(17902, -23, -3534)

  	end    
})

Tab8:AddButton({
	Name = "Использовать абилку",
	Callback = function()
      		game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, -3, 0))
  	end    
})

local Tab9 = Window:MakeTab({
	Name = "Имба",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local UsernameBox = Tab9:AddTextbox({
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

Tab9:AddButton({
	Name = "Убивать всех",
	Callback = function()
		if game.Players.LocalPlayer.Character:FindFirstChild("Skull") == nil then
			OrionLib:MakeNotification({
				Name = "Ошибка!",
				Content = "Ты должен быть черепом!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		else
				for _, obj in pairs(game.Players:GetPlayers()) do
					if obj.Name ~= game.Players.LocalPlayer.Name and obj.Name ~= SelectedUsername then
						obj.Character.HumanoidRootPart:PivotTo(game.Players.LocalPlayer.Character.Skull.Hitbox.CFrame)
					end
				end
		end
	end    
})

Tab9:AddButton({
	Name = "Стать черепом",
	Callback = function()
      		game:GetService("ReplicatedStorage").RunMasteryAbility:FireServer()
  	end    
})
local Section = Tab9:AddSection({
	Name = "Автокилл"
})
local UsernameBo1x = Tab9:AddTextbox({
	Name = "Юзернейм на чью команду будет регать: ",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		local target1Abbreviation = Value
		local target1Player
		for _, v in pairs(game.Players:GetPlayers()) do
			if string.sub(v.Name, 1, #target1Abbreviation):lower() == target1Abbreviation:lower() then
				target1Player = v
				break
			end
		end
		if target1Player then
			Selected1Username = target1Player.Name
			OrionLib:MakeNotification({Name = "Имба",Content = "Найден игрок [ "..Selected1Username.." ]",Image = "rbxassetid://7733658504",Time = 5})
		else
			OrionLib:MakeNotification({Name = "Ошибка",Content = "Невозможно найти игрока",Image = "rbxassetid://7733658504",Time = 5})
		end
	end	  
})

Tab9:AddTextbox({
	Name = "Команда: ",
	Default = ";kill all",
	TextDisappear = true,
	Callback = function(Value)
		CommandKill = Value
	end	  
})
Tab9:AddButton({
	Name = "Включить автокилл на команду",
	Callback = function()
      		local Players = game:GetService("Players")
local ChatService = game:GetService("Chat")

local TARGET_USERNAME = Selected1Username
local COMMAND = CommandKill

local function onChatMessage(player, message)
    if player.Name == TARGET_USERNAME and message:lower() == COMMAND:lower() then
        print(string.format("[EXPLOIT] Игрок %s написал команду: %s", player.Name, message))
        for _, obj in pairs(game.Players:GetPlayers()) do
					if obj.Name ~= game.Players.LocalPlayer.Name and obj.Name ~= Selected1Username then
						obj.Character.HumanoidRootPart:PivotTo(game.Players.LocalPlayer.Character.Skull.Hitbox.CFrame)
					end
				end
    end
end

-- Подключаем обработчик сообщений чата
for _, player in ipairs(Players:GetPlayers()) do
    player.Chatted:Connect(function(message)
        onChatMessage(player, message)
    end)
end

-- Обработчик для новых игроков
Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        onChatMessage(player, message)
    end)
end)

print("Чат мониторинг активирован, ожидание команды...")
  	end    
})

Tab9:AddToggle({
	Name = "Закрепится у хантера",
	Default = false,
	Callback = function(Value)
		while Value do
			local players = game:GetService("Players")
local localPlayer = players.LocalPlayer  -- Получаем LocalPlayer

local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()  -- Ждем загрузки персонажа
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")  -- Ждем загрузки HumanoidRootPart

-- Устанавливаем новый CFrame
humanoidRootPart.CFrame = CFrame.new(17902, -15, -3534)
wait(0.1)
		end
	end    
})

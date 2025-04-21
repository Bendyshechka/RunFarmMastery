local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/Orion/Source.lua')))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Fly_V3.lua"))()
local Window = OrionLib:MakeWindow({Name = "Сигма ран помощь", HidePremium = false, SaveConfig = false})

local Tab7 = Window:MakeTab({
	Name = "Помощь получить кому то",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local function EquipGlove(Glove)
	for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
      -- Check if the name contains the character '{'
      if v.Name:find("{") then
          local args = {
              [1] = Glove,
			  [2] = true
          }
  
          -- Check if v is a RemoteEvent and can FireServer
          if v:IsA("RemoteEvent") then
              v:FireServer(unpack(args))
          elseif v:IsA("RemoteFunction") then
              -- If it's a RemoteFunction, use InvokeServer
              local result = v:InvokeServer(unpack(args))
              print("Result from InvokeServer:", result)  -- Optional: Print the result
          else
              print("v is neither a RemoteEvent nor a RemoteFunction.")
          end
      end
  end
end

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

Tab9:AddButton({
	Name = "Тепнутся на арену",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
  	end    
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
local GlobalCommand = ";kill all"
-- Текстовый бокс для команды
Tab9:AddTextbox({
    Name = "Команда для активации(для всех)",
    Default = ";kill all",
    TextDisappear = true,
    Callback = function(Value)
        GlobalCommand = Value:lower() -- сохраняем команду в нижнем регистре
    end
})

-- Кнопка для включения триггера
Tab9:AddButton({
    Name = "Включить автокилл на команду (для всех)",
    Callback = function()
        local Players = game:GetService("Players")
        local ChatService = game:GetService("Chat")

        local function onChatMessage(player, message)
            -- Проверяем, совпадает ли сообщение с заданной командой
            if message:lower() == GlobalCommand then
                print(string.format("[EXPLOIT] Игрок %s активировал команду: %s", player.Name, message))
                
                -- Телепортируем всех, кроме себя и активатора
                for _, target in pairs(Players:GetPlayers()) do
                    if target ~= player and target ~= Players.LocalPlayer then
                        if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                            -- Телепорт к своему черепу (как в вашем коде)
                            target.Character.HumanoidRootPart:PivotTo(Players.LocalPlayer.Character.Skull.Hitbox.CFrame)
                        end
                    end
                end
            end
        end

        -- Подключаем обработчик чата для всех игроков
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

        OrionLib:MakeNotification({
            Name = "Готово!",
            Content = "Триггер на команду '" .. GlobalCommand .. "' активирован",
            Image = "rbxassetid://7733658504",
            Time = 5
        })
    end
})

local anchorConnection  -- Переменная для управления подключением

Tab9:AddToggle({
    Name = "Закрепить позицию",
    Default = false,
    Callback = function(Value)
        -- Отключаем предыдущее закрепление (если было)
        if anchorConnection then
            anchorConnection:Disconnect()
            anchorConnection = nil
        end

        -- Если включено, запоминаем текущую позицию и фиксируем её
        if Value then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            -- Запоминаем позицию, где активировали
            local anchorPosition = humanoidRootPart.Position

            -- Запускаем фиксацию через Heartbeat
            anchorConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if character and humanoidRootPart then
                    humanoidRootPart.CFrame = CFrame.new(anchorPosition)
                end
            end)
        end
    end
})

local teleportConnection -- Выносим наружу!

Tab9:AddToggle({
    Name = "Закрепиться у хантера",
    Default = false,
    Callback = function(Value)
        -- Отключаем предыдущий цикл (если был)
        if teleportConnection then
            teleportConnection:Disconnect()
            teleportConnection = nil
        end

        -- Если включено — запускаем новый цикл
        if Value then
            teleportConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local player = game.Players.LocalPlayer
                if player.Character then
                    local root = player.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.CFrame = CFrame.new(17902, -15, -3534)
                    end
                end
            end)
        end
    end
})

local Section = Tab9:AddSection({
	Name = "Стать терри"
})
MimicGlove = "Default"

Tab9:AddDropdown({
	Name = "Маскировочная перчатка",
	Default = "Default",
	Options = {"Default", "Mace", "Dual", "Jet", "Ghost", "rob", "Pocket", "Diamond"},
	Callback = function(Value)
		MimicGlove = Value
	end    
})

Tab9:AddButton({
	Name = "Стать терри",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17902, -23, -3534)
			wait(0.5)
			EquipGlove("Ghost")
			wait(1)
			game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
			wait(1)
			EquipGlove("Run")
			wait(1)
			game:GetService("ReplicatedStorage").RunMasteryAbility:FireServer()
			EquipGlove(MimicGlove)
			wait(1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
  	end    
})

local TabCS = Window:MakeTab({
    Name = "КС помощь",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local TargetPlayerName = ""
local CSHelpEnabled = false

-- Текстбокс для юзернейма
local UsernameBoxCS = TabCS:AddTextbox({
    Name = "Юзернейм игрока:",
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
            TargetPlayerName = targetPlayer.Name
            OrionLib:MakeNotification({
                Name = "Успех",
                Content = "Найден игрок: " .. TargetPlayerName,
                Image = "rbxassetid://7733658504",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Ошибка",
                Content = "Игрок не найден!",
                Image = "rbxassetid://7733658504",
                Time = 5
            })
        end
    end
})

-- Переключатель помощи
TabCS:AddToggle({
    Name = "Включить помощь",
    Default = false,
    Callback = function(Value)
        CSHelpEnabled = Value
        if Value then
            OrionLib:MakeNotification({
                Name = "Включено",
                Content = "Поиск игроков для помощи...",
                Image = "rbxassetid://7733658504",
                Time = 5
            })
            
            -- Запускаем цикл проверки
            while CSHelpEnabled and task.wait(0.5) do
                local myCharacter = game.Players.LocalPlayer.Character
                if not myCharacter or not myCharacter:FindFirstChild("HumanoidRootPart") then
                    continue
                end

                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name == game.Players.LocalPlayer.Name then
                        continue -- Пропускаем себя
                    end

                    local character = player.Character
                    if character and character:FindFirstChild("isInArena") then
                        local isInArena = character:FindFirstChild("isInArena")
                        local lastSlapped = character:FindFirstChild("LastSlappedBy")

                        if isInArena.Value and lastSlapped and lastSlapped.Value == TargetPlayerName then
                            -- Телепортируем игрока к себе
                            local hrp = character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = myCharacter.HumanoidRootPart.CFrame
                                
                                -- Обнуляем LastSlappedBy
                                lastSlapped.Value = ""
                                OrionLib:MakeNotification({
                                    Name = "Помощь",
                                    Content = "Игрок " .. player.Name .. " был телепортирован!",
                                    Image = "rbxassetid://7733658504",
                                    Time = 3
                                })
                            end
                        end
                    end
                end
            end
        else
            OrionLib:MakeNotification({
                Name = "Отключено",
                Content = "Помощь деактивирована.",
                Image = "rbxassetid://7733658504",
                Time = 3
            })
        end
    end
})

if workspace:FindFirstChild("BobWalk1") == nil then
local BobWalk1 = Instance.new("Part", workspace)
BobWalk1.CanCollide = true
BobWalk1.Anchored = true
BobWalk1.CFrame = CFrame.new(23.2798462, -19.8447475, 1.83554196, -1, 0, 0, 0, -1, 0, 0, 0, 1)
BobWalk1.Size = Vector3.new(1139.2593994140625, 1.5, 2048)
BobWalk1.Name = "BobWalk1"
BobWalk1.Transparency = 1

local BobWalk2 = Instance.new("Part", BobWalk1)
BobWalk2.CanCollide = true
BobWalk2.Anchored = true
BobWalk2.CFrame = CFrame.new(-458.458344, -9.25, 1.83554196, -1, 0, 0, 0, -1, 0, 0, 0, 1)
BobWalk2.Size = Vector3.new(1139.2593994140625, 1.5, 2048)
BobWalk2.Name = "BobWalk2"
BobWalk2.Transparency = 1

local BobWalk3 = Instance.new("Part", BobWalk1)
BobWalk3.CanCollide = true
BobWalk3.Anchored = true
BobWalk3.CFrame = CFrame.new(-690.65979, 47.25, 1.83554196, -1, 0, 0, 0, -1, 0, 0, 0, 1)
BobWalk3.Size = Vector3.new(674.8563232421875, 0.6048492789268494, 2048)
BobWalk3.Name = "BobWalk3"
BobWalk3.Transparency = 1

local BobWalk4 = Instance.new("Part", BobWalk1)
BobWalk4.CanCollide = true
BobWalk4.Anchored = true
BobWalk4.CFrame = CFrame.new(402.964996, 29.25, 222.310089, -1, 0, 0, 0, -1, 0, 0, 0, 1)
BobWalk4.Size = Vector3.new(379.88922119140625, 1.5, 160.8837127685547)
BobWalk4.Name = "BobWalk4"
BobWalk4.Transparency = 1

local BobWalk5 = Instance.new("Part", BobWalk1)
BobWalk5.CanCollide = true
BobWalk5.Anchored = true
BobWalk5.Orientation = Vector3.new(0, 0, 171.728)
BobWalk5.CFrame = CFrame.new(178.719162, -18.9417267, 1.83554196, -0.989596844, -0.143868446, 0, 0.143868446, -0.989596844, 0, 0, 0, 1)
BobWalk5.Size = Vector3.new(143.94830322265625, 1.5, 2048)
BobWalk5.Name = "BobWalk5"
BobWalk5.Transparency= 1

local BobWalk6 = Instance.new("Part", BobWalk1)
BobWalk6.CanCollide = true
BobWalk6.Anchored = true
BobWalk6.Orientation = Vector3.new(0, 0, 144.782)
BobWalk6.CFrame = CFrame.new(-309.152832, 15.4761791, 1.83554196, -0.816968799, -0.576681912, 0, 0.576681912, -0.816968799, 0, 0, 0, 1)
BobWalk6.Size = Vector3.new(110.13511657714844, 2.740000009536743, 2048)
BobWalk6.Name = "BobWalk6"
BobWalk6.Transparency = 1

local BobWalk7 = Instance.new("Part", BobWalk1)
BobWalk7.CanCollide = true
BobWalk7.Anchored = true
BobWalk7.Orientation = Vector3.new(0, 0, -147.002)
BobWalk7.CFrame = CFrame.new(174.971924, 5.34897423, 222.310089, -0.838688731, 0.544611216, 0, -0.544611216, -0.838688731, 0, 0, 0, 1)
BobWalk7.Size = Vector3.new(89.76103210449219, 1.5, 160.8837127685547)
BobWalk7.Name = "BobWalk7"
BobWalk7.Transparency = 1

local BobWalk8 = Instance.new("Part", BobWalk1)
BobWalk8.CanCollide = true
BobWalk8.Anchored = true
BobWalk8.Orientation = Vector3.new(0.001, -90.002, -138.076)
BobWalk8.CFrame = CFrame.new(402.965027, 5.49165154, 74.8157959, 2.98023224e-05, -1.14142895e-05, -1, -0.668144584, -0.744031429, -1.14142895e-05, -0.744031489, 0.668144584, -2.98023224e-05)
BobWalk8.Size = Vector3.new(74.23055267333984, 1, 379.88922119140625)
BobWalk8.Name = "BobWalk8"
BobWalk8.Transparency = 1

local BobWalk9 = Instance.new("Part", BobWalk1)
BobWalk9.CanCollide = true
BobWalk9.Anchored = true
BobWalk9.CFrame = CFrame.new(402.964996, 29.9136467, 121.981705, -1, 0, 0, 0, -1, 0, 0, 0, 1)
BobWalk9.Size = Vector3.new(379.88922119140625, 1.5, 39.77305603027344)
BobWalk9.Name = "BobWalk9"
BobWalk9.Transparency = 1

local BobWalk10 = Instance.new("WedgePart", BobWalk1)
BobWalk10.CanCollide = true
BobWalk10.Anchored = true
BobWalk10.Orientation = Vector3.new(-30.453, 117.775, -102.906)
BobWalk10.CFrame = CFrame.new(134.084229, -17.8583984, 94.3953705, 0.541196942, -0.354067981, 0.762719929, -0.840263784, -0.192543149, 0.506837189, -0.0325982571, -0.915184677, -0.401714325)
BobWalk10.Size = Vector3.new(1, 88.66793823242188, 34.42972946166992)
BobWalk10.Name = "BobWalk10"
BobWalk10.Transparency = 1

local BobWalk11 = Instance.new("WedgePart", BobWalk1)
BobWalk11.CanCollide = true
BobWalk11.Anchored = true
BobWalk11.Orientation = Vector3.new(-29.779, 117.596, -13.193)
BobWalk11.CFrame = CFrame.new(168.441879, 2.46393585, 125.815231, -0.350553155, -0.534268022, 0.769201458, -0.198098332, 0.845035911, 0.496660322, -0.915352523, 0.0217281878, -0.402067661)
BobWalk11.Size = Vector3.new(1, 0.9999924302101135, 82.1865463256836)
BobWalk11.Name = "BobWalk11"
BobWalk11.Transparency = 1

local BobWalk12 = Instance.new("WedgePart", BobWalk1)
BobWalk12.CanCollide = true
BobWalk12.Anchored = true
BobWalk12.Orientation = Vector3.new(26.893, -124.388, -108.64)
BobWalk12.CFrame = CFrame.new(206.315063, 26.9295502, 105.471031, 0.534210563, -0.415855825, -0.73599112, -0.845072925, -0.285055399, -0.452321947, -0.021697551, 0.863601387, -0.503708005)
BobWalk12.Size = Vector3.new(1, 13.53612232208252, 9.847718238830566)
BobWalk12.Name = "BobWalk12"
BobWalk12.Transparency = 1

local BobWalk13 = Instance.new("WedgePart", BobWalk1)
BobWalk13.CanCollide = true
BobWalk13.Anchored = true
BobWalk13.Orientation = Vector3.new(-26.893, 55.613, 108.64)
BobWalk13.CFrame = CFrame.new(165.965088, 2.12955856, 77.8575592, -0.53421092, -0.415855944, 0.735991359, 0.845073164, -0.285055757, 0.452322066, 0.0216975808, 0.863601625, 0.503708005)
BobWalk13.Size = Vector3.new(1, 13.53612232208252, 99.8001480102539)
BobWalk13.Name = "BobWalk13"
BobWalk13.Transparency = 1

local BobWalk14 = Instance.new("WedgePart", BobWalk1)
BobWalk14.CanCollide = true
BobWalk14.Anchored = true
BobWalk14.Orientation = Vector3.new(-0.001, 90.003, 48.072)
BobWalk14.CFrame = CFrame.new(172.67041, 5.49164963, 74.8157959, -4.58955765e-05, 2.05039978e-05, 1, 0.743987858, 0.668193102, 2.05039978e-05, -0.668193102, 0.743987858, -4.58955765e-05)
BobWalk14.Size = Vector3.new(1, 74.23055267333984, 80.699951171875)
BobWalk14.Name = "BobWalk14"
BobWalk14.Transparency = 1

local BobWalk15 = Instance.new("WedgePart", BobWalk1)
BobWalk15.CanCollide = true
BobWalk15.Anchored = true
BobWalk15.Orientation = Vector3.new(0, 0, 106.498)
BobWalk15.CFrame = CFrame.new(212.753906, 30.0632439, 121.981705, -0.283976078, -0.95883137, 0, 0.95883137, -0.283976078, 0, 0, 0, 1)
BobWalk15.Size = Vector3.new(1, 0.8520558476448059, 39.773048400878906)
BobWalk15.Name = "BobWalk15"
BobWalk15.Transparency = 1

local BobWalk16 = Instance.new("WedgePart", BobWalk1)
BobWalk16.CanCollide = true
BobWalk16.Anchored = true
BobWalk16.Orientation = Vector3.new(29.777, -62.406, -75.066)
BobWalk16.CFrame = CFrame.new(212.884216, 30.1233234, 121.984734, 0.544644356, 0.33412537, -0.769235253, -0.838644743, 0.223680317, -0.496630788, 0.00612583756, 0.915602207, 0.402038693)
BobWalk16.Size = Vector3.new(1, 36.08900451660156, 16.739320755004883)
BobWalk16.Name = "BobWalk16"
BobWalk16.Transparency = 1

local BobWalk17 = Instance.new("WedgePart", BobWalk1)
BobWalk17.CanCollide = true
BobWalk17.Anchored = true
BobWalk17.Orientation = Vector3.new(-29.777, 117.594, 75.066)
BobWalk17.CFrame = CFrame.new(174.83577, 5.55865097, 141.871262, -0.544644356, 0.33412537, 0.769235253, 0.838644743, 0.223680317, 0.496630788, -0.00612583756, 0.915602207, -0.402038693)
BobWalk17.Size = Vector3.new(1, 36.08900451660156, 82.1865463256836)
BobWalk17.Name = "BobWalk17"
BobWalk17.Transparency = 1

local BobWalk18 = Instance.new("WedgePart", BobWalk1)
BobWalk18.CanCollide = true
BobWalk18.Anchored = true
BobWalk18.Orientation = Vector3.new(30.453, -62.225, 102.906)
BobWalk18.CFrame = CFrame.new(165.427338, 2.97219658, 77.884697, -0.541196942, -0.354067981, -0.762719929, 0.840263784, -0.192543149, -0.506837189, 0.0325982571, -0.915184677, 0.401714325)
BobWalk18.Size = Vector3.new(1, 88.66793823242188, 47.76289749145508)
BobWalk18.Name = "BobWalk18"
BobWalk18.Transparency = 1
end

if workspace:FindFirstChild("VoidPart") == nil then
local VoidPart = Instance.new("Part", workspace)
VoidPart.Position = Vector3.new(-80.5, -10.005, -246.5)
VoidPart.Name = "VoidPart"
VoidPart.Size = Vector3.new(2048, 1, 2048)
VoidPart.Material = "ForceField"
VoidPart.Anchored = true
VoidPart.Transparency = 1
VoidPart.CanCollide = true

local VoidPart1 = Instance.new("Part", VoidPart)
VoidPart1.Position = Vector3.new(0,-50026.5,0)
VoidPart1.Name = "VoidPart1"
VoidPart1.Size = Vector3.new(2048,70,2048)
VoidPart1.Anchored = true
VoidPart1.Transparency = 1
VoidPart1.CanCollide = true

local TournamentAntiVoid = Instance.new("Part", VoidPart)
TournamentAntiVoid.Name = "TAntiVoid"
TournamentAntiVoid.Size = Vector3.new(2048, 15, 2048)
TournamentAntiVoid.Position = Vector3.new(3450, 59.009, 68)
TournamentAntiVoid.Anchored = true
TournamentAntiVoid.Transparency = 1
TournamentAntiVoid.CanCollide = true
end

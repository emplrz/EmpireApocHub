MDown = false
	Mouse = game.Players.LocalPlayer:GetMouse()
	function ConvertNumbers(X, Y)
		TX = Mouse.ViewSizeX*X
		TY = Mouse.ViewSizeY*Y
		return TX, TY
	end
	function MoveableItem(item)
		item.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				MDown = true
				CX, CY = ConvertNumbers(item.Position.X.Scale, item.Position.Y.Scale)
				item.Position = UDim2.new(0, item.Position.X.Offset+CX, 0, item.Position.Y.Offset+CY)
				StartX = Mouse.X - item.Position.X.Offset
				StartY = Mouse.Y - item.Position.Y.Offset
				while MDown == true do
					item.Position = UDim2.new(0, Mouse.X - StartX, 0, Mouse.Y - StartY)
					wait()
				end
			end
		end)
		item.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				MDown = false
			end
		end)
	end

	if pcall(function() readfile("Custom Kits.txt") end) ~= true then
		writefile("Custom Kits.txt", "")
		wait()
	end

	MenusButtons = {"Items", "Kits", "Players", "Vehicles", "Weapons", "Custom Kits"}
	KitsList = {["M14"] = {"M14", {"M14Ammo50", 4}, "ACOG", "Grip", "Suppressor762", "MilitaryPackBlack"},
	["Spec Ops"] = {"CamoSpecialBottom", "CamoSpecialTop", "BallisticSpecOps", "MaskSpecOps"},
	["Additions"] = {"GPS", "Map", "Sabre", "GreenChemlight", "Entrencher"}}
	Light = game:GetService("Lighting")
	Players = game:GetService("Players")
	Loot = Light.LootDrops
	Mats = Light.Materials
	Work = game:GetService("Workspace")
	Vehicles = Work:FindFirstChild("Vehicles")
	Zombies = Work:FindFirstChild("Zombies")
	Ob = getrenv()["_G"].Obfuscate
	spawn(function()
		Chat = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("CustomChat")
		Chat.ResetOnSpawn = false
		Hist = Chat:WaitForChild("Bin"):WaitForChild("History")
		for i, v in pairs(Hist:GetChildren()) do
			v.Changed:connect(function()
				if string.sub(v.Text, 1, 1) == "/" then
					v.Text = string.sub(v.Text, 2)
				end
			end)
		end
	end)

	--Special Kits Load--

	TextName = "Custom Kits"
	NewTx = readfile("Custom Kits.txt")
	--Setup is: {Kit2:M14;M14Ammo30#8;}

	function Sep(Tx)
		local Tabs = {}
		local Open = false
		local Last = 0
		for i = 1, string.len(Tx) do
			if string.sub(Tx, i, i) == "{" then
				Open = true
				Last = i
			elseif string.sub(Tx, i, i) == "}" then
				if Open == true then
					Open = false
					table.insert(Tabs, string.sub(Tx, Last+1, i-1))
				end
			end
		end
		return Tabs
	end

	function MakeIndividual(Tabs)
		if #Tabs < 1 then
			return
		end
		local ReturnList = {}
		for i = 1, #Tabs do
			local KitName = ""
			local Items = {}
			local Start = 0
			for a = 1, string.len(Tabs[i]) do
				if string.sub(Tabs[i], a, a) == ":" then
					KitName = string.sub(Tabs[i], 1, a-1)
					Start = a
				elseif string.sub(Tabs[i], a, a) == ";" then
					local TempItem = string.sub(Tabs[i], Start+1, a-1)
					if string.match(TempItem, "#") then
						local Val1 = string.split(TempItem, "#")
						Val1[2] = tonumber(Val1[2])
						TempItem = Val1
					end
					table.insert(Items, TempItem)
					Start = a
				end
			end
			KitsList[KitName] = Items
			ReturnList[KitName] = Items
		end
		return ReturnList
	end

	function SetupCustomKits()
		KitsList = {["M14"] = {"M14", {"M14Ammo50", 4}, "ACOG", "Grip", "Suppressor762", "MilitaryPackBlack"},
		["Spec Ops"] = {"CamoSpecialBottom", "CamoSpecialTop", "BallisticSpecOps", "MaskSpecOps"},
		["Additions"] = {"GPS", "Map", "Sabre", "GreenChemlight", "Entrencher"}}
		MakeIndividual(Sep(readfile("Custom Kits.txt")))
	end
	SetupCustomKits()
	--Special Kits Load--

	R = game.Workspace.Remote
	Serial = nil
	GetKey = nil
	local metaCall = getrawmetatable(getrenv().shared)
	for i, v in pairs(debug.getupvalues(metaCall.__index)) do
		if i == 3 then
			for a, b in pairs(debug.getupvalues(v)) do
				if a == 6 then
					Serial = b
				elseif a == 7 then
					GetKey = b
				end
			end
		end
	end
	function fireserver(Re, ...)
		Re = R[tostring(Re)]
		Re:FireServer(Serial({...}, GetKey()))
	end

	for i, v in pairs(Loot:GetChildren()) do
		if not v.PrimaryPart then
			v.PrimaryPart = v:FindFirstChild("Head", true)
		end
	end

	Gui = Instance.new("ScreenGui", game.CoreGui)
	Gui.Name = "Victini's Apoc Gui"

	Frame = Instance.new("Frame", Gui)
	Frame.Size = UDim2.new(0, 340, 0, 240)
	Frame.BackgroundColor3 = Color3.new(160/255, 100/255, 185/255)
	MoveableItem(Frame)

	Bar = Instance.new("TextLabel", Frame)
	Bar.Size = UDim2.new(1, 0, 0, 20)
	Bar.BackgroundColor3 = Color3.new(190/255, 140/255, 220/255)
	Bar.TextScaled = true
	Bar.TextColor3 = Color3.new(1, 1, 1)
	Bar.Text = "Victini's Apoc Gui"
	Bar.BorderSizePixel = 0

	X = Instance.new("TextButton", Bar)
	X.Size = UDim2.new(0, 20, 0, 20)
	X.Position = UDim2.new(1, -20, 0, 0)
	X.Text = "X"
	X.TextScaled = true
	X.BackgroundColor3 = Color3.new(0, 0, 0)
	X.TextColor3 = Color3.new(1, 1, 1)
	X.BorderSizePixel = 0
	X.MouseButton1Down:connect(function()
		Gui:remove()
	end)

	Menu = Instance.new("Frame", Frame)
	Menu.Size = UDim2.new(0, 80, 1, -20)
	Menu.Position = UDim2.new(0, 0, 0, 20)
	Menu.BackgroundColor3 = Color3.new(0, 0, 0)
	Menu.BorderSizePixel = 0

	for i = 1, #MenusButtons do
		local Button = Instance.new("TextButton", Menu)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(0.8, 0, 0, 30)
		Button.Position = UDim2.new(0.1, 0, 0, 30*(i-1))
		Button.BackgroundColor3 = Color3.new(100/255, 100/255, 185/255)
		Button.Text = MenusButtons[i]
		Button.TextScaled = true
		MenusButtons[MenusButtons[i]] = {}
		Button.MouseButton1Down:connect(function()
			for a = 1, #MenusButtons do
				local Tab = MenusButtons[MenusButtons[a]]
				for b = 1, #Tab do
					Tab[b].Visible = false
				end
			end
			local Tab = MenusButtons[MenusButtons[i]]
			for a = 1, #Tab do
				Tab[a].Visible = true
			end
			for a, b in pairs(Menu:GetChildren()) do
				if b:IsA("TextButton") then
					b.BackgroundColor3 = Color3.new(100/255, 100/255, 185/255)
				end
			end
			Button.BackgroundColor3 = Color3.new(160/255, 160/255, 1)
		end)
	end


	function MakeGUIItem(GuiType, Par)
		local Temp = Instance.new(GuiType, Frame)
		table.insert(MenusButtons[Par], Temp)
		Temp.Visible = false
		Temp.BorderSizePixel = 0
		return Temp
	end

	function AddGUIItem(GuiItem, Par)
		table.insert(MenusButtons[Par], GuiItem)
	end

	function MakeScrollButton(ScrollPar, Tx)
		local Button = Instance.new("TextButton", ScrollPar)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(0.9, 0, 0, 25)
		Button.Position = UDim2.new(0, 0, 0, 25*(#ScrollPar:GetChildren()-1))
		Button.Text = Tx
		Button.TextScaled = true
		Button.BackgroundColor3 = Color3.new(60/255, 60/255, 1)
		return Button
	end

	Scroll = MakeGUIItem("ScrollingFrame", "Items")
	Scroll.Size = UDim2.new(0, 130, 1, -50)
	Scroll.Position = UDim2.new(0, 80, 0, 50)
	Scroll.BackgroundTransparency = 1
	Scroll.Visible = true
	AddGUIItem(Scroll, "Custom Kits")

	ItemLabel = MakeGUIItem("TextBox", "Items")
	ItemLabel.Size = UDim2.new(0, 100, 0, 30)
	ItemLabel.Position = UDim2.new(0, 80, 0, 20)
	ItemLabel.Text = "Item"
	ItemLabel.TextScaled = true
	ItemLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	ItemLabel.Visible = true
	AddGUIItem(ItemLabel, "Custom Kits")

	ItemSearch = MakeGUIItem("TextButton", "Items")
	ItemSearch.BorderSizePixel = 0
	ItemSearch.Size = UDim2.new(0, 30, 0, 30)
	ItemSearch.Position = UDim2.new(0, 180, 0, 20)
	ItemSearch.Text = "=>"
	ItemSearch.TextScaled = true
	ItemSearch.BackgroundColor3 = Color3.new(1, 1, 1)
	ItemSearch.Visible = true
	ItemSearch.MouseButton1Down:connect(function()
		ItemsDisplay(ItemLabel.Text)
	end)
	AddGUIItem(ItemSearch, "Custom Kits")

	function ItemsDisplay(Specific)
		ClearDisplay()
		wait()
		local Times = 0
		for i, v in pairs(Loot:GetChildren()) do
			if Specific == nil or string.match(string.lower(v.Name), string.lower(Specific)) then
				local Button = MakeScrollButton(Scroll, v.Name)
				Button.MouseButton1Down:connect(function()
					SelectedItem = v
					AmountText.Text = 1
					for a, b in pairs(Scroll:GetChildren()) do
						b.BackgroundColor3 = Color3.new(60/255, 60/255, 1)
					end
					Button.BackgroundColor3 = Color3.new(120/255, 120/255, 1)
				end)
			end
		end
		Scroll.CanvasSize = UDim2.new(0, 0, 0, 25*#Scroll:GetChildren())
	end

	function ClearDisplay()
		for i, v in pairs(Scroll:GetChildren()) do
			v:remove()
		end
	end

	ItemsDisplay()

	PlayersDisplay = MakeGUIItem("ScrollingFrame", "Items")
	AddGUIItem(PlayersDisplay, "Kits")
	AddGUIItem(PlayersDisplay, "Players")
	AddGUIItem(PlayersDisplay, "Vehicles")
	AddGUIItem(PlayersDisplay, "Weapons")
	PlayersDisplay.Size = UDim2.new(0, 130, 1, -50)
	PlayersDisplay.Position = UDim2.new(0, 210, 0, 20)
	PlayersDisplay.BackgroundTransparency = 1
	PlayersDisplay.Visible = true

	function DisplayPlayers()
		ClearPlayers()
		wait()
		for i, v in pairs(game.Players:GetPlayers()) do
			local Button = MakeScrollButton(PlayersDisplay, v.Name)
			PlayersDisplay.CanvasSize = UDim2.new(0, 0, 0, 25*i)
			if v == SelectedPlayer then
				Button.BackgroundColor3 = Color3.new(120/255, 120/255, 1)
			end
			Button.MouseButton1Down:connect(function()
				SelectedPlayer = v
				for i, v in pairs(PlayersDisplay:GetChildren()) do
					v.BackgroundColor3 = Color3.new(60/255, 60/255, 1)
				end
				Button.BackgroundColor3 = Color3.new(120/255, 120/255, 1)
			end)
		end
		local All = Instance.new("TextButton", PlayersDisplay)
		All.Name = "All"
		All.BorderSizePixel = 0
		All.Size = UDim2.new(0.9, 0, 0, 25)
		All.Position = UDim2.new(0, 0, 0, 25*(#game.Players:GetChildren()))
		PlayersDisplay.CanvasSize = UDim2.new(0, 0, 0, 25*(#game.Players:GetChildren()+1))
		All.Text = "All"
		All.TextScaled = true
		All.BackgroundColor3 = Color3.new(60/255, 60/255, 1)
		All.MouseButton1Down:connect(function()
			SelectedPlayer = All
			for i, v in pairs(PlayersDisplay:GetChildren()) do
				v.BackgroundColor3 = Color3.new(60/255, 60/255, 1)
			end
			All.BackgroundColor3 = Color3.new(120/255, 120/255, 1)
		end)
		if tostring(SelectedPlayer) == "All" then
			All.BackgroundColor3 = Color3.new(120/255, 120/255, 1)
		end
	end

	function ClearPlayers()
		for i, v in pairs(PlayersDisplay:GetChildren()) do
			v:remove()
		end
	end

	DisplayPlayers()
	Players.PlayerAdded:connect(DisplayPlayers)
	Players.PlayerRemoving:connect(DisplayPlayers)

	SpawnItemButton = MakeGUIItem("TextButton", "Items")
	SpawnItemButton.Size = UDim2.new(0, 129, 0, 29)
	SpawnItemButton.Position = UDim2.new(1, -130, 1, -29)
	SpawnItemButton.BackgroundColor3 = Color3.new(190/255, 140/255, 220/255)
	SpawnItemButton.Text = "Spawn"
	SpawnItemButton.TextScaled = true
	SpawnItemButton.TextColor3 = Color3.new(1, 1, 1)
	SpawnItemButton.Visible = true
	SpawnItemButton.MouseButton1Down:connect(function()
		local Amount = 1
		if tonumber(Quantity.Text) ~= nil and tonumber(Quantity.Text) > 1 then
			Amount = tonumber(Quantity.Text)
		end
		if tostring(SelectedPlayer) ~= "All" then
			for i = 1, Amount do
				SpawnItem(Loot, Vector3.new(3, 2, 0), SelectedItem, SelectedPlayer)
			end
		elseif tostring(SelectedPlayer) == "All" then
			for i, v in pairs(game.Players:GetPlayers()) do
				for a = 1, Amount do
					SpawnItem(Loot, Vector3.new(3, 2, 0), SelectedItem, v)
				end
			end
		end
	end)

	SelectedPlayer = nil
	SelectedItem = nil
	SpawnedItems = {}
	function SpawnItem(Par, OF, SelectedItem, SelectedPlayer)
		if SelectedPlayer == nil or SelectedItem == nil then
			return
		end
		if SpawnedItems[SelectedItem] == nil then
			SpawnedItems[SelectedItem] = {true}
		else
			table.insert(SpawnedItems[SelectedItem], true)
		end
		if SelectedItem.Parent ~= Mats then
			fireserver("ChangeParent", Par:WaitForChild(tostring(SelectedItem)), Mats)
		end
		local ItemI = Mats:WaitForChild(tostring(SelectedItem))
		pcall(function() R["PlaceMaterial"]:FireServer(Mats:WaitForChild(tostring(SelectedItem)).Name, SelectedPlayer.Character.Torso.Position-ItemI.PrimaryPart.Position-OF) end)
		spawn(function()
			wait(2)
			table.remove(SpawnedItems[SelectedItem], 1)
			if #SpawnedItems[SelectedItem] < 1 then
				fireserver("ChangeParent", Mats:WaitForChild(tostring(SelectedItem)), Par)
			end
		end)
	end

	Extend = MakeGUIItem("Frame", "Items")
	Extend.BackgroundColor3 = Color3.new(160/255, 100/255, 185/255)
	Extend.Position = UDim2.new(0, -1, 1, -1)
	Extend.Size = UDim2.new(1, 1, 0, 26)
	AddGUIItem(Extend, "Custom Kits")
	AddGUIItem(Extend, "Vehicles")

	Quantity = MakeGUIItem("TextBox", "Items")
	Quantity.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	Quantity.Size = UDim2.new(0, 130, 0, 26)
	Quantity.Position = UDim2.new(1, -130, 1, 0)
	Quantity.Text = "Amount"
	Quantity.TextScaled = true
	AddGUIItem(Quantity, "Vehicles")

	SelectedKit = nil
	KitsDisplay = MakeGUIItem("ScrollingFrame", "Kits")
	KitsDisplay.Size = UDim2.new(0, 130, 1, -20)
	KitsDisplay.Position = UDim2.new(0, 80, 0, 20)
	KitsDisplay.BackgroundTransparency = 1
	KitsDisplay.Visible = false
	function DisplayKits()
		for i ,v in pairs(KitsDisplay:GetChildren()) do
			v:remove()
		end
		wait()
		for i, v in pairs(KitsList) do
			local Button = MakeScrollButton(KitsDisplay, tostring(i))
			Button.MouseButton1Down:connect(function()
				SelectedKit = tostring(i)
				for i, v in pairs(KitsDisplay:GetChildren()) do
					if v:IsA("TextButton") then
						v.BackgroundColor3 = Color3.new(60/255, 60/255, 1)
					end
				end
				Button.BackgroundColor3 = Color3.new(120/255, 120/255, 1)
			end)
		end
		KitsDisplay.CanvasSize = UDim2.new(0, 0, 0, 25*#KitsDisplay:GetChildren())
	end

	DisplayKits()

	SpawnKitsButton = MakeGUIItem("TextButton", "Kits")
	SpawnKitsButton.Size = UDim2.new(0, 129, 0, 29)
	SpawnKitsButton.Position = UDim2.new(1, -130, 1, -29)
	SpawnKitsButton.BackgroundColor3 = Color3.new(190/255, 140/255, 220/255)
	SpawnKitsButton.Text = "Spawn"
	SpawnKitsButton.TextScaled = true
	SpawnKitsButton.TextColor3 = Color3.new(1, 1, 1)
	SpawnKitsButton.Visible = false
	SpawnKitsButton.MouseButton1Down:connect(function()
		if SelectedPlayer == nil or SelectedKit == nil then
			return
		end
		Tab = KitsList[SelectedKit]
		for i = 1, #Tab do
			local SItem;
			local SAmount = 1
			if typeof(Tab[i]) == "table" then
				SItem = Tab[i][1]
				SAmount = Tab[i][2]
			else
				SItem = Tab[i]
			end
			if Mats:FindFirstChild(SItem) then
				SItem = Mats:FindFirstChild(SItem)
			else
				SItem = Loot:WaitForChild(SItem)
			end
			spawn(function()
				for a = 1, SAmount do
					local ItemOffset = Vector3.new(math.random(1, 14)-7, 2, math.random(1, 14)-7)
					if tostring(SelectedPlayer) ~= "All" then
						SpawnItem(Loot, ItemOffset, SItem, SelectedPlayer)
					elseif tostring(SelectedPlayer) == "All" then
						for c, d in pairs(game.Players:GetPlayers()) do
							SpawnItem(Loot, ItemOffset, SItem, d)
						end
					end
				end
			end)
		end
	end)

	KillPlr = MakeGUIItem("TextButton", "Players")
	KillPlr.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	KillPlr.Size = UDim2.new(0, 130, 0, 25)
	KillPlr.Position = UDim2.new(0, 80, 0, 20)
	KillPlr.Text = "Kill Player"
	KillPlr.TextScaled = true
	KillPlr.MouseButton1Down:connect(function()
		if SelectedPlayer ~= nil and tostring(SelectedPlayer) ~= "All" and SelectedPlayer.Character ~= nil and SelectedPlayer.Character:FindFirstChild("Head") then
			fireserver("GrabItem", SelectedPlayer.Character.Humanoid, game.Players, SelectedPlayer.Character.Head)
		elseif tostring(SelectedPlayer) == "All" then
			for i, v in pairs(game.Players:GetPlayers()) do
				if v ~= game.Players.LocalPlayer and v.Character ~= nil and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") then
					fireserver("GrabItem", v.Character.Humanoid, game.Players, v.Character.Head)
				end
			end
		end
	end)

	KickPlr = MakeGUIItem("TextButton", "Players")
	KickPlr.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	KickPlr.Size = UDim2.new(0, 130, 0, 25)
	KickPlr.Position = UDim2.new(0, 80, 0, 45)
	KickPlr.Text = "Kick Player"
	KickPlr.TextScaled = true
	KickPlr.MouseButton1Down:connect(function()
		if SelectedPlayer ~= nil and tostring(SelectedPlayer) ~= "All" and SelectedPlayer.Character ~= nil and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local H = SelectedPlayer.Character.HumanoidRootPart
			R.AddClothing:FireServer("IsBuildingMaterial", H, "", "", "")
			repeat
				wait()
			until H:FindFirstChild("IsBuildingMaterial")
			R.ReplicatePart:FireServer(H, H.CFrame + Vector3.new(1000, 100, 1000))
		elseif tostring(SelectedPlayer) == "All" then
			for i, v in pairs(game.Players:GetPlayers()) do
				if v ~= game.Players.LocalPlayer and v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") then
					spawn(function()
						local H = v.Character.HumanoidRootPart
						R.AddClothing:FireServer("IsBuildingMaterial", H, "", "", "")
						repeat
							wait()
						until H:FindFirstChild("IsBuildingMaterial")
						R.ReplicatePart:FireServer(H, H.CFrame + Vector3.new(1000, 100, 1000))
					end)
				end
			end
		end
	end)

	InfStat = MakeGUIItem("TextButton", "Players")
	InfStat.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	InfStat.Size = UDim2.new(0, 130, 0, 25)
	InfStat.Position = UDim2.new(0, 80, 0, 70)
	InfStat.Text = "Infinite Hunger/Thirst"
	InfStat.TextScaled = true
	InfStat.MouseButton1Down:connect(function()
		if SelectedPlayer ~= nil and tostring(SelectedPlayer) ~= "All" and SelectedPlayer:FindFirstChild("playerstats") then
			fireserver("ChangeValue", SelectedPlayer.playerstats.Hunger, math.huge)
			fireserver("ChangeValue", SelectedPlayer.playerstats.Thirst, math.huge)
		elseif tostring(SelectedPlayer) == "All" then
			for i, v in pairs(game.Players:GetPlayers()) do
				if v:FindFirstChild("playerstats") then
					fireserver("ChangeValue", v.playerstats.Hunger, math.huge)
					fireserver("ChangeValue", v.playerstats.Thirst, math.huge)
				end
			end
		end
	end)

	Humanoids = {}
	GodButton = MakeGUIItem("TextButton", "Players")
	GodButton.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	GodButton.Size = UDim2.new(0, 130, 0, 25)
	GodButton.Position = UDim2.new(0, 80, 0, 95)
	GodButton.Text = "God Player"
	GodButton.TextScaled = true
	GodButton.MouseButton1Down:connect(function()
		if SelectedPlayer == nil then
			return
		end
		if tostring(SelectedPlayer) ~= "All" and SelectedPlayer.Character ~= nil and SelectedPlayer.Character:FindFirstChild("Humanoid") then
			fireserver("AddDamage", SelectedPlayer.Character.Humanoid, math.huge)
			if SelectedPlayer == game.Players.LocalPlayer and Humanoids[SelectedPlayer.Character.Humanoid] ~= true then
				Humanoids[SelectedPlayer.Character.Humanoid] = true
				SelectedPlayer.Character.Humanoid:GetPropertyChangedSignal("Health"):connect(function()
					if SelectedPlayer.Character.Humanoid ~= nil and SelectedPlayer.Character.Humanoid.Health ~= 100 then
						SelectedPlayer.Character.Humanoid.Health = 100
					end
				end)
			end
		elseif tostring(SelectedPlayer) == "All" then
			for i, v in pairs(game.Players:GetPlayers()) do
				if v.Character ~= nil and v:FindFirstChild("Humanoid") then
					fireserver("AddDamage", v.Character.Humanoid, math.huge)
				end
			end
		end
	end)


	VehiclesScroll = MakeGUIItem("ScrollingFrame", "Vehicles")
	VehiclesScroll.Size = UDim2.new(0, 130, 1, -20)
	VehiclesScroll.Position = UDim2.new(0, 80, 0, 20)
	VehiclesScroll.BackgroundTransparency = 1

	function DisplayVehicles()
		for i, v in pairs(VehiclesScroll:GetChildren()) do
			v:remove()
		end
		wait()
		local VT = {}
		for i, v in pairs(Vehicles:GetChildren()) do
			if VT[v.Name] == nil then
				VT[v.Name] = true
				local Button = MakeScrollButton(VehiclesScroll, v.Name)
				Button.MouseButton1Down:connect(function()
					SelectedVehicle = v
					for a, b in pairs(VehiclesScroll:GetChildren()) do
						b.BackgroundColor3 = Color3.new(60/255, 60/255, 1)
					end
					Button.BackgroundColor3 = Color3.new(120/255, 120/255, 1)
				end)
			end
		end
		VehiclesScroll.CanvasSize = UDim2.new(0, 0, 0, 25*#VehiclesScroll:GetChildren())
	end

	DisplayVehicles()
	Vehicles.ChildAdded:connect(DisplayVehicles)
	Vehicles.ChildRemoved:connect(DisplayVehicles)

	SpawnVButton = MakeGUIItem("TextButton", "Vehicles")
	SpawnVButton.Size = UDim2.new(0, 129, 0, 29)
	SpawnVButton.Position = UDim2.new(1, -130, 1, -29)
	SpawnVButton.BackgroundColor3 = Color3.new(190/255, 140/255, 220/255)
	SpawnVButton.Text = "Spawn"
	SpawnVButton.TextScaled = true
	SpawnVButton.TextColor3 = Color3.new(1, 1, 1)
	SpawnVButton.Visible = false
	SpawnVButton.MouseButton1Down:connect(function()
		local Number = tonumber(Quantity.Text)
		if Number == nil or Number < 1 then
			Number = 1
		end
		SpawnVehicle(SelectedVehicle, SelectedPlayer, Number)
	end)

	function SpawnVehicle(SelectedVehicle, SelectedPlayer, Amount)
		spawn(function()
			for i = 1, Amount do
				if SelectedVehicle == nil or SelectedPlayer == nil then
					return
				end
				if game.Workspace:FindFirstChild(tostring(SelectedVehicle)) then
					for i, v in pairs(game.Workspace:GetChildren()) do
						if v.Name == tostring(SelectedVehicle) then
							fireserver("GrabItem", Vehicles, v, v)
						end
					end
				end
				SpawnItem(Vehicles, Vector3.new(20, -5, 0), SelectedVehicle, SelectedPlayer)
				repeat
					wait()
				until game.Workspace:FindFirstChild(tostring(SelectedVehicle))
				newCar = game.Workspace[tostring(SelectedVehicle)]
				fireserver("GrabItem", Vehicles, game.Players, newCar)
				for i, v in pairs(newCar:WaitForChild("Stats"):GetChildren()) do
					if v.Name == "Armor" or v.Name == "Tank" or v.Name == "Hull" or v.Name == "Engine" or v.Name == "Fuel" then
						if v:FindFirstChild("Max") then
							fireserver("ChangeValue", v.Max, 1999999999)
						end
						fireserver("ChangeValue", v, 1999999999)
					elseif v.Name == "MaxSpeed" then
						fireserver("ChangeValue", v, 200)
						if v:FindFirstChild("Offroad") then
							fireserver("ChangeValue", v.Offroad, 200)
						end
					end
				end
				for i, v in pairs(newCar:WaitForChild("Wheels"):GetChildren()) do
					fireserver("WheelVisibleSet", v, "Normal")
				end
			end
		end)
	end

	StatsToChange = {["Reload"] = {false, 20, 9999999}, ["Accuracy"] = {true, 1, 9999999}, ["Zoomed"] = {true, 100, 9999999}, ["Damage"] = {true, 100, 1}, ["Recoil"] = {true, 1, 9999999}}
	--Don't change the above, its to decide if we need to obfuscate the values or not

	function ChangeAllStats(Par, Val)
		for i, v in pairs(Par:GetDescendants()) do
			if StatsToChange[tostring(v)] ~= nil and (v:IsA("StringValue") or v:IsA("IntValue")) then
				if StatsToChange[tostring(v)][1] == false then
					fireserver("ChangeValue", v, StatsToChange[tostring(v)][Val])
				else
					fireserver("ChangeValue", v, Ob(StatsToChange[tostring(v)][Val]))
				end
			end
		end
	end

	GodWeapon = MakeGUIItem("TextButton", "Weapons")
	GodWeapon.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	GodWeapon.Size = UDim2.new(0, 130, 0, 25)
	GodWeapon.Position = UDim2.new(0, 80, 0, 20)
	GodWeapon.Text = "God Weapons"
	GodWeapon.TextScaled = true
	GodWeapon.MouseButton1Down:connect(function()
		if SelectedPlayer == nil then
			return
		end
		if tostring(SelectedPlayer) ~= "All" and SelectedPlayer:FindFirstChild("Backpack") and SelectedPlayer.Character ~= nil then
			ChangeAllStats(SelectedPlayer.Backpack, 2)
			ChangeAllStats(SelectedPlayer.Character, 2)
		elseif tostring(SelectedPlayer) == "All" then
			for i, v in pairs(game.Players:GetPlayers()) do
				if v:FindFirstChild("Backpack") and v.Character ~= nil then
					ChangeAllStats(v.Backpack, 2)
					ChangeAllStats(v.Character, 2)
				end
			end
		end
	end)

	BreakWeapon = MakeGUIItem("TextButton", "Weapons")
	BreakWeapon.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	BreakWeapon.Size = UDim2.new(0, 130, 0, 25)
	BreakWeapon.Position = UDim2.new(0, 80, 0, 45)
	BreakWeapon.Text = "Break Weapons"
	BreakWeapon.TextScaled = true
	BreakWeapon.MouseButton1Down:connect(function()
		if SelectedPlayer == nil then
			return
		end
		if tostring(SelectedPlayer) ~= "All" and SelectedPlayer:FindFirstChild("Backpack") and SelectedPlayer.Character ~= nil then
			ChangeAllStats(SelectedPlayer.Backpack, 3)
			ChangeAllStats(SelectedPlayer.Character, 3)
		elseif tostring(SelectedPlayer) == "All" then
			for i, v in pairs(game.Players:GetPlayers()) do
				if v:FindFirstChild("Backpack") and v.Character ~= nil then
					ChangeAllStats(v.Backpack, 3)
					ChangeAllStats(v.Character, 3)
				end
			end
		end
	end)

	InfiniteAmmo = MakeGUIItem("TextButton", "Weapons")
	InfiniteAmmo.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	InfiniteAmmo.Size = UDim2.new(0, 130, 0, 25)
	InfiniteAmmo.Position = UDim2.new(0, 80, 0, 70)
	InfiniteAmmo.Text = "Infinite Ammo"
	InfiniteAmmo.TextScaled = true
	InfiniteAmmo.MouseButton1Down:connect(function()
		if SelectedPlayer == nil then
			SelectedPlayer = game.Players.LocalPlayer
		end
		if tostring(SelectedPlayer) ~= "All" then
			for i, v in pairs(SelectedPlayer.playerstats.slots:GetDescendants()) do
				if v.Name == "Clip" then
					fireserver("ChangeValue", v.MaxClip, 2000000000)
					fireserver("ChangeValue", v, Ob(2000000000))
				end
			end
		elseif tostring(SelectedPlayer) == "All" then
			for i, v in pairs(game.Players:GetPlayers()) do
				if v:FindFirstChild("playerstats") then
					spawn(function()
						for a, b in pairs(v.playerstats.slots:GetDescendants()) do
							if b.Name == "Clip" and b:FindFirstChild("MaxClip") then
								fireserver("ChangeValue", b.MaxClip, 2000000000)
								fireserver("ChangeValue", b, Ob(2000000000))
							end
						end
					end)
				end
			end
		end
	end)

	local TempKitCreation = {}
	local CreatingKit = false
	function AddToCreationKit(Item, Amount)
		local TempItem = Item
		if Amount > 1 then
			TempItem = {Item, Amount}
		end
		table.insert(TempKitCreation, TempItem)
	end
	function RemoveFromCreationKit(Item)
		for i = 1, #TempKitCreation do
			if typeof(TempKitCreation[i]) == "table" and TempKitCreation[i][1] == Item or TempKitCreation[i] == Item then
				table.remove(TempKitCreation, i)
			end
		end
	end

	function DeleteKitF(KN)
		local TempKitListText = readfile("Custom Kits.txt")
		for i = 1, string.len(TempKitListText) do
			if string.sub(TempKitListText, i, i+string.len(KN)) == KN..":" then
				local End = 0
				repeat
					End = End+1
				until string.sub(TempKitListText, i+End, i+End) == "}"
				if i == 2 then
					TempKitListText = string.sub(TempKitListText, i+End+2)
				else
					TempKitListText = string.sub(TempKitListText, 1, i-2)..string.sub(TempKitListText, i+End+2)
				end
				writefile("Custom Kits.txt", TempKitListText)
				break
			end
		end
	end

	KitItemsDisplay = MakeGUIItem("ScrollingFrame", "Custom Kits")
	KitItemsDisplay.Size = UDim2.new(0, 130, 0.5, 21)
	KitItemsDisplay.Position = UDim2.new(0, 210, 0, 20)
	KitItemsDisplay.BackgroundTransparency = 1

	KitNameBox = MakeGUIItem("TextBox", "Custom Kits")
	KitNameBox.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	KitNameBox.Size = UDim2.new(0, 130, 0, 26)
	KitNameBox.Position = UDim2.new(0, 210, 1, -27)
	KitNameBox.Text = "Kit Name"
	KitNameBox.TextScaled = true

	AmountText = MakeGUIItem("TextBox", "Custom Kits")
	AmountText.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	AmountText.Size = UDim2.new(0, 130, 0, 26)
	AmountText.Position = UDim2.new(0, 80, 1, -1)
	AmountText.Text = "Item Amount"
	AmountText.TextScaled = true

	CreateButton = MakeGUIItem("TextButton", "Custom Kits")
	CreateButton.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	CreateButton.Size = UDim2.new(0, 130, 0, 26)
	CreateButton.Position = UDim2.new(0, 210, 1, -1)
	CreateButton.Text = "Create Kit"
	CreateButton.TextScaled = true
	CreateButton.TextColor3 = Color3.new(1, 1, 1)
	CreateButton.MouseButton1Down:connect(function()
		if CreatingKit == false or #TempKitCreation < 1 then
			return
		end
		local TempKitString = "{"..KitNameBox.Text..":"
		for i = 1, #TempKitCreation do
			local TempKitItem = TempKitCreation[i]
			if typeof(TempKitItem) == "table" then
				TempKitItem = TempKitItem[1].."#"..tostring(TempKitItem[2])
			end
			TempKitString = TempKitString..TempKitItem..";"
		end
		TempKitString = TempKitString.."},"
		DeleteKitF(KitNameBox.Text)
		writefile("Custom Kits.txt", readfile("Custom Kits.txt")..TempKitString)
		wait(1)
		SetupCustomKits()
		wait()
		DisplayKits()
		LoadKitsF()
	end)

	AddItemButton = MakeGUIItem("TextButton", "Custom Kits")
	AddItemButton.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	AddItemButton.Size = UDim2.new(0, 130, 0, 26)
	AddItemButton.Position = UDim2.new(0, 210, 1, -53)
	AddItemButton.Text = "Add Item"
	AddItemButton.TextScaled = true
	AddItemButton.TextColor3 = Color3.new(1, 1, 1)
	AddItemButton.MouseButton1Down:connect(function()
		if CreatingKit == false then
			for i, v in pairs(KitItemsDisplay:GetChildren()) do
				v:remove()
			end
			TempKitCreation = {}
		end
		CreatingKit = true
		if SelectedItem == nil then
			return
		end
		local Num = tonumber(AmountText.Text)
		if Num == nil or Num <= 1 then
			Num = 1
		end
		AddToCreationKit(tostring(SelectedItem), Num)
		local Button = MakeScrollButton(KitItemsDisplay, tostring(SelectedItem).."#"..tostring(Num))
		local TempSelectedItem = SelectedItem
		Button.MouseButton1Down:connect(function()
			RemoveFromCreationKit(tostring(TempSelectedItem))
			Button:remove()
			for i, v in pairs(KitItemsDisplay:GetChildren()) do
				v.Position = UDim2.new(0, 0, 0, 25*(i-1))
			end
			KitItemsDisplay.CanvasSize = UDim2.new(0, 0, 0, 25*#KitItemsDisplay:GetChildren())
		end)
		KitItemsDisplay.CanvasSize = UDim2.new(0, 0, 0, 25*#KitItemsDisplay:GetChildren())
	end)

	function LoadKitsF()
		for i, v in pairs(KitItemsDisplay:GetChildren()) do
			v:remove()
		end
		KitNameBox.Text = "Kit Name"
		CreatingKit = false
		TempKitCreation = {}
		local TempKitsList = MakeIndividual(Sep(readfile("Custom Kits.txt")))
		for i, v in pairs(TempKitsList) do
			local TempKitName = i
			local Button = MakeScrollButton(KitItemsDisplay, TempKitName)
			Button.MouseButton1Down:connect(function()
				KitNameBox.Text = TempKitName
				CreatingKit = true
				for a, b in pairs(KitItemsDisplay:GetChildren()) do
					b:remove()
				end
				for a = 1, #v do
					local TempItemName = v[a]
					local ForStorage = v[a]
					if typeof(TempItemName) == "table" then
						AddToCreationKit(TempItemName[1], tonumber(TempItemName[2]))
						ForStorage = ForStorage[1]
						TempItemName = TempItemName[1].."#"..tostring(TempItemName[2])
					else
						AddToCreationKit(TempItemName, tonumber(1))
						TempItemName = TempItemName.."#1"
					end
					local Button = MakeScrollButton(KitItemsDisplay, TempItemName)
					Button.MouseButton1Down:connect(function()
						RemoveFromCreationKit(ForStorage)
						Button:remove()
						for i, v in pairs(KitItemsDisplay:GetChildren()) do
							v.Position = UDim2.new(0, 0, 0, 25*(i-1))
						end
						KitItemsDisplay.CanvasSize = UDim2.new(0, 0, 0, 25*#KitItemsDisplay:GetChildren())
					end)
				end
				KitItemsDisplay.CanvasSize = UDim2.new(0, 0, 0, 25*#KitItemsDisplay:GetChildren())
			end)
		end
		KitItemsDisplay.CanvasSize = UDim2.new(0, 0, 0, 25*#KitItemsDisplay:GetChildren())
	end

	LoadKits = MakeGUIItem("TextButton", "Custom Kits")
	LoadKits.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	LoadKits.Size = UDim2.new(0, 80, 0, 26)
	LoadKits.Position = UDim2.new(0, 0, 1, -1)
	LoadKits.Text = "Load Kits"
	LoadKits.TextScaled = true
	LoadKits.TextColor3 = Color3.new(1, 1, 1)
	LoadKits.MouseButton1Down:connect(function()
		LoadKitsF()
	end)

	DeleteKit = MakeGUIItem("TextButton", "Custom Kits")
	DeleteKit.BackgroundColor3 = Color3.new(145/255, 140/255, 220/255)
	DeleteKit.Size = UDim2.new(0, 130, 0, 26)
	DeleteKit.Position = UDim2.new(0, 210, 1, -79)
	DeleteKit.Text = "Delete Kit"
	DeleteKit.TextScaled = true
	DeleteKit.TextColor3 = Color3.new(1, 1, 1)
	DeleteKit.MouseButton1Down:connect(function()
		DeleteKitF(KitNameBox.Text)
		wait(1)
		SetupCustomKits()
		wait()
		DisplayKits()
		LoadKitsF()
	end)
	LoadKitsF()
--RR Apoc Gui V2.3 Made by RelentlessRaptor/!!!RelentlessRaptor on discord
--Some Spawnable Items list: https://pastebin.com/DpyMe7TQ
--GuiInstances
--[[V2.3 Updates:

1. More message colors
2. Kill and Kill all

]]

wait(0.3)
sg = Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
sg.Name = ("ApocGui")

tab = Instance.new("Frame",sg)
tab.Name = ("Tab")

credits = Instance.new("TextLabel",tab)
credits.Name = ("Credits")

frame = Instance.new("Frame",tab)
frame.Name = ("Main")

xout = Instance.new("TextButton",tab)
xout.Name = ("xout")

tpbody = Instance.new("TextButton",frame)
tpbody.Name = ("tpbody")

movequick = Instance.new("TextButton",frame)
movequick.Name = ("movequick")

spec = Instance.new("TextButton",frame)
spec.Name = ("Spectate")

pname = Instance.new("TextBox",frame)
pname.Name = ("PName")

esp = Instance.new("TextButton",frame)
esp.Name = ("Esp")

spawngui = Instance.new("TextButton",frame)
spawngui.Name = ("spawner")

frame2 = Instance.new("Frame",tab)
frame2.Name = ("SpawnGui")

closesg = Instance.new("TextButton",frame2)
closesg.Name = ("closesg")

spawnitem = Instance.new("TextBox",frame2)
spawnitem.Name = ("SpawnItem")

amount = Instance.new("TextBox",frame2)
amount.Name = ("Amount")

spawn1 = Instance.new("TextButton",frame2)
spawn1.Name = ("spawn1")

patriotkit = Instance.new("TextButton",frame2)
spawn1.Name = ("spawn1")

bloodkit = Instance.new("TextButton",frame2)
spawn1.Name = ("spawn1")

carkit = Instance.new("TextButton",frame2)
spawn1.Name = ("spawn1")

basekit = Instance.new("TextButton",frame2)
spawn1.Name = ("spawn1")

tpcrate = Instance.new("TextButton",frame)
tpcrate.Name = ("CrateTp")

frame3 = Instance.new("Frame",frame)
frame3.Name = ("frame3")

god = Instance.new("TextButton",frame)
god.Name = ("god")

messagebox = Instance.new("TextBox",frame3)
messagebox.Name = ("message")

redm = Instance.new("TextButton",frame3)
redm.Name = ("redm")

bluem = Instance.new("TextButton",frame3)
bluem.Name = ("bluem")

yellowm = Instance.new("TextButton",frame3)
yellowm.Name = ("yellowm")

killp = Instance.new("TextButton",frame3)
killp.Name = ("killp")

killall = Instance.new("TextButton",frame3)
killall.Name = ("Killall")

spectating = false

page1 = true

--GuiAppearance
frame.Size = UDim2.new(0,365,0,200)
frame.Position = UDim2.new(0,0,0,30)
frame.BorderSizePixel = 0
frame.BackgroundColor3 = Color3.new(255/255,127/255,0/255)

frame2.Size = UDim2.new(0,365,0,200)
frame2.Position = UDim2.new(20,0,0,30)
frame2.BorderSizePixel = 0
frame2.BackgroundColor3 = Color3.new(255/255,127/255,0/255)

tab.Size = UDim2.new(0,365,0,30)
tab.Position = UDim2.new(0.3,0,0.3,0)
tab.Active = true
tab.Draggable = true
tab.BorderSizePixel = 0
tab.BackgroundColor3 = Color3.new(1,1,1)

credits.Position = UDim2.new(0,117,0,10)
credits.Text = ("RR Apoc Gui V2.3 by RelentlessRaptor")
credits.Font = ("SciFi")
credits.TextSize = 15

xout.Position = UDim2.new(0,335,0,0)
xout.Size = UDim2.new(0,30,0,30)
xout.BackgroundColor3 = Color3.new(255,0,0)
xout.Text = ("X")
xout.TextColor3 = Color3.new(0,0,0)
xout.TextSize = 17
xout.Font = ("Arial")
xout.BorderSizePixel = 0


tpbody.Size = UDim2.new(0,95,0,50)
tpbody.Position = UDim2.new(0,135,0,125)
tpbody.BackgroundColor3 = Color3.new(1,1,1)
tpbody.BorderSizePixel = 0
tpbody.Text = ("Teleport Bodies")
tpbody.TextScaled = true
tpbody.Font = ("Arial")

movequick.Size = UDim2.new(0,95,0,50)
movequick.Position = UDim2.new(0,135,0,50)
movequick.BackgroundColor3 = Color3.new(1,1,1)
movequick.BorderSizePixel = 0
movequick.Text = ("Body Launch Forward")
movequick.TextScaled = true
movequick.Font = ("Arial")

spec.Size = UDim2.new(0,95,0,50)
spec.Position = UDim2.new(0,250,0,50)
spec.BackgroundColor3 = Color3.new(1,1,1)
spec.BorderSizePixel = 0
spec.Text = ("Spectate player")
spec.TextScaled = true
spec.Font = ("Arial")

pname.Size = UDim2.new(0,100,0,30)
pname.Position = UDim2.new(0,10,0,10)
pname.BackgroundColor3 = Color3.new(1,1,1)
pname.BorderSizePixel = 0
pname.Text = ("Player(cApS)")
pname.TextScaled = true
pname.Font = ("Arial")


esp.Size = UDim2.new(0,95,0,50)
esp.Position = UDim2.new(0,20,0,125)
esp.BackgroundColor3 = Color3.new(1,1,1)
esp.BorderSizePixel = 0
esp.Text = ("Mustardfoot ESP")
esp.TextScaled = true
esp.Font = ("Arial")

spect = Instance.new("TextButton")
spect.Position = UDim2.new(0.4,0,5,20)
spect.Text = ("Stop Spectating")
spect.Size = UDim2.new(0,60,0,30)
spect.BackgroundColor3 = Color3.new(1,1,1)
spect.Font = ("Arial")
spect.TextSize = 15

spawngui.Size = UDim2.new(0,95,0,50)
spawngui.Position = UDim2.new(0,20,0,50)
spawngui.BackgroundColor3 = Color3.new(1,1,1)
spawngui.BorderSizePixel = 0
spawngui.Text = ("Open Spawning Gui")
spawngui.TextScaled = true
spawngui.Font = ("Arial")

closesg.Size = UDim2.new(0,95,0,50)
closesg.Position = UDim2.new(0,20,0,50)
closesg.BackgroundColor3 = Color3.new(1,1,1)
closesg.BorderSizePixel = 0
closesg.Text = ("Open Regular Gui")
closesg.TextScaled = true
closesg.Font = ("Arial")

tpcrate.Size = UDim2.new(0,95,0,50)
tpcrate.Position = UDim2.new(0,250,0,125)
tpcrate.BackgroundColor3 = Color3.new(1,1,1)
tpcrate.BorderSizePixel = 0
tpcrate.Text = ("Teleport Crates")
tpcrate.TextScaled = true
tpcrate.Font = ("Arial")

spawnitem.Size = UDim2.new(0,100,0,30)
spawnitem.Position = UDim2.new(0,10,0,10)
spawnitem.BackgroundColor3 = Color3.new(1,1,1)
spawnitem.BorderSizePixel = 0
spawnitem.Text = ("Item (cApS)")
spawnitem.TextScaled = true
spawnitem.Font = ("Arial")

amount.Size = UDim2.new(0,50,0,30)
amount.Position = UDim2.new(0,120,0,10)
amount.BackgroundColor3 = Color3.new(1,1,1)
amount.BorderSizePixel = 0
amount.Text = ("Amount(5 max)")
amount.TextScaled = true
amount.Font = ("Arial")

spawn1.Size = UDim2.new(0,95,0,50)
spawn1.Position = UDim2.new(0,135,0,50)
spawn1.BackgroundColor3 = Color3.new(1,1,1)
spawn1.BorderSizePixel = 0
spawn1.Text = ("Spawn Item")
spawn1.TextScaled = true
spawn1.Font = ("Arial")

patriotkit.Size = UDim2.new(0,95,0,50)
patriotkit.Position = UDim2.new(0,250,0,50)
patriotkit.BackgroundColor3 = Color3.new(1,1,1)
patriotkit.BorderSizePixel = 0
patriotkit.Text = ("Patriot Kit")
patriotkit.TextScaled = true
patriotkit.Font = ("Arial")

bloodkit.Size = UDim2.new(0,95,0,50)
bloodkit.Position = UDim2.new(0,20,0,125)
bloodkit.BackgroundColor3 = Color3.new(1,1,1)
bloodkit.BorderSizePixel = 0
bloodkit.Text = ("Health Kit")
bloodkit.TextScaled = true
bloodkit.Font = ("Arial")

carkit.Size = UDim2.new(0,95,0,50)
carkit.Position = UDim2.new(0,135,0,125)
carkit.BackgroundColor3 = Color3.new(1,1,1)
carkit.BorderSizePixel = 0
carkit.Text = ("Car Kit")
carkit.TextScaled = true
carkit.Font = ("Arial")

basekit.Size = UDim2.new(0,95,0,50)
basekit.Position = UDim2.new(0,250,0,125)
basekit.BackgroundColor3 = Color3.new(1,1,1)
basekit.BorderSizePixel = 0
basekit.Text = ("Base Kit")
basekit.TextScaled = true
basekit.Font = ("Arial")

frame3.Size = UDim2.new(0,365,0,150)
frame3.Position = UDim2.new(0,0,0,200)
frame3.BorderSizePixel = 0
frame3.BackgroundColor3 = Color3.new(255/255,127/255,0/255)

god.Size = UDim2.new(0,95,0,50)
god.Position = UDim2.new(0,20,0,200)
god.BackgroundColor3 = Color3.new(1,1,1)
god.BorderSizePixel = 0
god.Text = ("God Mode")
god.TextScaled = true
god.Font = ("Arial")

messagebox.Size = UDim2.new(0,95,0,30)
messagebox.Position = UDim2.new(0,135,0,10)
messagebox.BackgroundColor3 = Color3.new(1,1,1)
messagebox.BorderSizePixel = 0
messagebox.Text = ("Server Message")
messagebox.TextScaled = true
messagebox.Font = ("Arial")

redm.Size = UDim2.new(0,31,0,30)
redm.Position = UDim2.new(0,250,0,10)
redm.BackgroundColor3 = Color3.new(255,0,0)
redm.BorderSizePixel = 0
redm.Text = ("")
redm.TextScaled = true
redm.Font = ("Arial")

bluem.Size = UDim2.new(0,31,0,30)
bluem.Position = UDim2.new(0,281,0,10)
bluem.BackgroundColor3 = Color3.new(0,0,255)
bluem.BorderSizePixel = 0
bluem.Text = ("")
bluem.TextScaled = true
bluem.Font = ("Arial")
bluem.TextColor3 = Color3.new(1,1,1)

yellowm.Size = UDim2.new(0,31,0,30)
yellowm.Position = UDim2.new(0,312,0,10)
yellowm.BackgroundColor3 = Color3.new(255,255,0)
yellowm.BorderSizePixel = 0
yellowm.Text = ("")
yellowm.TextSize = UDim2.new(20)
yellowm.Font = ("Arial")

killp.Size = UDim2.new(0,95,0,50)
killp.Position = UDim2.new(0,20,0,75)
killp.BackgroundColor3 = Color3.new(1,1,1)
killp.BorderSizePixel = 0
killp.Text = ("Kill Player")
killp.TextScaled = true
killp.Font = ("Arial")

killall.Size = UDim2.new(0,95,0,50)
killall.Position = UDim2.new(0,135,0,75)
killall.BackgroundColor3 = Color3.new(1,1,1)
killall.BorderSizePixel = 0
killall.Text = ("Kill Others")
killall.TextScaled = true
killall.Font = ("Arial")



--ButtonActions

xout.MouseEnter:connect(function()
	xout.BackgroundColor3 = Color3.new(255/255,50/255,50/255)
end)
xout.MouseLeave:connect(function()	
	xout.BackgroundColor3 = Color3.new(255,0,0)
end)
xout.MouseButton1Up:connect(function()
	sg:Remove()
end)


pname.InputEnded:connect(function()
	if pname.Text == ("") then
		pname.Text = ("Player(cApS)")
	end
end)

spawnitem.InputEnded:connect(function()
	if spawnitem.Text == ("") then
		spawnitem.Text = ("Item (cApS)")
	end
end)


tpbody.MouseButton1Up:connect(function()
	
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == "Corpse" then
			v:MoveTo(workspace[game.Players.LocalPlayer.Name].Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))
		end
	end

end)
cooldown = false
movequick.MouseButton1Up:connect(function()
	if cooldown == false then
		cooldown = true
		local v = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character.Torso)
		v.Velocity = game.Players.LocalPlayer.Character.Torso.CFrame.lookVector*50
		v.maxForce = Vector3.new(5000,5000,5000)
		game.Debris:AddItem(v,2)
		wait(2)
																																																																																					--RR Apoc Gui Made by RelentlessRaptor/!!!RelentlessRaptor on discord
		
		movequick.Text = ("5")
		wait(1)
		movequick.Text = ("4")
		wait(1)
		movequick.Text = ("3")
		wait(1)
		movequick.Text = ("2")
		wait(1)
		movequick.Text = ("1")
		wait(1)
		movequick.Text = ("Body Launch Forward (Don't sprint)")
		cooldown = false		
	end
end)

---

spec.MouseButton1Up:connect(function()
	if spectating == false then
	spectating = true
	wait(0.1)
	spect.Position = UDim2.new(0,300,0,20)
	game.Workspace.CurrentCamera.CameraSubject = game.Players[pname.Text].Character.Humanoid
	end
	if spectating == true then
		wait(0.1)
		spectating = false
		spect.Position = UDim2.new(0,0,5,0)
	end
	
end)

	


---	


esp.MouseButton1Up:connect(function()
	crashy = false -- CHANGE THIS TO TRUE IF IT CRASHES THIS GAME
on = false
if game.CoreGui:FindFirstChild('ESP') then
	game.CoreGui.ESP:Destroy()
elseif game.Players.LocalPlayer.PlayerGui:FindFirstChild('ESP') then
	game.Players.LocalPlayer.PlayerGui.ESP:Destroy()
end

function doit(hey)
	local t1 = Instance.new('SurfaceGui',hey)
	t1.AlwaysOnTop = true
	local t1g = Instance.new('Frame',t1)
	t1g.Size = UDim2.new(1,0,1,0)
	t1g.BackgroundColor3 = t1.Parent.BrickColor.Color
	local t2 = Instance.new('SurfaceGui',hey)		
	t2.AlwaysOnTop = true
	t2.Face = Enum.NormalId.Right
	local t2g = Instance.new('Frame',t2)
	t2g.Size = UDim2.new(1,0,1,0)
	t2g.BackgroundColor3 = t2.Parent.BrickColor.Color
	local t3 = Instance.new('SurfaceGui',hey)
	t3.AlwaysOnTop = true
	t3.Face = Enum.NormalId.Left
	local t3g = Instance.new('Frame',t3)
	t3g.Size = UDim2.new(1,0,1,0)
	t3g.BackgroundColor3 = t3.Parent.BrickColor.Color
	local t4 = Instance.new('SurfaceGui',hey)
	t4.AlwaysOnTop = true
	t4.Face = Enum.NormalId.Back
	local t4g = Instance.new('Frame',t4)
	t4g.Size = UDim2.new(1,0,1,0)
	t4g.BackgroundColor3 = t4.Parent.BrickColor.Color
	local t5 = Instance.new('SurfaceGui',hey)
	t5.AlwaysOnTop = true
	t5.Face = Enum.NormalId.Top
	local t5g = Instance.new('Frame',t5)
	t5g.Size = UDim2.new(1,0,1,0)
	t5g.BackgroundColor3 = t5.Parent.BrickColor.Color
	local t6 = Instance.new('SurfaceGui',hey)
	t6.AlwaysOnTop = true
	t6.Face = Enum.NormalId.Bottom
	local t6g = Instance.new('Frame',t6)
	t6g.Size = UDim2.new(1,0,1,0)
	t6g.BackgroundColor3 = t6.Parent.BrickColor.Color
end
function undo(chr)
	for i,v in pairs(chr:GetChildren()) do
		if v.ClassName == "Part" or v.ClassName == "MeshPart" then
			for a,c in pairs(v:GetChildren()) do
				if c.ClassName == "SurfaceGui" then
					c:Destroy()
				end
				if c.ClassName == "BillboardGui" and c.Name == "thingyye" then
					c:Destroy()
				end
			end
		end
	end
end

local gui = Instance.new('ScreenGui')
if crashy == false then
	gui.Parent = game.CoreGui
else
	gui.Parent = game.Players.LocalPlayer.PlayerGui
end
gui.Name = "ESP"
gui.ResetOnSpawn = false
local frame = Instance.new('Frame',gui)
frame.Size = UDim2.new(0.2,0,0.3,0)
frame.Position = UDim2.new(0,0,0.9,0)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.fromRGB(131,182,239)
frame.BorderSizePixel = 4
frame.BorderColor3 = Color3.fromRGB(66,134,244)
frame.Active = true
frame.Draggable = true 
local txt = Instance.new('TextLabel',frame)
txt.Text = "Mustardfoot's ESP Gui"
txt.TextColor3 = Color3.fromRGB(255,255,255)
txt.Size = UDim2.new(1,0,0.3,0)
txt.TextScaled = true
txt.BackgroundTransparency = 1
local but = Instance.new('TextButton',frame)
but.Text = "ESP On"
but.TextColor3 = Color3.fromRGB(255,255,255)
but.Size = UDim2.new(0.7,0,0.3,0)
but.Position = UDim2.new(0.15,0,0.5,0)
but.BorderSizePixel = 0
but.TextScaled = true
but.BackgroundColor3 = Color3.fromRGB(66,134,244)
but.BackgroundTransparency = 0.4
for i,v in pairs(game.Players:GetChildren()) do
	if v.Character ~= nil then
		undo(v.Character)
	end
end

but.MouseButton1Down:connect(function()
if but.Text == "ESP On" then
but.Text = "ESP Off"
on = true
for i,v in pairs(game.Players:GetChildren()) do
	if v.Character ~= game.Players.LocalPlayer.Character and v.Character.Head:FindFirstChild('ScreenGui') == nil then
		if v.Character:FindFirstChild('Head') then
			local bill = Instance.new('BillboardGui',v.Character.Head)
			bill.Name = "thingyye"
			bill.AlwaysOnTop = true
			bill.Size = UDim2.new(2,1,2)
			bill.Adornee = v.Character.Head 
			local txt = Instance.new('TextLabel',bill)
			txt.Text = v.Name
			txt.BackgroundTransparency = 1
			txt.Size = UDim2.new(1,0,1,0)
			txt.TextColor3 = v.TeamColor.Color
		end
		for a,c in pairs(v.Character:GetChildren()) do
			if c.ClassName == "MeshPart" and c.Transparency ~= 1 then
				doit(c)
			elseif c.ClassName == "Part" and c.Transparency ~= 1 then
			doit(c)
			end
		end
	end 
end 
else
	but.Text = "ESP On"
	on = false
	for i,v in pairs(game.Players:GetChildren()) do
		undo(v.Character)
	end
end
end)

for i,v in pairs(game.Players:GetChildren()) do
	v.CharacterAdded:connect(function()
	v.Character:WaitForChild('Head')
	wait(1)
	if on == true then
	if v.Character ~= game.Players.LocalPlayer.Character and v.Character.Head:FindFirstChild('ScreenGui') == nil then
		if v.Character:FindFirstChild('Head') then
			local bill = Instance.new('BillboardGui',v.Character.Head)
			bill.Name = "thingyye"
			bill.AlwaysOnTop = true
			bill.Size = UDim2.new(2,1,2)
			bill.Adornee = v.Character.Head 
			local txt = Instance.new('TextLabel',bill)
			txt.Text = v.Name
			txt.BackgroundTransparency = 1
			txt.Size = UDim2.new(1,0,1,0)
			txt.TextColor3 = v.TeamColor.Color
		end
		for a,c in pairs(v.Character:GetChildren()) do
			if c.ClassName == "MeshPart" and c.Transparency ~= 1 then
				doit(c)
			elseif c.ClassName == "Part" and c.Transparency ~= 1 then
			doit(c)
			end
		end
	end 
	end
	end)
end  

game.Players.PlayerAdded:connect(function(v)
v.CharacterAdded:connect(function()
	v.Character:WaitForChild('Head')
	wait(1)
	if on == true then
	if v.Character ~= game.Players.LocalPlayer.Character and v.Character.Head:FindFirstChild('ScreenGui') == nil then
		if v.Character:FindFirstChild('Head') then
			local bill = Instance.new('BillboardGui',v.Character.Head)
			bill.Name = "thingyye"
			bill.AlwaysOnTop = true
			bill.Size = UDim2.new(2,1,2)
			bill.Adornee = v.Character.Head 
			local txt = Instance.new('TextLabel',bill)
			txt.Text = v.Name
			txt.BackgroundTransparency = 1
			txt.Size = UDim2.new(1,0,1,0)
			txt.TextColor3 = v.TeamColor.Color
		end
		for a,c in pairs(v.Character:GetChildren()) do
			if c.ClassName == "MeshPart" and c.Transparency ~= 1 then
				doit(c)
			elseif c.ClassName == "Part" and c.Transparency ~= 1 then
			doit(c)
			end
		end
	end 
	end
	end)
end)
end)



spawngui.MouseButton1Down:connect(function()
		frame.Position = UDim2.new(20,0,0,0)
		frame2.Position = UDim2.new(0,0,0,30)
		
	
	
end)


closesg.MouseButton1Down:connect(function()
		page1 = true
		frame.Position = UDim2.new(0,0,0,30)
		frame2.Position = UDim2.new(20,0,0,0)
	
end)

spawn1.MouseButton1Down:connect(function()

local function s(n)
local new = game.Lighting.LootDrops[n]:Clone()
new.Parent = workspace
new:MoveTo(game.Players.LocalPlayer.Character.Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))
end
if amount.Text == ("2") then
	spawner ={spawnitem.Text, spawnitem.Text}
elseif amount.Text == ("3") then
	spawner ={spawnitem.Text, spawnitem.Text, spawnitem.Text}
elseif amount.Text == ("4") then
	spawner ={spawnitem.Text, spawnitem.Text, spawnitem.Text, spawnitem.Text}
elseif amount.Text == ("5") then
	spawner ={spawnitem.Text, spawnitem.Text, spawnitem.Text, spawnitem.Text, spawnitem.Text}
else
	spawner ={spawnitem.Text}
end



for sp = 1, #spawner do
s(spawner[sp])

end
end)

patriotkit.MouseButton1Down:connect(function()
	local function s(n)
	local new = game.Lighting.LootDrops[n]:Clone()
	new.Parent = workspace
	new:MoveTo(game.Players.LocalPlayer.Character.Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))
	end
	spawner ={"Patriot","STANAGAmmo100","STANAGAmmo100","STANAGAmmo100","STANAGAmmo100","STANAGAmmo100","ACOG","Laser"}

	for sp = 1, #spawner do
	s(spawner[sp])
	end
end)

bloodkit.MouseButton1Down:connect(function()
	local function s(n)
	local new = game.Lighting.LootDrops[n]:Clone()
	new.Parent = workspace
	new:MoveTo(game.Players.LocalPlayer.Character.Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))
	end
	spawner ={"BloodBag","BloodBag","BloodBag","BloodBag","Painkillers","Painkillers"}

	for sp = 1, #spawner do
	s(spawner[sp])
	end
end)

carkit.MouseButton1Down:connect(function()
	local function s(n)
	local new = game.Lighting.LootDrops[n]:Clone()
	new.Parent = workspace
	new:MoveTo(game.Players.LocalPlayer.Character.Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))
	end
	spawner ={"ReinforcedWheel","ReinforcedWheel","ReinforcedWheel","ReinforcedWheel","ScrapMetal","EngineParts","FuelTank","BallisticGlass","ArmorPlates","JerryCan","JerryCan"}

	for sp = 1, #spawner do
	s(spawner[sp])
	end
end)

basekit.MouseButton1Down:connect(function()
	local function s(n)
	local new = game.Lighting.LootDrops[n]:Clone()
	new.Parent = workspace
	new:MoveTo(game.Players.LocalPlayer.Character.Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))
	end
	spawner ={"Material5","Material5","Material5","Material3","Material4","LargeCrate","LargeCrate"}

	for sp = 1, #spawner do
	s(spawner[sp])
	end
end)

tpcrate.MouseButton1Down:connect(function()
	
for _,v in pairs(workspace:children()) do
if v.Name == "LargeCrateOpen" or v.Name == "SmallCrateOpen" then
v:MoveTo(game.Players.LocalPlayer.Character.Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))
end	
end
end)

god.MouseButton1Down:connect(function()
	while true do
   		wait(0.01)
    	if game.Players.LocalPlayer.Character.Humanoid.Health < 100 then

       		game.Workspace.Remote.AddDamageSelf:FireServer(game.Players.LocalPlayer.Character.Humanoid.Health,game.Players.LocalPlayer.Character.Humanoid.Health- 100)
			--Don't take my god script and take credit for it. Just give me credit and you can.
   		end
	end
end)

messagebox.InputEnded:connect(function()
	
	if messagebox.Text == ("") then
		messagebox.Text = ("Server Message")
	end
end)
redm.MouseButton1Down:connect(function()
	for i,v in pairs(game.Players:GetChildren())do
		local var = Instance.new("StringValue")
		var.Value = "Red"
        game.Workspace.Remote.SendMessage:FireServer(v,tostring(var.Value),tostring(messagebox.Text))
	end
end)

bluem.MouseButton1Down:connect(function()
	for i,v in pairs(game.Players:GetChildren())do
		local var = Instance.new("StringValue")
		var.Value = "Blue"
        game.Workspace.Remote.SendMessage:FireServer(v,tostring(var.Value),tostring(messagebox.Text))
	end
end)

yellowm.MouseButton1Down:connect(function()
	for i,v in pairs(game.Players:GetChildren())do
		local var = Instance.new("StringValue")
		var.Value = "Yellow"
        game.Workspace.Remote.SendMessage:FireServer(v,tostring(var.Value),tostring(messagebox.Text))
	end
end)

killp.MouseButton1Down:connect(function()
	
	player = game.Players.LocalPlayer

	function findergun()
		local back = player.Backpack:GetChildren()
			for a = 1, #back do
				if back[a]:IsA("Model") and back[a]:FindFirstChild("Shooter") then return back[a] end
			end
			return nil
		end

		local findgun = findergun()
		
		for i, v in ipairs(game.Players:GetChildren()) do
			if findgun and v.Character and v ~= player then
				if v.Name == pname.Text then
					for i = 1, 6 do game.Workspace.Remote.DoHitLogic:FireServer(findgun, v.Character.Head) end	
				end
				
			end
		end			
	
	
end)

killall.MouseButton1Down:connect(function()
	
	player = game.Players.LocalPlayer

	function findergun()
		local back = player.Backpack:GetChildren()
			for a = 1, #back do
				if back[a]:IsA("Model") and back[a]:FindFirstChild("Shooter") then return back[a] end
			end
			return nil
		end

		local findgun = findergun()
	
		for i, v in ipairs(game.Players:GetChildren()) do
			if findgun and v.Character and v ~= player then
				for i = 1, 6 do game.Workspace.Remote.DoHitLogic:FireServer(findgun, v.Character.Head) end
			end
		end	
	
end)
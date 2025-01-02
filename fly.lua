local Main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Up = Instance.new("TextButton")
local Down = Instance.new("TextButton")
local ToggleFly = Instance.new("TextButton")
local ExploitName = Instance.new("TextLabel")
local PlusSpeed = Instance.new("TextButton")
local SpeedLabel = Instance.new("TextLabel")
local Minimize = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local MinusSpeed = Instance.new("TextButton")
local Minimize_2 = Instance.new("TextButton")

local Player = game.Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
local HumanoidRootPart=Character:WaitForChild('HumanoidRootPart')

local flySpeed = 1
local isFlying = false
local tpWalking = true

local now
local upConnection, downConnection

game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Explosion", Text = "Fly UI", Duration=3 } )

Main.Name = "Main"
Main.Parent = Player:WaitForChild("PlayerGui")
Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Main.ResetOnSpawn = false

Frame.Parent = Main
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)
Frame.Active = true
Frame.Draggable = true

Up.Name = "Up"
Up.Parent = Frame
Up.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Up.Size = UDim2.new(0, 44, 0, 28)
Up.Font = Enum.Font.SourceSans
Up.Text = "Up"
Up.TextColor3 = Color3.fromRGB(226, 149, 255)
Up.TextSize = 14.000

Down.Name = "Down"
Down.Parent = Frame
Down.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Down.Position = UDim2.new(0, 0, 0.491228074, 0)
Down.Size = UDim2.new(0, 44, 0, 28)
Down.Font = Enum.Font.SourceSans
Down.Text = "Down"
Down.TextColor3 = Color3.fromRGB(226, 149, 255)
Down.TextSize = 14.000

ToggleFly.Name = "ToggleFly"
ToggleFly.Parent = Frame
ToggleFly.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleFly.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
ToggleFly.Size = UDim2.new(0, 56, 0, 28)
ToggleFly.Font = Enum.Font.SourceSans
ToggleFly.Text = "Fly"
ToggleFly.TextColor3 = Color3.fromRGB(226, 149, 255)
ToggleFly.TextSize = 14.000

ExploitName.Parent = Frame
ExploitName.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ExploitName.Position = UDim2.new(0.469327301, 0, 0, 0)
ExploitName.Size = UDim2.new(0, 100, 0, 28)
ExploitName.Font = Enum.Font.SourceSans
ExploitName.Text = "Explosion"
ExploitName.TextColor3 = Color3.fromRGB(226, 149, 255)
ExploitName.TextScaled = false
ExploitName.TextSize = 16.000
ExploitName.TextWrapped = true

PlusSpeed.Name = "PlusSpeed"
PlusSpeed.Parent = Frame
PlusSpeed.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
PlusSpeed.Position = UDim2.new(0.231578946, 0, 0, 0)
PlusSpeed.Size = UDim2.new(0, 45, 0, 28)
PlusSpeed.Font = Enum.Font.SourceSans
PlusSpeed.Text = "+"
PlusSpeed.TextColor3 = Color3.fromRGB(226, 149, 255)
PlusSpeed.TextScaled = true
PlusSpeed.TextSize = 14.000
PlusSpeed.TextWrapped = true

SpeedLabel.Name = "Speed"
SpeedLabel.Parent = Frame
SpeedLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SpeedLabel.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
SpeedLabel.Size = UDim2.new(0, 44, 0, 28)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.Text = "1"
SpeedLabel.TextColor3 = Color3.fromRGB(226, 149, 255)
SpeedLabel.TextScaled = true
SpeedLabel.TextSize = 14.000
SpeedLabel.TextWrapped = true

MinusSpeed.Name = "MinusSpeed"
MinusSpeed.Parent = Frame
MinusSpeed.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MinusSpeed.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
MinusSpeed.Size = UDim2.new(0, 45, 0, 29)
MinusSpeed.Font = Enum.Font.SourceSans
MinusSpeed.Text = "-"
MinusSpeed.TextColor3 = Color3.fromRGB(226, 149, 255)
MinusSpeed.TextScaled = true
MinusSpeed.TextSize = 14.000
MinusSpeed.TextWrapped = true

CloseButton.Name = "Close"
CloseButton.Parent = Main.Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CloseButton.TextColor3 = Color3.fromRGB(226, 149, 255)
CloseButton.Font = "SourceSans"
CloseButton.Size = UDim2.new(0, 45, 0, 28)
CloseButton.Text = "x"
CloseButton.TextSize = 30
CloseButton.Position = UDim2.new(0, 0, -1, 27)

Minimize.Name = "Minimize"
Minimize.Parent = Main.Frame
Minimize.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Minimize.TextColor3 = Color3.fromRGB(226, 149, 255)
Minimize.Font = "SourceSans"
Minimize.Size = UDim2.new(0, 45, 0, 28)
Minimize.Text = "-"
Minimize.TextSize = 40
Minimize.Position = UDim2.new(0, 44, -1, 27)

Minimize_2.Name = "minimize_2"
Minimize_2.Parent = Main.Frame
Minimize_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Minimize_2.TextColor3 = Color3.fromRGB(226, 149, 255)
Minimize_2.Font = "SourceSans"
Minimize_2.Size = UDim2.new(0, 45, 0, 28)
Minimize_2.Text = "+"
Minimize_2.TextSize = 40
Minimize_2.Position = UDim2.new(0, 44, -1, 57)
Minimize_2.Visible = false

--Fly Thing
ToggleFly.MouseButton1Down:connect(function()
	if now == true then
		now = false
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
		Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else
		now = true
		for i = 1, flySpeed do
			spawn(function()
				local hb = game:GetService("RunService").Heartbeat
				tpwalking = true
				local chr = Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end
			end)
		end
		Character.Animate.Disabled = true
		local Char = Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i, v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
		Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end
	if
		Humanoid.RigType == Enum.HumanoidRigType.R6
	then
		local torso = Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0

		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0, 0.1, 0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if now == true then
			Humanoid.PlatformStand = true
		end
		while now == true or Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed + .5 + (speed / maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed - 1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity =
					((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
						((game.Workspace.CurrentCamera.CoordinateFrame *
							CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
							game.Workspace.CurrentCamera.CoordinateFrame.p)) *
					speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity =
					((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
						((game.Workspace.CurrentCamera.CoordinateFrame *
							CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) -
							game.Workspace.CurrentCamera.CoordinateFrame.p)) *
					speed
			else
				bv.velocity = Vector3.new(0, 0, 0)
			end
			--	Character.Animate.Disabled = true
			bg.cframe =
				game.Workspace.CurrentCamera.CoordinateFrame *
				CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		Humanoid.PlatformStand = false
		Character.Animate.Disabled = false
		tpwalking = false
	else
		local Player = Player
		local UpperTorso = Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0

		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0, 0.1, 0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if now == true then
			Humanoid.PlatformStand = true
		end
		while now == true or Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed + .5 + (speed / maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed - 1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity =
					((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
						((game.Workspace.CurrentCamera.CoordinateFrame *
							CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
							game.Workspace.CurrentCamera.CoordinateFrame.p)) *
					speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity =
					((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
						((game.Workspace.CurrentCamera.CoordinateFrame *
							CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) -
							game.Workspace.CurrentCamera.CoordinateFrame.p)) *
					speed
			else
				bv.velocity = Vector3.new(0, 0, 0)
			end

			bg.cframe =
				game.Workspace.CurrentCamera.CoordinateFrame *
				CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		Humanoid.PlatformStand = false
		Character.Animate.Disabled = false
		tpwalking = false
	end
end)

-- Up and down things
local function startMovingUp()
	if not upConnection then
		upConnection = game:GetService("RunService").Heartbeat:Connect(function()
			HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
		end)
	end
end

local function stopMovingUp()
	if upConnection then
		upConnection:Disconnect()
		upConnection = nil
	end
end

local function startMovingDown()
	if not downConnection then
		downConnection = game:GetService("RunService").Heartbeat:Connect(function()
			HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
		end)
	end
end

local function stopMovingDown()
	if downConnection then
		downConnection:Disconnect()
		downConnection = nil
	end
end

Up.MouseButton1Down:Connect(startMovingUp)
Up.MouseButton1Up:Connect(stopMovingUp)

Down.MouseButton1Down:Connect(startMovingDown)
Down.MouseButton1Up:Connect(stopMovingDown)

Player.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false
end)

--Speed thing
PlusSpeed.MouseButton1Down:connect(function()
	flySpeed = flySpeed + 1
	SpeedLabel.Text = flySpeed
	if now == true then
		tpwalking = false
		for i = 1, flySpeed do
			spawn(function()
				local hb = game:GetService("RunService").Heartbeat
				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end
			end)
		end
	end
end)

MinusSpeed.MouseButton1Down:connect(function()
	if flySpeed == 1 then
		SpeedLabel.Text = "Cant be less than 1"
		wait(1)
		SpeedLabel.Text = flySpeed
	else
		flySpeed = flySpeed - 1
		SpeedLabel.Text = flySpeed
		if now == true then
			tpwalking = false
			for i = 1, flySpeed do
				spawn(function()
					local hb = game:GetService("RunService").Heartbeat
					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end
				end)
			end
		end
	end
end)

CloseButton.MouseButton1Click:Connect(function()
	Main:Destroy()
end)

Minimize.MouseButton1Click:Connect(function()
	Up.Visible = false
	Down.Visible = false
	ToggleFly.Visible = false
	PlusSpeed.Visible = false
	SpeedLabel.Visible = false
	MinusSpeed.Visible = false
	Minimize.Visible = false
	Minimize_2.Visible = true
	Main.Frame.BackgroundTransparency = 1
	CloseButton.Position = UDim2.new(0, 0, -1, 57)
end)

Minimize_2.MouseButton1Click:Connect(function()
	Up.Visible = true
	Down.Visible = true
	ToggleFly.Visible = true
	PlusSpeed.Visible = true
	SpeedLabel.Visible = true
	MinusSpeed.Visible = true
	Minimize.Visible = true
	Minimize_2.Visible = false
	Main.Frame.BackgroundTransparency = 0
	CloseButton.Position = UDim2.new(0, 0, -1, 27)
end)

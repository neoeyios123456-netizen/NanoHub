local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui", player.PlayerGui)

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,250,0,220)
frame.Position = UDim2.new(0.05,0,0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "Nano Troll Hub"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.TextScaled = true

local function toggle(name,pos,func)

	local btn = Instance.new("TextButton",frame)
	btn.Size = UDim2.new(0.9,0,0,40)
	btn.Position = UDim2.new(0.05,0,pos,0)
	btn.Text = name.." : OFF"

	local state=false

	btn.MouseButton1Click:Connect(function()
		state = not state
		btn.Text = name.." : "..(state and "ON" or "OFF")
		func(state)
	end)

end

toggle("Invisible",0.25,function(v)
	local char = player.Character
	if char then
		for _,p in pairs(char:GetDescendants()) do
			if p:IsA("BasePart") then
				p.Transparency = v and 1 or 0
			end
		end
	end
end)

toggle("6x Speed",0.5,function(v)
	local hum = player.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.WalkSpeed = v and 96 or 16
	end
end)

local jump=false
toggle("Infinite Jump",0.75,function(v)
	jump=v
end)

UIS.JumpRequest:Connect(function()
	if jump then
		local char=player.Character
		if char then
			char:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
		end
	end
end)
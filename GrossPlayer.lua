--THIS MOUDLE IS MADE BY GROSSTOFU
-- ________  ________  ________  ___    ___ ________  ___  ________  ___  ___  _________   
--|\   ____\|\   __  \|\   __  \|\  \  /  /|\   __  \|\  \|\   ____\|\  \|\  \|\___   ___\ 
--\ \  \___|\ \  \|\  \ \  \|\  \ \  \/  / | \  \|\  \ \  \ \  \___|\ \  \\\  \|___ \  \_| 
-- \ \  \    \ \  \\\  \ \   ____\ \    / / \ \   _  _\ \  \ \  \  __\ \   __  \   \ \  \  
--  \ \  \____\ \  \\\  \ \  \___|\/  /  /   \ \  \\  \\ \  \ \  \|\  \ \  \ \  \   \ \  \ 
--   \ \_______\ \_______\ \__\ __/  / /      \ \__\\ _\\ \__\ \_______\ \__\ \__\   \ \__\
--    \|_______|\|_______|\|__||\___/ /        \|__|\|__|\|__|\|_______|\|__|\|__|    \|__|
--                             \|___|/                                                     				   
--			 					  ________      ___    ___ 
--			 					 |\   __  \    |\  \  /  /|
--			 					 \ \  \|\ /_   \ \  \/  / /
--			 					  \ \   __  \   \ \    / / 
--			 					   \ \  \|\  \   \/  /  /  
--			 					    \ \_______\__/  / /    
--			 					     \|_______|\___/ /     
--			 					              \|___|/      
-- ________  ________  ________  ________   ________  _________  ________  ________ ___  ___     
--|\   ____\|\   __  \|\   __  \|\   ____\ |\   ____\|\___   ___\\   __  \|\  _____\\  \|\  \    
--\ \  \___|\ \  \|\  \ \  \|\  \ \  \___|_\ \  \___|\|___ \  \_\ \  \|\  \ \  \__/\ \  \\\  \   
-- \ \  \  __\ \   _  _\ \  \\\  \ \_____  \\ \_____  \   \ \  \ \ \  \\\  \ \   __\\ \  \\\  \  
--  \ \  \|\  \ \  \\  \\ \  \\\  \|____|\  \\|____|\  \   \ \  \ \ \  \\\  \ \  \_| \ \  \\\  \ 
--   \ \_______\ \__\\ _\\ \_______\____\_\  \ ____\_\  \   \ \__\ \ \_______\ \__\   \ \_______\
--    \|_______|\|__|\|__|\|_______|\_________\\_________\   \|__|  \|_______|\|__|    \|_______|
--                                 \|_________\|_________|                                       



local GrossPlayer = {}

function DetectPlayerProperty(Player:Player)
	if Player.Character:FindFirstChild("Humanoid") == false then
		error(Player.Name.." is not a vaild player in game.")
	end
	if Player.Character:FindFirstChild("HumanoidRootPart") == false then
		error("Can't find HumanoidRootPart in player: "..Player.Name)
	end
end

function GrossPlayer:SetHealth(Player:Player, health:number)
	DetectPlayerProperty(Player)
	Player.Character:FindFirstChild("Humanoid").Health += health
end

function GrossPlayer:FullHealth(Player:Player)
	DetectPlayerProperty(Player)
	Player.Character:FindFirstChild("Humanoid").Health = 100
end

function GrossPlayer:Kill(Player:Player)
	DetectPlayerProperty(Player)
	Player.Character:FindFirstChild("Humanoid").Health = 0
end

function GrossPlayer:TeleportToPosition(PlayerToBeTeleport:Player, TargetPosition:CFrame)
	DetectPlayerProperty(PlayerToBeTeleport)
	PlayerToBeTeleport.Character:FindFirstChild("HumanoidRootPart").CFrame = TargetPosition
end

function GrossPlayer:TeleportToPlayer(PlayerToBeTeleport:Player, TargetPlayer:Player)
	DetectPlayerProperty(PlayerToBeTeleport)
	DetectPlayerProperty(TargetPlayer)
	PlayerToBeTeleport.Character:FindFirstChild("HumanoidRootPart").Position = TargetPlayer.Character:FindFirstChild("HumanoidRootPart").Position
end

function GrossPlayer:TeleportToObject(PlayerToBeTeleport:Player, TargetObject:Object)
	DetectPlayerProperty(PlayerToBeTeleport)
	if workspace:FindFirstChild(TargetObject.Name) == false then
		error("Can't find the object: "..TargetObject.Name.." in workspace.")
	end
	PlayerToBeTeleport.Character:FindFirstChild("HumanoidRootPart").Position = TargetObject.Position
end

function GrossPlayer:SetSpawnLocation(Player:Player, SpawnLocation:Object)
	DetectPlayerProperty(Player)
	local CheckpointData = game:GetService("ServerStorage"):FindFirstChild("CheckpointData")
	if not CheckpointData then
		CheckpointData = Instance.new("Folder")
		CheckpointData.Name = "CheckpointData"
		CheckpointData.Parent = game:GetService("ServerStorage")
	end

	local userIdString = tostring(Player.UserId)
	local CheckpointValue = CheckpointData:FindFirstChild(userIdString)
	if not CheckpointValue then
		CheckpointValue = Instance.new("ObjectValue")
		CheckpointValue.Name = userIdString
		CheckpointValue.Parent = CheckpointData

		Player.CharacterAdded:Connect(function(character)
			wait()
			local StoredCheckpoint = game:GetService("ServerStorage").CheckpointData[userIdString].Value
			character:MoveTo(StoredCheckpoint.Position + Vector3.new(math.random(-4, 4), 4, math.random(-4, 4)))
		end)
	end

	CheckpointValue.Value = SpawnLocation
end

function GrossPlayer:ResetSpawnLocation(Player:Player)
	DetectPlayerProperty(Player)
	
	local CheckpointData = game:GetService("ServerStorage"):FindFirstChild("CheckpointData")
	local userIdString = tostring(Player.UserId)
	local CheckpointValue = CheckpointData:FindFirstChild(userIdString)
	
	if not CheckpointData then return end
	if not CheckpointValue then return end
		Player.CharacterAdded:Connect(function(character)
			wait()
			local StoredCheckpoint = game:GetService("ServerStorage").CheckpointData[userIdString].Value
			character:MoveTo(StoredCheckpoint.Position + Vector3.new(math.random(-4, 4), 4, math.random(-4, 4)))
		end)
	for _, SpawnLocation in ipairs(workspace:GetChildren()) do
		if SpawnLocation:IsA("SpawnLocation") then
			CheckpointValue.Value = SpawnLocation
		end
	end
end

function GrossPlayer:ScaleCharacter(Player:Player, Size:number)
	DetectPlayerProperty(Player)
	local Humanoid = Player.Character:FindFirstChild("Humanoid")
	local HumanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")
	local CurrentDescription = Humanoid:GetAppliedDescription()
	CurrentDescription.HeadScale = Size
	CurrentDescription.HeightScale = Size
	CurrentDescription.WidthScale = Size
	CurrentDescription.DepthScale = Size
	Humanoid:ApplyDescription(CurrentDescription)
end

function GrossPlayer:ScaleCharacterMore(Player:Player, Head:number, Height:number, Width:number, Depth:number)
	DetectPlayerProperty(Player)
	local Humanoid = Player.Character:FindFirstChild("Humanoid")
	local HumanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")
	local CurrentDescription = Humanoid:GetAppliedDescription()
	CurrentDescription.HeadScale = Head
	CurrentDescription.HeightScale = Height
	CurrentDescription.WidthScale = Width
	CurrentDescription.DepthScale = Depth
	Humanoid:ApplyDescription(CurrentDescription)
end

function GrossPlayer:SetWalkSpeed(Player:Player, WalkSpeed:number)
	DetectPlayerProperty(Player)
	Player.Character.Humanoid.WalkSpeed = WalkSpeed
end

function GrossPlayer:SetJumpPower(Player:Player, JumpPower:number)
	DetectPlayerProperty(Player)
	Player.Character.Humanoid.JumpPower = JumpPower
end

function GrossPlayer:ResetWalkSpeed(Player:Player)
	DetectPlayerProperty(Player)
	Player.Character.Humanoid.WalkSpeed = 50
end

function GrossPlayer:ResetJumpPower(Player:Player)
	DetectPlayerProperty(Player)
	Player.Character.Humanoid.JumpPower = 16
end

function GrossPlayer:PlayAnimation(Player:Player, Animation:Animation)
	DetectPlayerProperty(Player)
	Player.Character.Humanoid:LoadAnimation(Animation):Play()
end

function GrossPlayer:GiveToolByClone(Player:Player, Tool:Tool)
	DetectPlayerProperty(Player)
	Tool:Clone().Parent = Player.Backpack
end

function GrossPlayer:GiveTool(Player:Player, Tool:Tool)
	DetectPlayerProperty(Player)
	Tool.Parent = Player.Backpack
end

function GrossPlayer:ClearInventory(Player:Player)
	DetectPlayerProperty(Player)
	for _, Tool in pairs(Player.Backpack:GetChildren()) do
		if Tool:IsA("Tool") then
			Tool:Destroy()
		end
	end
	for _, Tool in pairs(Player.Character:GetChildren()) do
		if Tool:IsA("Tool") then
			Tool:Destroy()
		end
	end
end

function GrossPlayer:SetCameraPosition(Player:Player, Position:Vector3, LookAt:Vector3)
	DetectPlayerProperty(Player)
	if not game:GetService("RunService"):IsClient() then
		error("Module must requried on clinet.")
	end
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	workspace.CurrentCamera.CFrame = CFrame.lookAt(Position, LookAt)
end

function GrossPlayer:ResetCameraPosition(Player:Player)
	DetectPlayerProperty(Player)
	if not game:GetService("RunService"):IsClient() then
		error("Module must requried on clinet.")
	end
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end

return GrossPlayer

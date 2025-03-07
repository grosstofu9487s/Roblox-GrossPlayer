# GrossPlayer
![GrossPlayer](https://github.com/user-attachments/assets/e94a7a65-3216-453d-b2d7-e4dba22870ab)
<br>
GrossPlayer Module made by Grosstofu
<br>
## How to use
Open "GrossPlayer.lua" in Roblox studio and place it in Replicatedstorage, to use it you can use require() in any script
## Function List
<code>GrossPlayer:SetHealth(Player:Player, health:number)</code> - Set designated player's Health
<br>
<code>GrossPlayer:FullHealth(Player:Player)</code> - Set designated player's Health to 100
<br>
<code>GrossPlayer:Kill(Player:Player)</code> - Set designated player's Health to 0
<br>
<code>GrossPlayer:TeleportToPosition(PlayerToBeTeleport:Player, TargetPosition:CFrame)</code> - Change designated player's position by CFrame
<br>
<code>GrossPlayer:TeleportToPlayer(PlayerToBeTeleport:Player, TargetPlayer:Player)</code> - Change designated player's position by giving another player's position
<br>
<code>GrossPlayer:TeleportToObject(PlayerToBeTeleport:Player, TargetObject:Object)</code> - Change designated player's position by giving an object's position
<br>
<code>GrossPlayer:SetSpawnLocation(Player:Player, SpawnLocation:Object)</code> - Set where will the player respawn when the player died
<br>
<code>GrossPlayer:ResetSpawnLocation(Player:Player)</code> - Reset where will the designated player respawn when the player died, the location will be at the "SpawnLocation" part in **workspace**
<br>
<code>GrossPlayer:ScaleCharacter(Player:Player, Size:number)</code> - Scale designated player's character's size
<br>
<code>GrossPlayer:ScaleCharacterMore(Player:Player, Head:number, Height:number, Width:number, Depth:number)</code> - Scale designated player's character's size by editing the value of head, height, width and depth
<br>
<code>GrossPlayer:SetWalkSpeed(Player:Player, WalkSpeed:number)</code> - Set designated player's walk speed
<br>
<code>GrossPlayer:ResetWalkSpeed(Player:Player)</code> - Reset designated player's walk speed, the defult value is 16
<br>
<code>GrossPlayer:SetJumpPower(Player:Player, JumpPower:number)</code> - Set designated player's jump power
<br>
<code>GrossPlayer:ResetJumpPower(Player:Player)</code> - Reset designated player's jump power, the defult value is 50
<br>
<code>GrossPlayer:PlayAnimation(Player:Player, Animation:Animation)</code> - Play animation on designated player's character
<br>
<code>GrossPlayer:GiveToolByClone(Player:Player, Tool:Tool)</code> - give designated player tool by clone the tool into designated player's backpack
<br>
<code>GrossPlayer:GiveTool(Player:Player, Tool:Tool)</code> - give designated player tool by change the designated tool's parent into designated player's backpack
<br>
<code>GrossPlayer:ClearInventory(Player:Player)</code> - Remove all the children in the inventory of designated player
<br>
<code>GrossPlayer:SetCameraPosition(Player:Player, Position:Vector3, LookAt:Vector3)</code> - Set designated player's camera positon, **this function can only be called in clinet**
<br>
<code>GrossPlayer:ResetCameraPosition(Player:Player)</code> - Set designated player's camera mode into custom(AKA free the camera), **this function can only be called in clinet**

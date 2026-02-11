local run = function(func) 
	func() 
end
local cloneref = cloneref or function(obj) 
	return obj 
end
local playersService = cloneref(game:GetService('Players'))
local inputService = cloneref(game:GetService('UserInputService'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local collectionService = cloneref(game:GetService('CollectionService'))
local httpService = cloneref(game:GetService('HttpService'))
local coreGui = cloneref(game:GetService('CoreGui'))
local gameCamera = workspace.CurrentCamera
local lplr = playersService.LocalPlayer

local vape = shared.vape
local sessioninfo = vape.Libraries.sessioninfo

run(function()
	local kills = sessioninfo:AddItem('Kills')
	local eggs = sessioninfo:AddItem('Eggs')
	local wins = sessioninfo:AddItem('Wins')
	local games = sessioninfo:AddItem('Games')
end)

run(function()
	local InfiniteJump = {Enabled = false}
	
	InfiniteJump = vape.Categories.Blatant:CreateModule({
		Name = 'InfiniteJump',
		Function = function(callback)
			if callback then
				local UserInputService = game:GetService("UserInputService")
				local Players = game:GetService("Players")
				local player = Players.LocalPlayer
				
				local connection
				connection = UserInputService.JumpRequest:Connect(function()
					if InfiniteJump.Enabled and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
						player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
					end
				end)

				repeat task.wait() until not InfiniteJump.Enabled
				if connection then
					connection:Disconnect()
				end
			end
		end,
		Tooltip = 'Allows you to jump infinitely'
	})
end)

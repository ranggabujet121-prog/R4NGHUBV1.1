local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Spectate Gui | By R4NG"
screenGui.ResetOnSpawn = false


local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Text = "Spectate: OFF"
toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Parent = screenGui


local nextButton = Instance.new("TextButton")
nextButton.Size = UDim2.new(0, 60, 0, 40)
nextButton.Position = UDim2.new(0, 140, 0, 10)
nextButton.Text = "Next"
nextButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
nextButton.TextColor3 = Color3.new(1, 1, 1)
nextButton.Parent = screenGui

local prevButton = Instance.new("TextButton")
prevButton.Size = UDim2.new(0, 60, 0, 40)
prevButton.Position = UDim2.new(0, 210, 0, 10)
prevButton.Text = "Prev"
prevButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
prevButton.TextColor3 = Color3.new(1, 1, 1)
prevButton.Parent = screenGui

-- Create Player Name Label
local playerLabel = Instance.new("TextLabel")
playerLabel.Size = UDim2.new(0, 200, 0, 30)
playerLabel.Position = UDim2.new(0, 10, 0, 60)
playerLabel.Text = "Spectating: None"
playerLabel.BackgroundTransparency = 1
playerLabel.TextColor3 = Color3.new(1, 1, 1)
playerLabel.TextScaled = true
playerLabel.Parent = screenGui


screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")


local spectateEnabled = false
local spectateIndex = 1
local playerList = {}

local function updatePlayerList()
    playerList = {}
    for i, player in Players:GetPlayers() do
        if player ~= LocalPlayer then
            table.insert(playerList, player)
        end
    end
end

local function updatePlayerLabel()
    if spectateEnabled and #playerList > 0 then
        playerLabel.Text = "Spectating: " .. playerList[spectateIndex].Name
    else
        playerLabel.Text = "Spectating: None"
    end
end

local function setSpectateCamera()
    if spectateEnabled and #playerList > 0 then
        local targetPlayer = playerList[spectateIndex]
        if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
            Workspace.CurrentCamera.CameraSubject = targetPlayer.Character:FindFirstChild("Humanoid")
        end
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
        end
    end
end

local function enableSpectate()
    spectateEnabled = true
    toggleButton.Text = "Spectate: ON"
    updatePlayerList()
    if #playerList == 0 then
        spectateIndex = 1
    else
        spectateIndex = math.clamp(spectateIndex, 1, #playerList)
    end
    updatePlayerLabel()
    setSpectateCamera()
end

local function disableSpectate()
    spectateEnabled = false
    toggleButton.Text = "Spectate: OFF"
    updatePlayerLabel()
    setSpectateCamera()
end

toggleButton.MouseButton1Click:Connect(function()
    if spectateEnabled then
        disableSpectate()
    else
        enableSpectate()
    end
end)

nextButton.MouseButton1Click:Connect(function()
    if spectateEnabled and #playerList > 0 then
        spectateIndex = spectateIndex + 1
        if spectateIndex > #playerList then
            spectateIndex = 1
        end
        updatePlayerLabel()
        setSpectateCamera()
    end
end)

prevButton.MouseButton1Click:Connect(function()
    if spectateEnabled and #playerList > 0 then
        spectateIndex = spectateIndex - 1
        if spectateIndex < 1 then
            spectateIndex = #playerList
        end
        updatePlayerLabel()
        setSpectateCamera()
    end
end)

Players.PlayerAdded:Connect(function()
    updatePlayerList()
    updatePlayerLabel()
end)

Players.PlayerRemoving:Connect(function()
    updatePlayerList()
    if spectateEnabled then
        if #playerList == 0 then
            disableSpectate()
        else
            spectateIndex = math.clamp(spectateIndex, 1, #playerList)
            updatePlayerLabel()
            setSpectateCamera()
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    if not spectateEnabled then
        setSpectateCamera()
    end
end)


updatePlayerList()
updatePlayerLabel()
setSpectateCamera()

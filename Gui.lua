local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Hapus GUI lama kalau ada
if PlayerGui:FindFirstChild("R4NG_HUB") then
    PlayerGui.R4NG_HUB:Destroy()
end

-- Bikin kertas gambar utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "R4NH HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Layar hitam untuk intro (full screen)
local IntroBG = Instance.new("Frame")
IntroBG.Size = UDim2.new(1, 0, 1, 0)
IntroBG.Position = UDim2.new(0, 0, 0, 0)
IntroBG.BackgroundColor3 = Color3.fromRGB(67, 50, 100)
IntroBG.BackgroundTransparency = 0
IntroBG.Parent = ScreenGui

-- Logo (gambar lu)
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 300, 0, 300)  -- ukuran logo
Logo.Position = UDim2.new(0.5, -150, 0.5, -150)  -- tepat tengah
Logo.BackgroundTransparency = 1
Logo.ImageTransparency = 1  -- awalnya ga keliatan
Logo.Image = "rbxassetid://89964754490655"  -- GANTI INI dengan ID logo lu
Logo.Parent = Hitam

-- Bikin logo bulat (opsional)
local Bulat = Instance.new("UICorner")
Bulat.CornerRadius = UDim.new(1, 0)
Bulat.Parent = Logo

local TweenService = game:GetService("TweenService")

local gerakan = TweenInfo.new(2, Enum.EasingStyle.Quad)  -- 2 detik, halus

local animasi = TweenService:Create(
    Logo,
    gerakan,
    {ImageTransparency = 0}  -- jadi keliatan
)

animasi:Play()  -- mulai!

local Suara = Instance.new("Sound")
Suara.SoundId = "rbxassetid://87679579947858"  -- GANTI dengan ID suara lu
Suara.Volume = 0.5
Suara.Parent = game:GetService("SoundService")

Suara:Play()  -- suara main pas logo muncul

wait(3)  -- tunggu logo keliatan 3 detik

-- Teks Loading...
local TeksLoading = Instance.new("TextLabel")
TeksLoading.Size = UDim2.new(0, 400, 0, 60)
TeksLoading.Position = UDim2.new(0.5, -200, 0.6, 0)
TeksLoading.BackgroundTransparency = 1
TeksLoading.Text = "Loading..."
TeksLoading.TextColor3 = Color3.new(1,1,1)
TeksLoading.TextSize = 50
TeksLoading.Font = Enum.Font.GothamBold
TeksLoading.Parent = Hitam

-- Loading bar (kotak hijau memanjang)
local BarBG = Instance.new("Frame")
BarBG.Size = UDim2.new(0, 500, 0, 40)
BarBG.Position = UDim2.new(0.5, -250, 0.75, 0)
BarBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BarBG.Parent = Hitam

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 0, 1, 0)  -- mulai kosong
Bar.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
Bar.Parent = BarBG

-- Bikin sudut bulat
local BulatBar = Instance.new("UICorner")
BulatBar.CornerRadius = UDim.new(0, 20)
BulatBar.Parent = BarBG

-- Animasi loading bar memanjang
TweenService:Create(Bar, TweenInfo.new(5, Enum.EasingStyle.Linear), {
    Size = UDim2.new(1, 0, 1, 0)  -- full dalam 5 detik
}):Play()

-- Suara panjang selama loading
local SuaraPanjang = Instance.new("Sound")
SuaraPanjang.SoundId = "rbxassetid://126291069838831"  -- GANTI dengan ID suara panjang lu
SuaraPanjang.Volume = 0.3
SuaraPanjang.Looped = true  -- muter terus
SuaraPanjang.Parent = game:GetService("SoundService")

SuaraPanjang:Play()  -- mulai muter pas loading

-- Tunggu loading selesai
wait(5.5)

-- Matikan suara panjang
SuaraPanjang:Stop()
SuaraPanjang:Destroy()

-- Hilangkan semua intro pelan-pelan
TweenService:Create(Hitam, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(TeksLoading, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(BarBG, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()

wait(1)
IntroBG:Destroy()  -- hapus layar hitam

-- Kotak key system (muncul setelah intro)
local KeyKotak = Instance.new("Frame")
KeyKotak.Size = UDim2.new(0, 350, 0, 250)
KeyKotak.Position = UDim2.new(0.5, -175, 0.5, -125)
KeyKotak.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
KeyKotak.Parent = ScreenGui

local KeySudut = Instance.new("UICorner")
KeySudut.CornerRadius = UDim.new(0, 15)
KeySudut.Parent = KeyKotak

-- Judul key
local KeyJudul = Instance.new("TextLabel")
KeyJudul.Size = UDim2.new(1, 0, 0, 50)
KeyJudul.BackgroundColor3 = Color3.fromRGB(60, 0, 150)
KeyJudul.Text = "Key nya RanggaGanteng"
KeyJudul.TextColor3 = Color3.new(1,1,1)
KeyJudul.TextSize = 28
KeyJudul.Font = Enum.Font.GothamBold
KeyJudul.Parent = KeyKotak

-- Kotak masukin key (TextBox)
local MasukKey = Instance.new("TextBox")
MasukKey.Size = UDim2.new(0.8, 0, 0, 60)
MasukKey.Position = UDim2.new(0.1, 0, 0.3, 0)
MasukKey.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
MasukKey.PlaceholderText = "Key di sini..."
MasukKey.Text = ""
MasukKey.TextColor3 = Color3.new(1,1,1)
MasukKey.TextSize = 24
MasukKey.Font = Enum.Font.Gotham
MasukKey.Parent = KeyKotak

-- Tombol submit
local TombolKey = Instance.new("TextButton")
TombolKey.Size = UDim2.new(0.8, 0, 0, 60)
TombolKey.Position = UDim2.new(0.1, 0, 0.6, 0)
TombolKey.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
TombolKey.Text = "Submit Key"
TombolKey.TextColor3 = Color3.new(1,1,1)
TombolKey.TextSize = 24
TombolKey.Font = Enum.Font.GothamSemibold
TombolKey.Parent = KeyKotak

-- Kata sandi yang benar (ganti ini!)
local KeyBenar = "RanggaGanteng"  -- Ganti jadi password lu

-- Kalau diteken tombol
TombolKey.MouseButton1Click:Connect(function()
    if MasukKey.Text == KeyBenar then
        print("Key benar! GUI utama muncul")
        KeyKotak:Destroy()  -- hilangkan key system
        -- Di sini taruh GUI utama lu
    else
        print("Key salah!")
        -- Muncul tulisan salah (bisa tambah di sini)
    end
end)

-- Fungsi cepat biar semua bulat
local function BikinBulat(barang)
    local sudut = Instance.new("UICorner")
    sudut.CornerRadius = UDim.new(0, 12)
    sudut.Parent = barang
end

-- Pakai gini
BikinBulat(TombolBiasa)
BikinBulat(TombolBiasa2)
BikinBulat(TombolBiasa3)
BikinBulat(TombolBiasa4)
BikinBulat(TombolBiasa5)
BikinBulat(TombolBiasa6)

-- Kotak utama GUI
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 350)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
MainFrame.Parent = ScreenGui

-- Contoh Halaman1 yang bisa discroll
local Halaman1 = Instance.new("ScrollingFrame")
Halaman1.Size = UDim2.new(1, 0, 1, -50)  -- tinggi sesuai kotak utama minus tab bar
Halaman1.Position = UDim2.new(0, 0, 0, 50)
Halaman1.BackgroundTransparency = 1
Halaman1.ScrollBarThickness = 8  -- ketebalan scrollbar
Halaman1.CanvasSize = UDim2.new(0, 0, 0, 0)  -- nanti otomatis
Halaman1.ScrollingDirection = Enum.ScrollingDirection.Y  -- scroll ke atas-bawah
Halaman1.Parent = MainFrame
-- Ikon kecil
local Ikon = Instance.new("ImageButton")
Ikon.Size = UDim2.new(0, 60, 0, 60)
Ikon.Position = UDim2.new(0.05, 0, 0.05, 0)
Ikon.BackgroundTransparency = 1
Ikon.Image = "rbxassetid://89964754490655"  -- ID logo lu
Ikon.Parent = ScreenGui
Ikon.Visible = false

local IkonCorner = Instance.new("UICorner")
IkonCorner.CornerRadius = UDim.new(1, 0)
IkonCorner.Parent = Ikon

-- Tombol close di MainFrame
TombolClose.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    Ikon.Visible = true
end)

-- Klik ikon → buka lagi
Ikon.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    Ikon.Visible = false
end)

-- Drag ikon
local draggingIkon = false
local dragInputIkon, dragStartIkon, startPosIkon

Ikon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingIkon = true
        dragStartIkon = input.Position
        startPosIkon = Ikon.Position
    end
end)

-- ... (lanjut drag seperti kode di atas)

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- Tab bar (baris tombol tab di atas)
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 50)
TabBar.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
TabBar.Parent = MainFrame

-- Bikin 3 tombol tab (contoh)
local Tab1 = Instance.new("TextButton")
Tab1.Size = UDim2.new(0.33, 0, 1, 0)
Tab1.Position = UDim2.new(0, 0, 0, 0)
Tab1.BackgroundColor3 = Color3.fromRGB(80, 0, 200)
Tab1.Text = "Rang Sc"
Tab1.TextColor3 = Color3.new(1,1,1)
Tab1.TextSize = 20
Tab1.Parent = TabBar

local TombolBiasa = Instance.new("TextButton")
TombolBiasa.Size = UDim2.new(0.8, 0, 0, 50)
TombolBiasa.Position = UDim2.new(0.1, 0, 0.1, 0)
TombolBiasa.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
TombolBiasa.Text = "Touch Fling Gui Script"
TombolBiasa.TextColor3 = Color3.new(1,1,1)
TombolBiasa.TextSize = 22
TombolBiasa.Parent = Tab1



local Garis = Instance.new("UIStroke")
Garis.Color = Color3.fromRGB(0, 255, 255)  -- cyan
Garis.Thickness = 2
Garis.Transparency = 0.3
Garis.Parent = TombolBiasa

TombolBiasa.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/LgZwZ7ZB",true))()

    -- Contoh: loadstring(game:HttpGet("link script"))()
end)

local TombolBiasa2 = Instance.new("TextButton")
TombolBiasa.Size = UDim2.new(0.8, 0, 0, 50)
TombolBiasa.Position = UDim2.new(0.1, 0, 0.3, 0)
TombolBiasa.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
TombolBiasa.Text = "Spectate Gui Script"
TombolBiasa.TextColor3 = Color3.new(1,1,1)
TombolBiasa.TextSize = 22
TombolBiasa.Parent = Tab1


local Garis = Instance.new("UIStroke")
Garis.Color = Color3.fromRGB(0, 255, 255)  -- cyan
Garis.Thickness = 2
Garis.Transparency = 0.3
Garis.Parent = TombolBiasa2

TombolBiasa2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/7EAbhifj"))("t.me/ByteScripts")
    -- Contoh: loadstring(game:Http
end)

local TombolBiasa3 = Instance.new("TextButton")
TombolBiasa.Size = UDim2.new(0.8, 0, 0, 50)
TombolBiasa.Position = UDim2.new(0.1, 0, 0.5, 0)
TombolBiasa.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
TombolBiasa.Text = "Teleport Player Gui"
TombolBiasa.TextColor3 = Color3.new(1,1,1)
TombolBiasa.TextSize = 22
TombolBiasa.Parent = Tab1


local Garis = Instance.new("UIStroke")
Garis.Color = Color3.fromRGB(0, 255, 255)  -- cyan
Garis.Thickness = 2
Garis.Transparency = 0.3
Garis.Parent = TombolBiasa3

TombolBiasa3.MouseButton1Click:Connect(function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Telxr/Teleportica/refs/heads/main/Telepo")))()
end)

local TombolBiasa4 = Instance.new("TextButton")
TombolBiasa.Size = UDim2.new(0.8, 0, 0, 50)
TombolBiasa.Position = UDim2.new(0.1, 0, 0.7, 0)
TombolBiasa.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
TombolBiasa.Text = "Horror Skybox"
TombolBiasa.TextColor3 = Color3.new(1,1,1)
TombolBiasa.TextSize = 22
TombolBiasa.Parent = Tab1

local Garis = Instance.new("UIStroke")
Garis.Color = Color3.fromRGB(0, 255, 255)  -- cyan
Garis.Thickness = 2
Garis.Transparency = 0.3
Garis.Parent = TombolBiasa4

TombolBiasa4.MouseButton1Click:Connect(function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local imageId = "rbxassetid://120650579249448"
local SoundId = "rbxassetid://911882720"

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

local originalDecals = {}
local originalTextures = {}
local originalMeshTextures = {}
local originalPlayerClothes = {}
local originalSkybox = {}
local addedTextures = {}

local function createLabel(text, size, color)
    local lbl = Instance.new("TextLabel")
    lbl.Size = size
    lbl.BackgroundTransparency = 0.7
    lbl.BackgroundColor3 = color
    lbl.BorderSizePixel = 0
    lbl.Font = Enum.Font.Code
    lbl.TextColor3 = Color3.new(0,1,0)
    lbl.TextStrokeColor3 = Color3.new(0,0.8,0)
    lbl.TextStrokeTransparency = 0
    lbl.Text = text
    lbl.TextScaled = true
    return lbl
end

local function createButton(text)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 180, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    btn.BackgroundTransparency = 0.8
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.Code
    btn.TextColor3 = Color3.new(0, 1, 0)
    btn.TextStrokeColor3 = Color3.new(0, 0.8, 0)
    btn.TextStrokeTransparency = 0
    btn.Text = text
    btn.TextScaled = true
    btn.AutoButtonColor = false
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0.3
        btn.TextColor3 = Color3.fromRGB(0,255,128)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 0.8
        btn.TextColor3 = Color3.fromRGB(0,255,0)
    end)
    return btn
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AxomHackerPanel"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 350)
Frame.Position = UDim2.new(0.05,0,0.2,0)
Frame.BackgroundColor3 = Color3.fromRGB(10, 30, 10)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(0, 255, 0)
Frame.Parent = ScreenGui

local closeBtn = createButton("X")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.TextStrokeColor3 = Color3.new(0.8, 0, 0)
closeBtn.TextScaled = true
closeBtn.Parent = Frame
closeBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                              startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local Title = createLabel("Axom Hack × V1", UDim2.new(1,0,0,50), Color3.fromRGB(0, 100, 0))
Title.Parent = Frame

local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Size = UDim2.new(1, -20, 1, -110)
ButtonsFrame.Position = UDim2.new(0, 10, 0, 55)
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ButtonsFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

local function getTileSize(dim)
    return math.clamp(dim / 10, 5, 20)
end
local function isBigPart(part)
    local threshold = 30
    return (part.Size.X > threshold or part.Size.Y > threshold or part.Size.Z > threshold)
end

local function changeAllLand()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Decal") then
            if not obj:IsDescendantOf(LocalPlayer.Character) then
                if not originalDecals[obj] then
                    originalDecals[obj] = obj.Texture
                end
                obj.Texture = imageId
            end
        elseif obj:IsA("Texture") then
            if not obj:IsDescendantOf(LocalPlayer.Character) then
                if not originalTextures[obj] then
                    originalTextures[obj] = obj.Texture
                end
                obj.Texture = imageId
            end
        elseif obj:IsA("MeshTexture") then
            if not obj:IsDescendantOf(LocalPlayer.Character) then
                if not originalMeshTextures[obj] then
                    originalMeshTextures[obj] = obj.TextureId
                end
                obj.TextureId = imageId
            end
        elseif obj:IsA("Part") or obj:IsA("UnionOperation") or obj:IsA("MeshPart") then
            if not obj:IsDescendantOf(LocalPlayer.Character) and not Players:GetPlayerFromCharacter(obj.Parent) then
                for _, child in pairs(obj:GetChildren()) do
                    if child:IsA("Decal") then
                        if not originalDecals[child] then
                            originalDecals[child] = child.Texture
                        end
                        child.Texture = imageId
                    elseif child:IsA("Texture") then
                        if not originalTextures[child] then
                            originalTextures[child] = child.Texture
                        end
                        child.Texture = imageId
                    end
                end
                local faces = {Enum.NormalId.Top,Enum.NormalId.Bottom,Enum.NormalId.Left,Enum.NormalId.Right,Enum.NormalId.Front,Enum.NormalId.Back}
                for _, face in pairs(faces) do
                    local found = false
                    for _, child in pairs(obj:GetChildren()) do
                        if (child:IsA("Texture") or child:IsA("Decal")) and child.Face == face then
                            found = true
                            break
                        end
                    end
                    if not found then
                        local tex = Instance.new("Texture")
                        tex.Texture = imageId
                        tex.Face = face
                        local size = obj.Size
                        if isBigPart(obj) then
                            if face == Enum.NormalId.Top or face == Enum.NormalId.Bottom then
                                tex.StudsPerTileU = getTileSize(size.X)
                                tex.StudsPerTileV = getTileSize(size.Z)
                            elseif face == Enum.NormalId.Left or face == Enum.NormalId.Right then
                                tex.StudsPerTileU = getTileSize(size.Z)
                                tex.StudsPerTileV = getTileSize(size.Y)
                            elseif face == Enum.NormalId.Front or face == Enum.NormalId.Back then
                                tex.StudsPerTileU = getTileSize(size.X)
                                tex.StudsPerTileV = getTileSize(size.Y)
                            end
                        else
                            if face == Enum.NormalId.Top or face == Enum.NormalId.Bottom then
                                tex.StudsPerTileU = size.X
                                tex.StudsPerTileV = size.Z
                            elseif face == Enum.NormalId.Left or face == Enum.NormalId.Right then
                                tex.StudsPerTileU = size.Z
                                tex.StudsPerTileV = size.Y
                            elseif face == Enum.NormalId.Front or face == Enum.NormalId.Back then
                                tex.StudsPerTileU = size.X
                                tex.StudsPerTileV = size.Y
                            end
                        end
                        tex.Parent = obj
                        table.insert(addedTextures, tex)
                    end
                end
            end
        end
    end
end

local function changeSkybox()
    if #originalSkybox == 0 then
        for _, obj in pairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then
                table.insert(originalSkybox, obj:Clone())
            end
        end
    end
    for _, obj in pairs(Lighting:GetChildren()) do
        if obj:IsA("Sky") then
            obj:Destroy()
        end
    end
    local newSky = Instance.new("Sky")
    newSky.SkyboxBk = imageId
    newSky.SkyboxDn = imageId
    newSky.SkyboxFt = imageId
    newSky.SkyboxLf = imageId
    newSky.SkyboxRt = imageId
    newSky.SkyboxUp = imageId
    newSky.Parent = Lighting
end

local function

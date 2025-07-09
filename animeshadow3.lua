warn("------- Lumira Hub --------")
warn("Executor: " .. identifyexecutor())

if getgenv().thai == true then
    isThai = true
else 
    isThai = false
end
isThai = getgenv().thai
local function tr(text)
    if not isThai then return text end
    local translations = {
        ["Executor: "] = "ตัวรันสคริปต์: ",
        ["Username: "] = "ชื่อผู้ใช้: ",
        ["Roblox ID: "] = "รหัส Roblox: ",
        ["Main"] = "หน้าแรก",
        ["Settings"] = "การตั้งค่า",
        ["Monster List"] = "รายชื่อมอนสเตอร์",
        ["Select Monster"] = "เลือกมอนสเตอร์",
        ["Select a world first"] = "กรุณาเลือกโลกก่อน",
        ["No monsters found"] = "ไม่พบมอนสเตอร์",
        ["Select World"] = "เลือกโลก",
        ["Select World Before Selecting Monster"] = "เลือกโลกก่อนเลือกมอนสเตอร์",
        ["Auto Click"] = "คลิกอัตโนมัติ",
        ["Fast Autoclicking"] = "คลิกเร็วอัตโนมัติ",
        ["Auto Attack + Teleport"] = "โจมตีอัตโนมัติพร้อมวาร์ป",
        ["Teleport and attack automatically"] = "วาร์ปและโจมตีอัตโนมัติ",
        ["Auto Claim AFK Gifts"] = "รับของขวัญ AFK อัตโนมัติ",
        ["Claim AFK Gifts Automatically"] = "รับของขวัญเมื่อ AFK อัตโนมัติ",
        ["Teleport Speed"] = "ความเร็ววาร์ป",
        ["Lower = faster teleport"] = "ยิ่งน้อย ยิ่งวาร์ปเร็ว",
        ["Close UI"] = "ปิดเมนู"
    }
    return translations[text] or text
end

-- Player information
local player = game:GetService("Players").LocalPlayer
warn(tr("Username: ") .. player.Name)
warn(tr("Roblox ID: ") .. player.UserId)

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Bridge")

-- Load UI Library
local Library
local success, err = pcall(function()
    Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x3-lunarix/lunarixhub/refs/heads/main/dummyui.lua"))()
end)

-- Configurations
local config = {
    AutoAttack = false,
    FastClick = false,
    AutoClaimAFK = false,
    SelectedWorld = nil,
    SelectedMonster = nil,
    TeleportSpeed = 0.5
}

-- UI Setup
local Window = Library:Window({
    Title = 'Lumira Hub',
    Desc = 'Anime Shadow 2',
    Icon = 'sun-moon',
    Theme = 'Dark',
    Config = {
        Keybind = Enum.KeyCode.RightControl,
        Size = UDim2.new(0, 530, 0, 400)
    },
    CloseUIButton = {
        Enabled = true,
        Text = tr('Close UI')
    }
})

Window:SelectTab(1)

local Tabs = {
    Main = Window:Tab({Title = tr('Main'), Icon = 'grid-2x2'}),
    Settings = Window:Tab({Title = tr('Settings'), Icon = 'settings'}),
}

-- Connections
local connections = {
    FastClick = nil,
    AutoClaimAFK = nil,
    NoClip = nil
}

local function EnableNoClip()
    if connections.NoClip then connections.NoClip:Disconnect() end
    connections.NoClip = RunService.Stepped:Connect(function()
        if LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end)
end

local function DisableNoClip()
    if connections.NoClip then connections.NoClip:Disconnect() end
    connections.NoClip = nil
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = true end
        end
    end
end

local function TweenTeleport(targetCFrame)
    local character = LocalPlayer.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    EnableNoClip()
    local tween = TweenService:Create(hrp, TweenInfo.new(config.TeleportSpeed, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
    tween:Play()
    tween.Completed:Connect(function()
        DisableNoClip()
    end)
end

local function GetNearestMonster()
    if not config.SelectedMonster or not config.SelectedWorld then return nil end
    local character = LocalPlayer.Character
    if not character then return nil end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local enemiesFolder = Workspace:FindFirstChild("Server"):FindFirstChild("Enemies"):FindFirstChild(config.SelectedWorld)
    if not enemiesFolder then return nil end

    local closest, closestDistance = nil, math.huge
    for _, enemy in pairs(enemiesFolder:GetChildren()) do
        if enemy.Name == config.SelectedMonster and enemy:FindFirstChild("HumanoidRootPart") then
            local distance = (hrp.Position - enemy.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closest = enemy
                closestDistance = distance
            end
        end
    end
    return closest
end

local function TeleportToMonster()
    local monster = GetNearestMonster()
    if not monster then return false end
    local monsterHrp = monster:FindFirstChild("HumanoidRootPart")
    if not monsterHrp then return false end
    TweenTeleport(monsterHrp.CFrame * CFrame.new(0, 0, 5))
    return true
end

local function AttackMonster()
    local monster = GetNearestMonster()
    if not monster then return false end
    local args = {"Shadows", "Attack", "Attack_All", "World", monster}
    local success, err = pcall(function()
        Remotes:FireServer(unpack(args))
    end)
    if not success then
        warn("Attack failed:", err)
        return false
    end
    return true
end

local function UpdateMonsterList()
    if config.SelectedWorld then
        local success, enemiesFolder = pcall(function()
            return Workspace:FindFirstChild("Server"):FindFirstChild("Enemies"):FindFirstChild(config.SelectedWorld)
        end)
        if success and enemiesFolder then
            local uniqueNames = {}
            local enemyList = {}
            
            for _, enemy in pairs(enemiesFolder:GetChildren()) do
                if not uniqueNames[enemy.Name] then
                    table.insert(enemyList, enemy.Name)
                    uniqueNames[enemy.Name] = true
                end
            end
            
            if #enemyList > 0 then
                MonsterList:Refresh(enemyList, true)
            else
                MonsterList:Refresh({tr("No monsters found")}, false)
            end
            return true
        else
            MonsterList:Refresh({tr("No monsters found")}, false)
        end
    else
        MonsterList:Refresh({tr("Select a world first")}, false)
    end
    return false
end

-- Create MonsterList dropdown before using it
MonsterList = Tabs.Main:Dropdown({
    Title = tr('Monster List'),
    Desc = tr('Select Monster'),
    Image = 'chevron-down',
    List = {tr("Select a world first")},
    Value = tr('Select Monster'),
    Callback = function(v)
        if v ~= tr("Select a world first") and v ~= tr("No monsters found") then
            config.SelectedMonster = v
        end
    end,
})

Tabs.Main:Dropdown({
    Title = tr('Select World'),
    Desc = tr('Select World Before Selecting Monster'),
    Image = 'chevron-down',
    List = {"Shadow City", "Dragon World", "Slayer Island", "Marine Island", "Ninja Village", "Bleach Island"},
    Value = nil,
    Callback = function(v)
        config.SelectedWorld = v
        config.SelectedMonster = nil -- Reset selected monster when world changes
        UpdateMonsterList()
    end,
})

Tabs.Main:Toggle({
    Title = tr('Auto Click'),
    Desc = tr('Fast Autoclicking'),
    Image = 'toggle-right',
    Value = false,
    Callback = function(v)
        config.FastClick = v
        if connections.FastClick then connections.FastClick:Disconnect() end
        if v then
            connections.FastClick = RunService.Heartbeat:Connect(function()
                if config.FastClick then
                    pcall(function()
                        Remotes:FireServer("Shadows", "Attack", "Click")
                    end)
                end
            end)
        end
    end,
})

Tabs.Main:Toggle({
    Title = tr('Auto Attack + Teleport'),
    Desc = tr('Teleport and attack automatically'),
    Image = 'toggle-right',
    Value = false,
    Callback = function(v)
        config.AutoAttack = v
    end,
})

Tabs.Main:Toggle({
    Title = tr('Auto Claim AFK Gifts'),
    Desc = tr('Claim AFK Gifts Automatically'),
    Image = 'toggle-right',
    Value = false,
    Callback = function(v)
        config.AutoClaimAFK = v
        if connections.AutoClaimAFK then connections.AutoClaimAFK:Disconnect() end
        if v then
            connections.AutoClaimAFK = RunService.Heartbeat:Connect(function()
                if config.AutoClaimAFK then
                    pcall(function()
                        Remotes:FireServer("Shadows", "Claim", "AFK")
                        task.wait(0.1)
                        Remotes:FireServer("General", "Afk Rewards", "Collect")
                    end)
                end
            end)
        end
    end,
})

Tabs.Settings:Slider({
    Title = tr('Teleport Speed'),
    Desc = tr('Lower = faster teleport'),
    Image = 'chevron-up',
    Min = 0.1,
    Max = 2,
    Value = 0.5,
    Callback = function(v)
        config.TeleportSpeed = v
    end
})

spawn(function()
    while task.wait(0.1) do
        if config.AutoAttack then
            xpcall(function()
                TeleportToMonster()
                task.wait(0.2)
                AttackMonster()
            end, function(err)
                warn("AutoAttack error:", err)
            end)
        end
    end
end)

game:GetService("Players").LocalPlayer.CharacterRemoving:Connect(function()
    for _, connection in pairs(connections) do
        if connection then
            connection:Disconnect()
        end
    end
end)

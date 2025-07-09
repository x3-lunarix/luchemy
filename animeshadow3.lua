warn("------- Lumira Hub --------")
warn("Executor: " .. identifyexecutor())

-- Language settings
isThai = getgenv().thai or false
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
        ["No monsters found"] = "ไม่พบมอนสเตอร์",
        ["Select World"] = "เลือกโลก",
        ["Select World First"] = "กรุณาเลือกโลกก่อน",
        ["Auto Click"] = "คลิกอัตโนมัติ",
        ["Fast Autoclicking"] = "คลิกเร็วอัตโนมัติ",
        ["Auto Attack + Teleport"] = "โจมตีอัตโนมัติพร้อมวาร์ป",
        ["Teleport and attack automatically"] = "วาร์ปและโจมตีอัตโนมัติ",
        ["Auto Claim AFK Gifts"] = "รับของขวัญ AFK อัตโนมัติ",
        ["Claim AFK Gifts Automatically"] = "รับของขวัญเมื่อ AFK อัตโนมัติ",
        ["Teleport Speed"] = "ความเร็ววาร์ป",
        ["Lower = faster teleport"] = "ยิ่งน้อย ยิ่งวาร์ปเร็ว",
        ["Close UI"] = "ปิดเมนู",
        ["Refresh List"] = "รีเฟรชรายการ",
        ["Update monster list"] = "อัปเดตรายการมอนสเตอร์",
        ["Teleport Mode"] = "โหมดวาร์ป",
        ["Select teleport method"] = "เลือกวิธีการวาร์ป",
        ["Tween"] = "วาร์ปแบบลื่นไหล",
        ["Instant"] = "วาร์ปทันที",
        ["Run Speed"] = "ความเร็ววิ่ง",
        ["Jump Power"] = "พลังกระโดด",
        ["Anti-AFK"] = "ป้องกันการถูกเตะ",
        ["Prevent 20 minute AFK kick"] = "ป้องกันการถูกเตะเมื่อ AFK 20 นาที",
        ["ESP Selected Monster"] = "แสดงมอนสเตอร์ที่เลือก",
        ["Show selected monster with lines"] = "แสดงมอนสเตอร์ที่เลือกด้วยเส้น",
        ["Enable Speed"] = "เปิดใช้งานความเร็ว",
        ["Toggle run speed modification"] = "เปิด/ปิดการปรับความเร็ววิ่ง",
        ["Enable Jump"] = "เปิดใช้งานการกระโดด",
        ["Toggle jump power modification"] = "เปิด/ปิดการปรับพลังกระโดด",
        ["Default"] = "ค่าเริ่มต้น"
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
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Load UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x3-lunarix/lunarixhub/refs/heads/main/dummyui.lua"))()

-- Configurations
local config = {
    AutoAttack = false,
    FastClick = false,
    AutoClaimAFK = false,
    SelectedWorld = nil,
    SelectedMonster = nil,
    TeleportSpeed = 0.5,
    TeleportMode = "Tween",
    RunSpeed = 16,
    JumpPower = 50,
    AntiAFK = false,
    ESPMonster = false,
    EnableSpeed = false,
    EnableJump = false,
    DefaultWalkSpeed = 16,
    DefaultJumpPower = 50
}

-- ESP Variables
local ESP = {
    Enabled = false,
    Boxes = {},
    Lines = {},
    CurrentMonster = nil
}

-- Connections
local connections = {
    FastClick = nil,
    AutoClaimAFK = nil,
    NoClip = nil,
    AntiAFK = nil,
    ESP = nil,
    Character = nil
}

-- Functions
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

local function TeleportToTarget(targetCFrame)
    local character = LocalPlayer.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    if config.TeleportMode == "Instant" then
        EnableNoClip()
        hrp.CFrame = targetCFrame
        DisableNoClip()
    else
        EnableNoClip()
        local tween = TweenService:Create(hrp, TweenInfo.new(config.TeleportSpeed, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
        tween:Play()
        tween.Completed:Connect(function()
            DisableNoClip()
        end)
    end
end

local function GetNearestMonster()
    if not config.SelectedMonster or not config.SelectedWorld then return nil end
    local character = LocalPlayer.Character
    if not character then return nil end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    local success, enemiesFolder = pcall(function()
        return Workspace:FindFirstChild("Server"):FindFirstChild("Enemies"):FindFirstChild(config.SelectedWorld)
    end)
    
    if not success or not enemiesFolder then return nil end

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
    TeleportToTarget(monsterHrp.CFrame * CFrame.new(0, 0, 5))
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

-- Monster List Functions
local function UpdateMonsterList()
    if config.SelectedWorld then
        local success, enemiesFolder = pcall(function()
            return Workspace:WaitForChild("Server"):WaitForChild("Enemies"):WaitForChild(config.SelectedWorld)
        end)
        
        if success and enemiesFolder then
            pcall(function()
                MonsterList:Clear()
            end)
            
            local uniqueNames = {}
            for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                if not uniqueNames[enemy.Name] then
                    MonsterList:Add(enemy.Name)
                    uniqueNames[enemy.Name] = true
                end
            end
            
            if not next(uniqueNames) then
                MonsterList:Add(tr("No monsters found"))
            end
            return true
        end
    end
    return false
end

-- ESP Functions
local function ClearESP()
    for _, obj in pairs(ESP.Boxes) do
        if obj then obj:Remove() end
    end
    for _, obj in pairs(ESP.Lines) do
        if obj then obj:Remove() end
    end
    ESP.Boxes = {}
    ESP.Lines = {}
end

local function UpdateESP()
    if not config.ESPMonster or not config.SelectedMonster then
        ClearESP()
        return
    end

    local character = LocalPlayer.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local monster = GetNearestMonster()
    if not monster then
        ClearESP()
        return
    end

    -- Only update if monster changed
    if ESP.CurrentMonster == monster then return end
    ESP.CurrentMonster = monster
    ClearESP()

    -- Create ESP box
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESPBox"
    box.Adornee = monster:FindFirstChild("HumanoidRootPart") or monster:FindFirstChildWhichIsA("BasePart")
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = Vector3.new(4, 6, 4)
    box.Transparency = 0.5
    box.Color3 = Color3.fromRGB(255, 0, 0)
    box.Parent = monster
    table.insert(ESP.Boxes, box)

    -- Create ESP line
    local line = Instance.new("LineHandleAdornment")
    line.Name = "ESPLine"
    line.Adornee = hrp
    line.AlwaysOnTop = true
    line.ZIndex = 5
    line.Length = (hrp.Position - box.Adornee.Position).Magnitude
    line.Thickness = 1
    line.Color3 = Color3.fromRGB(255, 255, 0)
    line.CFrame = CFrame.new(hrp.Position:Lerp(box.Adornee.Position, 0.5), box.Adornee.Position)
    line.Parent = hrp
    table.insert(ESP.Lines, line)
end

-- Anti-AFK Function
local function ToggleAntiAFK(enable)
    if connections.AntiAFK then connections.AntiAFK:Disconnect() end
    if enable then
        connections.AntiAFK = RunService.Heartbeat:Connect(function()
            VirtualInputManager:SendKeyEvent(true, "W", false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, "W", false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(true, "A", false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, "A", false, game)
        end)
    end
end

-- Character Movement Setup
local function SetupCharacterMovement()
    if connections.Character then connections.Character:Disconnect() end
    connections.Character = LocalPlayer.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        
        -- Store default values
        config.DefaultWalkSpeed = humanoid.WalkSpeed
        config.DefaultJumpPower = humanoid.JumpPower
        
        humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if config.EnableSpeed then
                humanoid.WalkSpeed = config.RunSpeed
            else
                humanoid.WalkSpeed = config.DefaultWalkSpeed
            end
        end)
        
        humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
            if config.EnableJump then
                humanoid.JumpPower = config.JumpPower
            else
                humanoid.JumpPower = config.DefaultJumpPower
            end
        end)
        
        -- Apply initial values
        if config.EnableSpeed then
            humanoid.WalkSpeed = config.RunSpeed
        else
            humanoid.WalkSpeed = config.DefaultWalkSpeed
        end
        
        if config.EnableJump then
            humanoid.JumpPower = config.JumpPower
        else
            humanoid.JumpPower = config.DefaultJumpPower
        end
    end)
    
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            -- Store default values
            config.DefaultWalkSpeed = humanoid.WalkSpeed
            config.DefaultJumpPower = humanoid.JumpPower
            
            if config.EnableSpeed then
                humanoid.WalkSpeed = config.RunSpeed
            else
                humanoid.WalkSpeed = config.DefaultWalkSpeed
            end
            
            if config.EnableJump then
                humanoid.JumpPower = config.JumpPower
            else
                humanoid.JumpPower = config.DefaultJumpPower
            end
        end
    end
end

-- UI Setup
local Window = Library:Window({
    Title = 'Lumira Hub',
    Desc = 'Anime Shadow 2',
    Icon = 'sun-moon',
    Theme = 'Dark',
    Config = {
        Keybind = Enum.KeyCode.RightControl,
        Size = UDim2.new(0, 530, 0, 450)
    },
    CloseUIButton = {
        Enabled = true,
        Text = tr('Close UI')
    }
})

Window:SelectTab(1)

local Tabs = {
    Main = Window:Tab({Title = tr('Main'), Icon = 'grid-2x2'}),
    Settings = Window:Tab({Title = tr('Settings'), Icon = 'settings', Compact = true}),
}

-- Main Tab
local MonsterList = Tabs.Main:Dropdown({
    Title = tr('Monster List'),
    Desc = tr('Select Monster'),
    Image = 'chevron-down',
    List = {},
    Value = tr('Select World First'),
    Callback = function(v)
        if v ~= tr("No monsters found") and v ~= tr("Select World First") then
            config.SelectedMonster = v
            if config.ESPMonster then
                UpdateESP()
            end
        end
    end,
})

local WorldDropdown = Tabs.Main:Dropdown({
    Title = tr('Select World'),
    Desc = tr('Select World Before Selecting Monster'),
    Image = 'globe',
    List = {"Shadow City", "Dragon World", "Slayer Island", "Marine Island", "Ninja Village", "Bleach Island"},
    Value = nil,
    Callback = function(v)
        config.SelectedWorld = v
        config.SelectedMonster = nil
        UpdateMonsterList()
        if config.ESPMonster then
            UpdateESP()
        end
    end,
})

Tabs.Main:Button({
    Title = tr('Refresh List'),
    Desc = tr('Update monster list'),
    Image = 'refresh-ccw',
    Callback = UpdateMonsterList
})

Tabs.Main:Dropdown({
    Title = tr('Teleport Mode'),
    Desc = tr('Select teleport method'),
    Image = 'move',
    List = {tr("Tween"), tr("Instant")},
    Value = tr("Tween"),
    Callback = function(v)
        config.TeleportMode = v == tr("Tween") and "Tween" or "Instant"
    end
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

-- Settings Tab (Compact)
Tabs.Settings:Toggle({
    Title = tr('Enable Speed'),
    Desc = tr('Toggle run speed modification'),
    Image = 'toggle-right',
    Value = false,
    Callback = function(v)
        config.EnableSpeed = v
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if v then
                    humanoid.WalkSpeed = config.RunSpeed
                else
                    humanoid.WalkSpeed = config.DefaultWalkSpeed
                end
            end
        end
    end
})

Tabs.Settings:Slider({
    Title = tr('Run Speed'),
    Desc = 'Adjust running speed',
    Image = 'chevron-up',
    Min = 16,
    Max = 200,
    Value = config.RunSpeed,
    Callback = function(v)
        config.RunSpeed = v
        if config.EnableSpeed and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = v
            end
        end
    end
})

Tabs.Settings:Toggle({
    Title = tr('Enable Jump'),
    Desc = tr('Toggle jump power modification'),
    Image = 'toggle-right',
    Value = false,
    Callback = function(v)
        config.EnableJump = v
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if v then
                    humanoid.JumpPower = config.JumpPower
                else
                    humanoid.JumpPower = config.DefaultJumpPower
                end
            end
        end
    end
})

Tabs.Settings:Slider({
    Title = tr('Jump Power'),
    Desc = 'Adjust jump height',
    Image = 'chevron-up',
    Min = 50,
    Max = 200,
    Value = config.JumpPower,
    Callback = function(v)
        config.JumpPower = v
        if config.EnableJump and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = v
            end
        end
    end
})

Tabs.Settings:Toggle({
    Title = tr('Anti-AFK'),
    Desc = tr('Prevent 20 minute AFK kick'),
    Image = 'toggle-right',
    Value = false,
    Callback = function(v)
        config.AntiAFK = v
        ToggleAntiAFK(v)
    end
})

Tabs.Settings:Toggle({
    Title = tr('ESP Selected Monster'),
    Desc = tr('Show selected monster with lines'),
    Image = 'toggle-right',
    Value = false,
    Callback = function(v)
        config.ESPMonster = v
        if v then
            if connections.ESP then connections.ESP:Disconnect() end
            connections.ESP = RunService.Heartbeat:Connect(function()
                UpdateESP()
            end)
        else
            if connections.ESP then connections.ESP:Disconnect() end
            ClearESP()
        end
    end
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

-- Main loop for auto attack
spawn(function()
    while task.wait(0.1) do
        if config.AutoAttack then
            xpcall(function()
                if TeleportToMonster() then
                    task.wait(0.2)
                    AttackMonster()
                end
            end, function(err)
                warn("AutoAttack error:", err)
            end)
        end
    end
end)

-- Initialize character movement
SetupCharacterMovement()

-- Cleanup on character removal
LocalPlayer.CharacterRemoving:Connect(function()
    for name, connection in pairs(connections) do
        if name ~= "Character" and connection then
            connection:Disconnect()
        end
    end
    ClearESP()
end)

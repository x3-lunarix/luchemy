warn("[ Project-Sindex ] - Executed!")
warn("[ Project-Sindex ] - Updated to Latest Blox Fruits Update!")

local TweenService = game:GetService("TweenService")

local Loader = Instance.new("ScreenGui")
Loader.Name = "LumiraV2Loader"
Loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loader.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 450, 0, 260)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BackgroundTransparency = 0.15
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = Loader

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 18)
UICorner.Parent = Main

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 180, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 100, 255))
})
Gradient.Rotation = 45
Gradient.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 420, 0, 50)
Title.Position = UDim2.new(0.5, 0, 0.12, 0)
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.BackgroundTransparency = 1
Title.Text = "Lumira V2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
Title.TextSize = 28
Title.TextTransparency = 1
Title.Parent = Main

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(0, 420, 0, 25)
SubTitle.Position = UDim2.new(0.5, 0, 0.28, 0)
SubTitle.AnchorPoint = Vector2.new(0.5, 0)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Updated to Latest Blox Fruits Update"
SubTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
SubTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
SubTitle.TextSize = 16
SubTitle.TextTransparency = 1
SubTitle.Parent = Main

local Executor = Instance.new("TextLabel")
Executor.Size = UDim2.new(0, 420, 0, 25)
Executor.Position = UDim2.new(0.5, 0, 0.42, 0)
Executor.AnchorPoint = Vector2.new(0.5, 0)
Executor.BackgroundTransparency = 1
Executor.Text = "Executor: " .. (identifyexecutor and identifyexecutor() or "Unknown")
Executor.TextColor3 = Color3.fromRGB(200, 200, 200)
Executor.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
Executor.TextSize = 16
Executor.TextTransparency = 1
Executor.Parent = Main

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(0, 420, 0, 25)
Status.Position = UDim2.new(0.5, 0, 0.56, 0)
Status.AnchorPoint = Vector2.new(0.5, 0)
Status.BackgroundTransparency = 1
Status.Text = "0%"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
Status.TextSize = 16
Status.TextTransparency = 1
Status.Parent = Main

local BarBG = Instance.new("Frame")
BarBG.Size = UDim2.new(0, 380, 0, 12)
BarBG.Position = UDim2.new(0.5, 0, 0.72, 0)
BarBG.AnchorPoint = Vector2.new(0.5, 0)
BarBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BarBG.BackgroundTransparency = 0.25
BarBG.BorderSizePixel = 0
BarBG.Parent = Main

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 6)
BarCorner.Parent = BarBG

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(90, 180, 255)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBG

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(0, 6)
BarFillCorner.Parent = BarFill

local BarGradient = Instance.new("UIGradient")
BarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 180, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 100, 255))
})
BarGradient.Rotation = 45
BarGradient.Parent = BarFill

local Thanks = Instance.new("TextLabel")
Thanks.Size = UDim2.new(0, 420, 0, 25)
Thanks.Position = UDim2.new(0.5, 0, 0.88, 0)
Thanks.AnchorPoint = Vector2.new(0.5, 0)
Thanks.BackgroundTransparency = 1
Thanks.Text = "❤️ Thanks for selecting Lumira Hub ❤️"
Thanks.TextColor3 = Color3.fromRGB(255, 170, 200)
Thanks.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
Thanks.TextSize = 16
Thanks.TextTransparency = 1
Thanks.Parent = Main

local function UpdateStatus(pct)
    Status.Text = pct .. "%"
    TweenService:Create(BarFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(pct / 100, 0, 1, 0)
    }):Play()
end

local function AnimateLoader()
    local fadeIn = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    TweenService:Create(Title, fadeIn, { TextTransparency = 0 }):Play()
    TweenService:Create(SubTitle, fadeIn, { TextTransparency = 0 }):Play()
    TweenService:Create(Executor, fadeIn, { TextTransparency = 0 }):Play()
    TweenService:Create(Status, fadeIn, { TextTransparency = 0 }):Play()
    TweenService:Create(Thanks, fadeIn, { TextTransparency = 0 }):Play()

    task.wait(0.8)

    for i = 0, 100, 2 do
        UpdateStatus(i)
        task.wait(0.07)
    end

    local fadeOut = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(Main, fadeOut, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(Title, fadeOut, { TextTransparency = 1 }):Play()
    TweenService:Create(SubTitle, fadeOut, { TextTransparency = 1 }):Play()
    TweenService:Create(Executor, fadeOut, { TextTransparency = 1 }):Play()
    TweenService:Create(Status, fadeOut, { TextTransparency = 1 }):Play()
    TweenService:Create(Thanks, fadeOut, { TextTransparency = 1 }):Play()
    TweenService:Create(BarBG, fadeOut, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(BarFill, fadeOut, { BackgroundTransparency = 1 }):Play()

    task.wait(1.2)
    Loader:Destroy()
end

AnimateLoader()

local Notification = require(game:GetService("ReplicatedStorage").Notification)
Notification.new("<Color=Green>[ Project Sindex] - Thanks for using Sindex hub<Color=/>"):Display()

local sindex = getgenv() or getfenv() or getsenv()
local Sindex = getgenv() or getfenv() or getsenv()

--- Check Level

First_Sea = false
Second_Sea = false
Third_Sea = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    First_Sea = true
elseif placeId == 4442272183 then
    Second_Sea = true
elseif placeId == 7449423635 then
    Third_Sea = true
end

function CheckLevel()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if First_Sea then
        local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
        if Lv == 1 or Lv <= 9 or Env.SelectMonster == "Bandit [Lv. 5]" then -- Bandit
            Ms = "Bandit"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif Lv == 10 or Lv <= 14 or Env.SelectMonster == "Monkey [Lv. 14]" then -- Monkey
            Ms = "Monkey"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif Lv == 15 or Lv <= 29 or Env.SelectMonster == "Gorilla [Lv. 20]" then -- Gorilla
            Ms = "Gorilla"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
        elseif Lv == 30 or Lv <= 39 or Env.SelectMonster == "Pirate [Lv. 35]" then -- Pirate
            Ms = "Pirate"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif Lv == 40 or Lv <= 59 or Env.SelectMonster == "Brute [Lv. 45]" then -- Brute
            Ms = "Brute"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif Lv == 60 or Lv <= 74 or Env.SelectMonster == "Desert Bandit [Lv. 60]" then -- Desert Bandit
            Ms = "Desert Bandit"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif Lv == 75 or Lv <= 89 or Env.SelectMonster == "Desert Officer [Lv. 70]" then -- Desert Officer
            Ms = "Desert Officer"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif Lv == 90 or Lv <= 99 or Env.SelectMonster == "Snow Bandit [Lv. 90]" then -- Snow Bandit
            Ms = "Snow Bandit"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif Lv == 100 or Lv <= 119 or Env.SelectMonster == "Snowman [Lv. 100]" then -- Snowman
            Ms = "Snowman"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif Lv == 120 or Lv <= 149 or Env.SelectMonster == "Chief Petty Officer [Lv. 120]" then -- Chief Petty Officer
            Ms = "Chief Petty Officer"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif Lv == 150 or Lv <= 174 or Env.SelectMonster == "Sky Bandit [Lv. 150]" then -- Sky Bandit
            Ms = "Sky Bandit"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif Lv == 175 or Lv <= 189 or Env.SelectMonster == "Dark Master [Lv. 175]" then -- Dark Master
            Ms = "Dark Master"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif Lv == 190 or Lv <= 209 or Env.SelectMonster == "Prisoner [Lv. 190]" then -- Prisoner
            Ms = "Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 1
            NameMon = "Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
        elseif Lv == 210 or Lv <= 249 or Env.SelectMonster == "Dangerous Prisoner [Lv. 210]" then -- Dangerous Prisoner
            Ms = "Dangerous Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 2
            NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
        elseif Lv == 250 or Lv <= 274 or Env.SelectMonster == "Toga Warrior [Lv. 250]" then -- Toga Warrior
            Ms = "Toga Warrior"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif Lv == 275 or Lv <= 299 or Env.SelectMonster == "Gladiator [Lv. 275]" then -- Gladiator
            Ms = "Gladiator"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
        elseif Lv == 300 or Lv <= 324 or Env.SelectMonster == "Military Soldier [Lv. 300]" then -- Military Soldier
            Ms = "Military Soldier"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
        elseif Lv == 325 or Lv <= 374 or Env.SelectMonster == "Military Spy [Lv. 325]" then -- Military Spy
            Ms = "Military Spy"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
        elseif Lv == 375 or Lv <= 399 or Env.SelectMonster == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior 
            Ms = "Fishman Warrior"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Lv == 400 or Lv <= 449 or Env.SelectMonster == "Fishman Commando [Lv. 400]" then -- Fishman Commando
            Ms = "Fishman Commando"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif Lv == 450 or Lv <= 474 or Env.SelectMonster == "God's Guard [Lv. 450]" then -- God's Guard
            Ms = "God's Guard"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif Lv == 475 or Lv <= 524 or Env.SelectMonster == "Shanda [Lv. 475]" then -- Shanda
            Ms = "Shanda"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif Lv == 525 or Lv <= 549 or Env.SelectMonster == "Royal Squad [Lv. 525]" then -- Royal Squad
            Ms = "Royal Squad"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif Lv == 550 or Lv <= 624 or Env.SelectMonster == "Royal Soldier [Lv. 550]" then -- Royal Soldier
            Ms = "Royal Soldier"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif Lv == 625 or Lv <= 649 or Env.SelectMonster == "Galley Pirate [Lv. 625]" then -- Galley Pirate
            Ms = "Galley Pirate"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif Lv >= 650 or Env.SelectMonster == "Galley Captain [Lv. 650]" then -- Galley Captain
            Ms = "Galley Captain"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if Second_Sea then
        local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
        if Lv == 700 or Lv <= 724 or Env.SelectMonster == "Raider [Lv. 700]" then -- Raider
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif Lv == 725 or Lv <= 774 or Env.SelectMonster == "Mercenary [Lv. 725]" then -- Mercenary
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
        elseif Lv == 775 or Lv <= 799 or Env.SelectMonster == "Swan Pirate [Lv. 775]" then -- Swan Pirate
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif Lv == 800 or Lv <= 874 or Env.SelectMonster == "Factory Staff [Lv. 800]" then -- Factory Staff
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
        elseif Lv == 875 or Lv <= 899 or Env.SelectMonster == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
        elseif Lv == 900 or Lv <= 949 or Env.SelectMonster == "Marine Captain [Lv. 900]" then -- Marine Captain
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
        elseif Lv == 950 or Lv <= 974 or Env.SelectMonster == "Zombie [Lv. 950]" then -- Zombie
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif Lv == 975 or Lv <= 999 or Env.SelectMonster == "Vampire [Lv. 975]" then -- Vampire
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
        elseif Lv == 1000 or Lv <= 1049 or Env.SelectMonster == "Snow Trooper [Lv. 1000]" then -- Snow Trooper
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif Lv == 1050 or Lv <= 1099 or Env.SelectMonster == "Winter Warrior [Lv. 1050]" then -- Winter Warrior
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif Lv == 1100 or Lv <= 1124 or Env.SelectMonster == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
        elseif Lv == 1125 or Lv <= 1174 or Env.SelectMonster == "Horned Warrior [Lv. 1125]" then -- Horned Warrior
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
        elseif Lv == 1175 or Lv <= 1199 or Env.SelectMonster == "Magma Ninja [Lv. 1175]" then -- Magma Ninja
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif Lv == 1200 or Lv <= 1249 or Env.SelectMonster == "Lava Pirate [Lv. 1200]" then -- Lava Pirate
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif Lv == 1250 or Lv <= 1274 or Env.SelectMonster == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif Lv == 1275 or Lv <= 1299 or Env.SelectMonster == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif Lv == 1300 or Lv <= 1324 or Env.SelectMonster == "Ship Steward [Lv. 1300]" then -- Ship Steward
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif Lv == 1325 or Lv <= 1349 or Env.SelectMonster == "Ship Officer [Lv. 1325]" then -- Ship Officer
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif Lv == 1350 or Lv <= 1374 or Env.SelectMonster == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
            if (LevelFarmQuest or LevelFarmNoQuest or SelectMonster_Quest_Farm or SelectMonster_NoQuest_Farm or DevilMastery_Farm) and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            end
        elseif Lv == 1375 or Lv <= 1424 or Env.SelectMonster == "Snow Lurker [Lv. 1375]" then -- Snow Lurker
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif Lv == 1425 or Lv <= 1449 or Env.SelectMonster == "Sea Soldier [Lv. 1425]" then -- Sea Soldier
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif Lv >= 1450 or Env.SelectMonster == "Water Fighter [Lv. 1450]" then -- Water Fighter
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
        end
    end
    if Third_Sea then
        local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
        if Lv == 1500 or Lv <= 1524 or Env.SelectMonster == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire
            Ms = "Pirate Millionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 1
            NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
        elseif Lv == 1525 or Lv <= 1574 or Env.SelectMonster == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billoonaire
            Ms = "Pistol Billionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 2
            NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
        elseif Lv == 1575 or Lv <= 1599 or Env.SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior
            Ms = "Dragon Crew Warrior"
            NameQuest = "DragonCrewQuest"
            QuestLv = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(6735.11084, 126.990463, -711.097961, 0.629286051, -0, -0.777173758, 0, 1, -0, 0.777173758, 0, 0.629286051)
            CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
        elseif Lv == 1600 or Lv <= 1624 or Env.SelectMonster == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer
            Ms = "Dragon Crew Archer"
            NameQuest = "DragonCrewQuest"
            QuestLv = 2
            NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(6735.11084, 126.990463, -711.097961, 0.629286051, -0, -0.777173758, 0, 1, -0, 0.777173758, 0, 0.629286051)
            CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
        elseif Lv == 1625 or Lv <= 1649 or Env.SelectMonster == "Hydra Enforcer [Lv. 1625]" then -- Female Islander 
            Ms = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            QuestLv = 1
            NameMon = "Hydra Enforcer"
            CFrameQ = CFrame.new(5214.33936, 1003.46765, 759.507324, 0.998771548, 0, 0.0495514274, 0, 1, 0, -0.0495514274, 0, 0.9987715)
            CFrameMon = CFrame.new(5195.61182, 1089.23682, 617.974304, -0.546986341, -1.6157415e-08, 0.837141514, -3.3323051e-08, 1, -2.47250798e-09, -0.837141514, -2.92485378e-08, -0.546986341)
        elseif Lv == 1650 or Lv <= 1699 or Env.SelectMonster == "Venomous Assailant [Lv. 1650]" then -- Giant Islander
            Ms = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            QuestLv = 2
            NameMon = "Venomous Assailant"
            CFrameQ = CFrame.new(5214.33936, 1003.46765, 759.507324, 0.998771548, 0, 0.0495514274, 0, 1, 0, -0.0495514274, 0, 0.9987715)
            CFrameMon = CFrame.new(5195.61182, 1089.23682, 617.974304, -0.546986341, -1.6157415e-08, 0.837141514, -3.3323051e-08, 1, -2.47250798e-09, -0.837141514, -2.92485378e-08, -0.546986341)
        elseif Lv == 1700 or Lv <= 1724 or Env.SelectMonster == "Marine Commodore [Lv. 1700]" then -- Marine Commodore
            Ms = "Marine Commodore"
            NameQuest = "MarineTreeIsland"
            QuestLv = 1
            NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
        elseif Lv == 1725 or Lv <= 1774 or Env.SelectMonster == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral
            Ms = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            QuestLv = 2
            NameMon = "Marine Rear Admiral"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
        elseif Lv == 1775 or Lv <= 1799 or Env.SelectMonster == "Fishman Raider [Lv. 1775]" then -- Fishman Raide
            Ms = "Fishman Raider"
            NameQuest = "DeepForestIsland3"
            QuestLv = 1
            NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
            CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
        elseif Lv == 1800 or Lv <= 1824 or Env.SelectMonster == "Fishman Captain [Lv. 1800]" then -- Fishman Captain
            Ms = "Fishman Captain"
            NameQuest = "DeepForestIsland3"
            QuestLv = 2
            NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
            CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
        elseif Lv == 1825 or Lv <= 1849 or Env.SelectMonster == "Forest Pirate [Lv. 1825]" then -- Forest Pirate
            Ms = "Forest Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 1
            NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
        elseif Lv == 1850 or Lv <= 1899 or Env.SelectMonster == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate
            Ms = "Mythological Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 2
            NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
        elseif Lv == 1900 or Lv <= 1924 or Env.SelectMonster == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate
            Ms = "Jungle Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 1
            NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
        elseif Lv == 1925 or Lv <= 1974 or Env.SelectMonster == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate
            Ms = "Musketeer Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 2
            NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
        elseif Lv == 1975 or Lv <= 1999 or Env.SelectMonster == "Reborn Skeleton [Lv. 1975]" then
            Ms = "Reborn Skeleton"
            NameQuest = "HauntedQuest1"
            QuestLv = 1
            NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
            CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
        elseif Lv == 2000 or Lv <= 2024 or Env.SelectMonster == "Living Zombie [Lv. 2000]" then
            Ms = "Living Zombie"
            NameQuest = "HauntedQuest1"
            QuestLv = 2
            NameMon = "Living Zombie"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
            CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
        elseif Lv == 2025 or Lv <= 2049 or Env.SelectMonster == "Demonic Soul [Lv. 2025]" then
            Ms = "Demonic Soul"
            NameQuest = "HauntedQuest2"
            QuestLv = 1
            NameMon = "Demonic Soul"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
        elseif Lv == 2050 or Lv <= 2074 or Env.SelectMonster == "Posessed Mummy [Lv. 2050]" then
            Ms = "Posessed Mummy"
            NameQuest = "HauntedQuest2"
            QuestLv = 2
            NameMon = "Posessed Mummy"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif Lv == 2075 or Lv <= 2099 or Env.SelectMonster == "Peanut Scout [Lv. 2075]" then
            Ms = "Peanut Scout"
            NameQuest = "NutsIslandQuest"
            QuestLv = 1
            NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif Lv == 2100 or Lv <= 2124 or Env.SelectMonster == "Peanut President [Lv. 2100]" then
            Ms = "Peanut President"
            NameQuest = "NutsIslandQuest"
            QuestLv = 2
            NameMon = "Peanut President"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif Lv == 2125 or Lv <= 2149 or Env.SelectMonster == "Ice Cream Chef [Lv. 2125]" then
            Ms = "Ice Cream Chef"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
        elseif Lv == 2150 or Lv <= 2199 or Env.SelectMonster == "Ice Cream Commander [Lv. 2150]" then
            Ms = "Ice Cream Commander"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
        elseif Lv == 2200 or Lv <= 2224 or Env.SelectMonster == "Cookie Crafter [Lv. 2200]" then
            Ms = "Cookie Crafter"
            NameQuest = "CakeQuest1"
            QuestLv = 1
            NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
        elseif Lv == 2225 or Lv <= 2249 or Env.SelectMonster == "Cake Guard [Lv. 2225]" then
            Ms = "Cake Guard"
            NameQuest = "CakeQuest1"
            QuestLv = 2
            NameMon = "Cake Guard"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
        elseif Lv == 2250 or Lv <= 2274 or Env.SelectMonster == "Baking Staff [Lv. 2250]" then
            Ms = "Baking Staff"
            NameQuest = "CakeQuest2"
            QuestLv = 1
            NameMon = "Baking Staff"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
        elseif Lv == 2275 or Lv <= 2299 or Env.SelectMonster == "Head Baker [Lv. 2275]" then
            Ms = "Head Baker"
            NameQuest = "CakeQuest2"
            QuestLv = 2
            NameMon = "Head Baker"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
        elseif Lv == 2300 or Lv <= 2324 or Env.SelectMonster == "Cocoa Warrior [Lv. 2300]" then
            Ms = "Cocoa Warrior"
            NameQuest ="ChocQuest1"
            QuestLv = 1
            NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
        elseif Lv == 2325 or Lv <= 2349 or Env.SelectMonster == "Chocolate Bar Battler [Lv. 2325]" then
            Ms = "Chocolate Bar Battler"
            NameQuest = "ChocQuest1"
            QuestLv = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
        elseif Lv == 2350 or Lv <= 2374 or Env.SelectMonster == "Sweet Thief [Lv. 2350]" then
            Ms = "Sweet Thief"
            NameQuest = "ChocQuest2"
            QuestLv = 1
            NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
        elseif Lv == 2375 or Lv <= 2400 or Env.SelectMonster == "Candy Rebel [Lv. 2375]" then
            Ms = "Candy Rebel"
            NameQuest = "ChocQuest2"
            QuestLv = 2
            NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
        elseif Lv == 2400 or Lv <= 2424 or Env.SelectMonster == "Candy Pirate [Lv. 2400]" then
            Ms = "Candy Pirate"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
        elseif Lv == 2425 or Lv <= 2449 or Env.SelectMonster == "Snow Demon [Lv. 2425]" then
            Ms = "Snow Demon"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)

        elseif Lv == 2450 or Lv <= 2474 or Env.SelectMonster == "Isle Outlaw [Lv. 2450]" then
            Ms = "Isle Outlaw"
            NameQuest = "TikiQuest1"
            QuestLv = 1
            NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566)
            CFrameMon = CFrame.new(-16122.4062, 10.6328173, -257.351685, -0.630029082, 0, 0.776571631, 0, 1, 0, -0.776571631, 0, -0.630029082)
        elseif Lv == 2475 or Lv <= 2499 or Env.SelectMonster == "Island Boy [Lv. 2475]" then
            Ms = "Island Boy"
            NameQuest = "TikiQuest1"
            QuestLv = 2
            NameMon = "Island Boy"
            CFrameQ = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566)
            CFrameMon = CFrame.new(-16736.2266, 20.533947, -131.718811, 0.546393692, 0, 0.837528467, 0, 1, 0, -0.837528467, 0, 0.546393692)
        elseif Lv == 2500 or Lv <= 2524 or Env.SelectMonster == "Sun-kissed Warrior [Lv. 2500]" then
            Ms = "Sun-kissed Warrior"
            NameQuest = "TikiQuest2"
            QuestLv = 1
            NameMon = "Sun-kissed Warrior"
            CFrameQ = CFrame.new(-16541.0215, 54.770813, 1051.46118, 0.0410757065, -0, -0.999156058, 0, 1, -0, 0.999156058, 0, 0.0410757065)
            CFrameMon = CFrame.new(-16413.5078, 54.6350479, 1054.43555, -0.999391913, 0, -0.034868788, 0, 1, 0, 0.034868788, 0, -0.999391913)
        elseif Lv == 2525 or Lv <= 2549 or Env.SelectMonster == "Isle Champion [Lv. 2525]" then
            Ms = "Isle Champion"
            NameQuest = "TikiQuest2"
            QuestLv = 2
            NameMon = "Isle Champion"
            CFrameQ = CFrame.new(-16541.0215, 54.770813, 1051.46118, 0.0410757065, -0, -0.999156058, 0, 1, -0, 0.999156058, 0, 0.0410757065)
            CFrameMon = CFrame.new(-16787.3203, 20.6350517, 992.131836, -0.775471091, 0, 0.631383121, 0, 1, 0, -0.631383121, 0, -0.775471091)
        elseif Lv == 2550 or Lv <= 2574 or Env.SelectMonster == "Serpent Hunter [Lv. 2550]" then
            Ms = "Serpent Hunter"
            NameQuest = "TikiQuest3"
            QuestLv = 1
            NameMon = "Serpent Hunter"
            CFrameQ = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-16654.7754, 105.286232, 1579.67444, 0.999096751, 4.45934489e-08, 0.0424928814, -4.38822667e-08, 1, -1.76692847e-08, -0.0424928814, 1.57886415e-08, 0.999096751)
        elseif Lv == 2575 or Lv <= 2599 or Env.SelectMonster == "Skull Slayer [Lv. 2575]" then
            Ms = "Skull Slayer"
            NameQuest = "TikiQuest3"
            QuestLv = 2
            NameMon = "Skull Slayer"
            CFrameQ = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-16654.7754, 105.286232, 1579.67444, 0.999096751, 4.45934489e-08, 0.0424928814, -4.38822667e-08, 1, -1.76692847e-08, -0.0424928814, 1.57886415e-08, 0.999096751)
            elseif Lv == 2600 or Lv <= 2624 or Env.SelectMonster == "Reef Bandit [Lv. 2600]" then
            Ms = "Reef Bandit"
            NameQuest = "SubmergedQuest1"
            QuestLv = 1
            NameMon = "Reef Bandit"
            CFrameQ = CFrame.new(10778.8496, -2087.71338, 9260.76758, 0.254936904, -4.35733618e-08, -0.966957688, -2.55894843e-08, 1, -5.18089536e-08, 0.966957688, 3.79519633e-08, 0.254936904)
            CFrameMon = CFrame.new(11052.75, -2084.71289, 9152.53711, -0.773495615, -7.13662907e-10, 0.633801639, -8.58463578e-10, 1, 7.83291002e-11, -0.633801639, -4.835084e-10, -0.773495615)
        elseif Lv == 2625 or Lv <= 2649 or Env.SelectMonster == "Coral Pirates [Lv. 2625]" then
            Ms = "Coral Pirate"
            NameQuest = "SubmergedQuest1"
            QuestLv = 2
            NameMon = "Coral Pirates"
            CFrameQ = CFrame.new(10778.8496, -2087.71338, 9260.76758, 0.254936904, -4.35733618e-08, -0.966957688, -2.55894843e-08, 1, -5.18089536e-08, 0.966957688, 3.79519633e-08, 0.254936904)
            CFrameMon = CFrame.new(10670.4717, -2053.29297, 9281.41895, 0.708642364, -4.16000745e-08, 0.705567837, 9.98025218e-09, 1, 4.89359664e-08, -0.705567837, -2.76363554e-08, 0.708642364)
        elseif Lv == 2650 or Lv <= 2674 or Env.SelectMonster == "Sea Chanter [Lv. 2650]" then
            Ms = "Sea Chanter"
            NameQuest = "SubmergedQuest2"
            QuestLv = 1
            NameMon = "Sea Chanter"
            CFrameQ = CFrame.new(10883.1201, -2086.1897, 10035.7256, 0.582791984, 2.62260293e-08, -0.812621355, 9.86950188e-10, 1, 3.2981184e-08, 0.812621355, -2.00231867e-08, 0.582791984)
            CFrameMon = CFrame.new(10638.0596, -2046.32092, 10057.8281, -0.148388281, -4.43093171e-08, -0.988929152, -2.01947294e-08, 1, -4.17751416e-08, 0.988929152, 1.37722154e-08, -0.148388281)
        elseif Lv >= 2675 or Env.SelectMonster == "Ocean Prophet [Lv. 2675]" then
            Ms = "Ocean Prophet"
            NameQuest = "SubmergedQuest2"
            QuestLv = 2
            NameMon = "Ocean Prophet"
            CFrameQ = CFrame.new(10883.1201, -2086.1897, 10035.7256, 0.582791984, 2.62260293e-08, -0.812621355, 9.86950188e-10, 1, 3.2981184e-08, 0.812621355, -2.00231867e-08, 0.582791984)
            CFrameMon = CFrame.new(11046.1992, -1979.58191, 10196.0244, 0.815879762, 1.47977355e-08, 0.57822156, -3.88164985e-08, 1, 2.91788833e-08, -0.57822156, -4.62509959e-08, 0.815879762)
        end
    end
end

if First_Sea then
    tableMon = {"Empty","Bandit [Lv. 5]","Monkey [Lv. 14]","Gorilla [Lv. 20]","Pirate [Lv. 35]","Brute [Lv. 45]","Desert Bandit [Lv. 60]","Desert Officer [Lv. 70]","Snow Bandit [Lv. 90]","Snowman [Lv. 100]","Chief Petty Officer [Lv. 120]","Sky Bandit [Lv. 150]","Dark Master [Lv. 175]","Prisoner [Lv. 190]", "Dangerous Prisoner [Lv. 210]","Toga Warrior [Lv. 250]","Gladiator [Lv. 275]","Military Soldier [Lv. 300]","Military Spy [Lv. 325]","Fishman Warrior [Lv. 375]","Fishman Commando [Lv. 400]","God's Guard [Lv. 450]","Shanda [Lv. 475]","Royal Squad [Lv. 525]","Royal Soldier [Lv. 550]","Galley Pirate [Lv. 625]","Galley Captain [Lv. 650]"}
elseif Second_Sea then
    tableMon = {"Empty","Raider [Lv. 700]","Mercenary [Lv. 725]","Swan Pirate [Lv. 775]","Factory Staff [Lv. 800]","Marine Lieutenant [Lv. 875]","Marine Captain [Lv. 900]","Zombie [Lv. 950]","Vampire [Lv. 975]","Snow Trooper [Lv. 1000]","Winter Warrior [Lv. 1050]","Lab Subordinate [Lv. 1100]","Horned Warrior [Lv. 1125]","Magma Ninja [Lv. 1175]","Lava Pirate [Lv. 1200]","Ship Deckhand [Lv. 1250]","Ship Engineer [Lv. 1275]","Ship Steward [Lv. 1300]","Ship Officer [Lv. 1325]","Arctic Warrior [Lv. 1350]","Snow Lurker [Lv. 1375]","Sea Soldier [Lv. 1425]","Water Fighter [Lv. 1450]"}
elseif Third_Sea then
    tableMon = {"Empty","Pirate Millionaire [Lv. 1500]","Dragon Crew Warrior [Lv. 1575]","Dragon Crew Archer [Lv. 1600]","Hydra Enforcer [Lv. 1625]","Venomous Assailant [Lv. 1650]","Marine Commodore [Lv. 1700]","Marine Rear Admiral [Lv. 1725]","Fishman Raider [Lv. 1775]","Fishman Captain [Lv. 1800]","Forest Pirate [Lv. 1825]","Mythological Pirate [Lv. 1850]","Jungle Pirate [Lv. 1900]","Musketeer Pirate [Lv. 1925]","Reborn Skeleton [Lv. 1975]","Living Zombie [Lv. 2000]","Demonic Soul [Lv. 2025]","Posessed Mummy [Lv. 2050]", "Peanut Scout [Lv. 2075]", "Peanut President [Lv. 2100]", "Ice Cream Chef [Lv. 2125]", "Ice Cream Commander [Lv. 2150]", "Cookie Crafter [Lv. 2200]", "Cake Guard [Lv. 2225]", "Baking Staff [Lv. 2250]", "Head Baker [Lv. 2275]", "Cocoa Warrior [Lv. 2300]", "Chocolate Bar Battler [Lv. 2325]", "Sweet Thief [Lv. 2350]", "Candy Rebel [Lv. 2375]", "Candy Pirate [Lv. 2400]", "Snow Demon [Lv. 2425]",
        "Isle Outlaw [Lv. 2450]", "Island Boy [Lv. 2475]", "Sun-kissed Warrior [Lv. 2500]", "Isle Champion [Lv. 2525]", "Serpent Hunter [Lv. 2550]", "Skull Slayer [Lv. 2575]","Reef Bandit [Lv. 2600]","Coral Pirates [Lv. 2625]","Sea Chanter [Lv. 2650]","Ocean Prophet [Lv. 2675]"
    }
end

function CheckBossQuest()
    if First_Sea then
        if SelectBoss == "The Gorilla King" then
            BossMon = "The Gorilla King [Lv. 25] [Boss]"
            NameBoss = 'The Gorrila King'
            NameQuestBoss = "JungleQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$2,000\n7,000 Exp."
            CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
        elseif SelectBoss == "Bobby" then
            BossMon = "Bobby [Lv. 55] [Boss]"
            NameBoss = 'Bobby'
            NameQuestBoss = "BuggyQuest1"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$8,000\n35,000 Exp."
            CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
        elseif SelectBoss == "The Saw" then
            BossMon = "The Saw [Lv. 100] [Boss]"
            NameBoss = 'The Saw'
            CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
        elseif SelectBoss == "Yeti" then
            BossMon = "Yeti [Lv. 110] [Boss]"
            NameBoss = 'Yeti'
            NameQuestBoss = "SnowQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$10,000\n180,000 Exp."
            CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif SelectBoss == "Mob Leader" then
            BossMon = "Mob Leader [Lv. 120] [Boss]"
            NameBoss = 'Mob Leader'
            CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
        elseif SelectBoss == "Vice Admiral" then
            BossMon = "Vice Admiral [Lv. 130] [Boss]"
            NameBoss = 'Vice Admiral'
            NameQuestBoss = "MarineQuest2"
            QuestLvBoss = 2
            RewardBoss = "Reward:\n$10,000\n180,000 Exp."
            CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
            CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
        elseif SelectBoss == "Saber Expert" then
            NameBoss = 'Saber Expert'
            BossMon = "Saber Expert [Lv. 200] [Boss]"
            CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
        elseif SelectBoss == "Warden" then
            BossMon = "Warden [Lv. 220] [Boss]"
            NameBoss = 'Warden'
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 1
            RewardBoss = "Reward:\n$6,000\n850,000 Exp."
            CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
            CFrameQBoss= CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif SelectBoss == "Chief Warden" then
            BossMon = "Chief Warden [Lv. 230] [Boss]"
            NameBoss = 'Chief Warden'
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 2
            RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
            CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif SelectBoss == "Swan" then
            BossMon = "Swan [Lv. 240] [Boss]"
            NameBoss = 'Swan'
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
            CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif SelectBoss == "Magma Admiral" then
            BossMon = "Magma Admiral [Lv. 350] [Boss]"
            NameBoss = 'Magma Admiral'
            NameQuestBoss = "MagmaQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
            CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
            CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
        elseif SelectBoss == "Fishman Lord" then
            BossMon = "Fishman Lord [Lv. 425] [Boss]"
            NameBoss = 'Fishman Lord'
            NameQuestBoss = "FishmanQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
            CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
        elseif SelectBoss == "Wysper" then
            BossMon = "Wysper [Lv. 500] [Boss]"
            NameBoss = 'Wysper'
            NameQuestBoss = "SkyExp1Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
            CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
            CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
        elseif SelectBoss == "Thunder God" then
            BossMon = "Thunder God [Lv. 575] [Boss]"
            NameBoss = 'Thunder God'
            NameQuestBoss = "SkyExp2Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
            CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
        elseif SelectBoss == "Cyborg" then
            BossMon = "Cyborg [Lv. 675] [Boss]"
            NameBoss = 'Cyborg'
            NameQuestBoss = "FountainQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
            CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
        elseif SelectBoss == "Ice Admiral" then
            BossMon = "Ice Admiral [Lv. 700] [Boss]"
            NameBoss = 'Ice Admiral'
            CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
        elseif SelectBoss == "Greybeard" then
            BossMon = "Greybeard [Lv. 750] [Raid Boss]"
            NameBoss = 'Greybeard'
            CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
        end
    end
    if Second_Sea then
        if SelectBoss == "Diamond" then
            BossMon = "Diamond [Lv. 750] [Boss]"
            NameBoss = 'Diamond'
            NameQuestBoss = "Area1Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
            CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
            CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
        elseif SelectBoss == "Jeremy" then
            BossMon = "Jeremy [Lv. 850] [Boss]"
            NameBoss = 'Jeremy'
            NameQuestBoss = "Area2Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
            CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
            CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
        elseif SelectBoss == "Fajita" then
            BossMon = "Fajita [Lv. 925] [Boss]"
            NameBoss = 'Fajita'
            NameQuestBoss = "MarineQuest3"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
            CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
            CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
        elseif SelectBoss == "Don Swan" then
            BossMon = "Don Swan [Lv. 1000] [Boss]"
            NameBoss = 'Don Swan'
            CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
        elseif SelectBoss == "Smoke Admiral" then
            BossMon = "Smoke Admiral [Lv. 1150] [Boss]"
            NameBoss = 'Smoke Admiral'
            NameQuestBoss = "IceSideQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
            CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
        elseif SelectBoss == "Awakened Ice Admiral" then
            BossMon = "Awakened Ice Admiral [Lv. 1400] [Boss]"
            NameBoss = 'Awakened Ice Admiral'
            NameQuestBoss = "FrostQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
            CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
            CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
        elseif SelectBoss == "Tide Keeper" then
            BossMon = "Tide Keeper [Lv. 1475] [Boss]"
            NameBoss = 'Tide Keeper'
            NameQuestBoss = "ForgottenQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
            CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
            CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
        elseif SelectBoss == "Darkbeard" then
            BossMon = "Darkbeard [Lv. 1000] [Raid Boss]"
            NameBoss = 'Darkbeard'
            CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
        elseif SelectBoss == "Cursed Captain" then
            BossMon = "Cursed Captain [Lv. 1325] [Raid Boss]"
            NameBoss = 'Cursed Captain'
            CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
        elseif SelectBoss == "Order" then
            BossMon = "Order [Lv. 1250] [Raid Boss]"
            NameBoss = 'Order'
            CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
        end
    end
    if Third_Sea then
        if SelectBoss == "Stone" then
            BossMon = "Stone [Lv. 1550] [Boss]"
            NameBoss = 'Stone'
            NameQuestBoss = "PiratePortQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
            CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
        elseif SelectBoss == "Hydra Leader" then
            BossMon = "Hydra Leader [Lv. 1675] [Boss]"
            NameBoss = 'Hydra Leader'
            NameQuestBoss = "VenomCrewQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$30,000\n70,000,000 Exp."
            CFrameQBoss = CFrame.new(5214.33936, 1003.46765, 759.507324, 0.998874724, 0, 0.0474264994, 0, 1, 0, -0.0474264994, 0, 0.9988747)
            CFrameBoss = CFrame.new(5887.97168, 1018.40173, -117.293022, -0.544665515, 0, 0.838653386, 0, 1, 0, -0.838653386, 0, -0.544665515)
        elseif SelectBoss == "Kilo Admiral" then
            BossMon = "Kilo Admiral [Lv. 1750] [Boss]"
            NameBoss = 'Kilo Admiral'
            NameQuestBoss = "MarineTreeIsland"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
            CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
            CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
        elseif SelectBoss == "Captain Elephant" then
            BossMon = "Captain Elephant [Lv. 1875] [Boss]"
            NameBoss = 'Captain Elephant'
            NameQuestBoss = "DeepForestIsland"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
            CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
            CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
        elseif SelectBoss == "Beautiful Pirate" then
            BossMon = "Beautiful Pirate [Lv. 1950] [Boss]"
            NameBoss = 'Beautiful Pirate'
            NameQuestBoss = "DeepForestIsland2"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
            CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
        elseif SelectBoss == "Cake Queen" then
            BossMon = "Cake Queen [Lv. 2175] [Boss]"
            NameBoss = 'Cake Queen'
            NameQuestBoss = "IceCreamIslandQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
            CFrameQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
        elseif SelectBoss == "Longma" then
            BossMon = "Longma [Lv. 2000] [Boss]"
            NameBoss = 'Longma'
            CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
        elseif SelectBoss == "Soul Reaper" then
            BossMon = "Soul Reaper [Lv. 2100] [Raid Boss]"
            NameBoss = 'Soul Reaper'
            CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
        elseif SelectBoss == "rip_indra True Form" then
            BossMon = "rip_indra True Form [Lv. 5000] [Raid Boss]"
            NameBoss = 'rip_indra True Form'
            CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
        elseif SelectBoss == "Tyrant of the Skies" then
            BossMon = "Tyrant of the Skies [Lv. 2600] [Raid Boss]"    
            NameBoss = 'Tyrant of the Skies'
            CFrameBoss = CFrame.new(-16260.345703125, 152.746826171875, 1395.822509765625)
        end
    end
end

if First_Sea then
    world = "First Sea"
elseif Second_Sea then
    world = "Second Sea"
elseif Third_Sea then
    world = "Third Sea"
end

---/// Tween & No Clip \\\---

function Tween(p)
	local Distance = (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 200 then
        game.Players.LocalPlayer.Character.PartTele.CFrame = p
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.PartTele.CFrame
    end
	if not game.Players.LocalPlayer.Character:FindFirstChild("PartTele") then
		local ga = Instance.new("Part", game.Players.LocalPlayer.Character)
		ga.Size = Vector3.new(10,1,10)
		ga.Name = "PartTele"
		ga.Anchored = true
		ga.Transparency = 1
		ga.CanCollide = false
		ga.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		ga:GetPropertyChangedSignal("CFrame"):Connect(function()
			task.wait(0.01)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.PartTele.CFrame
		end)
	end
    game.Players.LocalPlayer.Character.PartTele.CFrame = CFrame.new(game.Players.LocalPlayer.Character.PartTele.CFrame.X, p.Y, game.Players.LocalPlayer.Character.PartTele.CFrame.Z)
	local tw = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.PartTele, TweenInfo.new(Distance / 300, Enum.EasingStyle.Linear),{CFrame = p})
	tw:Play()
	function StopTween()
		if tw then
			tw:Cancel()
		end
		if game.Players.LocalPlayer.Character:FindFirstChild("PartTele") then
			game.Players.LocalPlayer.Character:FindFirstChild("PartTele"):Destroy()
		end
	end
end

function TP(p)
	local Distance = (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 200 then
        game.Players.LocalPlayer.Character.PartTele.CFrame = p
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.PartTele.CFrame
    end
	if not game.Players.LocalPlayer.Character:FindFirstChild("PartTele") then
		local ga = Instance.new("Part", game.Players.LocalPlayer.Character)
		ga.Size = Vector3.new(10,1,10)
		ga.Name = "PartTele"
		ga.Anchored = true
		ga.Transparency = 1
		ga.CanCollide = false
		ga.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		ga:GetPropertyChangedSignal("CFrame"):Connect(function()
			task.wait(0.01)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.PartTele.CFrame
		end)
	end
    game.Players.LocalPlayer.Character.PartTele.CFrame = CFrame.new(game.Players.LocalPlayer.Character.PartTele.CFrame.X, p.Y, game.Players.LocalPlayer.Character.PartTele.CFrame.Z)
	local tw = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.PartTele, TweenInfo.new(Distance / 300, Enum.EasingStyle.Linear),{CFrame = p})
	tw:Play()
	function StopTween()
		if tw then
			tw:Cancel()
		end
		if game.Players.LocalPlayer.Character:FindFirstChild("PartTele") then
			game.Players.LocalPlayer.Character:FindFirstChild("PartTele"):Destroy()
		end
	end
end

function AutoClick()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")

-- Utility functions
local function tablefound(ta, object)
    for _, v in pairs(ta) do
        if v == object then
            return true
        end
    end
    return false
end

-- UI creation functions
local ActualTypes = {
    RoundFrame = "ImageLabel", 
    Shadow = "ImageLabel", 
    Circle = "ImageLabel", 
    CircleButton = "ImageButton", 
    Frame = "Frame", 
    Label = "TextLabel", 
    Button = "TextButton", 
    SmoothButton = "ImageButton", 
    Box = "TextBox", 
    ScrollingFrame = "ScrollingFrame", 
    Menu = "ImageButton", 
    NavBar = "ImageButton"
}

local Properties = {
    RoundFrame = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://5554237731",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(3, 3, 297, 297)
    },
    SmoothButton = {
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Image = "rbxassetid://5554237731",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(3, 3, 297, 297)
    },
    Shadow = {
        Name = "Shadow",
        BackgroundTransparency = 1,
        Image = "rbxassetid://5554236805",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(23, 23, 277, 277),
        Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
        Position = UDim2.fromOffset(-15, -15)
    },
    Circle = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://5554831670"
    },
    CircleButton = {
        BackgroundTransparency = 1,
        AutoButtonColor = false,
        Image = "rbxassetid://5554831670"
    },
    Frame = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1)
    },
    Label = {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(5, 0),
        Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left
    },
    Button = {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(5, 0),
        Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left
    },
    Box = {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(5, 0),
        Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left
    },
    ScrollingFrame = {
        BackgroundTransparency = 1,
        ScrollBarThickness = 0,
        CanvasSize = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 1)
    },
    Menu = {
        Name = "More",
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Image = "rbxassetid://5555108481",
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(25, 10)
    },
    NavBar = {
        Name = "SheetToggle",
        Image = "rbxassetid://5576439039",
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.fromOffset(5, 5),
        AutoButtonColor = false
    }
}

local Types = {
    "RoundFrame", "Shadow", "Circle", "CircleButton", "Frame", "Label", 
    "Button", "SmoothButton", "Box", "ScrollingFrame", "Menu", "NavBar"
}

local function FindType(String)
    for _, Type in next, Types do
        if Type:sub(1, #String):lower() == String:lower() then
            return Type
        end
    end
    return false
end

local Objects = {}

function Objects.new(Type)
    local TargetType = FindType(Type)
    if TargetType then
        local NewImage = Instance.new(ActualTypes[TargetType])
        if Properties[TargetType] then
            for Property, Value in next, Properties[TargetType] do
                NewImage[Property] = Value
            end
        end
        return NewImage
    else
        return Instance.new(Type)
    end
end

local function GetXY(GuiObject)
    local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
    local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), 
                   math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
    return Px/Max, Py/May
end

local function CircleAnim(GuiObject, EndColour, StartColour)
    local PX, PY = GetXY(GuiObject)
    local Circle = Objects.new("Shadow")
    Circle.Size = UDim2.fromScale(0, 0)
    Circle.Position = UDim2.fromScale(PX, PY)
    Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
    Circle.ZIndex = 200
    Circle.Parent = GuiObject
    local Size = GuiObject.AbsoluteSize.X
    TweenService:Create(Circle, TweenInfo.new(0.5), {
        Position = UDim2.fromScale(PX, PY) - UDim2.fromOffset(Size/2, Size/2), 
        ImageTransparency = 1, 
        ImageColor3 = EndColour, 
        Size = UDim2.fromOffset(Size, Size)
    }):Play()
    task.delay(0.5, function()
        Circle:Destroy()
    end)
end

-- Create main UI
local UILibrary = Instance.new("ScreenGui")
UILibrary.Name = "ProjectSindex"
UILibrary.Parent = game:GetService("CoreGui")
UILibrary.IgnoreGuiInset = true
UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Create loading screen
local LoadScreen = Instance.new("Frame")
LoadScreen.Name = "LoadScreen"
LoadScreen.Parent = UILibrary
LoadScreen.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
LoadScreen.Size = UDim2.new(1, 0, 1, 0)
LoadScreen.ZIndex = 10

local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 10, 30))
}
BackgroundGradient.Rotation = 120
BackgroundGradient.Parent = LoadScreen

local LoadContainer = Instance.new("Frame")
LoadContainer.Name = "LoadContainer"
LoadContainer.Parent = LoadScreen
LoadContainer.AnchorPoint = Vector2.new(0.5, 0.5)
LoadContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
LoadContainer.BackgroundTransparency = 0.1
LoadContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadContainer.Size = UDim2.new(0, 300, 0, 300)
LoadContainer.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = LoadContainer

local ContainerShadow = Instance.new("ImageLabel")
ContainerShadow.Name = "ContainerShadow"
ContainerShadow.Parent = LoadContainer
ContainerShadow.AnchorPoint = Vector2.new(0.5, 0.5)
ContainerShadow.BackgroundTransparency = 1
ContainerShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
ContainerShadow.Size = UDim2.new(1, 20, 1, 20)
ContainerShadow.Image = "rbxassetid://5554236805"
ContainerShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
ContainerShadow.ImageTransparency = 0.8
ContainerShadow.ScaleType = Enum.ScaleType.Slice
ContainerShadow.SliceCenter = Rect.new(23, 23, 277, 277)
ContainerShadow.ZIndex = -1

local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Parent = LoadContainer
Logo.AnchorPoint = Vector2.new(0.5, 0.5)
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0.5, 0, 0.4, 0)
Logo.Size = UDim2.new(0, 120, 0, 120)
Logo.Image = "rbxassetid://91722326134472"
Logo.ImageColor3 = Color3.fromRGB(0, 170, 255)

local LogoShine = Instance.new("ImageLabel")
LogoShine.Name = "LogoShine"
LogoShine.Parent = Logo
LogoShine.AnchorPoint = Vector2.new(0.5, 0.5)
LogoShine.BackgroundTransparency = 1
LogoShine.Position = UDim2.new(0.5, 0, 0.5, 0)
LogoShine.Size = UDim2.new(1, 40, 1, 40)
LogoShine.Image = "rbxassetid://8992232431"
LogoShine.ImageTransparency = 0.8
LogoShine.ZIndex = -1

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = LoadContainer
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, 0, 0.7, 0)
Title.Size = UDim2.new(0, 200, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "PROJECT SINDEX"
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.TextSize = 20
Title.TextTransparency = 0

local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Parent = LoadContainer
Subtitle.AnchorPoint = Vector2.new(0.5, 0.5)
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0.5, 0, 0.8, 0)
Subtitle.Size = UDim2.new(0, 200, 0, 20)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "Advanced Script Hub"
Subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
Subtitle.TextSize = 14
Subtitle.TextTransparency = 0

local LoadButton = Instance.new("ImageButton")
LoadButton.Name = "LoadButton"
LoadButton.Parent = LoadContainer
LoadButton.AnchorPoint = Vector2.new(0.5, 0.5)
LoadButton.BackgroundTransparency = 1
LoadButton.Position = UDim2.new(0.5, 0, 0.9, 0)
LoadButton.Size = UDim2.new(0, 160, 0, 40)
LoadButton.Image = "rbxassetid://5554237731"
LoadButton.ScaleType = Enum.ScaleType.Slice
LoadButton.SliceCenter = Rect.new(3, 3, 297, 297)
LoadButton.ImageColor3 = Color3.fromRGB(0, 170, 255)

local ButtonLabel = Instance.new("TextLabel")
ButtonLabel.Name = "ButtonLabel"
ButtonLabel.Parent = LoadButton
ButtonLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ButtonLabel.BackgroundTransparency = 1
ButtonLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ButtonLabel.Size = UDim2.new(1, -10, 1, -10)
ButtonLabel.Font = Enum.Font.GothamBold
ButtonLabel.Text = "INITIALIZE"
ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonLabel.TextSize = 16

local UICornerButton = Instance.new("UICorner")
UICornerButton.CornerRadius = UDim.new(0, 8)
UICornerButton.Parent = LoadButton

-- Create main UI
local MainUI = Instance.new("Frame")
MainUI.Name = "MainUI"
MainUI.Parent = UILibrary
MainUI.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainUI.BackgroundTransparency = 0.05
MainUI.Position = UDim2.new(0.5, 0, 0.5, 0)
MainUI.Size = UDim2.new(0, 500, 0, 350)
MainUI.AnchorPoint = Vector2.new(0.5, 0.5)
MainUI.Visible = false

local MainUICorner = Instance.new("UICorner")
MainUICorner.CornerRadius = UDim.new(0, 12)
MainUICorner.Parent = MainUI

local MainUIShadow = Instance.new("ImageLabel")
MainUIShadow.Name = "MainUIShadow"
MainUIShadow.Parent = MainUI
MainUIShadow.AnchorPoint = Vector2.new(0.5, 0.5)
MainUIShadow.BackgroundTransparency = 1
MainUIShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
MainUIShadow.Size = UDim2.new(1, 20, 1, 20)
MainUIShadow.Image = "rbxassetid://5554236805"
MainUIShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
MainUIShadow.ImageTransparency = 0.8
MainUIShadow.ScaleType = Enum.ScaleType.Slice
MainUIShadow.SliceCenter = Rect.new(23, 23, 277, 277)
MainUIShadow.ZIndex = -1

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Parent = MainUI
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Header.Size = UDim2.new(1, 0, 0, 40)

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Name = "HeaderTitle"
HeaderTitle.Parent = Header
HeaderTitle.AnchorPoint = Vector2.new(0.5, 0.5)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Position = UDim2.new(0.5, 0, 0.5, 0)
HeaderTitle.Size = UDim2.new(0, 200, 1, 0)
HeaderTitle.Font = Enum.Font.GothamBold
HeaderTitle.Text = "PROJECT SINDEX"
HeaderTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
HeaderTitle.TextSize = 18

local TimeLabel = Instance.new("TextLabel")
TimeLabel.Name = "TimeLabel"
TimeLabel.Parent = Header
TimeLabel.AnchorPoint = Vector2.new(1, 0.5)
TimeLabel.BackgroundTransparency = 1
TimeLabel.Position = UDim2.new(1, -10, 0.5, 0)
TimeLabel.Size = UDim2.new(0, 150, 1, 0)
TimeLabel.Font = Enum.Font.Gotham
TimeLabel.Text = "00:00:00 | Jan 01, 2023"
TimeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TimeLabel.TextSize = 14
TimeLabel.TextXAlignment = Enum.TextXAlignment.Right

local ExecuteButton = Instance.new("ImageButton")
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = Header
ExecuteButton.AnchorPoint = Vector2.new(0, 0.5)
ExecuteButton.BackgroundTransparency = 1
ExecuteButton.Position = UDim2.new(0, 10, 0.5, 0)
ExecuteButton.Size = UDim2.new(0, 20, 0, 20)
ExecuteButton.Image = "rbxassetid://6031097225"
ExecuteButton.ImageColor3 = Color3.fromRGB(200, 200, 200)

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Parent = MainUI
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 0, 0, 40)
Content.Size = UDim2.new(1, 0, 1, -40)

-- Blur effect
local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = game.Lighting

-- Time updater
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            TimeLabel.Text = os.date("%I:%M:%S".." | ".."%B %d, %Y")
        end)
    end
end)

-- Button animations
LoadButton.MouseEnter:Connect(function()
    TweenService:Create(LoadButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 170, 0, 45)
    }):Play()
    TweenService:Create(LoadButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageColor3 = Color3.fromRGB(0, 200, 255)
    }):Play()
end)

LoadButton.MouseLeave:Connect(function()
    TweenService:Create(LoadButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 160, 0, 40)
    }):Play()
    TweenService:Create(LoadButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageColor3 = Color3.fromRGB(0, 170, 255)
    }):Play()
end)

ExecuteButton.MouseEnter:Connect(function()
    TweenService:Create(ExecuteButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageColor3 = Color3.fromRGB(0, 170, 255)
    }):Play()
end)

ExecuteButton.MouseLeave:Connect(function()
    TweenService:Create(ExecuteButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageColor3 = Color3.fromRGB(200, 200, 200)
    }):Play()
end)

-- Execute button functionality (SendKeyEvent only)
ExecuteButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.RightControl, false, game)
end)

-- Logo animation
task.spawn(function()
    while true do
        TweenService:Create(LogoShine, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            Rotation = 360
        }):Play()
        task.wait(2)
        LogoShine.Rotation = 0
    end
end)

-- Load function
LoadButton.MouseButton1Click:Connect(function()
    -- Animate button press
    TweenService:Create(LoadButton, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
        Size = UDim2.new(0, 155, 0, 38)
    }):Play()
    task.wait(0.1)
    TweenService:Create(LoadButton, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
        Size = UDim2.new(0, 160, 0, 40)
    }):Play()
    
    -- Loading animation
    TweenService:Create(LoadButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ImageTransparency = 1
    }):Play()
    TweenService:Create(ButtonLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 1
    }):Play()
    
    -- Show loading text
    Subtitle.Text = "Initializing..."
    
    -- Animate UI transition
    TweenService:Create(LoadContainer, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
        Size = UDim2.new(0, 500, 0, 350)
    }):Play()
    
    TweenService:Create(Blur, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = 15
    }):Play()
    
    task.wait(1)
    
    -- Hide loading screen and show main UI
    TweenService:Create(LoadScreen, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    }):Play()
    
    task.wait(0.5)
    LoadScreen.Visible = false
    MainUI.Visible = true
    
    -- Remove blur effect
    TweenService:Create(Blur, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = 0
    }):Play()
    
    -- Send key event after UI is loaded
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.RightControl, false, game)
end)


---/// Main Ui \\\---

local Env = loadstring(game:HttpGet(https://raw.githubusercontent.com/x3-lunarix/lunarixhub/refs/heads/main/NongkhawUI.luau))();

local Banner = {
    [' [ Update Log ] '] = 86844430363710,
	[' [ General ]'] = 101849161408766,
    [" [ Auto ] "] = 110162136250435,
    [' [ Items ] '] = 98574803492996,
	[' [ Shop ] '] = 74630923244478,
	[' [ Teleport ] '] = 137847566773112,
    [' [ Misc ]'] = 84034775913393,
    [' [ Setting ] '] = 72210587662292,
}

local Window = Env:Window({
	Title = "Project Sindex",
	Desc = "- "..world.." ",
})

local Update = Window:Add({
	Title = "Update",
	Desc = "Update and Change Log",
	Banner = Banner.Update
})
local Settings = Window:Add({
	Title = "Settings",
	Desc = "Settings",
	Banner = Banner.Setting
})

local Section = Update:Section({
	Title = "Section General",
	Side = 'l'
})

local Section = Settings:Section({
	Title = "Setting",
	Side = 'l'
})

local Section1 = Settings:Section({
	Title = "Setting",
	Side = 'r'
})

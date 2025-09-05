local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 600, 0, 400)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Main.BackgroundTransparency = 1
Main.ClipsDescendants = true
Main.Parent = screenGui

local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Background.BackgroundTransparency = 1
Background.Parent = Main

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Background

local UIGradient = Instance.new("UIGradient")
UIGradient.Rotation = 45
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 15, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
}
UIGradient.Transparency = NumberSequence.new(0.5)
UIGradient.Parent = Background

local Glow = Instance.new("ImageLabel")
Glow.Size = UDim2.new(1, 40, 1, 40)
Glow.Position = UDim2.new(0, -20, 0, -20)
Glow.BackgroundTransparency = 1
Glow.Image = "rbxassetid://8992231224"
Glow.ImageColor3 = Color3.fromRGB(80, 40, 150)
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceScale = 0.02
Glow.SliceCenter = Rect.new(256, 256, 256, 256)
Glow.ImageTransparency = 1
Glow.Parent = Main

local Particles = Instance.new("Frame")
Particles.Size = UDim2.new(1, 0, 1, 0)
Particles.BackgroundTransparency = 1
Particles.Parent = Main

local particleTemplates = {}
for i = 1, 8 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, 6, 0, 6)
    particle.BackgroundTransparency = 1
    particle.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle
    
    particleTemplates[i] = particle
end

local Circle1 = Instance.new("Frame")
Circle1.Size = UDim2.new(0, 200, 0, 200)
Circle1.Position = UDim2.new(0.1, 0, 0.7, 0)
Circle1.BackgroundColor3 = Color3.fromRGB(120, 70, 200)
Circle1.BackgroundTransparency = 1
Circle1.Parent = Main

local CircleCorner1 = Instance.new("UICorner")
CircleCorner1.CornerRadius = UDim.new(1, 0)
CircleCorner1.Parent = Circle1

local Circle2 = Instance.new("Frame")
Circle2.Size = UDim2.new(0, 150, 0, 150)
Circle2.Position = UDim2.new(0.8, 0, 0.2, 0)
Circle2.BackgroundColor3 = Color3.fromRGB(200, 100, 220)
Circle2.BackgroundTransparency = 1
Circle2.Parent = Main

local CircleCorner2 = Instance.new("UICorner")
CircleCorner2.CornerRadius = UDim.new(1, 0)
CircleCorner2.Parent = Circle2

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 500, 0, 70)
Title.Position = UDim2.new(0.5, 0, 0.15, 0)
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.BackgroundTransparency = 1
Title.Text = "PROJECT SINDEX"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json")
Title.TextSize = 42
Title.TextTransparency = 1
Title.TextStrokeTransparency = 0.7
Title.TextStrokeColor3 = Color3.fromRGB(80, 40, 150)
Title.ZIndex = 3
Title.Parent = Main

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 130, 240)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 80, 220))
}
TitleGradient.Rotation = 90
TitleGradient.Parent = Title

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(0, 400, 0, 30)
SubTitle.Position = UDim2.new(0.5, 0, 0.3, 0)
SubTitle.AnchorPoint = Vector2.new(0.5, 0)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Premium Experience • Elite Performance"
SubTitle.TextColor3 = Color3.fromRGB(200, 200, 220)
SubTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
SubTitle.TextSize = 18
SubTitle.TextTransparency = 1
SubTitle.Parent = Main

local BarContainer = Instance.new("Frame")
BarContainer.Size = UDim2.new(0, 450, 0, 30)
BarContainer.Position = UDim2.new(0.5, 0, 0.6, 0)
BarContainer.AnchorPoint = Vector2.new(0.5, 0)
BarContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
BarContainer.BackgroundTransparency = 1
BarContainer.Parent = Main

local BarContainerCorner = Instance.new("UICorner")
BarContainerCorner.CornerRadius = UDim.new(0, 8)
BarContainerCorner.Parent = BarContainer

local BarContainerStroke = Instance.new("UIStroke")
BarContainerStroke.Color = Color3.fromRGB(60, 60, 80)
BarContainerStroke.Thickness = 2
BarContainerStroke.Transparency = 1
BarContainerStroke.Parent = BarContainer

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.Position = UDim2.new(0, 0, 0, 0)
BarFill.AnchorPoint = Vector2.new(0, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(120, 70, 200)
BarFill.BackgroundTransparency = 1
BarFill.Parent = BarContainer

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(0, 8)
FillCorner.Parent = BarFill

local BarFillGradient = Instance.new("UIGradient")
BarFillGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 100, 240)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 70, 200))
}
BarFillGradient.Rotation = 0
BarFillGradient.Parent = BarFill

local BarGlow = Instance.new("ImageLabel")
BarGlow.Size = UDim2.new(1, 20, 1, 20)
BarGlow.Position = UDim2.new(0, -10, 0, -10)
BarGlow.BackgroundTransparency = 1
BarGlow.Image = "rbxassetid://8992231224"
BarGlow.ImageColor3 = Color3.fromRGB(150, 80, 220)
BarGlow.ScaleType = Enum.ScaleType.Slice
BarGlow.SliceScale = 0.02
BarGlow.SliceCenter = Rect.new(256, 256, 256, 256)
BarGlow.ImageTransparency = 1
BarGlow.Parent = BarFill

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(0, 450, 0, 25)
Status.Position = UDim2.new(0.5, 0, 0.68, 0)
Status.AnchorPoint = Vector2.new(0.5, 0)
Status.BackgroundTransparency = 1
Status.Text = "Initializing..."
Status.TextColor3 = Color3.fromRGB(180, 180, 200)
Status.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
Status.TextSize = 16
Status.TextTransparency = 1
Status.Parent = Main

local Thanks = Instance.new("TextLabel")
Thanks.Size = UDim2.new(0, 500, 0, 30)
Thanks.Position = UDim2.new(0.5, 0, 0.85, 0)
Thanks.AnchorPoint = Vector2.new(0.5, 0)
Thanks.BackgroundTransparency = 1
Thanks.Text = "❤️ Thank you for choosing Project Sindex ❤️"
Thanks.TextColor3 = Color3.fromRGB(255, 170, 220)
Thanks.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
Thanks.TextSize = 18
Thanks.TextTransparency = 1
Thanks.Parent = Main

local function createParticles()
    local activeParticles = {}
    
    for i = 1, 20 do
        local template = particleTemplates[math.random(1, #particleTemplates)]:Clone()
        template.Position = UDim2.new(math.random(), 0, math.random(), 0)
        template.Size = UDim2.new(0, math.random(4, 10), 0, math.random(4, 10))
        
        local color = math.random(1, 3)
        if color == 1 then
            template.BackgroundColor3 = Color3.fromRGB(120, 70, 200)
        elseif color == 2 then
            template.BackgroundColor3 = Color3.fromRGB(200, 100, 220)
        else
            template.BackgroundColor3 = Color3.fromRGB(150, 80, 220)
        end
        
        template.Parent = Particles
        activeParticles[i] = template
    end
    
    return activeParticles
end

local function animateParticles(particles)
    for _, particle in pairs(particles) do
        coroutine.wrap(function()
            local startPos = particle.Position
            local targetPos = UDim2.new(math.random(), 0, math.random(), 0)
            local duration = math.random(15, 25) / 10
            
            TweenService:Create(particle, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Position = targetPos
            }):Play()
            
            TweenService:Create(particle, TweenInfo.new(duration/2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 0.3
            }):Play()
            
            wait(duration/2)
            
            TweenService:Create(particle, TweenInfo.new(duration/2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1
            }):Play()
        end)()
    end
end

local function UpdateStatus(pct, message)
    Status.Text = message .. " (" .. pct .. "%)"
    
    TweenService:Create(BarFill, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Size = UDim2.new(pct / 100, 0, 1, 0)
    }):Play()
    
    TweenService:Create(BarGlow, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        ImageTransparency = 0.6
    }):Play()
    
    if pct % 20 == 0 then
        TweenService:Create(BarGlow, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ImageTransparency = 0.8
        }):Play()
    end
end

local function AnimateLoader()
    local fadeIn = TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local quickFade = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    TweenService:Create(Main, fadeIn, { BackgroundTransparency = 0 }):Play()
    TweenService:Create(Background, fadeIn, { BackgroundTransparency = 0 }):Play()
    TweenService:Create(Glow, fadeIn, { ImageTransparency = 0.7 }):Play()
    
    TweenService:Create(Circle1, quickFade, { BackgroundTransparency = 0.9 }):Play()
    TweenService:Create(Circle2, quickFade, { BackgroundTransparency = 0.9 }):Play()
    
    wait(0.3)
    
    TweenService:Create(Title, fadeIn, { TextTransparency = 0 }):Play()
    
    wait(0.4)
    
    TweenService:Create(SubTitle, fadeIn, { TextTransparency = 0 }):Play()
    
    wait(0.3)
    
    TweenService:Create(BarContainer, fadeIn, { BackgroundTransparency = 0 }):Play()
    TweenService:Create(BarContainerStroke, fadeIn, { Transparency = 0 }):Play()
    TweenService:Create(BarFill, fadeIn, { BackgroundTransparency = 0 }):Play()
    
    wait(0.2)
    
    TweenService:Create(Status, fadeIn, { TextTransparency = 0 }):Play()
    TweenService:Create(Thanks, fadeIn, { TextTransparency = 0 }):Play()
    
    local particles = createParticles()
    
    local pulseGlow = TweenService:Create(Glow, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
        ImageTransparency = 0.85
    })
    
    pulseGlow:Play()
    
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if Main.Parent then
            UIGradient.Rotation = (UIGradient.Rotation + 0.2) % 360
            TitleGradient.Rotation = (TitleGradient.Rotation + 0.5) % 360
            BarFillGradient.Rotation = (BarFillGradient.Rotation + 1) % 360
        else
            connection:Disconnect()
        end
    end)
    
    local stages = {
        {0, "Loading core modules"},
        {15, "Initializing components"},
        {30, "Preparing interface"},
        {50, "Compiling resources"},
        {70, "Optimizing performance"},
        {85, "Finalizing setup"},
        {100, "Ready to launch"}
    }
    
    for _, stage in ipairs(stages) do
        local pct, message = stage[1], stage[2]
        UpdateStatus(pct, message)
        
        animateParticles(particles)
        
        if pct == 50 then
            TweenService:Create(Circle1, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 220, 0, 220)
            }):Play()
            
            TweenService:Create(Circle2, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 170, 0, 170)
            }):Play()
        end
        
        wait(0.8)
    end
    
    wait(0.5)
    
    local fadeOut = TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    
    TweenService:Create(Title, fadeOut, { TextTransparency = 1 }):Play()
    TweenService:Create(SubTitle, fadeOut, { TextTransparency = 1 }):Play()
    TweenService:Create(Status, fadeOut, { TextTransparency = 1 }):Play()
    TweenService:Create(Thanks, fadeOut, { TextTransparency = 1 }):Play()
    TweenService:Create(BarContainer, fadeOut, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(BarContainerStroke, fadeOut, { Transparency = 1 }):Play()
    TweenService:Create(BarFill, fadeOut, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(BarGlow, fadeOut, { ImageTransparency = 1 }):Play()
    TweenService:Create(Circle1, fadeOut, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(Circle2, fadeOut, { BackgroundTransparency = 1 }):Play()
    
    wait(0.5)
    
    TweenService:Create(Background, fadeOut, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(Glow, fadeOut, { ImageTransparency = 1 }):Play()
    TweenService:Create(Main, fadeOut, { BackgroundTransparency = 1 }):Play()
    
    wait(1.5)
    
    screenGui:Destroy()
end

AnimateLoader()
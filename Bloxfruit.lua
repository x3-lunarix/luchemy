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

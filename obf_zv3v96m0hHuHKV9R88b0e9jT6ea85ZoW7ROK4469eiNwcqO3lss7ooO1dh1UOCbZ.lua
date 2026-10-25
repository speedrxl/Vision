--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b
88      88    88    88            odD'      88      88    88 88ooo88
88  ooo 88    88    88          .88'        88      88    88 88~~~88
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88  @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  MERGED
]=]

-- ====================== SERVICES ======================
local TweenService     = game:GetService("TweenService")
local Players          = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local HttpService      = game:GetService("HttpService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer      = Players.LocalPlayer
local loadStartTime    = tick()

-- ====================== LOADING SCREEN ======================
local loadingGui = Instance.new("ScreenGui")
loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
loadingGui.ResetOnSpawn = false
loadingGui.IgnoreGuiInset = true
loadingGui.DisplayOrder = 10
loadingGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local loadingCanvas = Instance.new("CanvasGroup", loadingGui)
loadingCanvas.SizeConstraint = Enum.SizeConstraint.RelativeYY
loadingCanvas.BorderSizePixel = 0
loadingCanvas.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadingCanvas.AnchorPoint = Vector2.new(0.5, 0.5)
loadingCanvas.Size = UDim2.new(0.36986, 70, -0.075, 70)
loadingCanvas.Position = UDim2.new(1.5, 0, 0.98182, 0)
loadingCanvas.BackgroundTransparency = 0.5
loadingCanvas.GroupTransparency = 0

local loadingStroke = Instance.new("UIStroke", loadingCanvas)
loadingStroke.Transparency = 0.5
loadingStroke.Thickness = 2

local loadingGradient = Instance.new("UIGradient", loadingCanvas)
loadingGradient.Rotation = 90
loadingGradient.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0.000, 0),
    NumberSequenceKeypoint.new(0.773, 0.50276),
    NumberSequenceKeypoint.new(1.000, 0.53039)
}

local loadingLabel = Instance.new("TextLabel", loadingCanvas)
loadingLabel.TextWrapped = true
loadingLabel.BorderSizePixel = 0
loadingLabel.TextXAlignment = Enum.TextXAlignment.Left
loadingLabel.TextScaled = true
loadingLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadingLabel.FontFace = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
loadingLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
loadingLabel.BackgroundTransparency = 1
loadingLabel.RichText = true
loadingLabel.Size = UDim2.new(1, -10, 1, 0)
loadingLabel.Text = "loading"
loadingLabel.Position = UDim2.new(0, 5, 0, 0)

TweenService:Create(loadingCanvas, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
    Position = UDim2.new(0.87634, 0, 0.98182, 0)
}):Play()

local _loadingDone = false
task.spawn(function()
    local dots = 0
    while not _loadingDone do
        task.wait(0.3)
        if _loadingDone then break end
        dots = (dots % 3) + 1
        loadingLabel.Text = "loading" .. string.rep(".", dots)
    end
end)

-- ====================== UI INSTANCES (new UI from visioncopy) ======================
local G2L = {}

-- StarterGui.Vision
G2L["1"] = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
G2L["1"]["Enabled"] = false
G2L["1"]["IgnoreGuiInset"] = true
G2L["1"]["DisplayOrder"] = 3
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets
G2L["1"]["Name"] = "Vision"
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
G2L["1"]["ResetOnSpawn"] = false

-- Fade (CanvasGroup)
G2L["2"] = Instance.new("CanvasGroup", G2L["1"])
G2L["2"]["BorderSizePixel"] = 0
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["2"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["2"]["Name"] = "Fade"
G2L["2"]["BackgroundTransparency"] = 1

-- UIScale
G2L["3"] = Instance.new("UIScale", G2L["1"])

-- Group
G2L["4"] = Instance.new("Frame", G2L["1"])
G2L["4"]["BorderSizePixel"] = 0
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["4"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["4"]["Name"] = "Group"
G2L["4"]["BackgroundTransparency"] = 1

-- Private
G2L["5"] = Instance.new("Frame", G2L["4"])
G2L["5"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
G2L["5"]["BorderSizePixel"] = 0
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["5"]["Size"] = UDim2.new(0.9, 70, 0.5, 70)
G2L["5"]["Position"] = UDim2.new(0.50174, 0, 0.5, 0)
G2L["5"]["Name"] = "Private"
G2L["5"]["BackgroundTransparency"] = 0.5

G2L["6"] = Instance.new("UIStroke", G2L["5"])
G2L["6"]["Transparency"] = 0.5
G2L["6"]["Thickness"] = 2

G2L["7"] = Instance.new("UIGradient", G2L["5"])
G2L["7"]["Rotation"] = 90
G2L["7"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000,0),NumberSequenceKeypoint.new(0.773,0.50276),NumberSequenceKeypoint.new(1.000,0.53039)}

-- Categories Folder
G2L["8"] = Instance.new("Folder", G2L["5"])
G2L["8"]["Name"] = "Categories"

-- Tab: General
G2L["9"] = Instance.new("TextButton", G2L["8"])
G2L["9"]["TextWrapped"] = true; G2L["9"]["BorderSizePixel"] = 0; G2L["9"]["TextSize"] = 14; G2L["9"]["TextScaled"] = true
G2L["9"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["9"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["9"]["BackgroundTransparency"] = 0.5; G2L["9"]["Size"] = UDim2.new(0.19933, 0, 0.05, 10)
G2L["9"]["Text"] = "General"; G2L["9"]["Name"] = "General"; G2L["9"]["Position"] = UDim2.new(-0.02467, 0, 0, 0)

G2L["a"] = Instance.new("Frame", G2L["9"])
G2L["a"]["BorderSizePixel"] = 0; G2L["a"]["BackgroundColor3"] = Color3.fromRGB(89,255,255)
G2L["a"]["Size"] = UDim2.new(1,0,0.1,0); G2L["a"]["Position"] = UDim2.new(0,0,1,0); G2L["a"]["Name"] = "Select"

G2L["b"] = Instance.new("UIListLayout", G2L["8"])
G2L["b"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
G2L["b"]["SortOrder"] = Enum.SortOrder.LayoutOrder
G2L["b"]["FillDirection"] = Enum.FillDirection.Horizontal

-- Tab: Automation
G2L["c"] = Instance.new("TextButton", G2L["8"])
G2L["c"]["TextWrapped"] = true; G2L["c"]["BorderSizePixel"] = 0; G2L["c"]["TextSize"] = 14; G2L["c"]["TextScaled"] = true
G2L["c"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["c"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["c"]["BackgroundTransparency"] = 0.5; G2L["c"]["Size"] = UDim2.new(0.2, 0, 0.05, 10)
G2L["c"]["LayoutOrder"] = 1; G2L["c"]["Text"] = "Automation"; G2L["c"]["Name"] = "Automation"
G2L["c"]["Position"] = UDim2.new(0.22609, 0, 0, 0)

G2L["d"] = Instance.new("Frame", G2L["c"])
G2L["d"]["Visible"] = false; G2L["d"]["BorderSizePixel"] = 0; G2L["d"]["BackgroundColor3"] = Color3.fromRGB(89,255,255)
G2L["d"]["Size"] = UDim2.new(1,0,0.1,0); G2L["d"]["Position"] = UDim2.new(0,0,1,0); G2L["d"]["Name"] = "Select"

-- Tab: Players
G2L["e"] = Instance.new("TextButton", G2L["8"])
G2L["e"]["TextWrapped"] = true; G2L["e"]["BorderSizePixel"] = 0; G2L["e"]["TextSize"] = 14; G2L["e"]["TextScaled"] = true
G2L["e"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["e"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["e"]["BackgroundTransparency"] = 0.5; G2L["e"]["Size"] = UDim2.new(0.2, 0, 0.05, 10)
G2L["e"]["LayoutOrder"] = 1; G2L["e"]["Text"] = "Players"; G2L["e"]["Name"] = "Players"
G2L["e"]["Position"] = UDim2.new(0.42482, 0, 0, 0)

G2L["f"] = Instance.new("Frame", G2L["e"])
G2L["f"]["Visible"] = false; G2L["f"]["BorderSizePixel"] = 0; G2L["f"]["BackgroundColor3"] = Color3.fromRGB(89,255,255)
G2L["f"]["Size"] = UDim2.new(1,0,0.1,0); G2L["f"]["Position"] = UDim2.new(0,0,1,0); G2L["f"]["Name"] = "Select"

-- Tab: Settings
G2L["10"] = Instance.new("TextButton", G2L["8"])
G2L["10"]["TextWrapped"] = true; G2L["10"]["BorderSizePixel"] = 0; G2L["10"]["TextSize"] = 14; G2L["10"]["TextScaled"] = true
G2L["10"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["10"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["10"]["BackgroundTransparency"] = 0.5; G2L["10"]["Size"] = UDim2.new(0.19933, 0, 0.05, 10)
G2L["10"]["LayoutOrder"] = 2; G2L["10"]["Text"] = "Settings"; G2L["10"]["Name"] = "Settings"
G2L["10"]["Position"] = UDim2.new(0.84991, 0, 0, 0)

G2L["11"] = Instance.new("Frame", G2L["10"])
G2L["11"]["Visible"] = false; G2L["11"]["BorderSizePixel"] = 0; G2L["11"]["BackgroundColor3"] = Color3.fromRGB(89,255,255)
G2L["11"]["Size"] = UDim2.new(1,0,0.1,0); G2L["11"]["Position"] = UDim2.new(0,0,1,0); G2L["11"]["Name"] = "Select"

-- Tab: Misc
G2L["12"] = Instance.new("TextButton", G2L["8"])
G2L["12"]["TextWrapped"] = true; G2L["12"]["BorderSizePixel"] = 0; G2L["12"]["TextSize"] = 14; G2L["12"]["TextScaled"] = true
G2L["12"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["12"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["12"]["BackgroundTransparency"] = 0.5; G2L["12"]["Size"] = UDim2.new(0.2, 0, 0.05, 10)
G2L["12"]["LayoutOrder"] = 1; G2L["12"]["Text"] = "Misc"; G2L["12"]["Name"] = "Misc"
G2L["12"]["Position"] = UDim2.new(0.61182, 0, 0.00581, 0)

G2L["13"] = Instance.new("Frame", G2L["12"])
G2L["13"]["Visible"] = false; G2L["13"]["BorderSizePixel"] = 0; G2L["13"]["BackgroundColor3"] = Color3.fromRGB(89,255,255)
G2L["13"]["Size"] = UDim2.new(1,0,0.1,0); G2L["13"]["Position"] = UDim2.new(0,0,1,0); G2L["13"]["Name"] = "Select"

-- Items Folder
G2L["14"] = Instance.new("Folder", G2L["5"])
G2L["14"]["Name"] = "Items"

-- ---- GENERAL tab content ----
G2L["15"] = Instance.new("ScrollingFrame", G2L["14"])
G2L["15"]["Active"] = true; G2L["15"]["ScrollingDirection"] = Enum.ScrollingDirection.Y
G2L["15"]["BorderSizePixel"] = 0; G2L["15"]["CanvasSize"] = UDim2.new(0,0,1,0)
G2L["15"]["Name"] = "General"; G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["15"]["AnchorPoint"] = Vector2.new(0,1); G2L["15"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
G2L["15"]["Size"] = UDim2.new(1,-20,0.95,-30); G2L["15"]["ScrollBarImageColor3"] = Color3.fromRGB(0,0,0)
G2L["15"]["Position"] = UDim2.new(0,10,1,-10); G2L["15"]["ScrollBarThickness"] = 10; G2L["15"]["BackgroundTransparency"] = 1

G2L["16"] = Instance.new("UIListLayout", G2L["15"])
G2L["16"]["Padding"] = UDim.new(0,5); G2L["16"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- Movement header
G2L["17"] = Instance.new("Frame", G2L["15"])
G2L["17"]["BorderSizePixel"] = 2; G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["17"]["BorderMode"] = Enum.BorderMode.Inset; G2L["17"]["Size"] = UDim2.new(1,-20,0.03831,15)
G2L["17"]["Name"] = "1Movement"; G2L["17"]["BackgroundTransparency"] = 0.5

G2L["18"] = Instance.new("TextLabel", G2L["17"])
G2L["18"]["TextWrapped"] = true; G2L["18"]["BorderSizePixel"] = 0; G2L["18"]["TextSize"] = 14; G2L["18"]["TextScaled"] = true
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["18"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["18"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["18"]["BackgroundTransparency"] = 1
G2L["18"]["Size"] = UDim2.new(0.97921,0,0.92573,0); G2L["18"]["Text"] = "Movement"; G2L["18"]["Name"] = "Option"
G2L["18"]["Position"] = UDim2.new(0.00868,0,0.07427,0)

-- Fly toggle
G2L["19"] = Instance.new("Frame", G2L["15"])
G2L["19"]["BorderSizePixel"] = 2; G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["19"]["BorderMode"] = Enum.BorderMode.Inset; G2L["19"]["Size"] = UDim2.new(1,-20,0.16,15)
G2L["19"]["Name"] = "Fly"; G2L["19"]["BackgroundTransparency"] = 0.5

G2L["1a"] = Instance.new("TextLabel", G2L["19"])
G2L["1a"]["TextWrapped"] = true; G2L["1a"]["BorderSizePixel"] = 0; G2L["1a"]["TextSize"] = 14
G2L["1a"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["1a"]["TextScaled"] = true
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["1a"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["1a"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["1a"]["BackgroundTransparency"] = 1
G2L["1a"]["Size"] = UDim2.new(0.75,0,0.5,0); G2L["1a"]["Text"] = "Fly"; G2L["1a"]["Name"] = "Option"
G2L["1a"]["Position"] = UDim2.new(0,5,0,5)

G2L["1b"] = Instance.new("Frame", G2L["19"])
G2L["1b"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["1b"]["BorderSizePixel"] = 0
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255,0,0); G2L["1b"]["AnchorPoint"] = Vector2.new(1,0.5)
G2L["1b"]["Size"] = UDim2.new(1,20,0.5,10); G2L["1b"]["Position"] = UDim2.new(1,-10,0.5,0)
G2L["1b"]["Name"] = "Toggle"; G2L["1b"]["BackgroundTransparency"] = 0.5

G2L["1c"] = Instance.new("UICorner", G2L["1b"]); G2L["1c"]["CornerRadius"] = UDim.new(1,0)

G2L["1d"] = Instance.new("TextButton", G2L["1b"])
G2L["1d"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["1d"]["BorderSizePixel"] = 0
G2L["1d"]["TextSize"] = 14; G2L["1d"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(87,0,0)
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["1d"]["Size"] = UDim2.new(1,0,1,0); G2L["1d"]["Text"] = ""; G2L["1d"]["Name"] = "Side"
G2L["1d"]["Position"] = UDim2.new(0.5,0,0,0)

G2L["1e"] = Instance.new("UICorner", G2L["1d"]); G2L["1e"]["CornerRadius"] = UDim.new(1,0)
G2L["1f"] = Instance.new("UIStroke", G2L["1b"]); G2L["1f"]["Thickness"] = 2

G2L["20"] = Instance.new("TextButton", G2L["1b"])
G2L["20"]["TextWrapped"] = true; G2L["20"]["RichText"] = true
G2L["20"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["20"]["BorderSizePixel"] = 2
G2L["20"]["TextSize"] = 20; G2L["20"]["TextScaled"] = true; G2L["20"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["20"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["20"]["BorderMode"] = Enum.BorderMode.Inset; G2L["20"]["BackgroundTransparency"] = 0.5
G2L["20"]["Size"] = UDim2.new(1,0,1,0); G2L["20"]["Text"] = "H"; G2L["20"]["Name"] = "Hotkey"
G2L["20"]["Position"] = UDim2.new(-0.62275,0,0,0)

G2L["21"] = Instance.new("TextButton", G2L["1b"])
G2L["21"]["TextWrapped"] = true; G2L["21"]["RichText"] = true
G2L["21"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["21"]["BorderSizePixel"] = 2
G2L["21"]["TextSize"] = 20; G2L["21"]["TextScaled"] = true; G2L["21"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["21"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["21"]["BorderMode"] = Enum.BorderMode.Inset; G2L["21"]["BackgroundTransparency"] = 0.5
G2L["21"]["Size"] = UDim2.new(2.79134,0,1,0); G2L["21"]["Text"] = "Speed: 1"; G2L["21"]["Name"] = "Hotkey"
G2L["21"]["Position"] = UDim2.new(-2.14267,0,0,0)

G2L["22"] = Instance.new("TextLabel", G2L["19"])
G2L["22"]["TextWrapped"] = true; G2L["22"]["BorderSizePixel"] = 0; G2L["22"]["TextSize"] = 20
G2L["22"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["22"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["22"]["TextScaled"] = true; G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["22"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["22"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["22"]["BackgroundTransparency"] = 1
G2L["22"]["RichText"] = true; G2L["22"]["Size"] = UDim2.new(0.75,0,0.5,-10)
G2L["22"]["Text"] = "Fly around freely"; G2L["22"]["Name"] = "Description"
G2L["22"]["Position"] = UDim2.new(0,5,0.5,5)

-- Assist header
G2L["23"] = Instance.new("Frame", G2L["15"])
G2L["23"]["BorderSizePixel"] = 2; G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["23"]["BorderMode"] = Enum.BorderMode.Inset; G2L["23"]["Size"] = UDim2.new(1,-20,0.03831,15)
G2L["23"]["Name"] = "Assist"; G2L["23"]["BackgroundTransparency"] = 0.5

G2L["24"] = Instance.new("TextLabel", G2L["23"])
G2L["24"]["TextWrapped"] = true; G2L["24"]["BorderSizePixel"] = 0; G2L["24"]["TextSize"] = 14; G2L["24"]["TextScaled"] = true
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["24"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["24"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["24"]["BackgroundTransparency"] = 1
G2L["24"]["Size"] = UDim2.new(0.97921,0,0.92573,0); G2L["24"]["Text"] = "Assist"; G2L["24"]["Name"] = "Option"
G2L["24"]["Position"] = UDim2.new(0.00868,0,0.07427,0)

-- Lock-On toggle
G2L["25"] = Instance.new("Frame", G2L["15"])
G2L["25"]["BorderSizePixel"] = 2; G2L["25"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["25"]["BorderMode"] = Enum.BorderMode.Inset; G2L["25"]["Size"] = UDim2.new(1,-20,0.16,15)
G2L["25"]["Name"] = "Lock-On"; G2L["25"]["BackgroundTransparency"] = 0.5

G2L["26"] = Instance.new("TextLabel", G2L["25"])
G2L["26"]["TextWrapped"] = true; G2L["26"]["BorderSizePixel"] = 0; G2L["26"]["TextSize"] = 14
G2L["26"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["26"]["TextScaled"] = true
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["26"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["26"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["26"]["BackgroundTransparency"] = 1
G2L["26"]["Size"] = UDim2.new(0.75,0,0.5,0); G2L["26"]["Text"] = "Lock-On"; G2L["26"]["Name"] = "Option"
G2L["26"]["Position"] = UDim2.new(0,5,0,5)

G2L["27"] = Instance.new("Frame", G2L["25"])
G2L["27"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["27"]["BorderSizePixel"] = 0
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(255,0,0); G2L["27"]["AnchorPoint"] = Vector2.new(1,0.5)
G2L["27"]["Size"] = UDim2.new(1,20,0.5,10); G2L["27"]["Position"] = UDim2.new(1,-10,0.5,0)
G2L["27"]["Name"] = "Toggle"; G2L["27"]["BackgroundTransparency"] = 0.5

G2L["28"] = Instance.new("UICorner", G2L["27"]); G2L["28"]["CornerRadius"] = UDim.new(1,0)

G2L["29"] = Instance.new("TextButton", G2L["27"])
G2L["29"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["29"]["BorderSizePixel"] = 0
G2L["29"]["TextSize"] = 14; G2L["29"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(87,0,0)
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["29"]["Size"] = UDim2.new(1,0,1,0); G2L["29"]["Text"] = ""; G2L["29"]["Name"] = "Side"
G2L["29"]["Position"] = UDim2.new(0.5,0,0,0)

G2L["2a"] = Instance.new("UICorner", G2L["29"]); G2L["2a"]["CornerRadius"] = UDim.new(1,0)
G2L["2b"] = Instance.new("UIStroke", G2L["27"]); G2L["2b"]["Thickness"] = 2

G2L["2c"] = Instance.new("TextButton", G2L["27"])
G2L["2c"]["TextWrapped"] = true; G2L["2c"]["RichText"] = true
G2L["2c"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["2c"]["BorderSizePixel"] = 2
G2L["2c"]["TextSize"] = 20; G2L["2c"]["TextScaled"] = true; G2L["2c"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["2c"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["2c"]["BorderMode"] = Enum.BorderMode.Inset; G2L["2c"]["BackgroundTransparency"] = 0.5
G2L["2c"]["Size"] = UDim2.new(1,0,1,0); G2L["2c"]["Text"] = "T"; G2L["2c"]["Name"] = "Hotkey"
G2L["2c"]["Position"] = UDim2.new(-0.62275,0,0,0)

G2L["2d"] = Instance.new("TextLabel", G2L["25"])
G2L["2d"]["TextWrapped"] = true; G2L["2d"]["BorderSizePixel"] = 0; G2L["2d"]["TextSize"] = 20
G2L["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["2d"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["2d"]["TextScaled"] = true; G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["2d"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["2d"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["2d"]["BackgroundTransparency"] = 1
G2L["2d"]["RichText"] = true; G2L["2d"]["Size"] = UDim2.new(0.75,0,0.5,-10)
G2L["2d"]["Text"] = "Locks your camera onto a player"; G2L["2d"]["Name"] = "Description"
G2L["2d"]["Position"] = UDim2.new(0,5,0.5,5)

-- ---- PLAYERS tab content ----
G2L["2e"] = Instance.new("Frame", G2L["14"])
G2L["2e"]["Visible"] = false; G2L["2e"]["BorderSizePixel"] = 0; G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["2e"]["AnchorPoint"] = Vector2.new(0,1); G2L["2e"]["Size"] = UDim2.new(1,-20,0.95,-30)
G2L["2e"]["Position"] = UDim2.new(0,10,1,-10); G2L["2e"]["Name"] = "Players"; G2L["2e"]["BackgroundTransparency"] = 1

G2L["2f"] = Instance.new("ScrollingFrame", G2L["2e"])
G2L["2f"]["Active"] = true; G2L["2f"]["ScrollingDirection"] = Enum.ScrollingDirection.Y
G2L["2f"]["BorderSizePixel"] = 0; G2L["2f"]["CanvasSize"] = UDim2.new(0,0,1,0)
G2L["2f"]["Name"] = "List"; G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["2f"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y; G2L["2f"]["Size"] = UDim2.new(0.2,40,1,0)
G2L["2f"]["ScrollBarImageColor3"] = Color3.fromRGB(0,0,0); G2L["2f"]["ScrollBarThickness"] = 5
G2L["2f"]["BackgroundTransparency"] = 0.5

G2L["30"] = Instance.new("UIListLayout", G2L["2f"])
G2L["30"]["Padding"] = UDim.new(0,2); G2L["30"]["SortOrder"] = Enum.SortOrder.LayoutOrder

G2L["31"] = Instance.new("UIStroke", G2L["2f"])
G2L["31"]["Transparency"] = 0.5; G2L["31"]["Thickness"] = 2

-- All Players entry
G2L["32"] = Instance.new("Frame", G2L["2f"])
G2L["32"]["BorderSizePixel"] = 2; G2L["32"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["32"]["Size"] = UDim2.new(1,0,0.125,5); G2L["32"]["Name"] = "All"; G2L["32"]["BackgroundTransparency"] = 0.5

G2L["33"] = Instance.new("ImageLabel", G2L["32"])
G2L["33"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["33"]["BorderSizePixel"] = 0
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(255,255,255); G2L["33"]["Image"] = "rbxassetid://9835638489"
G2L["33"]["Size"] = UDim2.new(1,0,1,0); G2L["33"]["BackgroundTransparency"] = 1; G2L["33"]["Name"] = "Icon"

G2L["34"] = Instance.new("TextLabel", G2L["32"])
G2L["34"]["TextWrapped"] = true; G2L["34"]["BorderSizePixel"] = 0; G2L["34"]["TextSize"] = 14
G2L["34"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["34"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["34"]["TextScaled"] = true; G2L["34"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["34"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["34"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["34"]["BackgroundTransparency"] = 1
G2L["34"]["Size"] = UDim2.new(0.7,0,0.5,0); G2L["34"]["Text"] = "All"; G2L["34"]["Name"] = "Display"
G2L["34"]["Position"] = UDim2.new(0.3,0,0,0)

G2L["35"] = Instance.new("TextLabel", G2L["32"])
G2L["35"]["TextWrapped"] = true; G2L["35"]["BorderSizePixel"] = 0; G2L["35"]["TextSize"] = 14
G2L["35"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["35"]["TextTransparency"] = 0.6
G2L["35"]["TextYAlignment"] = Enum.TextYAlignment.Top; G2L["35"]["TextScaled"] = true
G2L["35"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["35"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["35"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["35"]["BackgroundTransparency"] = 1
G2L["35"]["Size"] = UDim2.new(0.7,0,0.4,0); G2L["35"]["Text"] = "All Players"; G2L["35"]["Name"] = "Main"
G2L["35"]["Position"] = UDim2.new(0.3,0,0.5,0)

G2L["36"] = Instance.new("UIGradient", G2L["32"])
G2L["36"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(1,1)}

G2L["37"] = Instance.new("TextButton", G2L["32"])
G2L["37"]["BorderSizePixel"] = 0; G2L["37"]["TextSize"] = 14; G2L["37"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["37"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["37"]["ZIndex"] = 2; G2L["37"]["BackgroundTransparency"] = 1; G2L["37"]["Size"] = UDim2.new(1,0,1,0)
G2L["37"]["Text"] = ""; G2L["37"]["Name"] = "Select"

-- Player template
G2L["38"] = Instance.new("Frame", G2L["2f"])
G2L["38"]["Visible"] = false; G2L["38"]["BorderSizePixel"] = 2; G2L["38"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["38"]["Size"] = UDim2.new(1,0,0.125,5); G2L["38"]["Name"] = "Player"; G2L["38"]["BackgroundTransparency"] = 1

G2L["39"] = Instance.new("ImageLabel", G2L["38"])
G2L["39"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["39"]["BorderSizePixel"] = 0
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(255,255,255); G2L["39"]["Size"] = UDim2.new(1,0,1,0)
G2L["39"]["BackgroundTransparency"] = 1; G2L["39"]["Name"] = "Icon"

G2L["3a"] = Instance.new("TextLabel", G2L["38"])
G2L["3a"]["TextWrapped"] = true; G2L["3a"]["BorderSizePixel"] = 0; G2L["3a"]["TextSize"] = 14
G2L["3a"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["3a"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["3a"]["TextScaled"] = true; G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["3a"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["3a"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["3a"]["BackgroundTransparency"] = 1
G2L["3a"]["Size"] = UDim2.new(0.7,0,0.5,0); G2L["3a"]["Text"] = "Dummy"; G2L["3a"]["Name"] = "Display"
G2L["3a"]["Position"] = UDim2.new(0.3,0,0,0)

G2L["3b"] = Instance.new("TextLabel", G2L["38"])
G2L["3b"]["TextWrapped"] = true; G2L["3b"]["BorderSizePixel"] = 0; G2L["3b"]["TextSize"] = 14
G2L["3b"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["3b"]["TextTransparency"] = 0.6
G2L["3b"]["TextYAlignment"] = Enum.TextYAlignment.Top; G2L["3b"]["TextScaled"] = true
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["3b"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["3b"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["3b"]["BackgroundTransparency"] = 1
G2L["3b"]["Size"] = UDim2.new(0.7,0,0.4,0); G2L["3b"]["Text"] = "(@Dummy)"; G2L["3b"]["Name"] = "Main"
G2L["3b"]["Position"] = UDim2.new(0.3,0,0.5,0)

G2L["3c"] = Instance.new("UIGradient", G2L["38"])
G2L["3c"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(1,1)}

G2L["3d"] = Instance.new("TextButton", G2L["38"])
G2L["3d"]["BorderSizePixel"] = 0; G2L["3d"]["TextSize"] = 14; G2L["3d"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["3d"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["3d"]["ZIndex"] = 2; G2L["3d"]["BackgroundTransparency"] = 1; G2L["3d"]["Size"] = UDim2.new(1,0,1,0)
G2L["3d"]["Text"] = ""; G2L["3d"]["Name"] = "Select"

-- Players right-side scroll
G2L["3e"] = Instance.new("ScrollingFrame", G2L["2e"])
G2L["3e"]["Active"] = true; G2L["3e"]["ScrollingDirection"] = Enum.ScrollingDirection.Y
G2L["3e"]["BorderSizePixel"] = 0; G2L["3e"]["CanvasSize"] = UDim2.new(0,0,1,0)
G2L["3e"]["Name"] = "Players"; G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["3e"]["AnchorPoint"] = Vector2.new(1,0); G2L["3e"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
G2L["3e"]["Size"] = UDim2.new(0.8,-55,1,0); G2L["3e"]["ScrollBarImageColor3"] = Color3.fromRGB(0,0,0)
G2L["3e"]["Position"] = UDim2.new(1,0,0,0); G2L["3e"]["ScrollBarThickness"] = 10; G2L["3e"]["BackgroundTransparency"] = 1

G2L["3f"] = Instance.new("UIListLayout", G2L["3e"])
G2L["3f"]["Padding"] = UDim.new(0,5); G2L["3f"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- Options header
G2L["40"] = Instance.new("Frame", G2L["3e"])
G2L["40"]["BorderSizePixel"] = 2; G2L["40"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["40"]["BorderMode"] = Enum.BorderMode.Inset; G2L["40"]["Size"] = UDim2.new(1,-20,0.03831,15)
G2L["40"]["Name"] = "V"; G2L["40"]["BackgroundTransparency"] = 0.5

G2L["41"] = Instance.new("TextLabel", G2L["40"])
G2L["41"]["TextWrapped"] = true; G2L["41"]["BorderSizePixel"] = 0; G2L["41"]["TextSize"] = 14; G2L["41"]["TextScaled"] = true
G2L["41"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["41"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["41"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["41"]["BackgroundTransparency"] = 1
G2L["41"]["Size"] = UDim2.new(0.97921,0,0.92573,0); G2L["41"]["Text"] = "Options"; G2L["41"]["Name"] = "Option"
G2L["41"]["Position"] = UDim2.new(0.00868,0,0.07427,0)

-- Friend toggle
G2L["42"] = Instance.new("Frame", G2L["3e"])
G2L["42"]["BorderSizePixel"] = 2; G2L["42"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["42"]["BorderMode"] = Enum.BorderMode.Inset; G2L["42"]["Size"] = UDim2.new(1,-20,0.16,15)
G2L["42"]["Name"] = "Friend"; G2L["42"]["BackgroundTransparency"] = 0.5

G2L["43"] = Instance.new("TextLabel", G2L["42"])
G2L["43"]["TextWrapped"] = true; G2L["43"]["BorderSizePixel"] = 0; G2L["43"]["TextSize"] = 14
G2L["43"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["43"]["TextScaled"] = true
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["43"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["43"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["43"]["BackgroundTransparency"] = 1
G2L["43"]["Size"] = UDim2.new(0.75,0,0.5,0); G2L["43"]["Text"] = "Add friend"; G2L["43"]["Name"] = "Option"
G2L["43"]["Position"] = UDim2.new(0,5,0,5)

G2L["44"] = Instance.new("TextLabel", G2L["42"])
G2L["44"]["TextWrapped"] = true; G2L["44"]["BorderSizePixel"] = 0; G2L["44"]["TextSize"] = 20
G2L["44"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["44"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["44"]["TextScaled"] = true; G2L["44"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["44"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["44"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["44"]["BackgroundTransparency"] = 1
G2L["44"]["RichText"] = true; G2L["44"]["Size"] = UDim2.new(0.75,0,0.5,-10)
G2L["44"]["Text"] = "Adds the player as a friend, changes certain features"; G2L["44"]["Name"] = "Description"
G2L["44"]["Position"] = UDim2.new(0,5,0.5,5)

G2L["45"] = Instance.new("Frame", G2L["42"])
G2L["45"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["45"]["BorderSizePixel"] = 0
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(255,0,0); G2L["45"]["AnchorPoint"] = Vector2.new(1,0.5)
G2L["45"]["Size"] = UDim2.new(1,20,0.5,10); G2L["45"]["Position"] = UDim2.new(1,-10,0.5,0)
G2L["45"]["Name"] = "Toggle"; G2L["45"]["BackgroundTransparency"] = 0.5

G2L["46"] = Instance.new("UICorner", G2L["45"]); G2L["46"]["CornerRadius"] = UDim.new(1,0)

G2L["47"] = Instance.new("TextButton", G2L["45"])
G2L["47"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["47"]["BorderSizePixel"] = 0
G2L["47"]["TextSize"] = 14; G2L["47"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(88,0,0)
G2L["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["47"]["Size"] = UDim2.new(1,0,1,0); G2L["47"]["Text"] = ""; G2L["47"]["Name"] = "Side"
G2L["47"]["Position"] = UDim2.new(0.5,0,0,0)

G2L["48"] = Instance.new("UICorner", G2L["47"]); G2L["48"]["CornerRadius"] = UDim.new(1,0)
G2L["49"] = Instance.new("UIStroke", G2L["45"]); G2L["49"]["Thickness"] = 2

-- Visuals header
G2L["4a"] = Instance.new("Frame", G2L["3e"])
G2L["4a"]["BorderSizePixel"] = 2; G2L["4a"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["4a"]["BorderMode"] = Enum.BorderMode.Inset; G2L["4a"]["Size"] = UDim2.new(1,-20,0.03831,15)
G2L["4a"]["Name"] = "V2"; G2L["4a"]["BackgroundTransparency"] = 0.5

G2L["4b"] = Instance.new("TextLabel", G2L["4a"])
G2L["4b"]["TextWrapped"] = true; G2L["4b"]["BorderSizePixel"] = 0; G2L["4b"]["TextSize"] = 14; G2L["4b"]["TextScaled"] = true
G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["4b"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["4b"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["4b"]["BackgroundTransparency"] = 1
G2L["4b"]["Size"] = UDim2.new(0.97921,0,0.92573,0); G2L["4b"]["Text"] = "Visuals"; G2L["4b"]["Name"] = "Option"
G2L["4b"]["Position"] = UDim2.new(0.00868,0,0.07427,0)

-- Chams toggle
G2L["4c"] = Instance.new("Frame", G2L["3e"])
G2L["4c"]["BorderSizePixel"] = 2; G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["4c"]["BorderMode"] = Enum.BorderMode.Inset; G2L["4c"]["Size"] = UDim2.new(1,-20,0.16,15)
G2L["4c"]["Name"] = "Chams"; G2L["4c"]["BackgroundTransparency"] = 0.5

G2L["4d"] = Instance.new("TextLabel", G2L["4c"])
G2L["4d"]["TextWrapped"] = true; G2L["4d"]["BorderSizePixel"] = 0; G2L["4d"]["TextSize"] = 14
G2L["4d"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["4d"]["TextScaled"] = true
G2L["4d"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["4d"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["4d"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["4d"]["BackgroundTransparency"] = 1
G2L["4d"]["Size"] = UDim2.new(0.75,0,0.5,0); G2L["4d"]["Text"] = "Chams"; G2L["4d"]["Name"] = "Option"
G2L["4d"]["Position"] = UDim2.new(0,5,0,5)

G2L["4e"] = Instance.new("Frame", G2L["4c"])
G2L["4e"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["4e"]["BorderSizePixel"] = 0
G2L["4e"]["BackgroundColor3"] = Color3.fromRGB(255,0,0); G2L["4e"]["AnchorPoint"] = Vector2.new(1,0.5)
G2L["4e"]["Size"] = UDim2.new(1,20,0.5,10); G2L["4e"]["Position"] = UDim2.new(1,-10,0.5,0)
G2L["4e"]["Name"] = "Toggle"; G2L["4e"]["BackgroundTransparency"] = 0.5

G2L["4f"] = Instance.new("UICorner", G2L["4e"]); G2L["4f"]["CornerRadius"] = UDim.new(1,0)

G2L["50"] = Instance.new("TextButton", G2L["4e"])
G2L["50"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["50"]["BorderSizePixel"] = 0
G2L["50"]["TextSize"] = 14; G2L["50"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["50"]["BackgroundColor3"] = Color3.fromRGB(87,0,0)
G2L["50"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["50"]["Size"] = UDim2.new(1,0,1,0); G2L["50"]["Text"] = ""; G2L["50"]["Name"] = "Side"
G2L["50"]["Position"] = UDim2.new(0.5,0,0,0)

G2L["51"] = Instance.new("UICorner", G2L["50"]); G2L["51"]["CornerRadius"] = UDim.new(1,0)
G2L["52"] = Instance.new("UIStroke", G2L["4e"]); G2L["52"]["Thickness"] = 2

G2L["53"] = Instance.new("TextLabel", G2L["4c"])
G2L["53"]["TextWrapped"] = true; G2L["53"]["BorderSizePixel"] = 0; G2L["53"]["TextSize"] = 20
G2L["53"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["53"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["53"]["TextScaled"] = true; G2L["53"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["53"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["53"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["53"]["BackgroundTransparency"] = 1
G2L["53"]["RichText"] = true; G2L["53"]["Size"] = UDim2.new(0.75,0,0.5,-10)
G2L["53"]["Text"] = "Toggles outlines on players"; G2L["53"]["Name"] = "Description"
G2L["53"]["Position"] = UDim2.new(0,5,0.5,5)

-- ---- SETTINGS tab content ----
G2L["54"] = Instance.new("ScrollingFrame", G2L["14"])
G2L["54"]["Visible"] = false; G2L["54"]["Active"] = true
G2L["54"]["ScrollingDirection"] = Enum.ScrollingDirection.Y; G2L["54"]["BorderSizePixel"] = 0
G2L["54"]["CanvasSize"] = UDim2.new(0,0,1,0)
G2L["54"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
G2L["54"]["Name"] = "Settings"; G2L["54"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["54"]["AnchorPoint"] = Vector2.new(0,1); G2L["54"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
G2L["54"]["Size"] = UDim2.new(1,-20,0.95,-30); G2L["54"]["ScrollBarImageColor3"] = Color3.fromRGB(0,0,0)
G2L["54"]["Position"] = UDim2.new(0,10,1,-10); G2L["54"]["ScrollBarThickness"] = 10
G2L["54"]["BackgroundTransparency"] = 1

G2L["55"] = Instance.new("UIListLayout", G2L["54"])
G2L["55"]["Padding"] = UDim.new(0,5); G2L["55"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- Config row (LayoutOrder 1 - shows above Panic)
G2L["5c"] = Instance.new("Frame", G2L["54"])
G2L["5c"]["BorderSizePixel"] = 2; G2L["5c"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["5c"]["BorderMode"] = Enum.BorderMode.Inset; G2L["5c"]["Size"] = UDim2.new(1,-20,0.16,15)
G2L["5c"]["Name"] = "Config"; G2L["5c"]["LayoutOrder"] = 1; G2L["5c"]["BackgroundTransparency"] = 0.5

G2L["5d"] = Instance.new("TextLabel", G2L["5c"])
G2L["5d"]["TextWrapped"] = true; G2L["5d"]["BorderSizePixel"] = 0; G2L["5d"]["TextSize"] = 14
G2L["5d"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["5d"]["TextScaled"] = true
G2L["5d"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["5d"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["5d"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["5d"]["BackgroundTransparency"] = 1
G2L["5d"]["Size"] = UDim2.new(0.45,0,0.5,0); G2L["5d"]["Text"] = "Configs"; G2L["5d"]["Name"] = "Option"
G2L["5d"]["Position"] = UDim2.new(0,5,0,5)

G2L["5e"] = Instance.new("TextLabel", G2L["5c"])
G2L["5e"]["TextWrapped"] = true; G2L["5e"]["BorderSizePixel"] = 0; G2L["5e"]["TextSize"] = 20
G2L["5e"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["5e"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["5e"]["TextScaled"] = true; G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["5e"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["5e"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["5e"]["BackgroundTransparency"] = 1
G2L["5e"]["RichText"] = true; G2L["5e"]["Size"] = UDim2.new(0.45,0,0.5,-10)
G2L["5e"]["Text"] = "Save and load configurations (rename files in Vision/Configs folder)"
G2L["5e"]["Name"] = "Description"; G2L["5e"]["Position"] = UDim2.new(0,5,0.5,5)

-- Load button
G2L["5f"] = Instance.new("TextButton", G2L["5c"])
G2L["5f"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["5f"]["BorderSizePixel"] = 0
G2L["5f"]["TextSize"] = 25; G2L["5f"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["5f"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["5f"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["5f"]["AnchorPoint"] = Vector2.new(1,0.5); G2L["5f"]["Size"] = UDim2.new(1,20,0.5,10)
G2L["5f"]["Text"] = "Load"; G2L["5f"]["Name"] = "LoadBtn"; G2L["5f"]["Position"] = UDim2.new(1,-10,0.5,0)

G2L["60"] = Instance.new("UICorner", G2L["5f"]); G2L["60"]["CornerRadius"] = UDim.new(1,0)
G2L["61"] = Instance.new("UIStroke", G2L["5f"]); G2L["61"]["Thickness"] = 2; G2L["61"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- Save button
G2L["62"] = Instance.new("TextButton", G2L["5c"])
G2L["62"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["62"]["BorderSizePixel"] = 0
G2L["62"]["TextSize"] = 25; G2L["62"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["62"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["62"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["62"]["AnchorPoint"] = Vector2.new(1,0.5); G2L["62"]["Size"] = UDim2.new(1,20,0.5,10)
G2L["62"]["Text"] = "Save"; G2L["62"]["Name"] = "SaveBtn"; G2L["62"]["Position"] = UDim2.new(0.87083,-10,0.5,0)

G2L["63"] = Instance.new("UICorner", G2L["62"]); G2L["63"]["CornerRadius"] = UDim.new(1,0)
G2L["64"] = Instance.new("UIStroke", G2L["62"]); G2L["64"]["Thickness"] = 2; G2L["64"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- Config picker ScreenGui - always enabled, content hidden via CanvasGroup
G2L["65"] = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
G2L["65"]["IgnoreGuiInset"] = true; G2L["65"]["DisplayOrder"] = 8
G2L["65"]["Enabled"] = true
G2L["65"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets
G2L["65"]["Name"] = "VisionConfigPicker"; G2L["65"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
G2L["65"]["ResetOnSpawn"] = false

-- CanvasGroup used for the fade/slide animation (mirrors G2L["2"])
G2L["66"] = Instance.new("CanvasGroup", G2L["65"])
G2L["66"]["BorderSizePixel"] = 0
G2L["66"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["66"]["BackgroundTransparency"] = 1
G2L["66"]["Size"] = UDim2.new(1,0,1,0)
G2L["66"]["Name"] = "Fade"
G2L["66"]["GroupTransparency"] = 1
G2L["66"]["Visible"] = false

-- EmoteSelection-style inner content frame
G2L["cfgFrame"] = Instance.new("Frame", G2L["66"])
local cfgFrame = G2L["cfgFrame"]
cfgFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
cfgFrame.BorderSizePixel = 2
cfgFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
cfgFrame.AnchorPoint = Vector2.new(0.5,0.5)
cfgFrame.Size = UDim2.new(0.2,150,0.2,200)
cfgFrame.Position = UDim2.new(0.862,0,0.5,0)
cfgFrame.BorderColor3 = Color3.fromRGB(0,0,0)
cfgFrame.BackgroundTransparency = 0.5
cfgFrame.Name = "Emotes"

-- UIGradient (matches EmoteSelection style)
local cfgGrad = Instance.new("UIGradient", cfgFrame)
cfgGrad.Rotation = 90
cfgGrad.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0.000, 0),
    NumberSequenceKeypoint.new(0.773, 0.50276),
    NumberSequenceKeypoint.new(1.000, 0.53039)
}

-- UIPadding
local cfgPad = Instance.new("UIPadding", cfgFrame)
cfgPad.PaddingTop = UDim.new(0,5); cfgPad.PaddingRight = UDim.new(0,5)
cfgPad.PaddingLeft = UDim.new(0,5); cfgPad.PaddingBottom = UDim.new(0,5)

-- UIListLayout (HorizontalAlignment Center, matches EmoteSelection)
local cfgLayout = Instance.new("UIListLayout", cfgFrame)
cfgLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
cfgLayout.Padding = UDim.new(0,10); cfgLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- UIScale removed - was causing blurry text rendering

-- Search TextBox (LayoutOrder 0 - top of layout)
G2L["68"] = Instance.new("TextBox", cfgFrame)
G2L["68"]["PlaceholderColor3"] = Color3.fromRGB(107,107,107)
G2L["68"]["BorderSizePixel"] = 2; G2L["68"]["TextWrapped"] = true; G2L["68"]["TextSize"] = 14
G2L["68"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["68"]["TextScaled"] = true
G2L["68"]["BackgroundColor3"] = Color3.fromRGB(255,255,255); G2L["68"]["RichText"] = true
G2L["68"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["68"]["PlaceholderText"] = "Search config name"; G2L["68"]["LayoutOrder"] = 0
G2L["68"]["Size"] = UDim2.new(1,0,0,30)
G2L["68"]["BorderColor3"] = Color3.fromRGB(0,0,0)
G2L["68"]["Text"] = ""; G2L["68"]["BackgroundTransparency"] = 0.5; G2L["68"]["Name"] = "SearchBox"

-- Config list ScrollingFrame (LayoutOrder 1)
G2L["69"] = Instance.new("ScrollingFrame", cfgFrame)
G2L["69"]["Active"] = true; G2L["69"]["BorderSizePixel"] = 0
G2L["69"]["CanvasSize"] = UDim2.new(0,0,0.5,0)
G2L["69"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always
G2L["69"]["Name"] = "Search"; G2L["69"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["69"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
G2L["69"]["Size"] = UDim2.new(1,0,1,0)
G2L["69"]["ScrollBarImageColor3"] = Color3.fromRGB(0,0,0)
G2L["69"]["BorderColor3"] = Color3.fromRGB(0,0,0); G2L["69"]["LayoutOrder"] = 1
G2L["69"]["BackgroundTransparency"] = 1

-- UIListLayout inside scroll
G2L["6a"] = Instance.new("UIListLayout", G2L["69"])
G2L["6a"]["Padding"] = UDim.new(0,5); G2L["6a"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- UIFlexItem so scroll fills available space
local cfgFlexItem = Instance.new("UIFlexItem", G2L["69"])
cfgFlexItem.FlexMode = Enum.UIFlexMode.Fill

-- Config entry template (hidden, used as Clone source)
G2L["6c"] = Instance.new("Frame", G2L["69"])
G2L["6c"]["BorderSizePixel"] = 2; G2L["6c"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["6c"]["BorderMode"] = Enum.BorderMode.Inset; G2L["6c"]["Size"] = UDim2.new(1.0516,-20,0.0939,15)
G2L["6c"]["BorderColor3"] = Color3.fromRGB(0,0,0)
G2L["6c"]["Name"] = "ConfigTemplate"; G2L["6c"]["BackgroundTransparency"] = 0.5
G2L["6c"]["Visible"] = false

G2L["6d"] = Instance.new("TextButton", G2L["6c"])
G2L["6d"]["TextWrapped"] = true; G2L["6d"]["BorderSizePixel"] = 0; G2L["6d"]["TextSize"] = 14
G2L["6d"]["TextScaled"] = true; G2L["6d"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["6d"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["6d"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["6d"]["BackgroundTransparency"] = 1; G2L["6d"]["Size"] = UDim2.new(1.03568,-20,0.57508,15)
G2L["6d"]["LayoutOrder"] = 2; G2L["6d"]["Text"] = "Vision_Config1"; G2L["6d"]["Name"] = "Configuration"
G2L["6d"]["Position"] = UDim2.new(0.01028,0,0.04224,0)

-- Overwrite button (LayoutOrder 2)
G2L["6f"] = Instance.new("TextButton", cfgFrame)
G2L["6f"]["TextWrapped"] = true; G2L["6f"]["RichText"] = true
G2L["6f"]["BorderSizePixel"] = 2; G2L["6f"]["BorderMode"] = Enum.BorderMode.Inset; G2L["6f"]["TextSize"] = 14; G2L["6f"]["TextScaled"] = true
G2L["6f"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["6f"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["6f"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["6f"]["BackgroundTransparency"] = 0.5; G2L["6f"]["Size"] = UDim2.new(1,0,-0.03428,50)
G2L["6f"]["LayoutOrder"] = 2; G2L["6f"]["BorderColor3"] = Color3.fromRGB(0,0,0)
G2L["6f"]["Text"] = "Overwrite"; G2L["6f"]["Name"] = "Overwrite"

-- Load button in popup (LayoutOrder 3)
G2L["72"] = Instance.new("TextButton", cfgFrame)
G2L["72"]["TextWrapped"] = true; G2L["72"]["RichText"] = true
G2L["72"]["BorderSizePixel"] = 2; G2L["72"]["BorderMode"] = Enum.BorderMode.Inset; G2L["72"]["TextSize"] = 14; G2L["72"]["TextScaled"] = true
G2L["72"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["72"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["72"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["72"]["BackgroundTransparency"] = 0.5; G2L["72"]["Size"] = UDim2.new(1,0,-0.03428,50)
G2L["72"]["LayoutOrder"] = 3; G2L["72"]["BorderColor3"] = Color3.fromRGB(0,0,0)
G2L["72"]["Text"] = "Load"; G2L["72"]["Name"] = "Load"

-- Close button (LayoutOrder 4, red background, bold X - matches EmoteSelection)
local configCloseBtn = Instance.new("TextButton", cfgFrame)
configCloseBtn.TextWrapped = true; configCloseBtn.RichText = true
configCloseBtn.BorderSizePixel = 2; configCloseBtn.BorderMode = Enum.BorderMode.Inset; configCloseBtn.TextScaled = true
configCloseBtn.TextColor3 = Color3.fromRGB(0,0,0)
configCloseBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
configCloseBtn.FontFace = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
configCloseBtn.BackgroundTransparency = 0.5; configCloseBtn.Size = UDim2.new(1,0,-0.03428,50)
configCloseBtn.LayoutOrder = 4; configCloseBtn.BorderColor3 = Color3.fromRGB(0,0,0)
configCloseBtn.Text = "X"; configCloseBtn.Name = "Close"

-- Panic row
G2L["56"] = Instance.new("Frame", G2L["54"])
G2L["56"]["BorderSizePixel"] = 2; G2L["56"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["56"]["BorderMode"] = Enum.BorderMode.Inset; G2L["56"]["Size"] = UDim2.new(1,-20,0.16,15)
G2L["56"]["Name"] = "Panic"; G2L["56"]["LayoutOrder"] = 2; G2L["56"]["BackgroundTransparency"] = 0.5

G2L["57"] = Instance.new("TextLabel", G2L["56"])
G2L["57"]["TextWrapped"] = true; G2L["57"]["BorderSizePixel"] = 0; G2L["57"]["TextSize"] = 14
G2L["57"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["57"]["TextScaled"] = true
G2L["57"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["57"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["57"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["57"]["BackgroundTransparency"] = 1
G2L["57"]["Size"] = UDim2.new(0.75,0,0.5,0); G2L["57"]["Text"] = "Panic"; G2L["57"]["Name"] = "Option"
G2L["57"]["Position"] = UDim2.new(0,5,0,5)

G2L["58"] = Instance.new("TextLabel", G2L["56"])
G2L["58"]["TextWrapped"] = true; G2L["58"]["BorderSizePixel"] = 0; G2L["58"]["TextSize"] = 20
G2L["58"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["58"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["58"]["TextScaled"] = true; G2L["58"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["58"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["58"]["TextColor3"] = Color3.fromRGB(255,0,0); G2L["58"]["BackgroundTransparency"] = 1
G2L["58"]["RichText"] = true; G2L["58"]["Size"] = UDim2.new(0.75,0,0.5,-10)
G2L["58"]["Text"] = "Deletes UI and will disable all features"; G2L["58"]["Name"] = "Description"
G2L["58"]["Position"] = UDim2.new(0,5,0.5,5)

G2L["59"] = Instance.new("TextButton", G2L["56"])
G2L["59"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY; G2L["59"]["BorderSizePixel"] = 0
G2L["59"]["TextSize"] = 25; G2L["59"]["TextColor3"] = Color3.fromRGB(0,0,0)
G2L["59"]["BackgroundColor3"] = Color3.fromRGB(255,110,110)
G2L["59"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["59"]["AnchorPoint"] = Vector2.new(1,0.5); G2L["59"]["Size"] = UDim2.new(1,20,0.5,10)
G2L["59"]["Text"] = "Eject"; G2L["59"]["Name"] = "Button"; G2L["59"]["Position"] = UDim2.new(1,-10,0.5,0)

G2L["5a"] = Instance.new("UICorner", G2L["59"]); G2L["5a"]["CornerRadius"] = UDim.new(1,0)
G2L["5b"] = Instance.new("UIStroke", G2L["59"]); G2L["5b"]["Thickness"] = 2; G2L["5b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- ---- AUTOMATION tab content ----
G2L["73"] = Instance.new("ScrollingFrame", G2L["14"])
G2L["73"]["Visible"] = false; G2L["73"]["Active"] = true
G2L["73"]["ScrollingDirection"] = Enum.ScrollingDirection.Y; G2L["73"]["BorderSizePixel"] = 0
G2L["73"]["CanvasSize"] = UDim2.new(0,0,1,0); G2L["73"]["Name"] = "Automation"
G2L["73"]["BackgroundColor3"] = Color3.fromRGB(255,255,255); G2L["73"]["AnchorPoint"] = Vector2.new(0,1)
G2L["73"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y; G2L["73"]["Size"] = UDim2.new(1,-20,0.95,-30)
G2L["73"]["ScrollBarImageColor3"] = Color3.fromRGB(0,0,0); G2L["73"]["Position"] = UDim2.new(0,10,1,-10)
G2L["73"]["ScrollBarThickness"] = 10; G2L["73"]["BackgroundTransparency"] = 1

G2L["74"] = Instance.new("UIListLayout", G2L["73"])
G2L["74"]["Padding"] = UDim.new(0,5); G2L["74"]["SortOrder"] = Enum.SortOrder.LayoutOrder

local function makeAutoHeader(parent, name, text)
    local f = Instance.new("Frame", parent)
    f.BorderSizePixel = 2; f.BackgroundColor3 = Color3.fromRGB(255,255,255)
    f.BorderMode = Enum.BorderMode.Inset; f.Size = UDim2.new(1,-20,0.03831,15)
    f.Name = name; f.BackgroundTransparency = 0.5
    local lbl = Instance.new("TextLabel", f)
    lbl.TextWrapped = true; lbl.BorderSizePixel = 0; lbl.TextSize = 14; lbl.TextScaled = true
    lbl.BackgroundColor3 = Color3.fromRGB(255,255,255)
    lbl.FontFace = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    lbl.TextColor3 = Color3.fromRGB(0,0,0); lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(0.97921,0,0.92573,0); lbl.Text = text; lbl.Name = "Option"
    lbl.Position = UDim2.new(0.00868,0,0.07427,0)
    return f
end

local function makeAutoRow(parent, name, labelText, descText)
    local f = Instance.new("Frame", parent)
    f.BorderSizePixel = 2; f.BackgroundColor3 = Color3.fromRGB(255,255,255)
    f.BorderMode = Enum.BorderMode.Inset; f.Size = UDim2.new(1,-20,0.16,15)
    f.Name = name; f.BackgroundTransparency = 0.5

    local opt = Instance.new("TextLabel", f)
    opt.TextWrapped = true; opt.BorderSizePixel = 0; opt.TextSize = 14
    opt.TextXAlignment = Enum.TextXAlignment.Left; opt.TextScaled = true
    opt.BackgroundColor3 = Color3.fromRGB(255,255,255)
    opt.FontFace = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    opt.TextColor3 = Color3.fromRGB(0,0,0); opt.BackgroundTransparency = 1
    opt.Size = UDim2.new(0.75,0,0.5,0); opt.Text = labelText; opt.Name = "Option"
    opt.Position = UDim2.new(0,5,0,5)

    local desc = Instance.new("TextLabel", f)
    desc.TextWrapped = true; desc.BorderSizePixel = 0; desc.TextSize = 20
    desc.TextXAlignment = Enum.TextXAlignment.Left; desc.TextYAlignment = Enum.TextYAlignment.Top
    desc.TextScaled = true; desc.BackgroundColor3 = Color3.fromRGB(255,255,255)
    desc.FontFace = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    desc.TextColor3 = Color3.fromRGB(0,0,0); desc.BackgroundTransparency = 1; desc.RichText = true
    desc.Size = UDim2.new(0.75,0,0.5,-10); desc.Text = descText; desc.Name = "Description"
    desc.Position = UDim2.new(0,5,0.5,5)

    local toggleFrame = Instance.new("Frame", f)
    toggleFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY; toggleFrame.BorderSizePixel = 0
    toggleFrame.BackgroundColor3 = Color3.fromRGB(255,0,0); toggleFrame.AnchorPoint = Vector2.new(1,0.5)
    toggleFrame.Size = UDim2.new(1,20,0.5,10); toggleFrame.Position = UDim2.new(1,-10,0.5,0)
    toggleFrame.Name = "Toggle"; toggleFrame.BackgroundTransparency = 0.5
    Instance.new("UICorner", toggleFrame).CornerRadius = UDim.new(1,0)
    Instance.new("UIStroke", toggleFrame).Thickness = 2

    local side = Instance.new("TextButton", toggleFrame)
    side.SizeConstraint = Enum.SizeConstraint.RelativeYY; side.BorderSizePixel = 0
    side.TextSize = 14; side.TextColor3 = Color3.fromRGB(0,0,0)
    side.BackgroundColor3 = Color3.fromRGB(87,0,0)
    side.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    side.Size = UDim2.new(1,0,1,0); side.Text = ""; side.Name = "Side"
    side.Position = UDim2.new(0.5,0,0,0)
    Instance.new("UICorner", side).CornerRadius = UDim.new(1,0)

    return f, toggleFrame, side
end

makeAutoHeader(G2L["73"], "HO", "Honored One")
local albRow, albToggle, albSide = makeAutoRow(G2L["73"], "ALB", "Auto Lapse Blue Variant", "Automates lapse blue variant")
local arrRow, arrToggle, arrSide = makeAutoRow(G2L["73"], "ARR", "Auto Reversal Teleport",  "Automates reversal red teleport")
makeAutoHeader(G2L["73"], "V",  "Vessel")
local abfRow, abfToggle, abfSide = makeAutoRow(G2L["73"], "ABF", "Auto Black Flash",         "Automates black flash")
makeAutoHeader(G2L["73"], "S",  "Switcher")
local apsRow, apsToggle, apsSide = makeAutoRow(G2L["73"], "APS", "Auto Perfect Swap",        "Automates perfect swap")
local arpRow, arpToggle, arpSide = makeAutoRow(G2L["73"], "ARP", "Auto Rapid Punches Variant","Automates rapid punches variant")

-- ---- MISC tab content ----
G2L["a3"] = Instance.new("ScrollingFrame", G2L["14"])
G2L["a3"]["Visible"] = false; G2L["a3"]["Active"] = true
G2L["a3"]["ScrollingDirection"] = Enum.ScrollingDirection.Y; G2L["a3"]["BorderSizePixel"] = 0
G2L["a3"]["CanvasSize"] = UDim2.new(0,0,1,0); G2L["a3"]["Name"] = "Misc"
G2L["a3"]["BackgroundColor3"] = Color3.fromRGB(255,255,255); G2L["a3"]["AnchorPoint"] = Vector2.new(0,1)
G2L["a3"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y; G2L["a3"]["Size"] = UDim2.new(1,-20,0.95,-30)
G2L["a3"]["ScrollBarImageColor3"] = Color3.fromRGB(0,0,0); G2L["a3"]["Position"] = UDim2.new(0,10,1,-10)
G2L["a3"]["ScrollBarThickness"] = 10; G2L["a3"]["BackgroundTransparency"] = 1

G2L["a4"] = Instance.new("UIListLayout", G2L["a3"])
G2L["a4"]["Padding"] = UDim.new(0,5); G2L["a4"]["SortOrder"] = Enum.SortOrder.LayoutOrder

local killAllRow, killAllToggle, killAllSide = makeAutoRow(G2L["a3"], "Kill All", "Kill All",
    "Kills every player in the server (Warning: buggy, use HO awakening variant)")
killAllRow.BackgroundTransparency = 0.5

local kaDescLabel = killAllRow:FindFirstChild("Description")
if kaDescLabel then kaDescLabel.TextColor3 = Color3.fromRGB(255,0,0) end

-- ---- VISUALS (General tab, created here because makeAutoRow is defined above) ----
makeAutoHeader(G2L["15"], "VisualsHeader", "Visuals")
local doorRow, doorToggle, doorSide = makeAutoRow(G2L["15"], "DoorChams", "Door Chams",
    "Enables an outline for the Halloween Event Doors.")

local kaDescLabel = killAllRow:FindFirstChild("Description")
if kaDescLabel then kaDescLabel.TextColor3 = Color3.fromRGB(255,0,0) end

-- ---- LABEL (version) ----
G2L["ad"] = Instance.new("Frame", G2L["4"])
G2L["ad"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
G2L["ad"]["BorderSizePixel"] = 0; G2L["ad"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["ad"]["AnchorPoint"] = Vector2.new(0.5,0.5)
G2L["ad"]["Size"] = UDim2.new(0.36986,70,-0.075,70)
G2L["ad"]["Position"] = UDim2.new(0.3586,0,0.20718,0)
G2L["ad"]["Name"] = "label"; G2L["ad"]["BackgroundTransparency"] = 0.5

G2L["ae"] = Instance.new("UIStroke", G2L["ad"]); G2L["ae"]["Transparency"] = 0.5; G2L["ae"]["Thickness"] = 2

G2L["af"] = Instance.new("UIGradient", G2L["ad"])
G2L["af"]["Rotation"] = 90
G2L["af"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.773,0.50276),NumberSequenceKeypoint.new(1,0.53039)}

G2L["b0"] = Instance.new("TextLabel", G2L["ad"])
G2L["b0"]["TextWrapped"] = true; G2L["b0"]["BorderSizePixel"] = 0; G2L["b0"]["TextSize"] = 20
G2L["b0"]["TextXAlignment"] = Enum.TextXAlignment.Left; G2L["b0"]["TextScaled"] = true
G2L["b0"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)
G2L["b0"]["FontFace"] = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["b0"]["TextColor3"] = Color3.fromRGB(0,0,0); G2L["b0"]["BackgroundTransparency"] = 1
G2L["b0"]["RichText"] = true; G2L["b0"]["Size"] = UDim2.new(1,-10,1,0)
G2L["b0"]["Text"] = "vision by wikii - 1.0"; G2L["b0"]["Name"] = "label"; G2L["b0"]["Position"] = UDim2.new(0,5,0,0)

-- ==============================================================
-- LOGIC
-- ==============================================================

-- ===== TOGGLE STATE TABLES =====
local chamsEnabled  = false
local flyEnabled    = {value = false}
local lockOnEnabled = {value = false}
local killAllEnabled= {value = false}
local albEnabled    = {value = false}
local arrEnabled    = {value = false}
local abfEnabled    = {value = false}
local apsEnabled    = {value = false}
local arpEnabled    = {value = false}

local widget -- forward declaration so panic handler can reference it
local toggleRegistry = {} -- every toggle registered here; panic iterates to disable all

local tweenFast = TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)

local function setToggleVisual(sideBtn, toggleFrame, on)
    if on then
        TweenService:Create(sideBtn, tweenFast, {Position=UDim2.new(0,0,0,0), BackgroundColor3=Color3.fromRGB(169,255,189)}):Play()
        TweenService:Create(toggleFrame, tweenFast, {BackgroundColor3=Color3.fromRGB(86,255,0)}):Play()
    else
        TweenService:Create(sideBtn, tweenFast, {Position=UDim2.new(0.5,0,0,0), BackgroundColor3=Color3.fromRGB(87,0,0)}):Play()
        TweenService:Create(toggleFrame, tweenFast, {BackgroundColor3=Color3.fromRGB(255,0,0)}):Play()
    end
end

local function setupToggle(sideBtn, toggleFrame, enabledRef, onEnable, onDisable)
    setToggleVisual(sideBtn, toggleFrame, false)
    -- Register so panic can disable everything automatically
    table.insert(toggleRegistry, {ref=enabledRef, side=sideBtn, frame=toggleFrame, onDisable=onDisable})
    sideBtn.MouseButton1Click:Connect(function()
        enabledRef.value = not enabledRef.value
        setToggleVisual(sideBtn, toggleFrame, enabledRef.value)
        if enabledRef.value then
            if onEnable then onEnable() end
        else
            if onDisable then onDisable() end
        end
    end)
end

-- ===== PLAYER SELECTION =====
local selectedFrame = G2L["32"]
local currentSelectedPlayer = nil
selectedFrame.BackgroundTransparency = 0.5

local function selectFrame(frame)
    if selectedFrame then selectedFrame.BackgroundTransparency = 1 end
    selectedFrame = frame
    selectedFrame.BackgroundTransparency = 0.5
    -- Chams only visible when All Players selected
    G2L["4c"].Visible = (currentSelectedPlayer == nil)
end

G2L["37"].MouseButton1Click:Connect(function()
    currentSelectedPlayer = nil
    selectFrame(G2L["32"])
end)
G2L["4c"].Visible = true

-- ===== CHAMS =====
local UsernameColors = { ["BaconWhitelist"] = Color3.fromRGB(255,255,0) }
local DEFAULT_COLOR  = Color3.fromRGB(255,0,0)
local FRIEND_COLOR   = Color3.fromRGB(0,255,0)

local function addChams(player, character)
    if player == LocalPlayer then return end
    if not character or character:FindFirstChild("ChamsHighlight") then return end
    local hl = Instance.new("Highlight")
    hl.Name = "ChamsHighlight"; hl.Adornee = character
    local col = UsernameColors[player.Name] or DEFAULT_COLOR
    hl.FillColor = col; hl.OutlineColor = col
    hl.FillTransparency = 1; hl.OutlineTransparency = 0.5
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; hl.Parent = character
end

local function removeChams()
    for _, p in ipairs(Players:GetPlayers()) do
        local c = p.Character
        if c and c:FindFirstChild("ChamsHighlight") then c.ChamsHighlight:Destroy() end
    end
end

local function applyChamsToAll()
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character then addChams(p, p.Character) end
    end
end

setToggleVisual(G2L["50"], G2L["4e"], false)
G2L["50"].MouseButton1Click:Connect(function()
    if currentSelectedPlayer ~= nil then return end
    chamsEnabled = not chamsEnabled
    setToggleVisual(G2L["50"], G2L["4e"], chamsEnabled)
    if chamsEnabled then applyChamsToAll() else removeChams() end
end)

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then
        p.CharacterAdded:Connect(function(char)
            if chamsEnabled then task.wait(0.5); addChams(p, char) end
        end)
    end
end
Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(char)
        if chamsEnabled then task.wait(0.5); addChams(p, char) end
    end)
end)

-- ===== FRIEND SYSTEM =====
local friendedPlayers = {}
local FOLDER_NAME     = "Vision"
local FRIENDS_FILE    = "Vision/usernames.txt"

local function ensureStorage()
    if not isfolder(FOLDER_NAME) then makefolder(FOLDER_NAME) end
end

local function saveFriends()
    ensureStorage()
    local lines = {}
    for name in pairs(friendedPlayers) do table.insert(lines, name) end
    writefile(FRIENDS_FILE, table.concat(lines, "\n"))
end

local function loadFriends()
    ensureStorage()
    if isfile(FRIENDS_FILE) then
        for _, name in ipairs(string.split(readfile(FRIENDS_FILE), "\n")) do
            name = name:match("^%s*(.-)%s*$")
            if name and name ~= "" then
                friendedPlayers[name] = true; UsernameColors[name] = FRIEND_COLOR
            end
        end
    end
end
loadFriends()

local function refreshPlayerCham(player)
    if not player or not player.Character then return end
    local hl = player.Character:FindFirstChild("ChamsHighlight")
    if hl then hl:Destroy() end
    if chamsEnabled then addChams(player, player.Character) end
end

setToggleVisual(G2L["47"], G2L["45"], false)

local function setFriendVisual(on)
    setToggleVisual(G2L["47"], G2L["45"], on)
end

G2L["47"].MouseButton1Click:Connect(function()
    if not currentSelectedPlayer then return end
    local name = currentSelectedPlayer
    if not friendedPlayers[name] then
        friendedPlayers[name] = true; UsernameColors[name] = FRIEND_COLOR
        saveFriends(); setFriendVisual(true)
    else
        friendedPlayers[name] = nil; UsernameColors[name] = nil
        saveFriends(); setFriendVisual(false)
    end
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name == name then refreshPlayerCham(p); break end
    end
end)

-- ===== PLAYER LIST =====
local playerListFrame = G2L["2f"]
local playerTemplate  = G2L["38"]
playerTemplate.Visible = false

local function getHeadshot(userId)
    local ok, thumb = pcall(function()
        return Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    end)
    return ok and thumb or "rbxassetid://0"
end

local function refreshPlayerList()
    for _, child in ipairs(playerListFrame:GetChildren()) do
        if child:IsA("Frame") and child.Name:find("^Player_") then child:Destroy() end
    end
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local entry = playerTemplate:Clone()
        entry.Name = "Player_" .. player.UserId; entry.Visible = true
        entry.Display.Text  = player.DisplayName
        entry.Main.Text     = "(@" .. player.Name .. ")"
        entry.Icon.Image    = getHeadshot(player.UserId)
        entry.Select.MouseButton1Click:Connect(function()
            currentSelectedPlayer = player.Name
            selectFrame(entry)
            setFriendVisual(friendedPlayers[player.Name] == true)
        end)
        entry.Parent = playerListFrame
    end
end
refreshPlayerList()
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

-- ===== FLY =====
local flySpeed  = 1
local flyConn   = nil
local flyBV     = nil
local flyBG     = nil

-- ===== KEYBIND SYSTEM =====
local flyKey    = Enum.KeyCode.H
local lockOnKey = Enum.KeyCode.T

local listeningForFlyKey  = false
local listeningForLockKey = false

-- flyEnabled / lockOnEnabled = keybind armed; flyRunning / lockOnRunning = feature active
local flyRunning    = false
local lockOnRunning = false

-- ===== LOCK-ON =====
local lockOnTarget    = nil
local lockOnConn      = nil
local lockOnBillboard = nil  -- the target icon BillboardGui

local function removeTargetIcon()
    if lockOnBillboard then
        lockOnBillboard:Destroy()
        lockOnBillboard = nil
    end
end

local function addTargetIcon(character)
    removeTargetIcon()
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local bb = Instance.new("BillboardGui")
    bb.Name = "VisionTargetIcon"
    bb.Adornee = hrp
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0, 80, 0, 80)
    bb.StudsOffset = Vector3.new(0, 3.5, 0)
    bb.ResetOnSpawn = false
    bb.LightInfluence = 0
    bb.Parent = LocalPlayer.PlayerGui
    local img = Instance.new("ImageLabel", bb)
    img.Image = "rbxassetid://262619584"
    img.BackgroundTransparency = 1
    img.ImageTransparency = 0.5
    img.Size = UDim2.new(1, 0, 1, 0)
    img.Name = "Icon"
    lockOnBillboard = bb
end

-- Get player closest to mouse cursor (screen-space proximity, wide range)
local function getMouseTarget()
    local cam = workspace.CurrentCamera
    if not cam then return nil end
    local mouse = LocalPlayer:GetMouse()
    local mousePos = Vector2.new(mouse.X, mouse.Y)
    local closest, closestDist = nil, 200 -- max screen pixel distance

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local screenPos, onScreen = cam:WorldToScreenPoint(hrp.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closest = p
                    end
                end
            end
        end
    end
    return closest
end

local function stopLockOn()
    if lockOnConn then lockOnConn:Disconnect(); lockOnConn = nil end
    lockOnTarget = nil
    removeTargetIcon()
end

local function startLockOn()
    stopLockOn()
    -- Prefer mouse target, then selected player, then skip (no nearest fallback)
    local mouseTarget = getMouseTarget()
    if mouseTarget then
        lockOnTarget = mouseTarget
    elseif currentSelectedPlayer then
        lockOnTarget = Players:FindFirstChild(currentSelectedPlayer)
    end
    if not lockOnTarget then return end
    -- Add target icon
    if lockOnTarget.Character then
        addTargetIcon(lockOnTarget.Character)
    end
    lockOnConn = RunService.RenderStepped:Connect(function()
        if not lockOnRunning then stopLockOn(); return end
        local tChar = lockOnTarget and lockOnTarget.Character
        local tHrp  = tChar and tChar:FindFirstChild("HumanoidRootPart")
        if not tHrp then stopLockOn(); return end
        -- Keep icon facing local player
        local myChar = LocalPlayer.Character
        local myHrp  = myChar and myChar:FindFirstChild("HumanoidRootPart")
        if lockOnBillboard and myHrp then
            -- BillboardGui faces camera automatically; just keep it alive
        end
        local cam = workspace.CurrentCamera
        if cam then
            cam.CFrame = CFrame.new(cam.CFrame.Position, tHrp.Position)
        end
    end)
    -- Clean up icon if target respawns/dies
    lockOnTarget.CharacterAdded:Connect(function(newChar)
        if lockOnRunning then
            task.wait(0.1)
            addTargetIcon(newChar)
        end
    end)
end

-- ===== FLY =====
local function stopFly()
    if flyConn then flyConn:Disconnect(); flyConn = nil end
    if flyBV then flyBV:Destroy(); flyBV = nil end
    if flyBG then flyBG:Destroy(); flyBG = nil end
    local char = LocalPlayer.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
        if hrp then hrp.AssemblyLinearVelocity = Vector3.zero end
    end
end

local function startFly()
    stopFly()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end

    hum.PlatformStand = true
    flyBV = Instance.new("BodyVelocity", hrp)
    flyBV.MaxForce = Vector3.new(1e6,1e6,1e6); flyBV.Velocity = Vector3.zero
    flyBG = Instance.new("BodyGyro", hrp)
    flyBG.MaxTorque = Vector3.new(1e6,1e6,1e6); flyBG.D = 50

    flyConn = RunService.Heartbeat:Connect(function()
        if not flyRunning then stopFly(); return end
        local cam = workspace.CurrentCamera
        if not cam then return end
        local spd = flySpeed * 50
        local dir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) or UserInputService:IsKeyDown(Enum.KeyCode.Q) then dir = dir + Vector3.yAxis end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.E) then dir = dir - Vector3.yAxis end
        if dir.Magnitude > 0 then dir = dir.Unit end
        if flyBV then flyBV.Velocity = dir * spd end
        if flyBG then flyBG.CFrame = cam.CFrame end
    end)
end

-- Arm/disarm helpers
local function setFlyArmed(on)
    flyEnabled.value = on
    setToggleVisual(G2L["1d"], G2L["1b"], on)
    if not on then
        flyRunning = false
        stopFly()
    end
end

local function setLockOnArmed(on)
    lockOnEnabled.value = on
    setToggleVisual(G2L["29"], G2L["27"], on)
    if not on then
        lockOnRunning = false
        stopLockOn()
    end
end

-- Toggle buttons: arm/disarm keybind only
G2L["1d"].MouseButton1Click:Connect(function()
    setFlyArmed(not flyEnabled.value)
end)

G2L["29"].MouseButton1Click:Connect(function()
    setLockOnArmed(not lockOnEnabled.value)
end)

-- Speed adjust button
local speedValues = {1,2,3,4,5}
local speedIndex  = 1
G2L["21"].MouseButton1Click:Connect(function()
    speedIndex = (speedIndex % #speedValues) + 1
    flySpeed   = speedValues[speedIndex]
    G2L["21"].Text = "Speed: " .. flySpeed
end)

-- Animated "..." loop helper
local function startDotAnim(btn, stopFlagGetter)
    task.spawn(function()
        local dots = 0
        while stopFlagGetter() do
            task.wait(0.4)
            if not stopFlagGetter() then break end
            dots = (dots % 3) + 1
            btn.Text = string.rep(".", dots)
        end
    end)
end

-- Make hotkey button enter listen mode, then bind on next key press
local function enterListenMode(btn, onBound)
    btn.Text = "."
    startDotAnim(btn, function() return listeningForFlyKey or listeningForLockKey end)
    local conn
    conn = UserInputService.InputBegan:Connect(function(input, gpe)
        if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
        conn:Disconnect()
        local newKey = input.KeyCode
        onBound(newKey)
        btn.Text = newKey.Name
        listeningForFlyKey  = false
        listeningForLockKey = false
    end)
end

-- Fly hotkey button click -> enter listen mode
G2L["20"].MouseButton1Click:Connect(function()
    if listeningForFlyKey or listeningForLockKey then return end
    listeningForFlyKey = true
    enterListenMode(G2L["20"], function(k) flyKey = k end)
end)

-- Lock-On hotkey button click -> enter listen mode
G2L["2c"].MouseButton1Click:Connect(function()
    if listeningForFlyKey or listeningForLockKey then return end
    listeningForLockKey = true
    enterListenMode(G2L["2c"], function(k) lockOnKey = k end)
end)

-- Unified InputBegan: keybind only fires when armed
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if listeningForFlyKey or listeningForLockKey then return end

    if input.KeyCode == flyKey and flyEnabled.value then
        flyRunning = not flyRunning
        if flyRunning then startFly() else stopFly() end
    end

    if input.KeyCode == lockOnKey and lockOnEnabled.value then
        lockOnRunning = not lockOnRunning
        if lockOnRunning then startLockOn() else stopLockOn() end
    end
end)

-- ===== KILL ALL =====
local killAllConn = nil

local function stopKillAll()
    if killAllConn then killAllConn:Disconnect(); killAllConn = nil end
end

local function startKillAll()
    stopKillAll()
    killAllConn = RunService.Heartbeat:Connect(function()
        if not killAllEnabled.value then stopKillAll(); return end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    pcall(function() hum.Health = 0 end)
                end
            end
        end
    end)
end

setupToggle(killAllSide, killAllToggle, killAllEnabled, startKillAll, stopKillAll)

-- ===== DOOR CHAMS =====
local doorChamsEnabled = {value = false}
local DOOR_COLOR = Color3.fromRGB(255, 140, 0)
local DOOR_NAME  = "HalloweenDoor"
local DOOR_HL    = "DoorChams"
local doorGen    = 0

local function removeDoorChams()
    local effects = workspace:FindFirstChild("Effects")
    if not effects then return end
    for _, d in ipairs(effects:GetChildren()) do
        local hl = d.Name == DOOR_NAME and d:FindFirstChild(DOOR_HL)
        if hl then hl:Destroy() end
    end
end

local function stopDoorChams()
    doorGen += 1
    removeDoorChams()
end

local function startDoorChams()
    doorGen += 1
    local myGen = doorGen
    task.spawn(function()
        while doorChamsEnabled.value and doorGen == myGen do
            local effects = workspace:FindFirstChild("Effects")
            if effects then
                for _, d in ipairs(effects:GetChildren()) do
                    if d.Name == DOOR_NAME and not d:FindFirstChild(DOOR_HL) then
                        local hl = Instance.new("Highlight")
                        hl.Name = DOOR_HL
                        hl.Adornee = d
                        hl.FillTransparency = 1
                        hl.OutlineColor = DOOR_COLOR
                        hl.OutlineTransparency = 0
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Parent = d
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

setupToggle(doorSide, doorToggle, doorChamsEnabled, startDoorChams, stopDoorChams)

-- ===== AUTOMATION TOGGLES =====
setupToggle(albSide, albToggle, albEnabled)
setupToggle(arrSide, arrToggle, arrEnabled)
setupToggle(abfSide, abfToggle, abfEnabled)
setupToggle(apsSide, apsToggle, apsEnabled)
setupToggle(arpSide, arpToggle, arpEnabled)

-- ABF input handler
local abfDebounce = false
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Three and abfEnabled.value and not abfDebounce then
        local char = workspace.Characters and workspace.Characters:FindFirstChild(LocalPlayer.Name) or LocalPlayer.Character
        if char and char:FindFirstChild("Moveset") and char.Moveset:FindFirstChild("Divergent Fist") then
            abfDebounce = true
            task.wait(0.33)
            VirtualInputManager:SendKeyEvent(true,  Enum.KeyCode.Three, false, game)
            task.wait(0.05)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Three, false, game)
            task.wait(0.1)
            abfDebounce = false
        end
    end
end)

-- ARP input handler
local arpDebounce = false
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Three and arpEnabled.value and not arpDebounce then
        local char = workspace.Characters and workspace.Characters:FindFirstChild(LocalPlayer.Name) or LocalPlayer.Character
        if char and char:FindFirstChild("Moveset") and char.Moveset:FindFirstChild("Rapid Punches") then
            arpDebounce = true
            task.spawn(function()
                task.wait(3.6)
                for _ = 1, 10 do
                    keypress(0x52); task.wait(0.02); keyrelease(0x52); task.wait(0.03)
                end
                task.wait(0.1); arpDebounce = false
            end)
        end
    end
end)

-- ===== TABS =====
local tabs = {
    { button=G2L["9"],  select=G2L["a"],  content=G2L["15"] },
    { button=G2L["c"],  select=G2L["d"],  content=G2L["73"] },
    { button=G2L["e"],  select=G2L["f"],  content=G2L["2e"] },
    { button=G2L["10"], select=G2L["11"], content=G2L["54"] },
    { button=G2L["12"], select=G2L["13"], content=G2L["a3"] },
}

local function switchTab(index)
    for i, tab in ipairs(tabs) do
        tab.select.Visible = (i == index)
        tab.content.Visible = (i == index)
    end
end

for i, tab in ipairs(tabs) do
    tab.button.MouseButton1Click:Connect(function() switchTab(i) end)
end
switchTab(1)

-- ===== PANIC =====
G2L["59"].MouseButton1Click:Connect(function()
    -- Disable every registered toggle (current and future)
    for _, t in ipairs(toggleRegistry) do
        if t.ref.value then
            t.ref.value = false
            setToggleVisual(t.side, t.frame, false)
            if t.onDisable then t.onDisable() end
        end
    end
    -- Fly and Lock-On use custom arm helpers (not setupToggle)
    setFlyArmed(false)
    setLockOnArmed(false)
    removeChams()
    chamsEnabled = false
    G2L["1"]:Destroy()
    G2L["65"]:Destroy()
    if widget then widget:Destroy() end
end)

-- ===== OPEN / CLOSE ANIMATION =====
local isOpen = false
local openTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Exponential)

local function openUI()
    G2L["4"].Parent = G2L["2"]
    G2L["2"].Position = UDim2.new(0, 0, -0.2, 0)
    G2L["2"].GroupTransparency = 1
    G2L["2"].Visible = true; G2L["4"].Visible = true
    local t = TweenService:Create(G2L["2"], openTweenInfo, {Position=UDim2.new(0,0,0,0), GroupTransparency=0})
    t:Play()
    t.Completed:Once(function() G2L["4"].Parent = G2L["1"] end)
end

local closeConfigPicker
local function closeUI()
    G2L["2"].Visible = false; G2L["4"].Visible = false
    closeConfigPicker()
end

-- ===== CONFIG SYSTEM =====
local CONFIG_FOLDER  = "Vision/Configs"
local selectedConfig = nil  -- currently highlighted config name (without .json)

local function ensureConfigFolder()
    ensureStorage()
    if not isfolder(CONFIG_FOLDER) then makefolder(CONFIG_FOLDER) end
end

local function getConfigState()
    return {
        chams    = chamsEnabled,
        alb      = albEnabled.value,
        arr      = arrEnabled.value,
        abf      = abfEnabled.value,
        aps      = apsEnabled.value,
        arp      = arpEnabled.value,
        fly      = flyEnabled.value,
        lockOn   = lockOnEnabled.value,
        killAll  = killAllEnabled.value,
        flyKey   = flyKey.Name,
        lockOnKey = lockOnKey.Name,
        doorChams = doorChamsEnabled.value,
    }
end

local function applyConfigState(state)
    -- Chams
    if state.chams ~= chamsEnabled then
        chamsEnabled = state.chams
        setToggleVisual(G2L["50"], G2L["4e"], chamsEnabled)
        if chamsEnabled then applyChamsToAll() else removeChams() end
    end

local newDoor = state.doorChams or false
    if newDoor ~= doorChamsEnabled.value then
        doorChamsEnabled.value = newDoor
        setToggleVisual(doorSide, doorToggle, newDoor)
        if newDoor then startDoorChams() else stopDoorChams() end
    end
    
    -- Automation flags (visual + state)
    local function applyAuto(ref, side, frame, val)
        ref.value = val
        setToggleVisual(side, frame, val)
    end
    applyAuto(albEnabled, albSide, albToggle, state.alb   or false)
    applyAuto(arrEnabled, arrSide, arrToggle, state.arr   or false)
    applyAuto(abfEnabled, abfSide, abfToggle, state.abf   or false)
    applyAuto(apsEnabled, apsSide, apsToggle, state.aps   or false)
    applyAuto(arpEnabled, arpSide, arpToggle, state.arp   or false)
    -- Fly (restores armed state only)
    local newFly = state.fly or false
    if newFly ~= flyEnabled.value then
        setFlyArmed(newFly)
    end
    -- Lock-On (restores armed state only)
    local newLock = state.lockOn or false
    if newLock ~= lockOnEnabled.value then
        setLockOnArmed(newLock)
    end
    -- Kill All
    local newKA = state.killAll or false
    if newKA ~= killAllEnabled.value then
        killAllEnabled.value = newKA
        setToggleVisual(killAllSide, killAllToggle, newKA)
        if newKA then startKillAll() else stopKillAll() end
    end
    -- Keybinds
    if state.flyKey then
        local ok, kc = pcall(function() return Enum.KeyCode[state.flyKey] end)
        if ok and kc then
            flyKey = kc
            G2L["20"].Text = kc.Name
        end
    end
    if state.lockOnKey then
        local ok, kc = pcall(function() return Enum.KeyCode[state.lockOnKey] end)
        if ok and kc then
            lockOnKey = kc
            G2L["2c"].Text = kc.Name
        end
    end
end

-- Populate config list in picker
local function populateConfigList(filter)
    filter = (filter or ""):lower()
    for _, ch in ipairs(G2L["69"]:GetChildren()) do
        if ch:IsA("Frame") and ch.Name:find("^CEntry_") then ch:Destroy() end
    end
    selectedConfig = nil

    ensureConfigFolder()
    local files = listfiles(CONFIG_FOLDER)
    for _, path in ipairs(files) do
        local fname = path:match("([^/\]+)$") or path
        local name  = fname:gsub("%.json$", "")
        if filter == "" or name:lower():find(filter, 1, true) then
            local entry = G2L["6c"]:Clone()
            entry.Name = "CEntry_" .. name
            entry.Visible = true
            local btn = entry:FindFirstChild("Configuration")
            if btn then
                btn.Text = name
                -- Connect to the TextButton inside the frame, not the frame itself
                btn.MouseButton1Click:Connect(function()
                    for _, ch2 in ipairs(G2L["69"]:GetChildren()) do
                        if ch2:IsA("Frame") and ch2.Name:find("^CEntry_") then
                            ch2.BackgroundColor3 = Color3.fromRGB(255,255,255)
                            ch2.BackgroundTransparency = 0.5
                        end
                    end
                    entry.BackgroundColor3 = Color3.fromRGB(89,255,255)
                    entry.BackgroundTransparency = 0.3
                    selectedConfig = name
                end)
            end
            entry.Parent = G2L["69"]
        end
    end
end

-- ===== NOTIFICATION HELPER =====
-- Mimics the loading screen style: slides in from the right, stays 3s, fades out
local function showNotification(text)
    local notifGui = Instance.new("ScreenGui")
    notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    notifGui.ResetOnSpawn = false; notifGui.IgnoreGuiInset = true
    notifGui.DisplayOrder = 10
    notifGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local notifCanvas = Instance.new("CanvasGroup", notifGui)
    notifCanvas.SizeConstraint = Enum.SizeConstraint.RelativeYY
    notifCanvas.BorderSizePixel = 0
    notifCanvas.BackgroundColor3 = Color3.fromRGB(255,255,255)
    notifCanvas.AnchorPoint = Vector2.new(0.5,0.5)
    notifCanvas.Size = UDim2.new(0.36986,70,-0.075,70)
    notifCanvas.Position = UDim2.new(1.5,0,0.98182,0)
    notifCanvas.BackgroundTransparency = 0.5
    notifCanvas.GroupTransparency = 0

    local notifStroke = Instance.new("UIStroke", notifCanvas)
    notifStroke.Transparency = 0.5; notifStroke.Thickness = 2

    local notifGradient = Instance.new("UIGradient", notifCanvas)
    notifGradient.Rotation = 90
    notifGradient.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0.000,0),
        NumberSequenceKeypoint.new(0.773,0.50276),
        NumberSequenceKeypoint.new(1.000,0.53039)
    }

    local notifLabel = Instance.new("TextLabel", notifCanvas)
    notifLabel.TextWrapped = true; notifLabel.BorderSizePixel = 0
    notifLabel.TextXAlignment = Enum.TextXAlignment.Left
    notifLabel.TextScaled = true
    notifLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
    notifLabel.FontFace = Font.new([[rbxassetid://12187375716]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    notifLabel.TextColor3 = Color3.fromRGB(0,0,0)
    notifLabel.BackgroundTransparency = 1; notifLabel.RichText = true
    notifLabel.Size = UDim2.new(1,-10,1,0)
    notifLabel.Text = text; notifLabel.Position = UDim2.new(0,5,0,0)

    TweenService:Create(notifCanvas, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
        Position = UDim2.new(0.87634,0,0.98182,0)
    }):Play()

    task.delay(3, function()
        local t = TweenService:Create(notifCanvas, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {GroupTransparency=1})
        t:Play()
        t.Completed:Once(function() notifGui:Destroy() end)
    end)
end

-- Open config picker with same animation as main UI
local pickerOpen = false
local pickerTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Exponential)

local function openConfigPicker()
    if pickerOpen then return end
    pickerOpen = true
    populateConfigList("")
    G2L["cfgFrame"].Position = UDim2.new(0.862, 0, 0.3, 0)
    G2L["66"].GroupTransparency = 1
    G2L["66"].Visible = true
    TweenService:Create(G2L["66"], pickerTweenInfo, {GroupTransparency = 0}):Play()
    TweenService:Create(G2L["cfgFrame"], pickerTweenInfo, {Position = UDim2.new(0.862, 0, 0.5, 0)}):Play()
end

closeConfigPicker = function()
    if not pickerOpen then return end
    pickerOpen = false
    G2L["66"].Visible = false
    G2L["66"].GroupTransparency = 1
end

-- Load button (opens picker)
G2L["5f"].MouseButton1Click:Connect(openConfigPicker)

-- Close button
configCloseBtn.MouseButton1Click:Connect(closeConfigPicker)

-- Search filter
G2L["68"]:GetPropertyChangedSignal("Text"):Connect(function()
    populateConfigList(G2L["68"].Text)
end)

-- Load selected config
G2L["72"].MouseButton1Click:Connect(function()
    if not selectedConfig then return end
    local path = CONFIG_FOLDER .. "/" .. selectedConfig .. ".json"
    if not isfile(path) then return end
    local ok, data = pcall(function()
        return HttpService:JSONDecode(readfile(path))
    end)
    if ok and data then
        applyConfigState(data)
        closeConfigPicker()
        showNotification("Loaded config: " .. selectedConfig)
    end
end)

-- Overwrite selected config
G2L["6f"].MouseButton1Click:Connect(function()
    if not selectedConfig then return end
    ensureConfigFolder()
    local path = CONFIG_FOLDER .. "/" .. selectedConfig .. ".json"
    local ok = pcall(function()
        writefile(path, HttpService:JSONEncode(getConfigState()))
    end)
    closeConfigPicker()
    if ok then
        showNotification("Overwrote config: " .. selectedConfig)
    end
end)

-- Save button: creates a new Vision_Config(n).json
G2L["62"].MouseButton1Click:Connect(function()
    ensureConfigFolder()
    local n = 1
    while isfile(CONFIG_FOLDER .. "/Vision_Config" .. n .. ".json") do
        n = n + 1
    end
    local path = CONFIG_FOLDER .. "/Vision_Config" .. n .. ".json"
    local ok, err = pcall(function()
        writefile(path, HttpService:JSONEncode(getConfigState()))
    end)
    if ok then
        -- brief visual feedback on save button
        local orig = G2L["62"].Text
        G2L["62"].Text = "Saved!"
        task.delay(1.5, function() G2L["62"].Text = orig end)
    end
end)

-- ===== TOPBAR WIDGET =====
local topbar = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TopbarStandard")
local leftHolder = topbar:WaitForChild("Holders"):WaitForChild("Left")

widget = Instance.new("Frame")
widget.BackgroundTransparency = 1; widget.ClipsDescendants = true
widget.LayoutOrder = 172; widget.Size = UDim2.new(0,44,0,44)
widget.ZIndex = 20; widget.Name = "VisionWidget"; widget.Parent = leftHolder

local iconButton = Instance.new("Frame")
iconButton.BackgroundColor3 = Color3.fromRGB(18,18,21)
iconButton.BackgroundTransparency = 0.08; iconButton.Size = UDim2.new(1,0,1,0)
iconButton.ZIndex = 2; iconButton.Parent = widget
Instance.new("UICorner", iconButton).CornerRadius = UDim.new(1,0)

local iconImage = Instance.new("ImageLabel")
iconImage.Image = "rbxassetid://13321848320"; iconImage.BackgroundTransparency = 1
iconImage.Size = UDim2.new(0.65,0,0.65,0); iconImage.Position = UDim2.new(0.5,0,0.5,0)
iconImage.AnchorPoint = Vector2.new(0.5,0.5); iconImage.ZIndex = 15; iconImage.Parent = iconButton

local clickRegion = Instance.new("TextButton")
clickRegion.Text = ""; clickRegion.BackgroundTransparency = 1
clickRegion.Size = UDim2.new(1,0,1,0); clickRegion.ZIndex = 20; clickRegion.Parent = iconButton
Instance.new("UICorner", clickRegion).CornerRadius = UDim.new(1,0)

clickRegion.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    if isOpen then openUI() else closeUI() end
end)

-- ===== MENUS.GROUP INTEGRATION =====
local menusGroup = LocalPlayer.PlayerGui:FindFirstChild("Menus") and
                   LocalPlayer.PlayerGui.Menus:FindFirstChild("Group")

local function onMenuOpened()
    if isOpen then isOpen = false; closeUI() end
end

if menusGroup then
    for _, frame in ipairs(menusGroup:GetChildren()) do
        if frame:IsA("Frame") or frame:IsA("ScreenGui") then
            frame:GetPropertyChangedSignal("Visible"):Connect(function()
                if frame.Visible then onMenuOpened() end
            end)
        end
    end
    menusGroup.ChildAdded:Connect(function(child)
        if child:IsA("Frame") or child:IsA("ScreenGui") then
            child:GetPropertyChangedSignal("Visible"):Connect(function()
                if child.Visible then onMenuOpened() end
            end)
        end
    end)
end

-- ===== INITIAL STATE =====
G2L["2"].Visible  = false
G2L["4"].Visible  = false
G2L["1"].Enabled  = true

-- ===== FINISH LOADING =====
_loadingDone = true
local loadTime = tick() - loadStartTime
loadingLabel.Text = string.format("Vision loaded! - %.2f seconds", loadTime)

task.delay(5, function()
    local t = TweenService:Create(loadingCanvas, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {GroupTransparency=1})
    t:Play()
    t.Completed:Once(function() loadingGui:Destroy() end)
end)

print("Vision merged script loaded!")
return G2L["1"]

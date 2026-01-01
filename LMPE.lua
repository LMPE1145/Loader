local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/FUEx0f3G"))()

local ScreenGui = Instance.new("ScreenGui", getParent)
local TimeLabel = Instance.new("TextLabel", getParent)
local LocalPlayer = game.Players.LocalPlayer

ScreenGui.Name = "LBLG"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Enabled = true

TimeLabel.Name = "LBL"
TimeLabel.Parent = ScreenGui
TimeLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TimeLabel.BackgroundTransparency = 1
TimeLabel.BorderColor3 = Color3.new(0, 0, 0)
TimeLabel.Position = UDim2.new(0.75, 0, 0.01, 0)
TimeLabel.Size = UDim2.new(0, 133, 0, 30)
TimeLabel.Font = Enum.Font.GothamSemibold
TimeLabel.Text = "TextLabel"
TimeLabel.TextColor3 = Color3.new(1, 1, 1)
TimeLabel.TextScaled = true
TimeLabel.TextSize = 14
TimeLabel.TextWrapped = true
TimeLabel.Visible = true

local TimeLabelRef = TimeLabel
local Heartbeat = game:GetService("RunService").Heartbeat
local CurrentTick = nil
local StartTick = nil
local FrameTable = {}

local function UpdateFPS()
    CurrentTick = tick()
    for i = #FrameTable, 1, -1 do
        FrameTable[i + 1] = FrameTable[i] >= CurrentTick - 1 and FrameTable[i] or nil
    end
    FrameTable[1] = CurrentTick
    local fps = tick() - StartTick >= 1 and #FrameTable or #FrameTable / (tick() - StartTick)
    local fpsRounded = fps - fps % 1
    TimeLabelRef.Text = "时间:" .. os.date("%H") .. "时" .. os.date("%M") .. "分" .. os.date("%S")
end

StartTick = tick()
Heartbeat:Connect(UpdateFPS)

local MainWindow = OrionLib:MakeWindow({
    Name = "LMPE",
    HidePremium = false,
    SaveConfig = true,
    IntroText = "LMPE",
    ConfigFolder = "LMPE"
})

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "LMPE",
    Text = "LMPE",
    Duration = 4
})

local MainTab = MainWindow:MakeTab({
    Name = "LMPE",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddParagraph("脚本更新内容：飞行")
MainTab:AddParagraph("禁止被圈")

local AnnouncementTab = MainWindow:MakeTab({
    Name = "公告",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

AnnouncementTab:AddButton({
    Name = "复制作者QQ",
    Callback = function()
        setclipboard("825763412")
    end
})

AnnouncementTab:AddButton({
    Name = "复制QQ群",
    Callback = function()
        setclipboard("498865259")
    end
})

local PlayerTab = MainWindow:MakeTab({
    Name = "玩家",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

PlayerTab:AddSection({
    Name = "欢迎欢迎"
})

PlayerTab:AddSlider({
    Name = "速度",
    Min = 16,
    Max = 200,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "数值",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

PlayerTab:AddSlider({
    Name = "跳跃高度",
    Min = 50,
    Max = 200,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "数值",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

PlayerTab:AddTextbox({
    Name = "跳跃高度设置",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

PlayerTab:AddTextbox({
    Name = "移动速度设置",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

PlayerTab:AddTextbox({
    Name = "重力设置",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        game.Workspace.Gravity = Value
    end
})

PlayerTab:AddToggle({
    Name = "夜视",
    Default = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

PlayerTab:AddButton({
    Name = "飞行V3（隐藏）",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/U27yQRxS"))()
    end
})

PlayerTab:AddButton({
    Name = "曾躯",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain"))()
    end
})

PlayerTab:AddButton({
    Name = "爬墙",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end
})

PlayerTab:AddButton({
    Name = "光影V4",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
    end
})

PlayerTab:AddButton({
    Name = "变成蛋",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.ga/tWBTcE4R/raw", true))()
    end
})

PlayerTab:AddButton({
    Name = "让别让别人控制自己",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.ga/a7RTi4un/raw", true))()
    end
})

PlayerTab:AddButton({
    Name = "点击传送工具",
    Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse()
        tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "[FE] TELEPORT TOOL"
        tool.Activated:connect(function()
            local targetPosition = mouse.Hit + Vector3.new(0, 2.5, 0)
            local newCFrame = CFrame.new(targetPosition.X, targetPosition.Y, targetPosition.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = newCFrame
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

PlayerTab:AddButton({
    Name = "全(英文������)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/kEq7bdf9"))()
    end
})

PlayerTab:AddButton({
    Name = "地岩",
    Callback = function()
        loadstring("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/bbamxbbamxbbamx/codespaces-blank/main/%E7%99%BD\"))()")()
    end
})

PlayerTab:AddButton({
    Name = "dx旧版本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/test-lol/main/YO.lua"))()
    end
})

PlayerTab:AddButton({
    Name = "脚本中心",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/gemxHwA1"))()
    end
})

PlayerTab:AddButton({
    Name = "无敌",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        if player.Character:FindFirstChild("Head") then
            local character = player.Character
            character.Archivable = true
            local clonedCharacter = character:Clone()
            clonedCharacter.Parent = workspace
            player.Character = clonedCharacter
            wait(2)
            local humanoid = character:FindFirstChildWhichIsA("Humanoid")
            local humanoidRef = humanoid
            local clonedHumanoid = humanoid:Clone()
            clonedHumanoid.Parent = character
            clonedHumanoid.RequiresNeck = false
            humanoid.Parent = nil
            wait(2)
            player.Character = character
            clonedCharacter:Destroy()
            wait(1)
            local newHumanoid = clonedHumanoid
            clonedHumanoid:GetPropertyChangedSignal("Health"):Connect(function()
                if clonedHumanoid.Health <= 0 then
                    humanoid.Parent = player.Character
                    wait(1)
                    humanoid:Destroy()
                end
            end)
            workspace.CurrentCamera.CameraSubject = character
            if character:FindFirstChild("Animate") then
                character.Animate.Disabled = true
                wait(0.1)
                character.Animate.Disabled = false
            end
            player.Character:FindFirstChild("Head"):Destroy()
        end
    end
})

PlayerTab:AddButton({
    Name = "用飞别人",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
    end
})

PlayerTab:AddButton({
    Name = "防止掉线（反挂机）",
    Callback = function()
        print("Anti Afk On")
        local VirtualUser = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end
})

PlayerTab:AddButton({
    Name = "透视",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/MA8jhPWT"))()
    end
})

PlayerTab:AddButton({
    Name = "吸取全部玩家",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/hQSBGsw2"))()
    end
})

PlayerTab:AddButton({
    Name = "人物无敌",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/H3RLCWWZ"))()
    end
})

PlayerTab:AddButton({
    Name = "隐躯(E)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/nwGEvkez"))()
    end
})

PlayerTab:AddButton({
    Name = "电脑键盘",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})

PlayerTab:AddButton({
    Name = "飞车(E)(别人看到)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/G3GnBCyC", true))()
    end
})

PlayerTab:AddTextbox({
    Name = "跳跃高度",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

PlayerTab:AddTextbox({
    Name = "重力设置",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        game.Workspace.Gravity = Value
    end
})

PlayerTab:AddToggle({
    Name = "穿墙2",
    Default = false,
    Callback = function(Value)
        if Value then
            Noclip = true
            Stepped = game.RunService.Stepped:Connect(function()
                if Noclip ~= true then
                    Stepped:Disconnect()
                else
                    local iterator, table, index = pairs(game.Workspace:GetChildren())
                    while true do
                        local child
                        index, child = iterator(table, index)
                        if index == nil then
                            break
                        end
                        if child.Name == game.Players.LocalPlayer.Name then
                            local iterator2, table2, index2 = pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren())
                            while true do
                                local part
                                index2, part = iterator2(table2, index2)
                                if index2 == nil then
                                    break
                                end
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                end
                            end
                        end
                    end
                end
            end)
        else
            Noclip = false
        end
    end
})

PlayerTab:AddToggle({
    Name = "夜视",
    Default = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

PlayerTab:AddButton({
    Name = "鼠标（手机非常不建议用）",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.ga/V75mqzaz/raw", true))()
    end
})

PlayerTab:AddButton({
    Name = "飞行",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/U27yQRxS"))()
    end
})

PlayerTab:AddButton({
    Name = "跟踪玩家",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()
    end
})

PlayerTab:AddButton({
    Name = "伪名说话",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.ga/zCFEwaYq/raw", true))()
    end
})

PlayerTab:AddButton({
    Name = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
    end
})

PlayerTab:AddButton({
    Name = "透视",
    Callback = function()
        loadstring(game:GetObjects("rbxassetid://10092697033")[1].Source)()
    end
})

PlayerTab:AddButton({
    Name = "轿起来",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0", true))()
    end
})

PlayerTab:AddButton({
    Name = "隐躯(E)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/nwGEvkez"))()
    end
})

PlayerTab:AddButton({
    Name = "立即死亡",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

PlayerTab:AddButton({
    Name = "黑客脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BirthScripts/Scripts/main/c00l.lua"))()
    end
})

PlayerTab:AddButton({
    Name = "管理员",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua", true))()
    end
})

PlayerTab:AddButton({
    Name = "回滚衙后分服务器可能不可以能用",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 10000
    end
})

PlayerTab:AddButton({
    Name = "键盘",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})

PlayerTab:AddButton({
    Name = "玩家动作",
    Callback = function()
        getgenv().she = "作者小盛蓝免贵请勿倒卖"
        loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
    end
})

PlayerTab:AddButton({
    Name = "撸管R6",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end})

PlayerTab:AddButton({
    Name = "撸管R15",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end})

local Tab = Window:MakeTab({
    Name = "DOORS",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "绕过DOORS加速反作弊",
    Callback = function()
local Collision = game.Players.LocalPlayer.Character:WaitForChild"Collision"
local Crouch = Collision.CollisionCrouch
Crouch.Massless = true

local OTick = tick()
game:GetService("RunService"):BindToRenderStep("Bypass", 999, function()
    if (tick() - OTick) >= .2 then
        Collision.Massless = not Collision.Massless
        OTick = tick()
    end
end)
end})

Tab:AddButton({
    Name = "NB DOORS",
    Callback = function()
loadstring(game:HttpGet("https://github.com/DocYogurt/DOORS/raw/main/Scripts/Gui/NBDOORS"))()
end})

Tab:AddButton({
    Name = "mspaint",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
end})

Tab:AddButton({
    Name = "NB DOORS FLOOR2",
    Callback = function()
loadstring(game:HttpGet("https://github.com/DocYogurt/Main/raw/main/Scripts/DF2RW.lua"))()
end})

Tab:AddButton({
    Name = "MS HUB",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua"))()
end})

Tab:AddButton({
    Name = "BlackKing汉化版",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end})

Tab:AddButton({
    Name = "自动Rooms ( 请先开启所有带自动的功能否则不能自动躲柜子 )",
    Callback = function()
if game.PlaceId ~= 6839171747 or game.ReplicatedStorage.GameData.Floor.Value ~= "Rooms" then

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "提示";
    Text = "请到Rooms里执行";
    Icon = "rbxassetid://14250466898";
    Duration = 5;
})
    
local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://4590662766"
    Sound.Parent = game:GetService("SoundService")
    Sound.Volume = 5
    Sound:Play()
    
    return
elseif workspace:FindFirstChild("PathFindPartsFolder") then

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "提示";
    Text = "?";
    Icon = "rbxassetid://14250466898";
    Duration = 5;
})

local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://4590662766"
    Sound.Parent = game:GetService("SoundService")
    Sound.Volume = 5
    Sound:Play()

    return
end

local PathfindingService = game:GetService("PathfindingService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = game.Players.LocalPlayer
local LatestRoom = game.ReplicatedStorage.GameData.LatestRoom

local Cooldown = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = ScreenGui

TextLabel.Size = UDim2.new(0,350,0,100)
TextLabel.TextSize = 48
TextLabel.TextStrokeColor3 = Color3.new(1,1,1)
TextLabel.TextStrokeTransparency = 0
TextLabel.BackgroundTransparency = 1

local GC = getconnections or get_signal_cons
if GC then
    for i,v in pairs(GC(LocalPlayer.Idled)) do
        if v["Disable"] then
            v["Disable"](v)
        elseif v["Disconnect"] then
            v["Disconnect"](v)
        end
    end
end

local Folder = Instance.new("Folder")
Folder.Parent = workspace
Folder.Name = "PathFindPartsFolder"

if LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90") then
    LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Name = "lol"
end

function getLocker()
    local Closest

    for i,v in pairs(workspace.CurrentRooms:GetDescendants()) do
        if v.Name == "Rooms_Locker" then
            if v:FindFirstChild("Door") and v:FindFirstChild("HiddenPlayer") then
                if v.HiddenPlayer.Value == nil then
                    if v.Door.Position.Y > -3 then
                        if Closest == nil then
                            Closest = v.Door
                        else
                            if (LocalPlayer.Character.HumanoidRootPart.Position - v.Door.Position).Magnitude < (Closest.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
                                Closest = v.Door
                            end
                        end
                    end
                end
            end
        end
    end
    return Closest
end

function getPath()
    local Part
    
    local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
    if Entity and Entity.Main.Position.Y > -4 then
        Part = getLocker()
    else
        Part = workspace.CurrentRooms[LatestRoom.Value].Door.Door
    end
    return Part
end

LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
    TextLabel.Text = "Room: "..math.clamp(LatestRoom.Value, 1,1000)

    if LatestRoom.Value ~= 1000 then
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
    else
        LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.KeyboardMouse
    
        Folder:ClearAllChildren()

    local Sound = Instance.new("Sound")
          Sound.SoundId = "rbxassetid://4590662766"
          Sound.Parent = game:GetService("SoundService")
          Sound.Volume = 5
          Sound:Play()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "提示";
    Text = "已到达A-1000";
    Icon = "rbxassetid://14250466898";
    Duration = 5;
})
        return
    end
end)

game:GetService("RunService").RenderStepped:connect(function()
    LocalPlayer.Character.HumanoidRootPart.CanCollide = false
    LocalPlayer.Character.Collision.CanCollide = false
    LocalPlayer.Character.Collision.Size = Vector3.new(8,LocalPlayer.Character.Collision.Size.Y,8)

    LocalPlayer.Character.Humanoid.WalkSpeed = 21

    local Path = getPath()

    local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120")
    if Entity then
        if Path then
            if Path.Parent.Name == "Rooms_Locker" then
                if Entity.Main.Position.Y > -4 then
                    if (LocalPlayer.Character.HumanoidRootPart.Position - Path.Position).Magnitude < 2 then
                        if LocalPlayer.Character.HumanoidRootPart.Anchored == false then
                            fireproximityprompt(Path.Parent.HidePrompt)
                        end
                    end
                end
            end
        end
        if Entity.Main.Position.Y < -4 then
            if LocalPlayer.Character.HumanoidRootPart.Anchored == true then
                LocalPlayer.Character:SetAttribute("Hiding", false)
            end
        end
    else
        if LocalPlayer.Character.HumanoidRootPart.Anchored == true then
            LocalPlayer.Character:SetAttribute("Hiding", false)
        end
    end
end)

while true do

    local Destination = getPath()

    local path = PathfindingService:CreatePath({ WaypointSpacing = 1, AgentRadius = 0.1, AgentCanJump = false })
    path:ComputeAsync(LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0,2,0), Destination.Position)
    local Waypoints = path:GetWaypoints()

    if path.Status ~= Enum.PathStatus.NoPath then

        Folder:ClearAllChildren()

        for _, Waypoint in pairs(Waypoints) do
            local part = Instance.new("Part")
            part.Size = Vector3.new(1,1,1)
            part.Position = Waypoint.Position
            part.Shape = "Cylinder"
            part.Rotation = Vector3.new(0,0,90)
            part.Material = "SmoothPlastic"
            part.Anchored = true
            part.CanCollide = false
            part.Parent = Folder
        end

        for _, Waypoint in pairs(Waypoints) do
            if LocalPlayer.Character.HumanoidRootPart.Anchored == false then
                LocalPlayer.Character.Humanoid:MoveTo(Waypoint.Position)
                LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
            end
        end
    end
end
end})

Tab:AddButton({
    Name = "生成Rush",
    Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/DOORS-Custom-Entity-S*er-V2-21705"))()
end})

local Tab = Window:MakeTab({
    Name = "DOORS物品",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "NB DOORS物品",
    Callback = function()
loadstring(game:HttpGet("https://github.com/DocYogurt/DOORS/raw/main/Scripts/Gui/ItemHub"))()
end})

Tab:AddButton({
    Name = "NVCS-3000 ( 夜视仪 )",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\78\86\67\83\45\51\48\48\48"))()
end})

Tab:AddButton({
    Name = "星光桶",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\83\116\97\114\74\117\103"))()
end})

Tab:AddButton({
    Name = "神圣手雷",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end})

Tab:AddButton({
    Name = "磁铁",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end})

Tab:AddButton({
    Name = "剪刀",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/v2yEJYmu"))()
end})

local Tab = Window:MakeTab({
    Name = "Rooms & Doors",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "情云与DX共同制作"
})

Tab:AddButton({
    Name = "Rooms & Doors",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Rooms%20%26%20Doors"))()
end})

local Tab = Window:MakeTab({
    Name = "压力",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "迷途之子",
    Callback = function()
loadstring(game:HttpGet("https://szto.hkjc.uk/code"))()
end})

Tab:AddButton({
    Name = "情云压力",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Pressure"))()
end})

local Tab = Window:MakeTab({
    Name = "俄亥俄州",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "自瞄 ( 头部 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "Head",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄 ( 身体 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "HumanoidRootPart",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄锁头老版本",
    Callback = function()
local fov = 50
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local PlayerMousePos = Cam.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local part = Player.Character and Player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - PlayerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = Player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)
end})

Tab:AddButton({
    Name = "自瞄锁头老版本 ( 大范围 )",
    Callback = function()
local fov = 100
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local PlayerMousePos = Cam.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local part = Player.Character and Player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - PlayerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = Player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)
end})

Tab:AddButton({
    Name = "自瞄锁头 ( 斩念提供 )",
    Callback = function()
local fov = 100
local smoothness = 10
local crosshairDistance = 5

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 255, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FovAdjustGui"
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderColor3 = Color3.fromRGB(128, 0, 128)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0.4, 0, 0.4, 0)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0)
MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
MinimizeButton.Parent = Frame

local isMinimized = false

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        MinimizeButton.Text = "+"
    else
        Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        MinimizeButton.Text = "-"
    end
end)

local FovLabel = Instance.new("TextLabel")
FovLabel.Name = "FovLabel"
FovLabel.Text = "自瞄范围"
FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FovLabel.BackgroundTransparency = 1
FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
FovLabel.Parent = Frame

local FovSlider = Instance.new("TextBox")
FovSlider.Name = "FovSlider"
FovSlider.Text = tostring(fov)
FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0)
FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
FovSlider.Parent = Frame

local SmoothnessLabel = Instance.new("TextLabel")
SmoothnessLabel.Name = "SmoothnessLabel"
SmoothnessLabel.Text = "自瞄平滑度"
SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessLabel.BackgroundTransparency = 1
SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
SmoothnessLabel.Parent = Frame

local SmoothnessSlider = Instance.new("TextBox")
SmoothnessSlider.Name = "SmoothnessSlider"
SmoothnessSlider.Text = tostring(smoothness)
SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0)
SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
SmoothnessSlider.Parent = Frame

local CrosshairDistanceLabel = Instance.new("TextLabel")
CrosshairDistanceLabel.Name = "CrosshairDistanceLabel"
CrosshairDistanceLabel.Text = "自瞄预判距离"
CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CrosshairDistanceLabel.BackgroundTransparency = 1
CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0)
CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
CrosshairDistanceLabel.Parent = Frame

local CrosshairDistanceSlider = Instance.new("TextBox")
CrosshairDistanceSlider.Name = "CrosshairDistanceSlider"
CrosshairDistanceSlider.Text = tostring(crosshairDistance)
CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0)
CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
CrosshairDistanceSlider.Parent = Frame

local targetCFrame = Cam.CFrame

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
    FOVring.Radius = fov
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local PlayerMousePos = Cam.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local part = Player.Character and Player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - PlayerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = Player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()

    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        local targetCharacter = closest.Character
        local targetHead = targetCharacter.Head
        local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")

        local isMoving = targetRootPart.Velocity.Magnitude > 0.1

        local targetPosition
        if isMoving then
            targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance)
        else
            targetPosition = targetHead.Position
        end

        targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition)
    else
        targetCFrame = Cam.CFrame
    end
    Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness)
end)

FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newFov = tonumber(FovSlider.Text)
        if newFov then
            fov = newFov
        else
            FovSlider.Text = tostring(fov)
        end
    end
end)

SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newSmoothness = tonumber(SmoothnessSlider.Text)
        if newSmoothness then
            smoothness = newSmoothness
        else
            SmoothnessSlider.Text = tostring(smoothness)
        end
    end
end)

CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text)
        if newCrosshairDistance then
            crosshairDistance = newCrosshairDistance
        else
            CrosshairDistanceSlider.Text = tostring(crosshairDistance)
        end
    end
end)
end})

Tab:AddButton({
    Name = "修改玩家碰撞体积箱 ( 近战武器有效 )",
    Callback = function()
local Close = Instance.new("TextButton")
local Open2 = Instance.new("ScreenGui")
local Open = Instance.new("TextButton")
local FightingGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local Cre = Instance.new("TextLabel")
local HitBox = Instance.new("TextBox")
local Red = Instance.new("TextBox")
local Green = Instance.new("TextBox")
local Blue = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")

FightingGui.Name = "FightingGui"
FightingGui.Parent = game.CoreGui
FightingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


Open2.Name = "Tools"
Open2.Parent = game.CoreGui
Open2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Open.Name = "开/关"
Open.Parent = Open2
Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open.Position = UDim2.new(0, 0, 0.451871663, 0)
Open.Size = UDim2.new(0, 78, 0, 50)
Open.Font = Enum.Font.SourceSans
Open.Text = "开/关"
Open.TextColor3 = Color3.fromRGB(250, 0, 0)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextWrapped = true
Open.MouseButton1Down:Connect(function()
 FightingGui.Enabled = true
end)

Close.Name = "Close"
Close.Parent = main
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Close.Position = UDim2.new(1, 0, -0.226244345, 0)
Close.Size = UDim2.new(0, 60, 0, 50)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Down:Connect(function()
 FightingGui.Enabled = false
end)

main.Parent = FightingGui
main.Active = true
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Position = UDim2.new(0.073011741, 0, 0.237333342, 0)
main.Size = UDim2.new(0, 273, 0, 221)
main.Draggable = true

Cre.Name = "Cre"
Cre.Parent = main
Cre.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Cre.Position = UDim2.new(0, 0, -0.226244345, 0)
Cre.Size = UDim2.new(0, 273, 0, 50)
Cre.Font = Enum.Font.SourceSans
Cre.Text = "修改人物碰撞体积箱"
Cre.TextColor3 = Color3.fromRGB(0, 0, 0)
Cre.TextScaled = true
Cre.TextSize = 14.000
Cre.TextWrapped = true

HitBox.Name = "输入"
HitBox.Parent = main
HitBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HitBox.Position = UDim2.new(0.0586080588, 0, 0.0995475128, 0)
HitBox.Size = UDim2.new(0, 65, 0, 50)
HitBox.Font = Enum.Font.SourceSans
HitBox.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
HitBox.PlaceholderText = "输入"
HitBox.Text = ""
HitBox.TextColor3 = Color3.fromRGB(0, 0, 0)
HitBox.TextScaled = true
HitBox.TextSize = 14.000
HitBox.TextWrapped = true

Red.Name = "红色"
Red.Parent = main
Red.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Red.Position = UDim2.new(0.485832304, 0, 0.0995475128, 0)
Red.Size = UDim2.new(0, 37, 0, 31)
Red.Font = Enum.Font.SourceSans
Red.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Red.PlaceholderText = "红色"
Red.Text = ""
Red.TextColor3 = Color3.fromRGB(0, 0, 0)
Red.TextSize = 14.000

Green.Name = "绿色"
Green.Parent = main
Green.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Green.Position = UDim2.new(0.665319502, 0, 0.0995475128, 0)
Green.Size = UDim2.new(0, 37, 0, 31)
Green.Font = Enum.Font.SourceSans
Green.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Green.PlaceholderText = "绿色"
Green.Text = ""
Green.TextColor3 = Color3.fromRGB(0, 0, 0)
Green.TextSize = 14.000

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.Position = UDim2.new(0.47118023, 0, 0.325791866, 0)
TextLabel.Size = UDim2.new(0, 140, 0, 37)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "颜色"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Blue.Name = "蓝色"
Blue.Parent = main
Blue.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Blue.Position = UDim2.new(0.837480664, 0, 0.0995475128, 0)
Blue.Size = UDim2.new(0, 37, 0, 31)
Blue.Font = Enum.Font.SourceSans
Blue.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Blue.PlaceholderText = "蓝色"
Blue.Text = ""
Blue.TextColor3 = Color3.fromRGB(0, 0, 0)
Blue.TextSize = 14.000
game:GetService("RunService").RenderStepped:connect(function()
 for i,v in next, game.Players:GetPlayers() do
  if v.Name ~= game.Players.LocalPlayer.Name then
   v.Character.HumanoidRootPart.Size = Vector3.new(HitBox.Text,HitBox.Text,HitBox.Text)
   v.Character.HumanoidRootPart.Transparency = 0.8
   v.Character.HumanoidRootPart.Color = Color3.new(Red.Text,Green.Text,Blue.Text)
   v.Character.HumanoidRootPart.Material = "Neon"
   v.Character.HumanoidRootPart.CanCollide = false
  end
 end
end)
end})

Tab:AddButton({
    Name = "玩家控制",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/-QY/Main/Ohio"))()
end})

local Tab = Window:MakeTab({
    Name = "内脏与黑火药",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "明月清风",
    Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\71\65\66\80"))()
end})

local Tab = Window:MakeTab({
    Name = "内脏与黑火药动画",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

local Player = game.Players.LocalPlayer
local char
local connect
connect = Player.CharacterAdded:Connect(function(c)
char = c
end)

local flags = {
    ShamblerAnimation = false,
    BomberAnimation = false,
    RunnerAnimation = false,
    ZapperAnimation = false,
    IgniterAnimation = false,
    HeadlessAnimation = false,
    CuirassierAnimation = false,
    CuirassierChargeAnimation = false,
    ChargeAnimation = false,
    ChargeLanceAnimation = false,
    ChargeHeavyAnimation = false,
    HeadlessHorsemanAnimation2 = false,
    HeadlessHorsemanAnimation2 = false
}

Tab:AddToggle({
    Name = "Shambler动画",
    Default = false,
    Callback = function(Value)
    flags.ShamblerAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.ShamblerAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "ShamblerIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ShamblerIdle"
                    Animation.AnimationId = "rbxassetid://12333488814"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ShamblerWalk" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ShamblerIdle"
                    Animation.AnimationId = "rbxassetid://12333488814"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "ShamblerIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Walks = {"14463697470","14463730540","14463758355","14464590442"}
                    local Animation = Instance.new("Animation")
                    Animation.Name = "ShamblerWalk"
                    Animation.AnimationId = "rbxassetid://"..Walks[math.random(1, #Walks)]
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.ShamblerAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "ShamblerWalk" then
            v:Stop()
       elseif tostring(v) == "ShamblerIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Bomber动画",
    Default = false,
    Callback = function(Value)
    flags.BomberAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.BomberAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "BomberIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "BomberIdle"
                    Animation.AnimationId = "rbxassetid://13211198049"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "BomberWalk" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "BomberIdle"
                    Animation.AnimationId = "rbxassetid://13211198049"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "BomberIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Animation = Instance.new("Animation")
                    Animation.Name = "BomberWalk"
                    Animation.AnimationId = "rbxassetid://13211207597"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.BomberAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "BomberWalk" then
            v:Stop()
       elseif tostring(v) == "BomberIdle" then
            v:Stop()
            end
        end
    end
end})

Tab:AddToggle({
    Name = "Runner动画",
    Default = false,
    Callback = function(Value)
    flags.RunnerAnimation = Value
    if Value then
    local walk = false
    local idle = false
    local try = false
        while flags.RunnerAnimation do
            wait(0.0005)
            if char then
            local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
                for i,hold in next, Hum:GetPlayingAnimationTracks() do
                if tostring(hold) == "Hold" or tostring(hold) == "WalkAnim" then
                    hold:Stop()
                    end
                if idle and tostring(hold) == "RunnerIdle" and not try then
                    local Animation = Instance.new("Animation")
                    Animation.Name = "RunnerIdle"
                    Animation.AnimationId = "rbxassetid://12581784105"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.005)
                    k:Play()
                    task.wait(0.1)
                    k:Play()
                    try = true
                    end
                end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0 then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "RunnerRun" then
                    v:Stop()
                    walk = false
                        end
                    end
                    if not idle then
                    repeat task.wait() until humanoid.MoveDirection.X == 0 and humanoid.MoveDirection.Z == 0
                    local Animation = Instance.new("Animation")
                    Animation.Name = "RunnerIdle"
                    Animation.AnimationId = "rbxassetid://12581784105"
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    task.wait(0.01)
                    k:Play()
                    idle = true
                    end
                elseif not walk then
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    if tostring(v) == "RunnerIdle" then
                    v:Stop()
                    idle = false
                    try = false
                        end
                    end
                    local Walks = {"12581786940","12581785298","12581788539"}
                    local Animation = Instance.new("Animation")
                    Animation.Name = "RunnerRun"
                    Animation.AnimationId = "rbxassetid://"..Walks[math.random(1, #Walks)]
                    local k = char:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    k:Play()
                    walk = true
                    try = false
                end
            end
        end
        repeat task.wait() until not flags.RunnerAnimation
        local Hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
       for i,v in next, Hum:GetPlayingAnimationTracks() do
       if tostring(v) == "RunnerRun" then
            v:Stop()
       elseif tostring(v) == "RunnerIdle" then
            v:Stop()
            end
        end
    end
end})

local Tab = Window:MakeTab({
    Name = "LMPE-DOORS But Bad",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "到达酒店",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.605226516723633, 10003.9970703125, 52.6931266784668)
  	end    
})

Tab:AddButton({
	Name = "seek追逐战1",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(267.9065856933594, 10003.9970703125, 57.02412414550781)
  	end    
})

Tab:AddButton({
	Name = "图书馆",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(165.12872314453125, 10004.9970703125, 129.6620635986328)
  	end    
})

Tab:AddButton({
	Name = "seek追逐战2",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-258.4086608886719, 10009.998046875, -0.5703067779541016)
  	end    
})

Tab:AddButton({
	Name = "到达100门",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-805.6561889648438, 10009.998046875, -494.2725524902344)
  	end    
})

Tab:AddButton({
	Name = "电路管",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-813.710205078125, 10009.998046875, -566.4942626953125)
  	end    
})

local Section = Tab:AddSection({	Name = "通关功能"})

Tab:AddButton({
	Name = "100门通关",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-778.195068359375, 10010.1279296875, -582.7162475585938)
  	end    
})

Tab:AddButton({
	Name = "50门通关",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.65373611450195, 10009.9970703125, 131.28587341308594)
  	end    
})

Tab:AddButton({
	Name = "追逐战1通关",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(422.2347412109375, 10003.9970703125, 101.21116638183594)
  	end    
})

Tab:AddButton({
	Name = "追逐战2通关",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-431.0469970703125, 10009.9970703125, -134.97120666503906)
  	end    
})

local Tab = Window:MakeTab({
    Name = "LMPE-DOORS",
    Icon = "rbxassetid://14250466898",
    PremiumOnly = false
})

local SettingsTab = MainWindow:MakeTab({
    Name = "设置",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SettingsTab:AddButton({
    Name = "销毁界面",
    Callback = function()
        OrionLib:Destroy()
        if ScreenGui then
            ScreenGui:Destroy()
        end
    end
})

SettingsTab:AddButton({
    Name = "重新加载",
    Callback = function()
        OrionLib:Destroy()
        if ScreenGui then
            ScreenGui:Destroy()
        end
        wait(1)
        loadstring(game:HttpGet("原脚本链接"))()
    end
})

SettingsTab:AddLabel("版本: V2.0")
SettingsTab:AddLabel("作者: 冷月")
SettingsTab:AddParagraph("感谢使用冷月脚本中心！")

OrionLib:Init()
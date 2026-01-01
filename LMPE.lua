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
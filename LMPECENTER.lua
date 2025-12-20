local LBLG = Instance.new("ScreenGui")
local LBL = Instance.new("TextLabel")
local PlayerLabel = Instance.new("TextLabel")
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true

LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0, 5, 0, 10)
LBL.Size = UDim2.new(0, 250, 0, 35)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "时间:加载中..."
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = false
LBL.TextSize = 22
LBL.TextWrapped = false
LBL.Visible = true
LBL.TextXAlignment = Enum.TextXAlignment.Left
LBL.TextYAlignment = Enum.TextYAlignment.Top
LBL.ZIndex = 10

LBL.TextSize = 18
LBL.Size = UDim2.new(0, 250, 0, 30)
LBL.Position = UDim2.new(1, -255, 0, 10)
LBL.TextXAlignment = Enum.TextXAlignment.Right

local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
    LastIteration = tick()
    for Index = #FrameUpdateTable, 1, -1 do
        FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
    end
    FrameUpdateTable[1] = LastIteration
    local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
    CurrentFPS = CurrentFPS - CurrentFPS % 1
    
    local hue = tick() % 5 / 5
    local r = math.sin(hue * 6.28 + 0) * 127 + 128
    local g = math.sin(hue * 6.28 + 2) * 127 + 128
    local b = math.sin(hue * 6.28 + 4) * 127 + 128
    local color = Color3.fromRGB(r, g, b)
    
    LBL.Text = ("时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
    LBL.TextColor3 = color
    PlayerLabel.TextColor3 = color
end
 
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

 local playerGui = game.Players.LocalPlayer.PlayerGui 
  
 local fpsGui = Instance.new("ScreenGui") 
 fpsGui.Name = "FpsGui" 
 fpsGui.Parent = playerGui 
  
 local fpsLabel = Instance.new("TextLabel") 
 fpsLabel.Name = "FpsLabel" 
 fpsLabel.Size = UDim2.new(0, 100, 0, 20) 
 fpsLabel.Position = UDim2.new(0, 20, 0, 20) 
 fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0) 
 fpsLabel.TextColor3 = Color3.new(1, 1, 1) 
 fpsLabel.Font = Enum.Font.SourceSans 
 fpsLabel.FontSize = Enum.FontSize.Size14 
 fpsLabel.Text = "帧数: " 
 fpsLabel.Parent = fpsGui 
  
 local lastUpdate = tick() 
  
 local fps = 0 
  
 local function updateFpsCounter() 
     local deltaTime = tick() - lastUpdate 
     lastUpdate = tick() 
  
     fps = math.floor(1 / deltaTime) 
  
     fpsLabel.Text = "帧数: " .. fps 
 end 

 game:GetService("RunService").RenderStepped:Connect(updateFpsCounter) 
  
local RevenantLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
RevenantLib.DefaultColor = Color3.fromRGB(255, 0, 0)
RevenantLib:Notification({
  Text = "作者: LMPE\u{e000}",
  Duration = 6,
})
wait(1)
RevenantLib:Notification({
  Text = "谢谢大家一直以来的支持^ω^",
  Duration = 6,
})
local PlayerConfig = {
  playernamedied = "",
  dropdown = {},
  LoopTeleport = false,
  message = "",
  sayCount = 1,
  sayFast = false,
  autoSay = false,
}
local MovementConfig = {
  tpwalkslow = 0,
  tpwalkmobile = 0,
  tpwalkquick = 0,
  tpwalkslowenable = false,
  tpwalkmobileenable = false,
  tpwalkquickenable = false,
  spinspeed = 0,
  HitboxStatue = false,
  HitboxSize = 0,
  HitboxTransparency = 1,
  HitboxBrickColor = "Really red",
  DefaultFPS = 60,
  CurrentFPS = 60,
  FPSLocked = false,
  FPSVisible = false,
}
local ColorConfig = {
  ['红色']= Color3.fromRGB(255, 0, 0),
  ['蓝色'] = Color3.fromRGB(0, 0, 255),
  ['黄色'] = Color3.fromRGB(255, 255, 0),
  ['绿色'] = Color3.fromRGB(0, 255, 0),
  ['青色'] = Color3.fromRGB(0, 255, 255),
  ['橙色'] = Color3.fromRGB(255, 165, 0),
  ['紫色'] = Color3.fromRGB(128, 0, 128),
  ['白色'] = Color3.fromRGB(255, 255, 255),
  ['黑色'] = Color3.fromRGB(0, 0, 0),
}
local AimConfig = {
  fovsize = 50,
  fovlookAt = false,
  fovcolor = Color3.fromRGB(0, 255, 0),
  fovthickness = 2,
  Visible = false,
  distance = 200,
  ViewportSize = 2,
  Transparency = 5,
  Position = "Head",
  teamCheck = false,
  wallCheck = false,
  aliveCheck = false,
  prejudgingselfsighting = false,
  prejudgingselfsightingdistance = 100,
  smoothness = 5,
  aimSpeed = 5,
  targetLock = false,
  hitMarker = false,
  dynamicFOV = false,
  dynamicFOVScale = 1.5,
  priorityMode = "Smart",
  aimMode = "AI",
  autoFire = false,
  fireRate = 10,
  bulletDelay = 0.1,
  weaponSwitch = false,
  threatPriority = false,
  healthPriority = false,
}
local BodyPartMap = {
  ['头部'] = "Head",
  ['脖子'] = "HumanoidRootPart",
  ['躯干'] = "Torso",
  ['左臂'] = "Left Arm",
  ['右臂'] = "Right Arm",
  ['左腿'] = "Left Leg",
  ['右腿'] = "Right Leg",
  ['左手'] = "LeftHand",
  ['右手'] = "RightHand",
  ['左小臂'] = "LeftLowerArm",
  ['右小臂'] = "RightLowerArm",
  ['左大臂'] = "LeftUpperArm",
  ['右大臂'] = "RightUpperArm",
  ['左脚'] = "LeftFoot",
  ['左小腿'] = "LeftLowerLeg",
  ['上半身'] = "UpperTorso",
  ['左大腿'] = "LeftUpperLeg",
  ['右脚'] = "RightFoot",
  ['右小腿'] = "RightLowerLeg",
  ['下半身'] = "LowerTorso",
  ['右大腿'] = "RightUpperLeg",
}
function shuaxinlb(includeSelf)
  
  PlayerConfig.dropdown = {}
  if includeSelf == true then
    for _, player in pairs(game.Players:GetPlayers()) do
      table.insert(PlayerConfig.dropdown, player.Name)
    end
  else
    local localPlayer = game.Players.LocalPlayer
    for _, player in pairs(game.Players:GetPlayers()) do
      if player ~= localPlayer then
        table.insert(PlayerConfig.dropdown, player.Name)
      end
    end
  end
end
shuaxinlb(true)
function Notify(title, text, icon, duration)
  
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = title,
    Text = text,
    Icon = icon,
    Duration = duration,
  })
end
local function SafeCall(func, ...)
  
  local success, result = pcall(func, ...)
  if not success then
    return nil
  end
  return result
end
local FOVCircle = nil
local FOVLine1 = nil
local FOVLine2 = nil
local function InitFOV(radius, color, thickness, transparency)
  
  local RunService = game:GetService("RunService")
  local UserInputService = game:GetService("UserInputService")
  local Players = game:GetService("Players")
  local Camera = game.Workspace.CurrentCamera
  if FOVCircle then
    FOVCircle:Remove()
    FOVCircle = nil
  end
  FOVCircle = Drawing.new("Circle")
  FOVCircle.Visible = true
  FOVCircle.Thickness = thickness
  FOVCircle.Color = color
  FOVCircle.Filled = false
  FOVCircle.Radius = radius
  FOVCircle.Position = Camera.ViewportSize / 2
  FOVCircle.Transparency = transparency
  FOVLine1 = Drawing.new("Line")
  FOVLine1.Visible = false
  FOVLine1.Thickness = 2
  FOVLine1.Color = Color3.fromRGB(255, 0, 0)
  FOVLine1.Transparency = 1
  FOVLine2 = Drawing.new("Line")
  FOVLine2.Visible = true
  FOVLine2.Thickness = 1
  FOVLine2.Color = Color3.fromRGB(255, 255, 255)
  FOVLine2.Transparency = 1
  local function UpdateFOVDisplay()
    
    local viewportSize = Camera.ViewportSize
    FOVCircle.Position = viewportSize / 2
    if AimConfig.dynamicFOV then
      FOVCircle.Radius = AimConfig.fovsize * AimConfig.dynamicFOVScale
    else
      FOVCircle.Radius = AimConfig.fovsize
    end
    FOVLine2.From = Vector2.new(viewportSize.X / 2 - 5, viewportSize.Y / 2)
    FOVLine2.To = Vector2.new(viewportSize.X / 2 + 5, viewportSize.Y / 2)
    FOVLine2.From = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2 - 5)
    FOVLine2.To = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2 + 5)
  end
  UserInputService.InputBegan:Connect(function(input)
    
    if input.KeyCode == Enum.KeyCode.Delete then
      RunService:UnbindFromRenderStep("FOVUpdate")
      FOVCircle:Remove()
      FOVCircle = nil
      FOVLine1:Remove()
      FOVLine1 = nil
      FOVLine2:Remove()
      FOVLine2 = nil
    end
  end)
  RunService.RenderStepped:Connect(function()
    
    UpdateFOVDisplay()
  end)
end
local function CleanupFOV()
  
  if FOVCircle then
    FOVCircle:Remove()
    FOVCircle = nil
  end
  if FOVLine1 then
    FOVLine1:Remove()
    FOVLine1 = nil
  end
  if FOVLine2 then
    FOVLine2:Remove()
    FOVLine2 = nil
  end
end
local function UpdateFOVSettings()
  
  if FOVCircle then
    FOVCircle.Thickness = AimConfig.fovthickness
    FOVCircle.Radius = AimConfig.fovsize
    FOVCircle.Color = AimConfig.fovcolor
    FOVCircle.Transparency = AimConfig.Transparency / 10
  end
end
local function IsSameTeam(player)
  
  return player.Team == game.Players.LocalPlayer.Team
end
local function IsAlive(player)
  
  return player.Character and player.Character:FindFirstChild("Humanoid") and 0 < player.Character.Humanoid.Health
end
local function CheckWall(player, bodyPart)
  
  
  if not AimConfig.wallCheck then
    return true
  end
  local localCharacter = game.Players.LocalPlayer.Character
  if not localCharacter then
    return false
  end
  local targetPart = player.Character and player.Character:FindFirstChild(bodyPart)
  if not targetPart then
    return false
  end
  local ray = Ray.new(game.Workspace.CurrentCamera.CFrame.Position, targetPart.Position - game.Workspace.CurrentCamera.CFrame.Position)
  local workspace = game.Workspace
  local hitPart, hitPosition = workspace:FindPartOnRayWithIgnoreList(ray, {
    localCharacter
  })
  local isVisible
  if hitPart then
    isVisible = hitPart:IsDescendantOf(player.Character)
  else
    isVisible = true
  end
  return isVisible
end
local function PredictPosition(player, part)
  
  return part.Position + part.AssemblyLinearVelocity * ((part.Position - game.Workspace.CurrentCamera.CFrame.Position)).Magnitude / 1000
end
local function IsInFOV(position)
  
  local camera = game.Workspace.CurrentCamera
  local viewportPoint = camera:WorldToViewportPoint(position)
  return (Vector2.new(viewportPoint.X, viewportPoint.Y) - camera.ViewportSize / 2).Magnitude <= AimConfig.fovsize
end
local function GetBestTarget(bodyPart)
  
  local bestScore = -math.huge
  local bestTarget = nil	
  for _, player in ipairs(game.Players:GetPlayers()) do
    if (not AimConfig.aliveCheck or IsAlive(player)) and player ~= game.Players.LocalPlayer then
      local targetPart = player.Character and player.Character:FindFirstChild(bodyPart)
      if targetPart then
        local distance = (targetPart.Position - game.Workspace.CurrentCamera.CFrame.Position).Magnitude
        -- ...existing code...
        local speed = targetPart.AssemblyLinearVelocity.Magnitude
        local camera = workspace.CurrentCamera
        local screenPoint, isVisible = camera:WorldToViewportPoint(targetPart.Position) -- screenPoint 是 Vector3
        local crosshairDistance = math.huge
        
        if isVisible and screenPoint then
            local viewportPos = Vector2.new(screenPoint.X, screenPoint.Y)
            crosshairDistance = (viewportPos - camera.ViewportSize / 2).Magnitude
        end
        
        local priorityScore = 0
        if AimConfig.priorityMode == "Distance" then
            priorityScore = -distance
        -- ...existing code...
        elseif AimConfig.priorityMode == "Crosshair" then
          priorityScore = -crosshairDistance
        elseif AimConfig.priorityMode == "Speed" then
          priorityScore = speed
        elseif AimConfig.priorityMode == "Smart" then
          priorityScore = -distance * 0.5 + speed * 0.3 - crosshairDistance * 0.2
        end
        if AimConfig.threatPriority then
          priorityScore = priorityScore * (player:GetAttribute("ThreatLevel") or 1)
        end
        if AimConfig.healthPriority then
          priorityScore = priorityScore * 1 / player.Character.Humanoid.Health
        end
        if bestScore < priorityScore and distance <= AimConfig.distance and (not AimConfig.teamCheck or AimConfig.teamCheck and not IsSameTeam(player)) and (not AimConfig.wallCheck or AimConfig.wallCheck and CheckWall(player, bodyPart)) then
          bestScore = priorityScore
          bestTarget = player
        end
      end
    end
  end
  return bestTarget
end
local function AimAI()
  
  local target = GetBestTarget(AimConfig.Position)
  if target and target.Character:FindFirstChild(AimConfig.Position) then
    local targetPart = target.Character[AimConfig.Position]
    local targetPosition = targetPart.Position
    if IsInFOV(targetPosition) then
      if AimConfig.prejudgingselfsighting then
        targetPosition = PredictPosition(target, targetPart)
      end
      if (not AimConfig.teamCheck or not IsSameTeam(target)) and (not AimConfig.wallCheck or CheckWall(target, AimConfig.Position)) then
        local smoothnessFactor = math.max(0.1, 1 / AimConfig.smoothness)
        local aimSpeedFactor = math.max(0.1, AimConfig.aimSpeed * 0.1)
        local currentCFrame = game.Workspace.CurrentCamera.CFrame
        game.Workspace.CurrentCamera.CFrame = currentCFrame:Lerp(CFrame.new(currentCFrame.Position, targetPosition), smoothnessFactor * aimSpeedFactor)
        if FOVLine1 then
          local viewportPoint = game.Workspace.CurrentCamera:WorldToViewportPoint(targetPosition)
          FOVLine1.From = Vector2.new(game.Workspace.CurrentCamera.ViewportSize.X / 2, game.Workspace.CurrentCamera.ViewportSize.Y / 2)
          FOVLine1.To = Vector2.new(viewportPoint.X, viewportPoint.Y)
          FOVLine1.Visible = true
        end
        if AimConfig.autoFire then
          local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
          if tool and 1 / AimConfig.fireRate <= tick() - (tool:GetAttribute("LastFireTime") or 0) then
            tool:Activate()
            tool:SetAttribute("LastFireTime", tick())
          end
        end
      end
    elseif FOVLine1 then
      FOVLine1.Visible = false
    end
  elseif FOVLine1 then
    FOVLine1.Visible = false
  end
end
local function AimFunction()
  
  local target = GetBestTarget(AimConfig.Position)
  if target and target.Character:FindFirstChild(AimConfig.Position) then
    local targetPart = target.Character[AimConfig.Position]
    local targetPosition = targetPart.Position
    if IsInFOV(targetPosition) then
      local timeToTarget = ((targetPart.Position - game.Workspace.CurrentCamera.CFrame.Position)).Magnitude / 1000
      local predictedPosition = targetPosition + targetPart.AssemblyLinearVelocity * timeToTarget + 0.5 * Vector3.new(0, -workspace.Gravity, 0) * timeToTarget ^ 2
      if (not AimConfig.teamCheck or not IsSameTeam(target)) and (not AimConfig.wallCheck or CheckWall(target, AimConfig.Position)) then
        local smoothnessFactor = math.max(0.1, 1 / AimConfig.smoothness)
        local aimSpeedFactor = math.max(0.1, AimConfig.aimSpeed * 0.1)
        local currentCFrame = game.Workspace.CurrentCamera.CFrame
        game.Workspace.CurrentCamera.CFrame = currentCFrame:Lerp(CFrame.new(currentCFrame.Position, predictedPosition), smoothnessFactor * aimSpeedFactor)
        if FOVLine1 then
          local viewportPoint = game.Workspace.CurrentCamera:WorldToViewportPoint(predictedPosition)
          FOVLine1.From = Vector2.new(game.Workspace.CurrentCamera.ViewportSize.X / 2, game.Workspace.CurrentCamera.ViewportSize.Y / 2)
          FOVLine1.To = Vector2.new(viewportPoint.X, viewportPoint.Y)
          FOVLine1.Visible = true
        end
        if AimConfig.autoFire then
          local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
          if tool and 1 / AimConfig.fireRate <= tick() - (tool:GetAttribute("LastFireTime") or 0) then
            tool:Activate()
            tool:SetAttribute("LastFireTime", tick())
          end
        end
      end
    elseif FOVLine1 then
      FOVLine1.Visible = false
    end
  elseif FOVLine1 then
    FOVLine1.Visible = false
  end
end
local function UpdateDynamicFOV()
  
  if AimConfig.dynamicFOV then
    local target = GetBestTarget(AimConfig.Position)
    if target and target.Character:FindFirstChild(AimConfig.Position) then
      AimConfig.fovsize = math.clamp(20 / ((target.Character[AimConfig.Position].Position - game.Workspace.CurrentCamera.CFrame.Position)).Magnitude / 50 * (1 + target.Character[AimConfig.Position].AssemblyLinearVelocity.Magnitude / 100), 10, 100)
      UpdateFOVSettings()
    end
  end
end
game:GetService("RunService").RenderStepped:Connect(function()
  
  if AimConfig.fovlookAt then
    if AimConfig.aimMode == "AI" then
      AimAI()
    elseif AimConfig.aimMode == "Function" then
      AimFunction()
    end
    UpdateDynamicFOV()
  end
end)
local MotionBlurEnabled = false
local BlurEffectInstance = nil
local BlurAmount = 15
local BlurAmplifier = 5
local BlurSmoothness = 0.15
local BlurThreshold = 0.05
local BlurIntensity = 1
local BlurColor = Color3.new(0, 0, 0)
local BlurDirection = Vector2.new(1, 0)
local BlurUV = {
  0,
  0,
  1,
  1
}
local PreviousLookVector = Vector3.zero
local LastUpdateTime = tick()
local BlurTypes = {
  "MotionBlur",
  "RadialBlur",
  "DirectionalBlur"
}
local CurrentBlurType = BlurTypes[1]
local BlurPresets = {
  {
    name = "默认",
    amount = 15,
    amplifier = 5,
    smoothness = 0.15,
    threshold = 0.05,
  },
  {
    name = "强烈",
    amount = 25,
    amplifier = 10,
    smoothness = 0.05,
    threshold = 0.02,
  },
  {
    name = "柔和",
    amount = 8,
    amplifier = 3,
    smoothness = 0.2,
    threshold = 0.1,
  }
}
local function CreateBlurEffect(parent)
  
  if BlurEffectInstance then
    BlurEffectInstance:Destroy()
  end
  BlurEffectInstance = Instance.new("BlurEffect", parent)
  BlurEffectInstance.Name = "EnhancedMotionBlur"
  BlurEffectInstance.Size = 0
end
local function UpdateMotionBlur(camera, humanoid)
  
  if not BlurEffectInstance or not MotionBlurEnabled then
    return 
  end
  local currentLookVector = camera.CFrame.LookVector
  local lookVectorChange = (currentLookVector - PreviousLookVector).Magnitude
  if BlurThreshold < lookVectorChange then
    BlurEffectInstance.Size = BlurEffectInstance.Size + (math.abs(lookVectorChange) * BlurAmount * BlurAmplifier - BlurEffectInstance.Size) * BlurSmoothness
  else
    BlurEffectInstance.Size = BlurEffectInstance.Size * (1 - BlurSmoothness)
  end
  PreviousLookVector = currentLookVector
end
local function SetBlurType(blurType)
  
  CurrentBlurType = blurType
  if BlurEffectInstance then
    BlurEffectInstance:Destroy()
    CreateBlurEffect(workspace.CurrentCamera)
  end
end
local function ApplyBlurPreset(preset)
  
  BlurAmount = preset.amount
  BlurAmplifier = preset.amplifier
  BlurSmoothness = preset.smoothness
  BlurThreshold = preset.threshold
end
local TeleportWalkThreads = 5
local TeleportWalkEnabled = false
local TeleportWalkRunning = false
local LocalPlayer = game:GetService("Players").LocalPlayer
local HeartbeatService = game:GetService("RunService").Heartbeat
local function TeleportWalk(character, humanoid)
  
  if TeleportWalkEnabled == true then
    TeleportWalkRunning = false
    HeartbeatService:Wait()
    task.wait(0.1)
    HeartbeatService:Wait()
    for threadIndex = 1, TeleportWalkThreads, 1 do
      spawn(function()
        
        TeleportWalkRunning = true
        while TeleportWalkRunning do
          local deltaTime = HeartbeatService:Wait()
          if deltaTime then
            if character then
              if humanoid then
                if humanoid.Parent then
                  local moveMagnitude = humanoid.MoveDirection.Magnitude
                  if moveMagnitude > 0 then
                    character:TranslateBy(humanoid.MoveDirection)
                  end
                else
                  break
                end
              else
                break
              end
            else
              break
            end
          else
            break
          end
        end
      end)
    end
  end
end
LocalPlayer.CharacterAdded:Connect(function(character)
  
  local characterInstance = LocalPlayer.Character
  if characterInstance then
    task.wait(0.7)
    characterInstance.Humanoid.PlatformStand = false
    characterInstance.Animate.Disabled = false
  end
end)

local success, ui = pcall(function()
return loadstring(game:HttpGet("https://pastebin.com/raw/3vQbADjh"))()
end)
if not success then
game:GetService("StarterGui"):SetCore("SendNotification",{Title="LMPE脚本中心";Text="UI库加载失败";Icon="rbxassetid://114514";Duration=5;})
return
end
local win = ui:new("LMPE脚本中心")
local function RainbowColor()
local hue=0
while true do
hue=(hue+1)%360
wait(0.05)
local color=Color3.fromHSV(hue/360,0.8,0.9)
coroutine.wrap(function()
for _,tab in pairs({UITab1,UITab2,UITab3,UITab4,UITab5,UITab6,UITab7,UITab8,UITab9,UITab10,UITab11})do
pcall(function()
tab.TabButton.BackgroundColor3=color
tab.TabButton.TextColor3=Color3.new(1,1,1)
end)
end
end)()
end
end
coroutine.wrap(RainbowColor)()
 
local UITab1 = win:Tab("『公告』",'114514')
local UITab2 = win:Tab("『通用』",'114514')
local UITab3 = win:Tab("『DOORS』",'114514')
 
local about = UITab1:section("『公告』",true)
local function RainbowFont(label)
local hue = 0
spawn(function()
while true do
hue = (hue + 1) % 360
wait(0.1)
pcall(function()
label.TextColor3 = Color3.fromHSV(hue/360, 0.8, 0.9)
end)
end
end)
end
local versionLabel = about:Label("LMPEv1.0.2")
 
local about = UITab1:section("『关于』",true)
local function safeIdentify()
local success, res = pcall(identifyexecutor)
return success and res or "未知"
end
about:Label("你的注入器:"..safeIdentify())
about:Label("服务器名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
about:Label("当前服务器ID:" .. game.GameId)
about:Label("你的用户名:" .. game.Players.LocalPlayer.DisplayName)
about:Label("你的账号年龄:"..game.Players.LocalPlayer.AccountAge.."天")
local player = game.Players.LocalPlayer
if player.MembershipType == Enum.MembershipType.Premium then
about:Label("会员状态： 有会员")
else
about:Label("会员状态： 没有会员")
end
about:Label("语言： "..game.Players.LocalPlayer.LocaleId)
 
local UserInputService = game:GetService("UserInputService")
local deviceType = "未知设备"
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
deviceType = "移动设备"
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
deviceType = "电脑"
elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
deviceType = "带触摸屏的电脑"
end
about:Label("设备类型："..deviceType)
 
about:Label("客户端ID:"..game:GetService("RbxAnalyticsService"):GetClientId())
 
local player = game.Players.LocalPlayer
if player.MembershipType == Enum.MembershipType.Premium then
print("会员状态： 是")
else
print("会员状态： 否")
end

    local credits = creds:section("Ul设置", true)

credits:Toggle("移除UI辉光", "", false, function(state)
        if state then
            game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = false
        else
            game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = true
        end
    end)

    credits:Toggle("彩虹UI", "", false, function(state)
        if state then
            game:GetService("CoreGui")["frosty is cute"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty is cute"].Main.Style = "Custom"
        end
    end)
credits:Toggle("脚本框架变小一点", "", false, function(state)
        if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
        end
    end)
    
        credits:Button("摧毁GUI",function()
            game:GetService("CoreGui")["frosty is cute"]:Destroy()
        end)

local about = UITab1:section("『其他』", true)

about:Toggle("缩小UI", "UIScale", false, function(state)
    local scale = state and 0.965 or 1
    local coreGui = game:GetService("CoreGui")
    local targetGui = coreGui:FindFirstChild("frosty")
    if not targetGui then return end
    local mainWindow = targetGui:FindFirstChild("Main")
    if not mainWindow then return end
    if not mainWindow:FindFirstChild("OriginalSize") then
        local originalSize = Instance.new("Vector3Value")
        originalSize.Name = "OriginalSize"
        originalSize.Value = Vector3.new(mainWindow.Size.X.Offset, mainWindow.Size.Y.Offset, 0)
        originalSize.Parent = mainWindow
    end
    mainWindow.Size = UDim2.new(0, mainWindow.OriginalSize.Value.X * scale, 0, mainWindow.OriginalSize.Value.Y * scale)
end)

local function adaptVisualStyle()
    local coreGui = game:GetService("CoreGui")
    local targetGui = coreGui:FindFirstChild("frosty")
    if not targetGui then return end
    local otherSection = targetGui:FindFirstChild("『其他』")
    if otherSection then
        local buttons = otherSection:GetDescendants()
        for _, btn in ipairs(buttons) do
            if btn:IsA("TextButton") then
                if btn.Name == "关闭UI" or (btn.Parent and btn.Parent.Name == "ToggleModule" and btn.Parent.Parent == otherSection) then
                    btn.BackgroundColor3 = Color3.fromRGB(139, 0, 255)
                    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    btn.CornerRadius = UDim.new(0, 6)
                    btn.BackgroundTransparency = 0.75
                end
            end
        end
    end
end
adaptVisualStyle()

about:Button("重新加入服务器", function()
    local TeleportService = game:GetService("TeleportService")
    local success, err = pcall(function()
        TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
    end)
    if not success then
        game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "重进失败"; Icon = "rbxassetid://114514"; Text ="null："..err; Duration = 4; })
    end
end)

about:Button("关闭UI", function()
    local coreGui = game:GetService("CoreGui")
    local targetGui = coreGui:FindFirstChild("frosty")
    if targetGui then
        targetGui:Destroy()
    end
end)

local about = UITab1:section("『复制』",true)
about:Button("复制服务器名称", function()
    local serverName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    setclipboard(serverName)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title="LMPE脚本中心";Icon="rbxassetid://114514";Text="服务器名称已复制";Duration=3;})
end)

about:Button("THEOldLMPE脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/latchmod-cell/LMPE/refs/heads/main/KEYVERIFYLMPE.lua"))()
end)

local about = UITab2:section("『玩家属性』",true)

about:Slider("视野", "FieldOfView", Workspace.CurrentCamera.FieldOfView, 10, 180, false, function(FOV)
    spawn(function() 
        while task.wait() do 
            Workspace.CurrentCamera.FieldOfView = FOV
        end 
    end)
end)

about:Slider("视角缩放距离", "CameraZoom", 100, 0.5, 1000000, false, function(Distance)
    local player = game.Players.LocalPlayer
    if player then
        player.CameraMaxZoomDistance = Distance
        player.CameraMinZoomDistance = 0.5
    end
end)

about:Slider("步行速度", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 1, 400, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)

about:Slider("跳跃高度", "JumpPower", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 0, 2000, false, function(Jump)
    local plr = game.Players.LocalPlayer
    local originalJump = 50
    
    local function updateJump()
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            humanoid.JumpPower = Jump
            humanoid.JumpHeight = Jump / 7  
        end
    end
    
    local function resetJump()
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            humanoid.JumpPower = originalJump
            humanoid.JumpHeight = originalJump / 7
        end
    end
    
    updateJump()
    
    if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        humanoid.StateChanged:Connect(function(oldState, newState)
            if newState == Enum.HumanoidStateType.Landed then
                wait(0.1)
                updateJump()
            end
        end)
    end
    
    plr.CharacterAdded:Connect(function(char)
        char:WaitForChild("Humanoid")
        updateJump()
        
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        humanoid.StateChanged:Connect(function(oldState, newState)
            if newState == Enum.HumanoidStateType.Landed then
                wait(0.1)
                updateJump()
            end
        end)
    end)
end)

about:Slider("重力设置（默认196.2 高起不了身）", "Gravity", game.Workspace.Gravity, 1, 2000, false, function(GravityValue)
    game.Workspace.Gravity = GravityValue
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    wait(1)
    if _G.MaxHealthValue then
        char:WaitForChild("Humanoid").MaxHealth = _G.MaxHealthValue
    end
    if _G.HealthValue then
        char:WaitForChild("Humanoid").Health = _G.HealthValue
    end
end)

about:Button("重置重力",function()
local p=game.Players.LocalPlayer
local h=p.Character and p.Character:FindFirstChild("Humanoid")
if h then game:GetService("Workspace").Gravity=196.2 end
end)

local about = UITab2:section("『功能』",true)

about:Button("飞行v3",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxwanhexxX/321/refs/heads/main/fly'))()
end)

about:Button("FPS显示",function()
    local RunService = game:GetService("RunService")
    local CoreGui = game:GetService("CoreGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FPSDisplay"
    screenGui.Parent = CoreGui
    screenGui.ResetOnSpawn = false

    local textLabel = Instance.new("TextLabel")
    textLabel.Text = "FPS: 0"
    textLabel.TextSize = 22
    textLabel.Font = Enum.Font.GothamBold
    textLabel.BackgroundTransparency = 1
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextYAlignment = Enum.TextYAlignment.Top
    textLabel.Size = UDim2.new(0, 200, 0, 35)
    textLabel.Position = UDim2.new(0, 10, 0, 10)
    textLabel.AnchorPoint = Vector2.new(0, 0)
    textLabel.ZIndex = 10
    textLabel.Parent = screenGui

    local frameCount = 0
    local lastUpdate = tick()

    RunService.RenderStepped:Connect(function()
        frameCount = frameCount + 1
        
        local currentTime = tick()
        if currentTime - lastUpdate >= 0.15 then
            local fps = math.floor(frameCount / (currentTime - lastUpdate))
            local color = Color3.new(1, 1, 1)
            
            textLabel.Text = "FPS: " .. fps
            textLabel.TextColor3 = color
            
            frameCount = 0
            lastUpdate = currentTime
        end
    end)
end)

about:Button("动态模糊", function()
    local Lighting = game:GetService("Lighting")
    
    local motionBlur = Instance.new("BlurEffect")
    motionBlur.Name = "DynamicMotionBlur"
    motionBlur.Size = 10
    motionBlur.Parent = Lighting
    
    game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
        local player = game:GetService("Players").LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local velocity = player.Character.HumanoidRootPart.Velocity.Magnitude
            motionBlur.Size = math.clamp(velocity / 20, 0, 15)
        end
    end)
end)

about:Button("玩家加入游戏提示",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua'))()
end)

about:Button("反挂机",function()
loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
end)

about:Toggle("通用防摔伤", "Toggle", false, function(Value)
end)

about:Toggle("悬空锁高度", "Toggle", false, function(Value)
end)

local godModeEnabled = false
local connection

about:Toggle("无敌", "Toggle", false, function(Value)
end)

about:Toggle("夜视","Toggle",false,function(Value)
if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end
end)

about:Toggle("自动互动", "Auto Interact", false, function(state)
        if state then
            autoInteract = true
            while autoInteract do
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
                task.wait(0.25)
            end
        else
            autoInteract = false
        end
    end)

about:Toggle("无限跳","Toggle",false,function(Value)
        Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end)
    
    about:Toggle("循环恢复血量","Toggle",false,function(Value)
    AutoHeal = Value
    while AutoHeal do
        wait(0.01) 
        
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            humanoid.Health = humanoid.MaxHealth
        end
    end
end)

about:Button("汉化穿墙",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/OtherScript/main/Noclip"))()
end)

about:Button("踏空ui", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float', true))()
end)

about:Button("强制杀死玩家", function()
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character:BreakJoints()
    end
end)

about:Button("飞车", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/vb/main/%E9%A3%9E%E8%BD%A6.lua", true))()
end)

about:Button("旋转", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%97%8B%E8%BD%AC.lua", true))()
end)

about:Label("境头")

about:Button("第一人称", function()
    game.Players.LocalPlayer.CameraMaxZoomDistance = 0.5
    game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
    
    local function setFirstPerson()
        game.Players.LocalPlayer.CameraMaxZoomDistance = 0.5
        game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
    end
    
    setFirstPerson()
    
    game.Players.LocalPlayer.CharacterAdded:Connect(function()
        wait(1)
        setFirstPerson()
    end)
end)

about:Button("第三人称", function()
    game.Players.LocalPlayer.CameraMaxZoomDistance = 50
    game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
    
    local function setThirdPerson()
        game.Players.LocalPlayer.CameraMaxZoomDistance = 50
        game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
    end
    
    setThirdPerson()
    
    game.Players.LocalPlayer.CharacterAdded:Connect(function()
        wait(1)
        setThirdPerson()
    end)
end)

local about = UITab2:section("『工具』",true)

about:Button("点击传送", function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "LMPE脚本中心点击传送"
    tool.Activated:Connect(function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
        end
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
end)

about:Button("控制台",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/3345179204-sudo/-/refs/heads/main/%E6%8E%A7%E5%88%B6tai"))()
end)

about:Button("汉化dex",function()
loadstring(game:HttpGet("https://gitee.com/cmbhbh/cmbh/raw/master/Bex.lua"))()
end)

about:Button("工具挂", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua", true))()
end)

about:Button("iw指令", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()
end)

about:Button("电脑键盘", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

local about = UITab2:section("『光影』",true)

about:Button("普通光影", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("光影滤镜", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("超高画质",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

about:Button("光影V4",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)

about:Button("RTX高仿",function()
loadstring(game:HttpGet('https://pastebin.com/raw/Bkf0BJb3'))()
end)

about:Button("光影深", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
about:Button("光影浅", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

local about = UITab3:section("『LMPE-DOORS』",true)

about:Button("LMPE-LMPE脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LMPE1145/Loader/refs/heads/main/LMPE-DOORS.lua"))()
end)

about:Button("LMHUB脚本", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LMPE1145/Loader/refs/heads/main/LMHUB.lua"))()
end)

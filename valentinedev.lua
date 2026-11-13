-- =======================================================
-- 🔑🏎️ VALENTINE V1 - ULTIMATE HUB v9.5 (FULL COMBINED EDITION)
-- =======================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local LocalPlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")

local parentGui = (gethui and gethui()) or (syn and syn.protect_gui and CoreGui) or CoreGui or LocalPlayerGui

-- 🔗 ใส่ลิงก์ Raw ของไฟล์ keys.txt บน GitHub ของคุณบิลลี่ตรงนี้!
local KEY_LINK = "https://raw.githubusercontent.com/nmkiopkioo-sketch/rb/refs/heads/main/keys.txt"

--เคลียร์ GUI เก่าทั้งหมดก่อนรัน
if parentGui:FindFirstChild("RaycityKeyGui") then parentGui.RaycityKeyGui:Destroy() end
if parentGui:FindFirstChild("RaycitySpeedGui") then parentGui.RaycitySpeedGui:Destroy() end

-- =======================================================
-- 1. หน้าต่างระบบใส่ Key (Key System UI)
-- =======================================================
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "RaycityKeyGui"
KeyGui.ResetOnSpawn = false
KeyGui.DisplayOrder = 999999
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.Parent = parentGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 320, 0, 200)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -100)
KeyFrame.BackgroundColor3 = Color3.fromRGB(12, 15, 22)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Parent = KeyGui
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 14)

local KeyTopBar = Instance.new("Frame")
KeyTopBar.Size = UDim2.new(1, 0, 0, 36)
KeyTopBar.BackgroundColor3 = Color3.fromRGB(18, 23, 33)
KeyTopBar.Parent = KeyFrame
Instance.new("UICorner", KeyTopBar).CornerRadius = UDim.new(0, 14)

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, -20, 1, 0)
KeyTitle.Position = UDim2.new(0, 12, 0, 0)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "🔐 VALENTINE V1 - KEY SYSTEM"
KeyTitle.TextColor3 = Color3.fromRGB(0, 255, 170)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 11
KeyTitle.TextXAlignment = Enum.TextXAlignment.Left
KeyTitle.Parent = KeyTopBar

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -40, 0, 40)
KeyInput.Position = UDim2.new(0, 20, 0, 55)
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
KeyInput.PlaceholderText = "กรุณากรอก Key (เช่น VAL-XXXX-XXXX)..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderColor3 = Color3.fromRGB(120, 140, 170)
KeyInput.Font = Enum.Font.GothamMedium
KeyInput.TextSize = 11
KeyInput.Parent = KeyFrame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(1, -40, 0, 38)
SubmitBtn.Position = UDim2.new(0, 20, 0, 105)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 35)
SubmitBtn.Text = "🚀 ยืนยัน Key (Submit)"
SubmitBtn.TextColor3 = Color3.fromRGB(0, 255, 170)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 12
SubmitBtn.Parent = KeyFrame
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

local KeyStatus = Instance.new("TextLabel")
KeyStatus.Size = UDim2.new(1, -20, 0, 24)
KeyStatus.Position = UDim2.new(0, 10, 0, 155)
KeyStatus.BackgroundTransparency = 1
KeyStatus.Text = "สถานะ: กรุณากรอก Key เพื่อเข้าใช้งาน"
KeyStatus.TextColor3 = Color3.fromRGB(200, 215, 240)
KeyStatus.Font = Enum.Font.GothamBold
KeyStatus.TextSize = 10
KeyStatus.Parent = KeyFrame

-- ฟังก์ชันตรวจสอบ Key ผ่าน GitHub
local function verifyKey(enteredKey)
    local success, response = pcall(function()
        return game:HttpGet(KEY_LINK)
    end)
    
    if not success then
        KeyStatus.Text = "สถานะ: ไม่สามารถเชื่อมต่อฐานข้อมูล Key ได้!"
        return false
    end
    
    enteredKey = enteredKey:gsub("%s+", "")
    for line in response:gmatch("[^\r\n]+") do
        local keyPart, daysPart = line:match("^([^|]+)|(.+)$")
        if keyPart and keyPart == enteredKey then
            return true
        end
    end
    return false
end

SubmitBtn.MouseButton1Click:Connect(function()
    local userKey = KeyInput.Text
    if userKey == "" then
        KeyStatus.Text = "สถานะ: กรุณาใส่ Key ก่อนกดปุ่มยืนยัน!"
        return
    end
    
    SubmitBtn.Text = "กำลังตรวจสอบ..."
    task.wait(0.5)
    
    if verifyKey(userKey) then
        KeyStatus.Text = "สถานะ: Key ถูกต้อง! กำลังเปิดโปรแกรม..."
        task.wait(0.8)
        KeyGui:Destroy()
        
        -- =======================================================
        -- 2. ฟังก์ชันหลักของ VALENTINE V1 HUB (เปิดหลังผ่าน Key)
        -- =======================================================
        pcall(function()
            if setfflag then
                setfflag("AbuseReportScreenshotPercentage", "0")
                setfflag("HumanoidParallelizeRigging", "False")
            end
        end)

        local supremeAntiBanActive = true
        pcall(function()
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            local oldNamecall = mt.__namecall
            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod():lower()
                if supremeAntiBanActive and method == "kick" and self == LocalPlayer then
                    return nil
                end
                return oldNamecall(self, ...)
            end)
            setreadonly(mt, true)
        end)

        local config = {
            speedEnabled = false,
            ghostNpc = false,
            antiAfk = false,
            antiBanActive = true,
            autoQuestActive = false,
            vmaxKmh = 350,
            accelRate = 1.0
        }

        local stockValues = { vmax = 100, torqueBonus = 0, btPower = 2.6, btDuration = 3.5, btNeedSP = 50 }

        local townWaypoints = {
            { name = "🏙️ NAMSAN TOWN", pos = Vector3.new(-24231.0, 16.4, -4448.0), active = false, btnObj = nil },
            { name = "🎓 Hanyang University Town", pos = Vector3.new(-23469.0, 3.0, 163.5), active = false, btnObj = nil },
            { name = "🌃 Togkdong Town", pos = Vector3.new(-23239.5, -3.4, -9627.6), active = false, btnObj = nil },
            { name = "🏢 TOWN Coex", pos = Vector3.new(-23286.0, 1.0, -13211.0), active = false, btnObj = nil }
        }

        local npcWaypoints = {
            { name = "🎯 Lv.4 Derix", pos = Vector3.new(-1221.2, 41.8, -5311.7), active = false, btnObj = nil },
            { name = "🎯 Lv.15 ชิงกุกที่มาจากเมืองอื่น", pos = Vector3.new(3452.6, 32.7, -7126.0), active = false, btnObj = nil },
            { name = "🎯 Lv.18 Honduras is narcissistic", pos = Vector3.new(4891.4, 40.3, -2449.6), active = false, btnObj = nil },
            { name = "🎯 Lv.25 Sunyoung (แนะนำเป็นปาตี้)", pos = Vector3.new(6399.5, 51.1, 205.5), active = false, btnObj = nil },
            { name = "🎯 Lv.25 Zong yi, who is extremely angry", pos = Vector3.new(12879.8, 58.2, 5604.1), active = false, btnObj = nil },
            { name = "🎯 Lv.30 มโยซอน", pos = Vector3.new(6381.8, 41.5, 9193.0), active = false, btnObj = nil }
        }

        local recordedPath = {}
        local isRecording = false
        local isPlaying = false
        local totalLoops = 1
        local currentLoop = 0
        local playbackIndex = 1

        local renv = (getrenv and getrenv()) or nil
        local rShared = renv and renv.shared
        local rHooks = rShared and rShared.RCDrivePairHooks

        local function applyGhostMode(enable)
            pcall(function()
                LocalPlayer:SetAttribute("RaycityGM", true)
                LocalPlayer:SetAttribute("GmCheatOn", true)
                LocalPlayer:SetAttribute("GmCheatGhost", enable)
                if rHooks then
                    if enable then
                        rHooks.traffic = function() return nil end
                        rHooks.mov = function() return nil end
                    else
                        if renv and renv._origTrafficHook then rHooks.traffic = renv._origTrafficHook end
                        if renv and renv._origMovHook then rHooks.mov = renv._origMovHook end
                    end
                end
                local trafficCars = workspace:FindFirstChild("RBRCTrafficCars")
                if trafficCars then
                    for _, car in ipairs(trafficCars:GetChildren()) do
                        for _, part in ipairs(car:GetDescendants()) do
                            if part:IsA("BasePart") then part.CanCollide = not enable end
                        end
                    end
                end
            end)
        end

        local afkConn = nil
        local afkLoopActive = true
        if LocalPlayer.Idled then
            afkConn = LocalPlayer.Idled:Connect(function()
                if config.antiAfk then
                    pcall(function() VirtualUser:CaptureController() VirtualUser:ClickButton2(Vector2.new(100, 100)) end)
                end
            end)
        end

        task.spawn(function()
            while afkLoopActive do
                task.wait(60)
                if config.antiAfk then
                    pcall(function() VirtualUser:CaptureController() VirtualUser:ClickButton2(Vector2.new(50, 50)) end)
                else
                    task.wait(1)
                end
            end
        end)

        local activePhys = nil
        local function getPhysics()
            local car = workspace:FindFirstChild("MyCar")
            local root = car and (car:FindFirstChild("Root") or car:FindFirstChild("Hull"))
            if not root then return nil end
            local rootPos = root.Position
            if activePhys and activePhys.p and activePhys.cf then
                if (activePhys.cf.Position * 2 - rootPos).Magnitude < 8 then return activePhys end
            end
            if getgc then
                local success, gcTable = pcall(getgc, true)
                if success and type(gcTable) == "table" then
                    for _, v in pairs(gcTable) do
                        if type(v) == "table" and rawget(v, "wheels") and rawget(v, "p") and rawget(v, "cf") then
                            if (v.cf.Position * 2 - rootPos).Magnitude < 15 then
                                activePhys = v
                                if v.p then
                                    stockValues.vmax = v.p.vmax or 100
                                    stockValues.btPower = v.p.btPower or 2.6
                                end
                                return activePhys
                            end
                        end
                    end
                end
            end
            return nil
        end

        local function getCarRoot()
            local car = workspace:FindFirstChild("MyCar")
            if car then
                local root = car:FindFirstChild("Root") or car:FindFirstChild("Hull") or car:FindFirstChild("PrimaryPart") or car.PrimaryPart
                if not root then
                    for _, p in ipairs(car:GetDescendants()) do if p:IsA("BasePart") then return p end end
                else return root end
            end
            return nil
        end

        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "RaycitySpeedGui"
        ScreenGui.ResetOnSpawn = false
        ScreenGui.DisplayOrder = 999999
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ScreenGui.Parent = parentGui

        local FloatingPill = Instance.new("TextButton")
        FloatingPill.Name = "FloatingPill"
        FloatingPill.Size = UDim2.new(0, 140, 0, 40)
        FloatingPill.Position = UDim2.new(0.02, 0, 0.22, 0)
        FloatingPill.BackgroundColor3 = Color3.fromRGB(18, 22, 32)
        FloatingPill.Text = "⚡ VALENTINE V1"
        FloatingPill.TextColor3 = Color3.fromRGB(200, 210, 225)
        FloatingPill.Font = Enum.Font.GothamBold
        FloatingPill.TextSize = 12
        FloatingPill.Active = true
        FloatingPill.Parent = ScreenGui
        Instance.new("UICorner", FloatingPill).CornerRadius = UDim.new(0, 20)

        local MainFrame = Instance.new("Frame")
        MainFrame.Name = "MainFrame"
        MainFrame.Size = UDim2.new(0, 360, 0, 750)
        MainFrame.Position = UDim2.new(0.5, -180, 0.5, -375)
        MainFrame.BackgroundColor3 = Color3.fromRGB(12, 15, 22)
        MainFrame.BorderSizePixel = 0
        MainFrame.Active = true
        MainFrame.Parent = ScreenGui
        Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

        local TopBar = Instance.new("Frame")
        TopBar.Size = UDim2.new(1, 0, 0, 44)
        TopBar.BackgroundColor3 = Color3.fromRGB(18, 23, 33)
        TopBar.Parent = MainFrame
        Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 14)

        local TitleLabel = Instance.new("TextLabel")
        TitleLabel.Size = UDim2.new(1, -90, 1, 0)
        TitleLabel.Position = UDim2.new(0, 16, 0, 0)
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Text = "🏎️ VALENTINE V1 (ULTIMATE)"
        TitleLabel.TextColor3 = Color3.fromRGB(240, 245, 255)
        TitleLabel.Font = Enum.Font.GothamBold
        TitleLabel.TextSize = 12
        TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        TitleLabel.Parent = TopBar

        local MinBtn = Instance.new("TextButton")
        MinBtn.Size = UDim2.new(0, 32, 0, 32)
        MinBtn.Position = UDim2.new(1, -72, 0, 6)
        MinBtn.BackgroundColor3 = Color3.fromRGB(28, 36, 52)
        MinBtn.Text = "—"
        MinBtn.TextColor3 = Color3.fromRGB(200, 215, 235)
        MinBtn.Font = Enum.Font.GothamBold
        MinBtn.Parent = TopBar
        Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

        local CloseBtn = Instance.new("TextButton")
        CloseBtn.Size = UDim2.new(0, 32, 0, 32)
        CloseBtn.Position = UDim2.new(1, -36, 0, 6)
        CloseBtn.BackgroundColor3 = Color3.fromRGB(70, 22, 30)
        CloseBtn.Text = "X"
        CloseBtn.TextColor3 = Color3.fromRGB(255, 120, 130)
        CloseBtn.Font = Enum.Font.GothamBold
        CloseBtn.TextSize = 14
        CloseBtn.Parent = TopBar
        Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

        local Container = Instance.new("ScrollingFrame")
        Container.Size = UDim2.new(1, -16, 1, -54)
        Container.Position = UDim2.new(0, 8, 0, 48)
        Container.BackgroundTransparency = 1
        Container.CanvasSize = UDim2.new(0, 0, 0, 1350)
        Container.ScrollBarThickness = 4
        Container.Parent = MainFrame

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 6)
        UIListLayout.Parent = Container

        local MasterBtn = Instance.new("TextButton")
        MasterBtn.LayoutOrder = 1
        MasterBtn.Size = UDim2.new(1, 0, 0, 36)
        MasterBtn.Font = Enum.Font.GothamBold
        MasterBtn.TextSize = 12
        MasterBtn.Parent = Container
        Instance.new("UICorner", MasterBtn).CornerRadius = UDim.new(0, 8)

        local GhostBtn = Instance.new("TextButton")
        GhostBtn.LayoutOrder = 2
        GhostBtn.Size = UDim2.new(1, 0, 0, 36)
        GhostBtn.Font = Enum.Font.GothamBold
        GhostBtn.TextSize = 12
        GhostBtn.Parent = Container
        Instance.new("UICorner", GhostBtn).CornerRadius = UDim.new(0, 8)

        local AfkBtn = Instance.new("TextButton")
        AfkBtn.LayoutOrder = 3
        AfkBtn.Size = UDim2.new(1, 0, 0, 32)
        AfkBtn.Font = Enum.Font.GothamBold
        AfkBtn.TextSize = 11
        AfkBtn.Parent = Container
        Instance.new("UICorner", AfkBtn).CornerRadius = UDim.new(0, 8)

        local AutoQuestBtn = Instance.new("TextButton")
        AutoQuestBtn.LayoutOrder = 4
        AutoQuestBtn.Size = UDim2.new(1, 0, 0, 34)
        AutoQuestBtn.Font = Enum.Font.GothamBold
        AutoQuestBtn.TextSize = 11
        AutoQuestBtn.Parent = Container
        Instance.new("UICorner", AutoQuestBtn).CornerRadius = UDim.new(0, 8)

        local AntiBanBtn = Instance.new("TextButton")
        AntiBanBtn.LayoutOrder = 5
        AntiBanBtn.Size = UDim2.new(1, 0, 0, 32)
        AntiBanBtn.Font = Enum.Font.GothamBold
        AntiBanBtn.TextSize = 11
        AntiBanBtn.Parent = Container
        Instance.new("UICorner", AntiBanBtn).CornerRadius = UDim.new(0, 8)

        local SpeedSec = Instance.new("Frame")
        SpeedSec.LayoutOrder = 6
        SpeedSec.Size = UDim2.new(1, 0, 0, 102)
        SpeedSec.BackgroundColor3 = Color3.fromRGB(16, 20, 28)
        SpeedSec.Parent = Container
        Instance.new("UICorner", SpeedSec).CornerRadius = UDim.new(0, 8)

        local SpeedLabel = Instance.new("TextLabel")
        SpeedLabel.Size = UDim2.new(1, -16, 0, 20)
        SpeedLabel.Position = UDim2.new(0, 8, 0, 2)
        SpeedLabel.BackgroundTransparency = 1
        SpeedLabel.Text = "🏁 ความเร็วสูงสุด (VMAX): 350 km/h"
        SpeedLabel.TextColor3 = Color3.fromRGB(225, 235, 250)
        SpeedLabel.Font = Enum.Font.GothamBold
        SpeedLabel.TextSize = 11
        SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
        SpeedLabel.Parent = SpeedSec

        local SliderBg = Instance.new("Frame")
        SliderBg.Size = UDim2.new(1, -20, 0, 6)
        SliderBg.Position = UDim2.new(0, 10, 0, 52)
        SliderBg.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
        SliderBg.BorderSizePixel = 0
        SliderBg.Parent = SpeedSec
        Instance.new("UICorner", SliderBg).CornerRadius = UDim.new(1, 0)

        local SliderFill = Instance.new("Frame")
        SliderFill.Size = UDim2.new((350 - 100) / (1200 - 100), 0, 1, 0)
        SliderFill.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
        SliderFill.BorderSizePixel = 0
        SliderFill.Parent = SliderBg
        Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)

        local minVmax, maxVmax = 100, 1200
        local draggingSlider = false

        local function applyVmax(val)
            config.vmaxKmh = math.clamp(val, minVmax, maxVmax)
            SpeedLabel.Text = string.format("🏁 ความเร็วสูงสุด (VMAX): %d km/h", config.vmaxKmh)
            local posRel = (config.vmaxKmh - minVmax) / (maxVmax - minVmax)
            SliderFill.Size = UDim2.new(posRel, 0, 1, 0)
        end

        local function updateSliderByInput(input)
            local posRel = math.clamp((input.Position.X - SliderBg.AbsolutePosition.X) / SliderBg.AbsoluteSize.X, 0, 1)
            local calculatedVal = math.floor(minVmax + (maxVmax - minVmax) * posRel)
            applyVmax(calculatedVal)
        end

        SliderBg.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingSlider = true
                updateSliderByInput(input)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                draggingSlider = false
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                updateSliderByInput(input)
            end
        end)

        local speedPresets = { { "350", 350 }, { "600", 600 }, { "800", 800 }, { "1200", 1200 } }
        for i, p in ipairs(speedPresets) do
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(0.23, -4, 0, 22)
            b.Position = UDim2.new((i - 1) * 0.25 + 0.02, 0, 0, 23)
            b.BackgroundColor3 = Color3.fromRGB(25, 32, 46)
            b.Text = p[1] .. "k"
            b.TextColor3 = Color3.fromRGB(215, 230, 250)
            b.Font = Enum.Font.GothamMedium
            b.TextSize = 10
            b.Parent = SpeedSec
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
            b.MouseButton1Click:Connect(function() applyVmax(p[2]) end)
        end

        local TuneMinus = Instance.new("TextButton")
        TuneMinus.Size = UDim2.new(0.48, -4, 0, 20)
        TuneMinus.Position = UDim2.new(0, 8, 0, 72)
        TuneMinus.BackgroundColor3 = Color3.fromRGB(22, 28, 40)
        TuneMinus.Text = "- 50 km/h"
        TuneMinus.TextColor3 = Color3.fromRGB(180, 200, 225)
        TuneMinus.Font = Enum.Font.Gotham
        TuneMinus.TextSize = 10
        TuneMinus.Parent = SpeedSec
        Instance.new("UICorner", TuneMinus).CornerRadius = UDim.new(0, 4)
        TuneMinus.MouseButton1Click:Connect(function() applyVmax(config.vmaxKmh - 50) end)

        local TunePlus = Instance.new("TextButton")
        TunePlus.Size = UDim2.new(0.48, -4, 0, 20)
        TunePlus.Position = UDim2.new(0.5, 2, 0, 72)
        TunePlus.BackgroundColor3 = Color3.fromRGB(22, 28, 40)
        TunePlus.Text = "+ 50 km/h"
        TunePlus.TextColor3 = Color3.fromRGB(180, 200, 225)
        TunePlus.Font = Enum.Font.Gotham
        TunePlus.TextSize = 10
        TunePlus.Parent = SpeedSec
        Instance.new("UICorner", TunePlus).CornerRadius = UDim.new(0, 4)
        TunePlus.MouseButton1Click:Connect(function() applyVmax(config.vmaxKmh + 50) end)

        -- Accel Section
        local AccelSec = Instance.new("Frame")
        AccelSec.LayoutOrder = 7
        AccelSec.Size = UDim2.new(1, 0, 0, 74)
        AccelSec.BackgroundColor3 = Color3.fromRGB(16, 20, 28)
        AccelSec.Parent = Container
        Instance.new("UICorner", AccelSec).CornerRadius = UDim.new(0, 8)

        local AccelLabel = Instance.new("TextLabel")
        AccelLabel.Size = UDim2.new(1, -16, 0, 20)
        AccelLabel.Position = UDim2.new(0, 8, 0, 2)
        AccelLabel.BackgroundTransparency = 1
        AccelLabel.Text = "🚀 อัตราเร่งกระชาก: x1.0 (ปกติ)"
        AccelLabel.TextColor3 = Color3.fromRGB(225, 235, 250)
        AccelLabel.Font = Enum.Font.GothamBold
        AccelLabel.TextSize = 11
        AccelLabel.TextXAlignment = Enum.TextXAlignment.Left
        AccelLabel.Parent = AccelSec

        local accelPresets = { { "x0.5", 0.5 }, { "x1.0", 1.0 }, { "x1.5", 1.5 }, { "x3.5", 3.5 }, { "x6.0", 6.0 }, { "x12.0", 12.0 } }
        for i, a in ipairs(accelPresets) do
            local row = math.floor((i - 1) / 3)
            local col = (i - 1) % 3
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(0.31, -4, 0, 20)
            b.Position = UDim2.new(col * 0.33 + 0.02, 0, 0, 23 + row * 22)
            b.BackgroundColor3 = Color3.fromRGB(25, 32, 46)
            b.Text = a[1]
            b.TextColor3 = Color3.fromRGB(215, 230, 250)
            b.Font = Enum.Font.GothamMedium
            b.TextSize = 10
            b.Parent = AccelSec
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
            b.MouseButton1Click:Connect(function()
                config.accelRate = a[2]
                AccelLabel.Text = string.format("🚀 อัตราเร่งกระชาก: %s", a[1])
            end)
        end

        local StatusBox = Instance.new("Frame")
        StatusBox.LayoutOrder = 8
        StatusBox.Size = UDim2.new(1, 0, 0, 36)
        StatusBox.BackgroundColor3 = Color3.fromRGB(8, 10, 15)
        StatusBox.Parent = Container
        Instance.new("UICorner", StatusBox).CornerRadius = UDim.new(0, 8)

        local StatusLabel = Instance.new("TextLabel")
        StatusLabel.Size = UDim2.new(1, -12, 1, 0)
        StatusLabel.Position = UDim2.new(0, 6, 0, 0)
        StatusLabel.BackgroundTransparency = 1
        StatusLabel.Text = "ความเร็ว: 0 km/h | เกียร์: 0"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        StatusLabel.Font = Enum.Font.GothamBold
        StatusLabel.TextSize = 12
        StatusLabel.Parent = StatusBox

        -- Town Teleports
        local TownHeader = Instance.new("TextLabel")
        TownHeader.LayoutOrder = 9
        TownHeader.Size = UDim2.new(1, 0, 0, 20)
        TownHeader.BackgroundTransparency = 1
        TownHeader.Text = "📍 ระบบวาร์ปข้ามเมือง (Town Teleport)"
        TownHeader.TextColor3 = Color3.fromRGB(200, 215, 240)
        TownHeader.Font = Enum.Font.GothamBold
        TownHeader.TextSize = 11
        TownHeader.TextXAlignment = Enum.TextXAlignment.Left
        TownHeader.Parent = Container

        for idx, town in ipairs(townWaypoints) do
            local townBtn = Instance.new("TextButton")
            townBtn.LayoutOrder = 9 + idx
            townBtn.Size = UDim2.new(1, 0, 0, 34)
            townBtn.BackgroundColor3 = Color3.fromRGB(24, 30, 42)
            townBtn.Text = town.name
            townBtn.TextColor3 = Color3.fromRGB(180, 195, 220)
            townBtn.Font = Enum.Font.GothamBold
            townBtn.TextSize = 11
            townBtn.Parent = Container
            Instance.new("UICorner", townBtn).CornerRadius = UDim.new(0, 8)
            town.btnObj = townBtn

            townBtn.MouseButton1Click:Connect(function()
                local root = getCarRoot()
                if root then
                    root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    root.CFrame = CFrame.new(town.pos)
                    town.active = true
                    townBtn.BackgroundColor3 = Color3.fromRGB(20, 90, 140)
                end
            end)
        end

        -- NPC Teleports
        local NpcHeader = Instance.new("TextLabel")
        NpcHeader.LayoutOrder = 14
        NpcHeader.Size = UDim2.new(1, 0, 0, 20)
        NpcHeader.BackgroundTransparency = 1
        NpcHeader.Text = "🎯 ระบบวาร์ปหา NPC & Boss"
        NpcHeader.TextColor3 = Color3.fromRGB(0, 255, 170)
        NpcHeader.Font = Enum.Font.GothamBold
        NpcHeader.TextSize = 11
        NpcHeader.TextXAlignment = Enum.TextXAlignment.Left
        NpcHeader.Parent = Container

        for idx, npc in ipairs(npcWaypoints) do
            local npcBtn = Instance.new("TextButton")
            npcBtn.LayoutOrder = 14 + idx
            npcBtn.Size = UDim2.new(1, 0, 0, 38)
            npcBtn.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
            npcBtn.Text = npc.name
            npcBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            npcBtn.Font = Enum.Font.GothamBold
            npcBtn.TextSize = 10
            npcBtn.TextWrapped = true
            npcBtn.Parent = Container
            Instance.new("UICorner", npcBtn).CornerRadius = UDim.new(0, 8)
            npc.btnObj = npcBtn

            npcBtn.MouseButton1Click:Connect(function()
                local root = getCarRoot()
                if root then
                    root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    root.CFrame = CFrame.new(npc.pos)
                    npc.active = true
                    npcBtn.BackgroundColor3 = Color3.fromRGB(20, 90, 140)
                end
            end)
        end

        -- Macro Replay Header & Controls
        local ReplayHeader = Instance.new("TextLabel")
        ReplayHeader.LayoutOrder = 21
        ReplayHeader.Size = UDim2.new(1, 0, 0, 20)
        ReplayHeader.BackgroundTransparency = 1
        ReplayHeader.Text = "📼 ระบบรีเพย์เส้นทางเควสต์ (Macro Replay)"
        ReplayHeader.TextColor3 = Color3.fromRGB(255, 200, 100)
        ReplayHeader.Font = Enum.Font.GothamBold
        ReplayHeader.TextSize = 11
        ReplayHeader.TextXAlignment = Enum.TextXAlignment.Left
        ReplayHeader.Parent = Container

        local LoopSec = Instance.new("Frame")
        LoopSec.LayoutOrder = 22
        LoopSec.Size = UDim2.new(1, 0, 0, 36)
        LoopSec.BackgroundColor3 = Color3.fromRGB(16, 20, 28)
        LoopSec.Parent = Container
        Instance.new("UICorner", LoopSec).CornerRadius = UDim.new(0, 8)

        local LoopLabel = Instance.new("TextLabel")
        LoopLabel.Size = UDim2.new(0.6, 0, 1, 0)
        LoopLabel.Position = UDim2.new(0, 10, 0, 0)
        LoopLabel.BackgroundTransparency = 1
        LoopLabel.Text = "🔄 จำนวนรอบที่ต้องการทำ:"
        LoopLabel.TextColor3 = Color3.fromRGB(225, 235, 250)
        LoopLabel.Font = Enum.Font.GothamBold
        LoopLabel.TextSize = 10
        LoopLabel.TextXAlignment = Enum.TextXAlignment.Left
        LoopLabel.Parent = LoopSec

        local LoopInput = Instance.new("TextBox")
        LoopInput.Size = UDim2.new(0, 70, 0, 24)
        LoopInput.Position = UDim2.new(1, -80, 0.5, -12)
        LoopInput.BackgroundColor3 = Color3.fromRGB(25, 32, 46)
        LoopInput.Text = "1"
        LoopInput.TextColor3 = Color3.fromRGB(0, 255, 170)
        LoopInput.Font = Enum.Font.GothamBold
        LoopInput.TextSize = 11
        LoopInput.Parent = LoopSec
        Instance.new("UICorner", LoopInput).CornerRadius = UDim.new(0, 6)

        LoopInput.FocusLost:Connect(function()
            local val = tonumber(LoopInput.Text)
            if val and val > 0 then totalLoops = math.floor(val) else totalLoops = 1 LoopInput.Text = "1" end
        end)

        local ReplayPlayBtn = Instance.new("TextButton")
        ReplayPlayBtn.LayoutOrder = 23
        ReplayPlayBtn.Size = UDim2.new(1, 0, 0, 36)
        ReplayPlayBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 35)
        ReplayPlayBtn.Text = "▶️ เริ่มทำงาน (Play Replay Loop)"
        ReplayPlayBtn.TextColor3 = Color3.fromRGB(0, 255, 170)
        ReplayPlayBtn.Font = Enum.Font.GothamBold
        ReplayPlayBtn.TextSize = 11
        ReplayPlayBtn.Parent = Container
        Instance.new("UICorner", ReplayPlayBtn).CornerRadius = UDim.new(0, 8)

        local ReplayRecBtn = Instance.new("TextButton")
        ReplayRecBtn.LayoutOrder = 24
        ReplayRecBtn.Size = UDim2.new(1, 0, 0, 36)
        ReplayRecBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 25)
        ReplayRecBtn.Text = "🔴 บันทึกเส้นทาง (Record)"
        ReplayRecBtn.TextColor3 = Color3.fromRGB(255, 120, 130)
        ReplayRecBtn.Font = Enum.Font.GothamBold
        ReplayRecBtn.TextSize = 11
        ReplayRecBtn.Parent = Container
        Instance.new("UICorner", ReplayRecBtn).CornerRadius = UDim.new(0, 8)

        local ReplayResetBtn = Instance.new("TextButton")
        ReplayResetBtn.LayoutOrder = 25
        ReplayResetBtn.Size = UDim2.new(1, 0, 0, 36)
        ReplayResetBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        ReplayResetBtn.Text = "❌ รีเซ็ตข้อมูล (Reset)"
        ReplayResetBtn.TextColor3 = Color3.fromRGB(200, 200, 215)
        ReplayResetBtn.Font = Enum.Font.GothamBold
        ReplayResetBtn.TextSize = 11
        ReplayResetBtn.Parent = Container
        Instance.new("UICorner", ReplayResetBtn).CornerRadius = UDim.new(0, 8)

        local ReplayStatus = Instance.new("TextLabel")
        ReplayStatus.LayoutOrder = 26
        ReplayStatus.Size = UDim2.new(1, 0, 0, 26)
        ReplayStatus.BackgroundTransparency = 1
        ReplayStatus.Text = "สถานะ: พร้อมใช้งาน (IDLE)"
        ReplayStatus.TextColor3 = Color3.fromRGB(200, 215, 240)
        ReplayStatus.Font = Enum.Font.GothamBold
        ReplayStatus.TextSize = 10
        ReplayStatus.Parent = Container

        local CreditLabel = Instance.new("TextLabel")
        CreditLabel.LayoutOrder = 27
        CreditLabel.Size = UDim2.new(1, 0, 0, 32)
        CreditLabel.BackgroundTransparency = 1
        CreditLabel.Text = "By : Billy\nDiscord: https://discord.gg/XgwRMhg7hB"
        CreditLabel.TextColor3 = Color3.fromRGB(140, 160, 190)
        CreditLabel.Font = Enum.Font.GothamMedium
        CreditLabel.TextSize = 10
        CreditLabel.Parent = Container

        -- Replay Loop logic
        RunService.Heartbeat:Connect(function()
            if isRecording then
                local root = getCarRoot()
                if root then
                    table.insert(recordedPath, { cf = root.CFrame, vel = root.AssemblyLinearVelocity })
                    ReplayStatus.Text = string.format("กำลังบันทึก... (เฟรม: %d)", #recordedPath)
                end
            end
        end)

        ReplayRecBtn.MouseButton1Click:Connect(function()
            if isPlaying then return end
            isRecording = not isRecording
            if isRecording then
                recordedPath = {}
                playbackIndex = 1
                ReplayRecBtn.Text = "⏹️ หยุดบันทึก (Stop Recording)"
                ReplayRecBtn.BackgroundColor3 = Color3.fromRGB(70, 22, 30)
                ReplayStatus.Text = "สถานะ: กำลังอัดเส้นทางเควสต์..."
            else
                ReplayRecBtn.Text = "🔴 บันทึกเส้นทาง (Record)"
                ReplayRecBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 25)
                ReplayStatus.Text = string.format("สถานะ: บันทึกสำเร็จ (%d เฟรม)", #recordedPath)
            end
        end)

        ReplayPlayBtn.MouseButton1Click:Connect(function()
            if isRecording then return end
            if isPlaying then
                isPlaying = false
                ReplayPlayBtn.Text = "▶️ เริ่มทำงาน (Play Replay Loop)"
                ReplayPlayBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 35)
            else
                if #recordedPath == 0 then ReplayStatus.Text = "สถานะ: ยังไม่มีข้อมูลเส้นทาง!" return end
                isPlaying = true
                ReplayPlayBtn.Text = "⏸️ หยุดการทำงาน (Stop Loop)"
                ReplayPlayBtn.BackgroundColor3 = Color3.fromRGB(70, 45, 15)

                task.spawn(function()
                    if currentLoop == 0 then currentLoop = 1 playbackIndex = 1 end
                    while isPlaying and currentLoop <= totalLoops do
                        ReplayStatus.Text = string.format("สถานะ: กำลังทำรอบ [%d/%d] (เฟรม %d/%d)", currentLoop, totalLoops, playbackIndex, #recordedPath)
                        local root = getCarRoot()
                        if root then
                            while isPlaying and playbackIndex <= #recordedPath do
                                local data = recordedPath[playbackIndex]
                                root.AssemblyLinearVelocity = data.vel
                                root.CFrame = data.cf
                                playbackIndex = playbackIndex + 1
                                RunService.Heartbeat:Wait()
                            end
                        end
                        if playbackIndex > #recordedPath then
                            currentLoop = currentLoop + 1
                            if currentLoop <= totalLoops then
                                playbackIndex = 1
                                for i = 3, 1, -1 do
                                    if not isPlaying then break end
                                    ReplayStatus.Text = string.format("สถานะ: จบรอบ พักรอเริ่มรอบใหม่ใน %d วินาที...", i)
                                    task.wait(1)
                                end
                            else
                                break
                            end
                        end
                    end
                    isPlaying = false
                    ReplayPlayBtn.Text = "▶️ เริ่มทำงาน (Play Replay Loop)"
                    ReplayPlayBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 35)
                    if currentLoop > totalLoops then
                        ReplayStatus.Text = string.format("สถานะ: ทำครบ %d รอบเรียบร้อย!", totalLoops)
                        currentLoop = 0
                        playbackIndex = 1
                    end
                end)
            end
        end)

        ReplayResetBtn.MouseButton1Click:Connect(function()
            isRecording = false isPlaying = false recordedPath = {} currentLoop = 0 playbackIndex = 1
            LoopInput.Text = "1" totalLoops = 1
            ReplayRecBtn.Text = "🔴 บันทึกเส้นทาง (Record)" ReplayRecBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 25)
            ReplayPlayBtn.Text = "▶️ เริ่มทำงาน (Play Replay Loop)" ReplayPlayBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 35)
            ReplayStatus.Text = "สถานะ: รีเซ็ตข้อมูลทั้งหมดแล้ว!"
        end)

        local function updateUI()
            MasterBtn.Text = config.speedEnabled and "⚡ สปีดแฮก: เปิด (ON)" or "⚡ สปีดแฮก: ปิด (OFF)"
            MasterBtn.TextColor3 = config.speedEnabled and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(160, 175, 200)
            MasterBtn.BackgroundColor3 = config.speedEnabled and Color3.fromRGB(15, 42, 32) or Color3.fromRGB(24, 30, 42)

            GhostBtn.Text = config.ghostNpc and "👻 ทะลุรถ: เปิด (ON)" or "👻 ทะลุรถ: ปิด (OFF)"
            GhostBtn.TextColor3 = config.ghostNpc and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(160, 175, 200)
            GhostBtn.BackgroundColor3 = config.ghostNpc and Color3.fromRGB(15, 42, 32) or Color3.fromRGB(24, 30, 42)

            AfkBtn.Text = config.antiAfk and "🛡️ กันหลุด: เปิด (ON)" or "🛡️ กันหลุด: ปิด (OFF)"
            AfkBtn.TextColor3 = config.antiAfk and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(160, 175, 200)
            AfkBtn.BackgroundColor3 = config.antiAfk and Color3.fromRGB(15, 42, 32) or Color3.fromRGB(24, 30, 42)

            AutoQuestBtn.Text = config.autoQuestActive and "🎯 ออโต้รับเควสต์ (Enter): เปิด (ON)" or "🎯 ออโต้รับเควสต์ (Enter): ปิด (OFF)"
            AutoQuestBtn.TextColor3 = config.autoQuestActive and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(160, 175, 200)
            AutoQuestBtn.BackgroundColor3 = config.autoQuestActive and Color3.fromRGB(15, 42, 32) or Color3.fromRGB(24, 30, 42)

            AntiBanBtn.Text = config.antiBanActive and "🛡️ ป้องกันแอดมิน & แบน (Supreme): เปิด (ON)" or "🛡️ ป้องกันแอดมิน & แบน (Supreme): ปิด (OFF)"
            AntiBanBtn.TextColor3 = config.antiBanActive and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(160, 175, 200)
            AntiBanBtn.BackgroundColor3 = config.antiBanActive and Color3.fromRGB(15, 42, 32) or Color3.fromRGB(24, 30, 42)
        end

        MasterBtn.MouseButton1Click:Connect(function() config.speedEnabled = not config.speedEnabled updateUI() end)
        GhostBtn.MouseButton1Click:Connect(function() config.ghostNpc = not config.ghostNpc applyGhostMode(config.ghostNpc) updateUI() end)
        AfkBtn.MouseButton1Click:Connect(function() config.antiAfk = not config.antiAfk updateUI() end)
        AutoQuestBtn.MouseButton1Click:Connect(function() config.autoQuestActive = not config.autoQuestActive updateUI() end)
        AntiBanBtn.MouseButton1Click:Connect(function()
            config.antiBanActive = not config.antiBanActive
            supremeAntiBanActive = config.antiBanActive
            updateUI()
        end)

        -- ลูปออโต้เควสต์ (กด Enter)
        task.spawn(function()
            while true do
                if config.autoQuestActive then
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.15)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        task.wait(0.8)
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.15)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end)
                    task.wait(1.5)
                else
                    task.wait(0.4)
                end
            end
        end)

        local function makeDraggable(handle, target)
            local dragging, dragStart, startPos
            handle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true dragStart = input.Position startPos = target.Position
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local delta = input.Position - dragStart
                    target.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end)
        end
        makeDraggable(TopBar, MainFrame)
        makeDraggable(FloatingPill, FloatingPill)

        local isVisible = true
        MinBtn.MouseButton1Click:Connect(function() isVisible = not isVisible MainFrame.Visible = isVisible end)
        FloatingPill.MouseButton1Click:Connect(function() isVisible = not isVisible MainFrame.Visible = isVisible end)

        CloseBtn.MouseButton1Click:Connect(function()
            afkLoopActive = false
            if afkConn then afkConn:Disconnect() end
            applyGhostMode(false)
            if ScreenGui then ScreenGui:Destroy() end
        end)

        RunService.Heartbeat:Connect(function(dt)
            if not ScreenGui or not ScreenGui.Parent then return end
            if config.ghostNpc then applyGhostMode(true) end

            local phys = getPhysics()
            local root = getCarRoot()
            if not phys or not phys.p or not root then
                StatusLabel.Text = "กำลังรอข้อมูลรถ... (กรุณาขึ้นขับรถ)"
                return
            end

            local currentKmh = phys.v and (phys.v.Magnitude * 3.6) or 0
            if config.speedEnabled then
                phys.p.vmax = config.vmaxKmh / 3.6
                phys.torqueBonus = 500
                phys.p.btPower = 8.0

                local isAccelerating = (phys.throttle and phys.throttle > 0) or UserInputService:IsKeyDown(Enum.KeyCode.W)
                local isBraking = (phys.brake and phys.brake > 0) or UserInputService:IsKeyDown(Enum.KeyCode.S)

                if isAccelerating and not isBraking and currentKmh < config.vmaxKmh then
                    phys.v = phys.v + root.CFrame.LookVector * (config.accelRate * 25.0) * dt
                    root.AssemblyLinearVelocity = phys.v * 2
                end
            else
                if phys.p.vmax ~= stockValues.vmax then
                    phys.p.vmax = stockValues.vmax
                    phys.torqueBonus = 0
                    phys.p.btPower = stockValues.btPower
                end
            end
            StatusLabel.Text = string.format("ความเร็ว: %d km/h | เกียร์: %s", math.floor(currentKmh), tostring(phys.gear or 0))
        end)

        applyVmax(config.vmaxKmh)
        updateUI()
        print("[Valentine V1] Ultimate Hub Loaded Successfully By : Billy!")
    else
        KeyStatus.Text = "สถานะ: Key ไม่ถูกต้อง หรือหมดอายุแล้ว!"
        SubmitBtn.Text = "🚀 ยืนยัน Key (Submit)"
    end
end)

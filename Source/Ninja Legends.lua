local LoadingTime;
local env = (getgenv or getfenv or getrenv)() or shared
if getgenv().AuthTime ~= nil then LoadingTime = getgenv().AuthTime else LoadingTime = tick() end
local function run(func) func() end
run(function()if env.Shion_Loaded and not env.Shion_Debug then return end end) -- If you're developer then, Remove this line.
run(function()repeat wait()until game:IsLoaded()repeat wait()until game.Players;repeat wait()until game.Players.LocalPlayer;repeat wait()until game:GetService("ReplicatedStorage")repeat wait()until game:GetService("Players")repeat wait()until game:GetService("Players").LocalPlayer:FindFirstChildWhichIsA("PlayerGui")end)
run(function() pcall(function() env.Shion_Loaded = true end) end)

-- cloneref support for shitty versions of it
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/CloneRef.lua", true))();

local cloneref = cloneref or function(...) return ... end

--// GetService , Variables
local Workspace = cloneref(game:GetService("Workspace"))
local workspace = Workspace
local Players = cloneref(game:GetService("Players"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local PlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
local RunService = cloneref(game:GetService("RunService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local TweenService = cloneref(game:GetService("TweenService"))
local MarketplaceService = cloneref(game:GetService("MarketplaceService"))

local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
local getMouse = Players.LocalPlayer:GetMouse()

local MainThread = loadstring(game:HttpGet("https://github.com/Pri4c1lla/roblox-projects/raw/main/Assets/ThreadLooper.lua"))()
env.CreateThered = MainThread.new()

local NotificationLoad = loadstring(game:HttpGet(('https://raw.githubusercontent.com/treeofplant/Notif/main/library.lua'),true))()

--// local
local lp = Players.LocalPlayer
local LocalPlayer = game.Players.LocalPlayer
local rs = ReplicatedStorage
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())
local executor_used = tostring(identifyexecutor()) -- random

local GameInfo = MarketplaceService:GetProductInfo(game.PlaceId)

-- random string
local charset = {}

run(function()
    for i = 48,  57 do table.insert(charset, string.char(i)) end;
    for i = 65,  90 do table.insert(charset, string.char(i)) end;
    for i = 97, 122 do table.insert(charset, string.char(i)) end;
end)

--// RandomCharacters(math.random(...)) << to use this func
local function RandomCharacters(length)
    if length > 0 then
        return RandomCharacters(length - 1) .. charset[math.random(1, #charset)]
    else
        return ""
    end
end

local MinimizeKey = env.MinimizeKey or env.MinimizeKey

env.Mizekey = {
    ["MinimizeKey"] = MinimizeKey or Enum.KeyCode.RightShift
}

--[[
shared.Theme = {
    Table = {
        "Dark",
        "Light",
        "Darker",
        "Rose",
        "Aqua",
        "Amethyst"
    }
}
--math.random(1, #shared.Theme.Table)
]]

env.SettingUi = {}; env.SettingUi = {
    ["TabWidth"] = 160,
    ["Size"] = { 580, 460 },
    ["Theme"] = "Darker",
    ["Acrylic"] = true,
    ["Transparency"] = true,
    ["MinimizeKey"] = env.Mizekey.MinimizeKey,
}

local function getchar()
    return Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
end

local function HumanoidRootPart()
    return getchar():FindFirstChild("HumanoidRootPart",3)
end

local function FireTouchPart(Part: BasePart)
	local TouchTransmitter = Part:FindFirstChildOfClass("TouchTransmitter")
	if not TouchTransmitter then return end

	local Root = HumanoidRootPart()

    if firetouchinterest
    then
        firetouchinterest(Root, Part, 0)
        task.wait()
        firetouchinterest(Root, Part, 1)
    else
        return print("something is error with firetouchinterest(function)")
    end
end

local function IsAlive()
    if LocalPlayer.Character.Humanoid.Health > 0 and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return true
    else
        return false
    end
end

-- Noclip Stuff and Flight func
local noclipDefaults = {}
local movers = {}

local Fluent = nil
run(function()
    local Success, Result = pcall(function()
        return game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua", true)
    end)
    if Success and typeof(Result) == "string" and string.find(Result, "dawid") then
        Fluent = env.loadstring(Result)()
    else
        return
    end
end)

-- Setting function
local Script = {
    Main = {
        ["swing"] = false,
        ["SellPart"] = {},
        ["typeSell"] = {},
        ["typeshop"] = {},
        ["Sell"] = false,
        ["belts"] = false,
        ["sword"] = false,
        ["shurikens"] = false,
        ["skills"] = false,
        ["Wheel"] = false,
        ["Chi"] = false,
        ["Hoops"] = false,
        ["Chest"] = false,
        ["Ranks"] = false
    },
    Players = {
        ["flight"] = false,
        ["flightmb"] = false,
        ["IsSpectator"] = false,
        ["SelectPlayers"] = {},
        ["FlySpeed"] = {},
        ["TeleportPlayers"] = false,
        ["SpectatePlayers"] = false,
        ["WalkSpeedsave"] = {},
        ["WalkSpeed"] = 30,
        ["JumpValue"] = 50,
        ["JumpToggle"] = false,
        ["Noclip"] = false
    },
    Boss = {
        ["SelectBoss"] = {},
        ["InstantBoss"] = false,
        ["InstantAllBoss"] = false
    },
    Eggs = {
        ["SelectTeleport"] = {},
        ["SelectOpenEggs"] = {},
        ["open"] = false,
        ["autoEvolvePets"] = false,
        ["TypeOfSell"] = false,
        ["SelectToSell"] = false
    },
    Teleports = {
        ["SelectIslands"] = {},
        ["TypeKarma"] = {},
        ["SelectArea"] = {},
    },
    Misc = {
        ["RangeRadius"] = {},
        ["Fastshurikens"] = false,
        ["KillAura"] = false
    },
}

--// for specific game
env._trash_table = {
    ["Stuff"] = {
        ["Shop"] = {},
        ["Island"] = {},
        ["Crystal"] = {},
        ["SellArea"] = {},
        ["Boss"] = {},
        ["Ranks"] = {},
        ["PetsFolder"] = {}
    },
    ["Character"] = {
        ["Velocity"] = RandomCharacters(math.random(16,32))
    }
}

--// insert table
run(function()
    local suc , fail = pcall(function()

        for i,v in pairs(workspace:WaitForChild("islandUnlockParts"):GetChildren()) do
            table.insert(env._trash_table.Stuff.Island, v.Name)
        end

        for i,v in pairs(workspace:WaitForChild("mapCrystalsFolder"):GetChildren()) do
            table.insert(env._trash_table.Stuff.Crystal, v.Name)
        end

        for i,v in pairs(workspace:WaitForChild("sellAreaCircles"):GetChildren()) do
            table.insert(env._trash_table.Stuff.SellArea, v.Name)
        end

        for i,v in pairs(workspace:WaitForChild("shopAreaCircles"):GetChildren()) do
            table.insert(env._trash_table.Stuff.Shop, v.Name)
        end

        for i,v in pairs(workspace:WaitForChild("bossFolder"):GetChildren()) do
            table.insert(env._trash_table.Stuff.Boss, v.Name)
        end

        for i,v in pairs(rs:WaitForChild("Ranks")["Ground"]:GetChildren()) do
            table.insert(env._trash_table.Stuff.Ranks, v.Name)
        end

        for i,v in pairs(LocalPlayer:WaitForChild("petsFolder"):GetChildren()) do
            table.insert(env._trash_table.Stuff.PetsFolder, v.Name)
        end

        if not suc then return end

    end)
end)

--// All Element
local Element = loadstring(game:HttpGet("https://gist.githubusercontent.com/Pri4c1lla/ed34be9357bddcb2b28c6513c5621941/raw/ac26ebcc81d55b005845860079a0a7fb12f2101d/Element.lua"))()
local infJumpDebounce
env.oldwalkspeed = lp.Character:FindFirstChildOfClass('Humanoid').WalkSpeed
local AreaCFrame={[1]=CFrame.new(-119.522469,13002.2637,274.569244,0.342042685,-0,-0.939684391,0,1,-0,0.939684391,0,0.342042685),[2]=CFrame.new(354.477539,8874.26367,116.569244,0.342042685,-0,-0.939684391,0,1,-0,0.939684391,0,0.342042685),[3]=CFrame.new(330.127533,16921.8223,-16.1307545,0.342042685,-0,-0.939684391,0,1,-0,0.939684391,0,0.342042685),[4]=CFrame.new(1848.47754,82.2061615,-137.430756,0.342042685,-0,-0.939684391,0,1,-0,0.939684391,0,0.342042685),[5]=CFrame.new(627.358643,82.2061615,2429.48657,-0.422592998,0,-0.906319618,0,1,0,0.906319618,0,-0.422592998),[6]=CFrame.new(330.127533,30432.8242,-16.1307545,0.342042685,-0,-0.939684391,0,1,-0,0.939684391,0,0.342042685),[7]=CFrame.new(1875.96692,82.2061615,-6806.41016,0.965929627,-0,-0.258804798,0,1,-0,0.258804798,0,0.965929627),[8]=CFrame.new(5041.17725,82.2061615,1614.74866,0.258864343,-0,-0.965913713,0,1,-0,0.965913713,0,0.258864343)}

local function GetLastIsland()
	return env._trash_table.Stuff.Island[#env._trash_table.Stuff.Island]
end

local function GetChestName()
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and string.match(v.Name,"Chest") and not string.match(v.Name,"group") and not string.match(v.Name,"evil") and not string.match(v.Name,"light") and v.circleSignPart.signGui.timeLabel.text == "Ready To Collect" then
            return v
        end
    end
    return nil
end

local function findchi()
    for i,v in pairs(workspace.spawnedCoins.Valley:GetChildren()) do
        if string.match(v.Name,"Chi") then if not v:FindFirstChild("collected") then return v end end
        --[[
        if (v.Name == "Pink Chi Crate" or v.Name == "Chi Crate" or v.Name == "Blue Chi Crate" or v.Name == "Chi") then
            if not v:FindFirstChild("collected") then return v end
        end
        ]]
    end
    return nil
end

local function EquipShuriken()
    for _,v in pairs(lp:FindFirstChildOfClass("Backpack"):GetDescendants()) do
        if v:IsA("Tool") and v.Name:lower():find("shuriken") then
            return v
        end
    end
    return nil
end

local function Katana()
    for i,v in ipairs(lp.Backpack:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("attackKatanaScript") then
            return v
        end
    end
    for i,v in ipairs(lp.Character:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("attackKatanaScript") then
            return v
        end
    end
    return nil
end

local function randomteleport(Part)
    if RandomType == 1 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Part.HumanoidRootPart.CFrame * CFrame.new(0, 7, 1)
    elseif RandomType == 2 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Part.HumanoidRootPart.CFrame * CFrame.new(0, 1, 7)
    elseif RandomType == 3 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Part.HumanoidRootPart.CFrame * CFrame.new(1, 1, -7)
    elseif RandomType == 4 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Part.HumanoidRootPart.CFrame * CFrame.new(7, 1, 0)
    elseif RandomType == 5 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Part.HumanoidRootPart.CFrame * CFrame.new(-7, 1, 0)
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Part.HumanoidRootPart.CFrame * CFrame.new(0, 7, 1)
    end
end

--// UI Initializer
run(function()
    local Options = Fluent.Options

    local Window = Fluent:CreateWindow({
        Title = `{GameInfo.Name}`,
        SubTitle = `By github.com/Pri4c1lla/roblox-projects`,
        TabWidth = env.SettingUi.TabWidth,
        Size = UDim2.fromOffset(table.unpack(env.SettingUi.Size)),
        Theme = env.SettingUi.Theme,
        Acrylic = env.SettingUi.Acrylic,
        MinimizeKey = env.SettingUi.MinimizeKey
    })

    local Tabs = { Main=Window:AddTab({ Title = "Main" , Icon = "component"}) , Boss = Window:AddTab({ Title = "Boss", Icon = "swords"}) , Players = Window:AddTab({ Title = "Players" , Icon = "users"}) , Eggs = Window:AddTab({ Title = "Eggs" , Icon = "egg" }) , Teleports = Window:AddTab({ Title = "Teleports", Icon = "terminal" }) , Misc = Window:AddTab({ Title = "Misc" , Icon = "align-left"}) }

    Window:SelectTab(1)

    local AutoSwing = Tabs.Main:AddToggle("", {Title = "Auto Swing", Description = "", Default = false})
    AutoSwing:OnChanged(function(v)
        Script.Main.swing = v
    end)

    local buyswords = Tabs.Main:AddToggle("", {Title = "auto buy swords", Description = "", Default = false})
    buyswords:OnChanged(function(v)
        Script.Main.sword = v
        pcall(function()
            if Script.Main.sword then
                env.CreateThered:newThread(.1,function(self)
                    if not Script.Main.sword then
                        self:Disable()
                    end
                    LocalPlayer:WaitForChild("ninjaEvent"):FireServer("buyAllSwords",GetLastIsland())
                end)
            end
        end)
    end)

    local buybelts = Tabs.Main:AddToggle("", {Title = "auto buy belts", Description = "", Default = false})
    buybelts:OnChanged(function(v)
        Script.Main.belts = v
        pcall(function()
            if Script.Main.belts then
                env.CreateThered:newThread(.1,function(self)
                    if not Script.Main.belts then
                        self:Disable()
                    end
                    LocalPlayer:WaitForChild("ninjaEvent"):FireServer("buyAllBelts",GetLastIsland())
                end)
            end
        end)
    end)

    local buyskills = Tabs.Main:AddToggle("", {Title = "auto buy skills", Description = "", Default = false})
    buyskills:OnChanged(function(v)
        Script.Main.skills = v
        pcall(function()
            if Script.Main.skills then
                env.CreateThered:newThread(.1,function(self)
                    if not Script.Main.skills then
                        self:Disable()
                    end
                    LocalPlayer:WaitForChild("ninjaEvent"):FireServer("buyAllSkills",GetLastIsland())
                end)
            end
        end)
    end)

    local buyshurikens = Tabs.Main:AddToggle("", {Title = "auto buy shurikens", Description = "", Default = false})
    buyshurikens:OnChanged(function(v)
        Script.Main.shurikens = v
        pcall(function()
            if Script.Main.shurikens then
                env.CreateThered:newThread(.1,function(self)
                    if not Script.Main.shurikens then
                        self:Disable()
                    end
                    LocalPlayer:WaitForChild("ninjaEvent"):FireServer("buyAllShurikens",GetLastIsland())
                end)
            end
        end)
    end)

    local AutoRanks = Tabs.Main:AddToggle("", {Title = "Auto Ranks", Description = "", Default = false})
    AutoRanks:OnChanged(function(v)    
        Script.Main.Ranks = v
        pcall(function()
            if Script.Main.Ranks then
                env.CreateThered:newThread(.25,function(self)
                    if not Script.Main.Ranks  then
                        self:Disable()
                    end
                    for _, v in next, env._trash_table.Stuff.Ranks do
                        LocalPlayer:WaitForChild("ninjaEvent"):FireServer("buyRank", v)
                        task.wait()
                    end
                end)
            end
        end)
    end)

    Tabs.Main:AddButton({
        Title = "Get All Element",
        Description = "update at 10/17/2024",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            for _,Elements in next, Element do
                                rs:WaitForChild("rEvents"):FindFirstChild("elementMasteryEvent"):FireServer(Elements)
                            end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    local CollectChests = Tabs.Main:AddToggle("", {Title = "Collect All Chests", Description = "Fixed", Default = false})
    CollectChests:OnChanged(function(v)
        Script.Main.Chest = v
        pcall(function()
            if Script.Main.Chest then
                env.CreateThered:newThread(.25,function(self)
                    if not Script.Main.Chest then
                        self:Disable()
                    end
                    local Chests = GetChestName()
                    if Chests ~= nil then
                        FireTouchPart(Chests.circleInner) 
                    end
                end)
            end
        end)
    end)

    local AutoChi = Tabs.Main:AddToggle("", {Title = "Auto Chi", Description = "(save old position) Depend On Ping if Collecting Is Slow.", Default = false})
    AutoChi:OnChanged(function(v)
        Script.Main.Chi = v
        pcall(function()
            if Script.Main.Chi and env.AllowBackOldPos then
                oldpos = HumanoidRootPart().CFrame
            else
                HumanoidRootPart().CFrame = oldpos
            end
        end)
    end)

    local AutoHoops = Tabs.Main:AddToggle("", {Title = "Auto Hoops", Description = "(Depend On Ping) delay is 0.25", Default = false})
    AutoHoops:OnChanged(function(v)
        Script.Main.Hoops = v
        if Script.Main.Hoops then
            env.CreateThered:newThread(.25,function(self)
                if not Script.Main.Hoops then
                    self:Disable()
                end
                for _, v in pairs(workspace.Hoops:GetChildren()) do
                    if v:IsA("MeshPart") then
                        if v:FindFirstChild("beingUsed") then return end
                        task.defer(function()
                            oldpostouchPart = v.touchPart.CFrame
                            v.touchPart.CFrame = HumanoidRootPart().CFrame
                            task.wait()
                            v.touchPart.CFrame = oldpostouchPart
                        end)
                    end
                end
            end)
        end
    end)

    local openshop = Tabs.Main:AddDropdown("", {
        Title = "Open Shop",
        Description = "",
        Values = env._trash_table.Stuff.Shop,
        Multi = false,
        Default = 1,
    })
    
    openshop:SetValue("nil")
    
    openshop:OnChanged(function(v)
       Script.Main.typeshop = v
    end)
    
    Tabs.Main:AddButton({
        Title = "Click To open",
        Description = "",
        Callback = function()
            for i,v in pairs(workspace.shopAreaCircles:GetChildren()) do
                if string.match(v.Name,Script.Main.typeshop) then
                    FireTouchPart(v.circleInner)
                end
            end
        end
    })

    local SEC = Tabs.Main:AddDropdown("", {
        Title = "Sell Area",
        Description = "Select a Sell Part",
        Values = env._trash_table.Stuff.SellArea,
        Multi = false,
        Default = 1,
    })
    
    SEC:SetValue("nil")
    
    SEC:OnChanged(function(v)
       Script.Main.SellPart = v
    end)

    local ASM = Tabs.Main:AddDropdown("", {
        Title = "Select Sell Method",
        Values = {"Instant","Full(Max)"},
        Multi = false,
        Default = 1,
    })
    
    ASM:SetValue("Instant")
    
    ASM:OnChanged(function(v)
       Script.Main.typeSell = v
    end)

    local AutoSell = Tabs.Main:AddToggle("", {Title = "Auto Sell", Description = "", Default = false})
    AutoSell:OnChanged(function(v)
        Script.Main.Sell = v
            pcall(function()
            if Script.Main.Sell then
                env.CreateThered:newThread(0,function(self)
                    if not Script.Main.Sell then
                        self:Disable()
                    end
                    if Script.Main.typeSell == "Instant" then
                        for i,v in pairs(workspace.sellAreaCircles:GetChildren()) do
                            if string.match(v.Name,Script.Main.SellPart) then
                                FireTouchPart(v.circleInner)
                            end
                        end
                    elseif Script.Main.typeSell == "Full(max)" then
                        if PlayerGui.gameGui.maxNinjitsuMenu.Visible ~= false then
                            for i,v in pairs(workspace.sellAreaCircles:GetChildren()) do
                                if string.match(v.Name,Script.Main.SellPart) then
                                    FireTouchPart(v.circleInner)
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end)
    
    local autoWheel = Tabs.Main:AddToggle("", {Title = "auto Wheel(24h Cooldown)", Default = false})
    autoWheel:OnChanged(function(v)
        Script.Main.Wheel = v
        if Script.Main.Wheel then
            env.CreateThered:newThread(.5,function(self)
                if not Script.Main.Wheel then
                    self:Disable()
                end
                rs:WaitForChild("rEvents"):WaitForChild("openFortuneWheelRemote"):InvokeServer("openFortuneWheel",workspace:WaitForChild("Fortune Wheel"))
            end)
        end
    end)

    --// Boss tabs

    local Bossdropdown = Tabs.Boss:AddDropdown("Dropdown", {
        Title = "Select Boss",
        Values = env._trash_table.Stuff.Boss,
        Multi = false,
        Default = 1,
    })

    Bossdropdown:SetValue(nil)

    Bossdropdown:OnChanged(function(v)
        Script.Boss.SelectBoss = v
    end)

    local KillBoss = Tabs.Boss:AddToggle("", {Title = "Kill Boss", Default = false })
    KillBoss:OnChanged(function(v)
        Script.Boss.KillBoss = v
        if Script.Boss.KillBoss then
            env.needatk = Script.Boss.KillBoss
        else
            env.needatk = Script.Boss.KillBoss
        end
    end)

    local InstantBoss = Tabs.Boss:AddToggle("", {Title = "Instant Kill Boss", Description = "", Default = false })
    InstantBoss:OnChanged(function(v)
        Script.Boss.InstantBoss = v
    end)
    
    local InstantAllBoss = Tabs.Boss:AddToggle("", {Title = "Instant Kill All Boss", Description = "", Default = false })
    InstantAllBoss:OnChanged(function(v)
        Script.Boss.InstantAllBoss = v
    end)

    --// Players tabs

    local WalkSpeed = Tabs.Players:AddSlider("", {
        Title = "WalkSpeed",
        Description = "",
        Default = 100,
        Min = 50,
        Max = 1000,
        Rounding = 10,
        Callback = function(v)
            Script.Players.WalkSpeedsave = tonumber(v)
        end
    })

    WalkSpeed:SetValue(30)

    local LoopWalkSpeed = Tabs.Players:AddToggle("L_542_", {Title = "Toggle WalkSpeed", Description = "", Default = false})
    LoopWalkSpeed:OnChanged(function(Value)
        Script.Players.WalkSpeed = Value
    end)

    local Jumped = Tabs.Players:AddSlider("", {
        Title = "Jumppower",
        Description = "",
        Default = 100,
        Min = 50,
        Max = 1000,
        Rounding = 10,
        Callback = function(v)
            Script.Players.JumpValue = tonumber(v)
        end
    })
    
    Jumped:SetValue(30)
    
    Jumped:OnChanged(function(Value)
        Script.Players.JumpValue = Value
    end)
    
    local LoopJumpPower = Tabs.Players:AddToggle("L_542_", {Title = "Toggle JumpPower", Description = "", Default = false})
    LoopJumpPower:OnChanged(function(Value)
        Script.Players.JumpToggle = Value
    end)

    local infJumpes = Tabs.Players:AddToggle("", {Title = "inf Jump", Description = "", Default = false})
    infJumpes:OnChanged(function(v)
        env.faGStOFQ6W = v
        -- i don't know what i do
        if env.faGStOFQ6W then
            if infJump then infJump:Disconnect() end
            infJumpDebounce = false
            infJump = UserInputService.JumpRequest:Connect(function()
                if not infJumpDebounce then
                    infJumpDebounce = true
                    getchar():FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
                    task.wait()
                    infJumpDebounce = false
                end
            end)
        else
            if infJump then infJump:Disconnect() end
            infJumpDebounce = false
        end
    end)

    local FlysKeybind = Tabs.Players:AddKeybind("Flying", {
        Title = "flight",
        Mode = "Toggle",
        Description = "Noclip Built In",
        Default = "N",
        Callback = function(v)
            Script.Main.flight = v
            if Script.Main.flight then
                while Script.Main.flight do task.wait()
                    local character = getchar()
                    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.PlatformStand = Script.Main.flight
                    end
                end
            else
                run(function()
                    pcall(function()
                        env.AngularVC.Parent = nil;
                        env.FlightGyro.Parent = nil;
                        env.FlightBV.Parent = nil;
                        getchar():FindFirstChildOfClass("Humanoid").PlatformStand = false;
                    end)
                end)
            end
        end,
    })

    local FlyToggle = Tabs.Players:AddToggle("FlyingMoblie", {Title = "Fly", Description = "Toggle Fly For Mobile Users", Default = false })
    FlyToggle:OnChanged(function(v)
        Script.Players.flightmb = v
        if Script.Players.flightmb and IsOnMobile and not env.Shion_Debug then
            while Script.Players.flightmb do task.wait()
                local character = getchar()
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = Script.Players.flightmb
                end
            end
        else
            run(function()
                pcall(function()
                    env.AngularVC.Parent = nil;
                    env.FlightGyro.Parent = nil;
                    env.FlightBV.Parent = nil;
                    getchar():FindFirstChildOfClass("Humanoid").PlatformStand = false;
                end)
            end)
        end
    end)

    local Flight = Tabs.Players:AddSlider("Fly Speed", {
        Title = "Fly Speed",
        Description = "Make Your Flying Faster",
        Default = 2,
        Min = 3,
        Max = 150,
        Rounding = 1,
        Callback = function(Value)
            Script.Players.FlySpeed = Value
        end
    })
    
    Flight:OnChanged(function(Value)
        Script.Players.FlySpeed = Value
    end)
    
    Flight:SetValue(5)

    local Noclipv = Tabs.Players:AddToggle("", {Title = "Noclip", Description = "", Default = false})
    Noclipv:OnChanged(function(v)
        Script.Players.Noclip = v
    end)

    --// Teleport tabs
    local SelectIsland = Tabs.Teleports:AddDropdown("Island", {
        Title = "Select Islands to Teleport",
        Values = env._trash_table.Stuff.Island,
        Multi = false,
        Default = 1,
    })
    
    SelectIsland:SetValue(nil)
    
    SelectIsland:OnChanged(function(v)
        Script.Teleports.SelectIslands = v
    end)
    
    Tabs.Teleports:AddButton({
        Title = "Click To Teleport",
        Description = "Teleporting to Select Islands",
        Callback = function()
            for i,v in pairs(workspace.islandUnlockParts:GetChildren()) do
                if v.Name == Script.Teleports.SelectIslands then
                    HumanoidRootPart().CFrame = v.CFrame * CFrame.new(0,15,0)
                end
            end
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Unlock All Island",
        Description = "",
        Callback = function()
            for _,index in next, env._trash_table.Stuff.Island do
                for i,v in pairs(workspace.islandUnlockParts[index]:GetChildren()) do
                    if v.Name == "TouchInterest" and v.Parent then
                        FireTouchPart(v.Parent)
                    end
                end 
            end
        end
    })
    
    local SelectKarmaType = Tabs.Teleports:AddDropdown("Karma", {
        Title = "Select Karma Type",
        Values = {"Evil","Light"},
        Multi = false,
        Default = 1,
    })
    
    SelectKarmaType:SetValue("Evil")
    
    SelectKarmaType:OnChanged(function(v)
        Script.Teleports.TypeKarma = v
    end)
    
    local trainingArea = Tabs.Teleports:AddDropdown("Area", {
        Title = "Select Area",
        Values = {"-+100 Karma","-250 Karma","+1000 Karma","-+2000 Karma","-+5000 Karma"},
        Multi = false,
        Default = 1,
    })
    
    trainingArea:SetValue(nil)
    
    trainingArea:OnChanged(function(v)
        Script.Teleports.SelectArea = v
    end)
    
    Tabs.Teleports:AddButton({
        Title = "Teleport",
        Description = "",
        Callback = function()
            if Script.Teleports.TypeKarma == "Evil" then
                if Script.Teleports.SelectArea == "-+100 Karma" then
                    HumanoidRootPart().CFrame = AreaCFrame[1]
                elseif Script.Teleports.SelectArea == "-250 Karma" then
                    HumanoidRootPart().CFrame = AreaCFrame[3]
                elseif Script.Teleports.SelectArea == "-+2000 Karma" then
                    HumanoidRootPart().CFrame = AreaCFrame[5]
                elseif Script.Teleports.SelectArea == "-+5000 Karma" then
                    HumanoidRootPart().CFrame = AreaCFrame[7]
                end
            elseif Script.Teleports.TypeKarma == "Light" then
                if Script.Teleports.SelectArea == "-+100 Karma" then
                    HumanoidRootPart().CFrame = AreaCFrame[2]
                elseif Script.Teleports.SelectArea == "+1000 Karma" then
                    HumanoidRootPart().CFrame = AreaCFrame[4]
                elseif Script.Teleports.SelectArea == "-+2000 Karma" then
                    HumanoidRootPart().CFrame = AreaCFrame[6]
                elseif Script.Teleports.SelectArea == "-+5000 Karma" then
                    HumanoidRootPart().CFrame = AreaCFrame[8]
                end
            end
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Teleport Dojo",
        Description = "Teleporting to Infinty Stats Dojo",
        Callback = function()
            HumanoidRootPart().CFrame = workspace.areaTeleportParts.valleyToInfinityStatsDojo.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Teleport Altar",
        Description = "Teleporting to altar Of Elements",
        Callback = function()
            HumanoidRootPart().CFrame = workspace.areaTeleportParts.valleyToAltarOfElements.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Teleport Cloneing Altar",
        Description = "Teleporting to Pet Cloning Altar",
        Callback = function()
            HumanoidRootPart().CFrame = workspace.areaTeleportParts.valleyToCloningAltar.CFrame
        end
    })

    local TeleportEgg = Tabs.Eggs:AddDropdown("Eggss", {
        Title = "Select To Teleport",
        Values = env._trash_table.Stuff.Crystal,
        Multi = false,
        Default = 1,
    })
    
    TeleportEgg:SetValue(nil)
    
    TeleportEgg:OnChanged(function(v)
        Script.Eggs.SelectTeleport = v
    end)
    
    Tabs.Eggs:AddButton({
        Title = "Teleport to Crystals / Eggs",
        Description = "",
        Callback = function()
            HumanoidRootPart().CFrame = workspace.mapCrystalsFolder[Script.Eggs.SelectTeleport]:GetModelCFrame() * CFrame.new(0,5,0)
        end
    })
    
    local Eggs = Tabs.Eggs:AddDropdown("Eggs", {
        Title = "Select Egg",
        Values = env._trash_table.Stuff.Crystal,
        Multi = false,
        Default = 1,
    })
    
    Eggs:SetValue(nil)
    
    Eggs:OnChanged(function(v)
        Script.Eggs.SelectOpenEggs = v
    end)
    
    local openegged = Tabs.Eggs:AddToggle("", {Title = "Open Eggs / Crystal", Description = "",Default = false })
    openegged:OnChanged(function(v)
        Script.Eggs.open = v
    end)

    local autoEvolvePets = Tabs.Eggs:AddToggle("", {Title = "auto Evolve Pets", Description = "",Default = false })
    autoEvolvePets:OnChanged(function(v)
        Script.Eggs.autoEvolvePets = v
    end)

    local Sellpets = Tabs.Eggs:AddDropdown("Dropdown", {
        Title = "Type of Sell",
        Values = env._trash_table.Stuff.PetsFolder,
        Multi = false,
        Default = 1,
    })

    Sellpets:SetValue("nil")

    Sellpets:OnChanged(function(v)
        Script.Eggs.TypeOfSell = v
    end)

    local Folderpets = Tabs.Eggs:AddToggle("", {Title = "Sell Pets", Default = false })
    Folderpets:OnChanged(function(v)
        Script.Eggs.SelectToSell = v
    end)

    local abop = Tabs.Misc:AddToggle("", {Title = "Allow Return Old Position", Description = "work with all function that mention save old position.", Default = true })
    abop:OnChanged(function(v)
        env.AllowBackOldPos = v
    end)

    Tabs.Misc:AddButton({
        Title = "Toggle Popups",
        Description = "",
        Callback = function()
            run(function()
                PlayerGui.statEffectsGui.Enabled = not PlayerGui.statEffectsGui.Enabled
                PlayerGui.hoopGui.Enabled = not PlayerGui.hoopGui.Enabled
            end)
        end
    })

    local Fastshurikens = Tabs.Misc:AddToggle("", {Title = "Fast Shurikens", Default = false })
    Fastshurikens:OnChanged(function(v)
        Script.Misc.Fastshurikens = v
    end)

    local RenderRadius = Tabs.Misc:AddSlider("Range", {
        Title = "RenderRadius",
        Description = "Range",
        Default = 400,
        Min = 50,
        Max = 1000,
        Rounding = 50,
        Callback = function(Value)
            Script.Misc.RangeRadius = Value / 2
        end
    })
    
    RenderRadius:OnChanged(function(Value)
        Script.Misc.RangeRadius = Value / 2
    end)
    
    RenderRadius:SetValue(400)

    local KillAura = Tabs.Misc:AddToggle("", {Title = "Kill Aura", Description = "Using Shurikens to Kill Players. Recommended use with Fast Shurikens" ,Default = false })
    KillAura:OnChanged(function(v)
        Script.Misc.KillAura = v
    end)

    Tabs.Misc:AddButton({
        Title = "get max jump",
        Description = "max jump is 50",
        Callback = function()
            lp:FindFirstChild("multiJumpCount").Value = 9e9
        end
    })

    Tabs.Misc:AddButton({
        Title = "JumpPad",
        Description = "",
        Callback = function()
            for _,v in pairs(workspace.jumpPads:GetChildren()) do
                if v.Name == "JumpPad" then
                    FireTouchPart(v.touchPart)
                end
            end
        end
    })

    Tabs.Misc:AddButton({
        Title = "Teleport to a safe place",
        Description = "",
        Callback = function()
            if getchar() then
                local hrp = HumanoidRootPart()
                if hrp then
                    local cf = env.MainPart.CFrame * CFrame.new(0,3,0)
                    hrp.CFrame = cf
                end
            end
        end
    })

    NotificationLoad:NewNotification({
        ["Mode"] = "Info",
        ["Title"] = "all tabs is loaded, please wait.",
        ["Description"] = "",
        ["Timeout"] = 5,
        ["Audio"] = false
    })

    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
    
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({'TextboxIdentifier'})
    InterfaceManager:SetFolder("Pri4cillT1x/Configs")
    SaveManager:SetFolder("Pri4cillT1x/Configs")
    local Settings = Window:AddTab({
        Title = "Settings",
        Icon = "settings"
    })
    InterfaceManager:BuildInterfaceSection(Settings)
    SaveManager:BuildConfigSection(Settings)
    Window:SelectTab(1)
    SaveManager:LoadAutoloadConfig()

end)

run(function()
    RunService.Heartbeat:Connect(function()

        pcall(function()

            if Script.Main.swing or env.needatk then
                if getchar() then
                    local Humanoid = getchar().Humanoid
                    local get_sword = Katana()
                    if (get_sword ~= nil and get_sword.Parent ~= nil) then
                        if get_sword.Parent == getchar() then
                            task.spawn(function()
                                get_sword:Activate()
                                get_sword:Deactivate()
                                LocalPlayer:WaitForChild("ninjaEvent"):FireServer("swingKatana")
                            end)
                        elseif get_sword.Parent == lp.Backpack then
                            Humanoid:EquipTool(get_sword)
                        end
                    end
                end
            end

            if Script.Main.Chi then
                local chi = findchi()
                if chi ~= nil then
                    HumanoidRootPart().CFrame = chi.CFrame
                end
            end

            if Script.Boss.KillBoss then
                for i,v in pairs(workspace.bossFolder:GetChildren()) do
                    if v.Name == Script.Boss.SelectBoss and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") then
                        HumanoidRootPart().CFrame = randomteleport(v)
                        wait()
                    end
                end
            end

            if Script.Main.flight or Script.Players.flightmb then
                local character = getchar()
                local primaryPart = character and character.PrimaryPart
                if primaryPart then
                    local bodyVelocity, bodyGyro = unpack(movers)
                    if not bodyVelocity then
                        bodyVelocity = Instance.new("BodyVelocity")
                        bodyVelocity.MaxForce = Vector3.one * 9e9
            
                        bodyGyro = Instance.new("BodyGyro")
                        bodyGyro.MaxTorque = Vector3.one * 9e9
                        bodyGyro.P = 9e4
            
                        local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
                        bodyAngularVelocity.AngularVelocity = Vector3.yAxis * 9e9
                        bodyAngularVelocity.MaxTorque = Vector3.yAxis * 9e9
                        bodyAngularVelocity.P = 9e9
            
                        movers = { bodyVelocity, bodyGyro, bodyAngularVelocity }

                        env.FlightBV = bodyVelocity
                        env.FlightGyro = bodyGyro
                        env.AngularVC = bodyAngularVelocity
                    end
            
                    if Script.Main.flight or Script.Players.flightmb then
                        local camCFrame = workspace.CurrentCamera.CFrame
                        local velocity = Vector3.zero
                        local rotation = camCFrame.Rotation
            
                        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                            velocity += camCFrame.LookVector
                            rotation *= CFrame.Angles(math.rad(-40), 0, 0)
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                            velocity -= camCFrame.LookVector
                            rotation *= CFrame.Angles(math.rad(40), 0, 0)
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                            velocity += camCFrame.RightVector
                            rotation *= CFrame.Angles(0, 0, math.rad(-40))
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                            velocity -= camCFrame.RightVector
                            rotation *= CFrame.Angles(0, 0, math.rad(40))
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                            velocity += Vector3.yAxis
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                            velocity -= Vector3.yAxis
                        end
            
                        local tweenInfo = TweenInfo.new(0.5)
                        TweenService:Create(bodyVelocity, tweenInfo, { Velocity = velocity * Script.Players.FlySpeed * 45 }):Play()
                        bodyVelocity.Parent = primaryPart
            
                        if not env.fling then
                            TweenService:Create(bodyGyro, tweenInfo, { CFrame = camCFrame.Rotation }):Play()
                            bodyGyro.Parent = primaryPart
                        end
                    end
                end
            end

            if Script.Boss.InstantBoss then
                if sethidden then
                    for i,v in pairs(workspace.bossFolder:GetChildren()) do
                        if v.Name == Script.Boss.SelectBoss and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") then
                            v.Humanoid:ChangeState(15)
                            v.Humanoid.Health = die
                            v.Humanoid.Health = 0
                            sethidden(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                else
                    for i,v in pairs(workspace.bossFolder:GetChildren()) do
                        if v.Name == Script.Boss.SelectBoss and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") then
                            v.Humanoid:ChangeState(15)
                            v.Humanoid.Health = die
                            v.Humanoid.Health = 0
                        end
                    end
                end
            end

            if Script.Boss.InstantAllBoss then
                if sethidden then
                    for _,v in pairs(workspace.bossFolder:GetChildren()) do
                        if v:isA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") then
                            v.Humanoid:ChangeState(15)
                            v.Humanoid.Health = die
                            v.Humanoid.Health = 0
                            sethidden(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                else
                    for _,v in pairs(workspace.bossFolder:GetChildren()) do
                        if v:isA("Model") and v:FindFirstChild("HumanoidRootPart") then
                            v.Humanoid:ChangeState(15)
                            v.Humanoid.Health = die
                            v.Humanoid.Health = 0
                        end
                    end
                end
            end

            if Script.Eggs.open then
                if Script.Eggs.SelectOpenEggs ~= nil then
                    local args = {
                        [1] = "openCrystal",
                        [2] = Script.Eggs.SelectOpenEggs
                    }
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(unpack(args))
                end
            end

            if Script.Eggs.autoEvolvePets then
                local args = {
                    [1] = "autoEvolvePets"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("autoEvolveRemote"):InvokeServer(unpack(args))
            end

            if Script.Eggs.SelectToSell then
                if Script.Eggs.TypeOfSell ~= nil then
                    for i,v in pairs(lp.petsFolder[Script.Eggs.TypeOfSell]:GetChildren()) do
                        if v:IsA("StringValue") then
                            rs:WaitForChild("rEvents"):WaitForChild("sellPetEvent"):FireServer("sellPet", v)
                        end
                    end
                end
            end

            if Script.Players.WalkSpeed then
                lp.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = Script.Players.WalkSpeedsave
            else
                if not Script.Players.WalkSpeed then
                    lp.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = env.oldwalkspeed
                end
            end

            if Script.Players.JumpToggle then
                lp.Character:FindFirstChildOfClass('Humanoid').JumpPower = Script.Players.JumpValue
            else
                if not Script.Players.JumpToggle then
                    lp.Character:FindFirstChildOfClass('Humanoid').JumpPower = 50
                end
            end
    
            if Script.Misc.Fastshurikens and not Script.Misc.KillAura then
                for _, v in pairs(workspace.shurikensFolder:GetChildren()) do
                    if v.Name == "Handle" then
                        if v:FindFirstChild("BodyVelocity") then
                            local bv = v:FindFirstChildOfClass("BodyVelocity")
                            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            bv.Velocity = getMouse.Hit.lookVector * math.random(10000)
                        end
                    end
                end
            elseif Script.Misc.Fastshurikens and Script.Misc.KillAura then
                for _, v in pairs(workspace.shurikensFolder:GetChildren()) do
                    if v.Name == "Handle" then
                        if v:FindFirstChild("BodyVelocity") then
                            local bv = v:FindFirstChildOfClass("BodyVelocity")
                            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            bv.Velocity = env.PositionTarget * math.random(10000)
                        end
                    end
                end
            end

            if Script.Misc.KillAura then
                for _,v in next, Players:GetPlayers() do
                    if v.Name ~= lp.Name then
                        --local i = (v.Character:FindFirstChild("HumanoidRootPart").Position - HumanoidRootPart().Position).magnitude
                        if lp:DistanceFromCharacter(v.Position) <= Script.Misc.RangeRadius and not v.Character:FindFirstChild("inSafezone") and not getchar():FindFirstChild("inSafezone") then
                            env.PositionTarget = v.Character:FindFirstChild("HumanoidRootPart").Position
                            local x = EquipShuriken()
                            x.Parent = getchar()
                            local args = {
                                [1] = "attackShuriken",
                                [2] = v.Character:FindFirstChild("HumanoidRootPart").Position
                            }
                            LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                        end
                    end
                end
            end
    
            if Script.Players.Noclip or Script.Main.flight or Script.Players.flightmb then
                local character = getchar()
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            if noclipDefaults[part] == nil then
                                task.wait()
                                noclipDefaults[part] = part.CanCollide
                            else
                                if not Script.Players.Noclip or not Script.Players.flight or not Script.Players.flightmb then
                                    part.CanCollide = false
                                else
                                    part.CanCollide = noclipDefaults[part]
                                end
                            end
                        end
                    end
                end
            end

            RunService.Heartbeat:wait()

        end)
    end)
end)

run(function()

    local executor; executor = {
        "Solara",
        "Xeno",
        "Forlorn"
    }

    for _,v in next, executor do 
        if executor_used == v then
            NotificationLoad:NewNotification({
                ["Mode"] = "info",
                ["Title"] = "Dear user who using Xeno/SynxRemake/Solara",
                ["Description"] = "if some function not working it depending on your executor.", -- i just lazy to fix/error by executor. fix it yourself it open source
                ["Timeout"] = 5,
                ["Audio"] = false
            })
        end
    end

end)

run(function()
    local no_part,yes_part = pcall(function()
        assert(not env.SafePart)
        env.SafePart = true;
        env.MainPart = Instance.new("Part",workspace)
        env.MainPart.Anchored = true
        env.MainPart.Size = Vector3.new(150,1,150)
        local r = math.random(10000)
        local cf = Vector3.new(35e+3,35e+3,35e+3) + Vector3.new(r,r,r) -- 35e+3 = 35000
        env.MainPart.CFrame = CFrame.new(cf)
        env.MainPart.Material = Enum.Material.ForceField
        env.CreateThered:newThread(.25,function(self)
            env.MainPart.Name = game:GetService("HttpService"):GenerateGUID(false)
            env.MainPart.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        end)
    end)
    if yes_part then
        return("safe part had already done")
    end
end)

RandomType = 1

run(function()
    task.spawn(function()
        while wait() do 
            RandomType = math.random(1,5)
            wait(0.3)
        end
    end)
end)

run(function()
    RunService.Stepped:Connect(function()
        pcall(function()
            if Script.Main.Chi or Script.Boss.KillBoss then
                if syn and syn.request then
                    setfflag("HumanoidParallelRemoveNoPhysics", "False")
                    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(11)
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                    end
                else
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(env._trash_table.Character.Velocity) then
                            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand ~= true then
                                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = true
                            end
                            local Velocity = Instance.new("BodyVelocity",HumanoidRootPart())
                            Velocity.Name = env._trash_table.Character.Velocity
                            Velocity.MaxForce = Vector3.new(9e9,9e9,9e9);
                            Velocity.Velocity = Vector3.new(0,0,0);
                        end
                        for _, part in pairs(getchar():GetDescendants()) do
                            if part:IsA("BasePart") then
                                if noclipDefaults[part] == nil then
                                    noclipDefaults[part] = part.CanCollide
                                else
                                    if not Script.Main.Chi or not Script.Boss.KillBoss or game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health == 0
                                    then
                                        part.CanCollide = false
                                    else
                                        part.CanCollide = noclipDefaults[part]
                                    end
                                end
                            end
                        end
                    end
                end
            else
                run(function()
                    if not Script.Main.Chi or not Script.Boss.KillBoss then
                        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(env._trash_table.Character.Velocity) then
                            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(env._trash_table.Character.Velocity):Destroy();
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand ~= false then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = false
                        end
                    end
                end)
            end
        end)
    end)
end)

run(function()
    pcall(function()

        NotificationLoad:NewNotification({
            ["Mode"] = "info",
            ["Title"] = "Started Anti AFK",
            ["Description"] = "Thank for using my script. <3",
            ["Timeout"] = 6,
            ["Audio"] = false
        })
        
        local getconnect = getconnections or get_signal_cons

        if getconnect then
            for i,v in pairs(getconnect(lp.Idled)) do
                if v["Disable"] then
                    v["Disable"](v)
                elseif v["Disconnect"] then
                    v["Disconnect"](v)
                end
            end
        else
            lp.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end

    end)
end)

run(function()
    pcall(function()
        
        for _,v in pairs(rs.gamepassIds:GetChildren()) do
            if v:IsA("IntValue") then
                if (v.Name ~= "+2 Pet Slots" and v.Name ~= "+3 Pet Slots" and v.Name ~= "+4 Pet Slots" and v.Name ~= "+60 Capacity" and v.Name ~= "+100 Capacity" and v.Name ~= "+200 Capacity" and v.Name ~= "+20 Capacity" and v.Name ~= "x3 Pet Clones" and v.Name ~= "Infinite Ninjitsu") then -- If it work, remove this line.
                    v:Clone()
                    v.Value = nil
                    v.Parent = lp.ownedGamepasses 
                    wait()
                end
            end
        end

    end)
end)

run(function()
    if lp:WaitForChild("adsAllowed").Value ~= false then
        lp:WaitForChild("adsAllowed").Value = false
    end
end)

print("Load Script Success in "..string.format("%.2f",tick() - LoadingTime).." secs")

NotificationLoad:NewNotification({
    ["Mode"] = "Success",
    ["Title"] = string.format("%.2f",tick() - LoadingTime).." secs",
    ["Description"] = "Done, took load in.",
    ["Timeout"] = 5,
    ["Audio"] = false
})

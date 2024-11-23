--[[
https://raw.githubusercontent.com/Pri4c1lla/Storage/refs/heads/main/Source/Ninja%20Legends.lua
                                                     
              ,--.  ,---.       ,--.,--.,--.         
 ,---. ,--.--.`--' /    | ,---./   ||  ||  | ,--,--. 
| .-. ||  .--',--./  '  || .--'`|  ||  ||  |' ,-.  | 
| '-' '|  |   |  |'--|  |\ `--. |  ||  ||  |\ '-'  | 
|  |-' `--'   `--'   `--' `---' `--'`--'`--' `--`--' 
`--'                                                 

💕 (ห้ามเอาไปขาย หรือ obf / obfuscate)

]]

local function AuthTimes()
    if getgenv().AuthTime ~= nil then
        return getgenv().AuthTime
    else
        return tick()
    end
end

local LoadingTime = AuthTimes()

if getgenv().Shion_Loaded and not shared.Shion_Debug then
    return
end

pcall(function() getgenv().Shion_Loaded = true end)

local function run(func) func() end

-- wait for load
run(function()
	repeat
		wait()
	until game:IsLoaded()
	repeat
		wait()
	until game.Players
	repeat
		wait()
	until game.Players.LocalPlayer
	repeat
		wait()
	until game:GetService("ReplicatedStorage")
	repeat
		wait()
	until game:GetService("Players")
	repeat
		wait()
	until game:GetService("Players").LocalPlayer:FindFirstChildWhichIsA("PlayerGui")

end)

function randomString()
	local length = math.random(16,30)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

--[[
function randomStr()
    local str = ""
    for _ = 1, math.random(8,15) do
        str = str..string.char(math.random(97,122))
    end
    return str
end
]]

--// Var
local MainThread = loadstring(game:HttpGet("https://raw.githubusercontent.com/Milkytillys/Megumint-Utilities/refs/heads/main/ThreadLooper.lua"))()
shared.CreateThered = MainThread.new()

--local cloneref = cloneref or function(...) return ... end

local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local PlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local lp = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
local gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop
local getMouse = Players.LocalPlayer:GetMouse()
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())
local executor_used = tostring(identifyexecutor())

-- Marco Luraph
if not LPH_OBFUSCATED then
    LPH_JIT_MAX = (function(...) return ... end)
    LPH_JIT = (function(...) return ... end)
    LPH_NO_VIRTUALIZE = (function(...) return ... end)
    LPH_NO_UPVALUES = (function(...) return ... end) -- from hookmetamethod or upvalue function
end

-- random shit

local NotificationLoad = loadstring(game:HttpGet(('https://raw.githubusercontent.com/treeofplant/Notif/main/library.lua'),true))()

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

function random(min, max)
	return math.random(min, max)
end;

local random_index = random(1, #shared.Theme.Table)

local float
float = false

local infJump
infJumpDebounce = false

local noclipDefaults = {}
local movers = {}

local AreaCFrame = {
    [1] = CFrame.new(-119.522469, 13002.2637, 274.569244, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685), -- Evil 100
    [2] = CFrame.new(354.477539, 8874.26367, 116.569244, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685), -- Light 100
    [3] = CFrame.new(330.127533, 16921.8223, -16.1307545, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685), -- Evil 250
    [4] = CFrame.new(1848.47754, 82.2061615, -137.430756, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685), -- Light 1000
    [5] = CFrame.new(627.358643, 82.2061615, 2429.48657, -0.422592998, 0, -0.906319618, 0, 1, 0, 0.906319618, 0, -0.422592998), -- Evil 2000
    [6] = CFrame.new(330.127533, 30432.8242, -16.1307545, 0.342042685, -0, -0.939684391, 0, 1, -0, 0.939684391, 0, 0.342042685), -- Light 2000
    [7] = CFrame.new(1875.96692, 82.2061615, -6806.41016, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627), -- Evil 5000
    [8] = CFrame.new(5041.17725, 82.2061615, 1614.74866, 0.258864343, -0, -0.965913713, 0, 1, -0, 0.965913713, 0, 0.258864343), -- Light 5000
}

-- จริงๆ ไม่ต้องใช้ loadstring นอกก็ได้ (ก็เพิ่งจะนึกได้ 5555555)
local Element = loadstring(game:HttpGet("https://gist.githubusercontent.com/Pri4c1lla/ed34be9357bddcb2b28c6513c5621941/raw/ac26ebcc81d55b005845860079a0a7fb12f2101d/Element.lua"))()

shared.Yurikusa = {
    Main = {
        ["Velocity"] = "Shion_"..randomString(),
        ["Folder"] = "Shion_"..randomString()
    }
}

run(function()
    if not workspace:FindFirstChild(shared.Yurikusa.Main.Folder) then
        local Pri4cillT1x = Instance.new("Folder",workspace)
        Pri4cillT1x.Name = shared.Yurikusa.Main.Folder
        shared.Folder = Pri4cillT1x
    end
end)

--// Utility function or shity function i make.
local FineExecutors = {
    "Xeno", -- firetouchinterest is broken.
    "Forlorn", -- syn x remake. alot of crash and firetouchinterest is broken too. | ลาว(กาก)เหมือนกับ xeno
    "Solara" -- less crash. better than Syn x Remake, Xeno
}

run(function()
    warn("Your Executor is "..executor_used)
end)

local function getchar()
    return lp.Character or lp.CharacterAdded:Wait()
end

local function gethumanoidrootpart()
    return getchar():FindFirstChild("HumanoidRootPart")
end

function r15(plr) -- if (players) is R15 will return true if not then return false
	if plr.Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15 then
		return true
	end
end

local function Floating()
    float = true
    local Char = getchar()
    local floatName = randomString()
    if float and not Char:FindFirstChild(floatName) then
        task.spawn(function()
			local Float = Instance.new('Part')
			Float.Name = floatName
			Float.Parent = Char
			Float.Transparency = 1
            if not r15(lp) then
                Float.Size = Vector3.new(25,0.1,25)
            else
                Float.Size = Vector3.new(25,0.2,25)
            end
			Float.Anchored = true
			local FloatValue = -3.1
			Float.CFrame = gethumanoidrootpart().CFrame * CFrame.new(0,FloatValue,0)
            qUp = getMouse.KeyUp:Connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue + 0.5
				end
			end)
			eUp = getMouse.KeyUp:Connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue - 0.5
				end
			end)
			qDown = getMouse.KeyDown:Connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue - 0.5
				end
			end)
			eDown = getMouse.KeyDown:Connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue + 0.5
				end
			end)
            floatDied = lp.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
                Float:Destroy()
                qUp:Disconnect()
                eUp:Disconnect()
                qDown:Disconnect()
                eDown:Disconnect()
                floatDied:Disconnect()
            end)
            if float and Char:FindFirstChild(floatName) then
                repeat task.wait()
                    pcall(function()
                        Float.CFrame = gethumanoidrootpart().CFrame * CFrame.new(0,FloatValue,0)
                        for _,child in pairs(lp.Character:GetDescendants()) do
                            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                                child.CanCollide = false
                            end
                        end
                    end)
                until not float or not lp.Character:FindFirstChildOfClass("Humanoid") or lp.Character.Humanoid.Health <= 0
                Float:Destroy()
            end
        end)
    end
end

--// All Configuration Below Here.

local MinimizeKey = getgenv().MinimizeKey

shared.Mizekey = {
    ["MinimizeKey"] = MinimizeKey or Enum.KeyCode.RightShift
}

shared.SettingUi = {};

shared.SettingUi = {
    ["TabWidth"] = 160,
    ["Size"] = { 580, 460 },
    ["Theme"] = random_index,
    ["Acrylic"] = true,
    ["Transparency"] = true,
    ["MinimizeKey"] = shared.Mizekey.MinimizeKey,
}

shared.tables = {
    Table = {
        ["Players"] = {},
        ["Shop"] = {},
        ["Island"] = {},
        ["Crystal"] = {},
        ["SellArea"] = {},
        ["Boss"] = {},
        ["Ranks"] = {}
    }
}

run(function()
    local success,result = pcall(function()

        for i,v in next, Players:GetPlayers() do
            table.insert(shared.tables.Table.Players, v.Name)
        end

        for i,v in pairs(workspace:FindFirstChild("islandUnlockParts"):GetChildren()) do
            table.insert(shared.tables.Table.Island, v.Name)
        end

        for i,v in pairs(workspace.mapCrystalsFolder:GetChildren()) do
            table.insert(shared.tables.Table.Crystal, v.Name)
        end

        for i,v in pairs(workspace.sellAreaCircles:GetChildren()) do
            table.insert(shared.tables.Table.SellArea, v.Name)
        end

        for i,v in pairs(workspace.shopAreaCircles:GetChildren()) do
            table.insert(shared.tables.Table.Shop, v.Name)
        end

        for i,v in pairs(workspace.bossFolder:GetChildren()) do
            table.insert(shared.tables.Table.Boss, v.Name)
        end

        for i,v in pairs(ReplicatedStorage.Ranks.Ground:GetChildren()) do
            table.insert(shared.tables.Table.Ranks, v.Name)
        end

    end)
    if success then
        return
    else
        return("Error: "..result)
    end
end)

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
        ["open"] = false
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

local MainUi = httprequest({
    Url = "https://raw.githubusercontent.com/SixZensED/Scripts/main/main.lua",
    Method = "GET"
})
if MainUi.StatusCode == 200 then
    shared.Fluent = getfenv().loadstring(MainUi.Body)()
end

--// Addon function
local function FireTouchPart(Part: BasePart)
	local TouchTransmitter = Part:FindFirstChildOfClass("TouchTransmitter")
	if not TouchTransmitter then return end

	local Root = gethumanoidrootpart()

	if firetouchinterest then
        if not IsOnMobile and executor_used ~= FineExecutors then
            firetouchinterest(Root, Part, 0)
            task.wait()
            firetouchinterest(Root, Part, 1)
        elseif executor_used == FineExecutors then
            firetouchinterest(Root, Part, 1)
            task.wait(.1)
        else
            firetouchinterest(Root, Part, 0)
            task.wait()
            firetouchinterest(Root, Part, 1)
        end
    else
        return("Failed to firetouchinterest / Missing FireTouchInterest")
    end
end

local function GetSword()
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

local function GetLastIsland()
	return shared.tables.Table.Island[#shared.tables.Table.Island]
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

local function GetChestName()
    for _,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and string.match(v.Name,"Chest") and not string.match(v.Name,"group") and not string.match(v.Name,"evil") and not string.match(v.Name,"light") and v.circleSignPart.signGui.timeLabel.text == "Ready To Collect" then
            return v
        end
    end
    return nil
end

local function CallNinjaEvent(com,...)
    local Remote = lp:WaitForChild(com)
    if Remote:IsA("RemoteEvent") then
        Remote:FireServer(...)
    elseif Remote:IsA("RemoteFunction") then
        Remote:InvokeServer(...)
    end
end

local function EquipShuriken()
    for _,v in pairs(lp:FindFirstChildOfClass("Backpack"):GetDescendants()) do
        if string.match(tostring(v.Name),"Shuriken") then return v end
    end
    return nil
end

--! UI Initializer
run(function()
    local Fluent = shared.Fluent
    local Options = Fluent.Options

    local Window = Fluent:CreateWindow({
        Title = "ninja Legends | 11/20/2024",
        SubTitle = "By Shion",
        TabWidth = shared.SettingUi.TabWidth,
        Size = UDim2.fromOffset(table.unpack(shared.SettingUi.Size)),
        Theme = shared.SettingUi.Theme,
        Acrylic = shared.SettingUi.Acrylic,
        MinimizeKey = shared.SettingUi.MinimizeKey
    })

    shared.Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "component" }),
        Boss = Window:AddTab({ Title = "Boss", Icon = "swords" }),
        Players = Window:AddTab({ Title = "Players", Icon = "users" }),
        Eggs = Window:AddTab({ Title = "Eggs", Icon = "egg" }),
        Teleports = Window:AddTab({ Title = "Teleports", Icon = "terminal" }),
        Misc = Window:AddTab({ Title = "Misc", Icon = "align-left" }),
    }

    local Tabs = shared.Tabs -- i just lazy

    local AutoSwing = Tabs.Main:AddToggle("", {Title = "Auto Swing", Description = "not syncing with client. idk why", Default = false})
    AutoSwing:OnChanged(function(v)
        Script.Main.swing = v
    end)

    local buyswords = Tabs.Main:AddToggle("", {Title = "auto buy swords", Description = "", Default = false})
    buyswords:OnChanged(function(v)
        Script.Main.sword = v
        pcall(function()
            if Script.Main.sword then
                shared.CreateThered:newThread(.1,function(self)
                    if not Script.Main.sword then
                        self:Disable()
                    end
                    CallNinjaEvent("ninjaEvent","buyAllSwords",GetLastIsland())
                end)
            end
        end)
    end)

    local buybelts = Tabs.Main:AddToggle("", {Title = "auto buy belts", Description = "", Default = false})
    buybelts:OnChanged(function(v)
        Script.Main.belts = v
        pcall(function()
            if Script.Main.belts then
                shared.CreateThered:newThread(.1,function(self)
                    if not Script.Main.belts then
                        self:Disable()
                    end
                    CallNinjaEvent("ninjaEvent","buyAllBelts",GetLastIsland())
                end)
            end
        end)
    end)

    local buyskills = Tabs.Main:AddToggle("", {Title = "auto buy skills", Description = "", Default = false})
    buyskills:OnChanged(function(v)
        Script.Main.skills = v
        pcall(function()
            if Script.Main.skills then
                shared.CreateThered:newThread(.1,function(self)
                    if not Script.Main.skills then
                        self:Disable()
                    end
                    CallNinjaEvent("ninjaEvent","buyAllSkills",GetLastIsland())
                end)
            end
        end)
    end)

    local buyshurikens = Tabs.Main:AddToggle("", {Title = "auto buy shurikens", Description = "", Default = false})
    buyshurikens:OnChanged(function(v)
        Script.Main.shurikens = v
        pcall(function()
            if Script.Main.shurikens then
                shared.CreateThered:newThread(.1,function(self)
                    if not Script.Main.shurikens then
                        self:Disable()
                    end
                    CallNinjaEvent("ninjaEvent","buyAllShurikens",GetLastIsland())
                end)
            end
        end)
    end)

    local AutoRanks = Tabs.Main:AddToggle("", {Title = "Auto Ranks", Description = "", Default = false})
    AutoRanks:OnChanged(function(v)    
        Script.Main.Ranks = v
        pcall(function()
            if Script.Main.Ranks then
                shared.CreateThered:newThread(.25,function(self)
                    if not Script.Main.Ranks  then
                        self:Disable()
                    end
                    for _, v in next, shared.tables.Table.Ranks do
                        CallNinjaEvent("ninjaEvent","buyRank", v)
                        wait()
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
                                ReplicatedStorage:WaitForChild("rEvents"):FindFirstChild("elementMasteryEvent"):FireServer(Elements)
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

    local CollectChests = Tabs.Main:AddToggle("", {Title = "Collect All Chests", Description = "Collecting is find (maybe😂)", Default = false})
    CollectChests:OnChanged(function(v)
        Script.Main.Chest = v
        pcall(function()
            if Script.Main.Chest then
                shared.CreateThered:newThread(.1,function(self)
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
            if Script.Main.Chi and getgenv().AllowBackOldPos then
                oldpos = gethumanoidrootpart().CFrame
            else
                gethumanoidrootpart().CFrame = oldpos
            end
        end)
    end)

    local AutoHoops = Tabs.Main:AddToggle("", {Title = "Auto Hoops", Description = "(Depend On Ping) delay is 0.1", Default = false})
    AutoHoops:OnChanged(function(v)
        Script.Main.Hoops = v
        if Script.Main.Hoops then
            shared.CreateThered:newThread(.25,function(self)
                if not Script.Main.Hoops then
                    self:Disable()
                end
                for _, v in pairs(workspace.Hoops:GetChildren()) do
                    if v:IsA("MeshPart") then
                        if v:FindFirstChild("beingUsed") then return end
                        task.defer(function()
                            local oldpostouchPart = v.touchPart.CFrame
                            v.touchPart.CFrame = gethumanoidrootpart().CFrame
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
        Values = shared.tables.Table.Shop,
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
                if string.find(v.Name,Script.Main.typeshop) then
                    FireTouchPart(v.circleInner)
                end
            end
        end
    })

    local SEC = Tabs.Main:AddDropdown("", {
        Title = "Sell Area",
        Description = "Select a Sell Part",
        Values = shared.tables.Table.SellArea,
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
                shared.CreateThered:newThread(nil,function(self)
                    if not Script.Main.Sell then
                        self:Disable()
                    end
                    if Script.Main.typeSell == "Instant" then
                        for i,v in pairs(workspace.sellAreaCircles:GetChildren()) do
                            if string.find(v.Name,Script.Main.SellPart) then
                                FireTouchPart(v.circleInner)
                            end
                        end
                    elseif Script.Main.typeSell == "Full(max)" then
                        if PlayerGui.gameGui.maxNinjitsuMenu.Visible ~= false then
                            for i,v in pairs(workspace.sellAreaCircles:GetChildren()) do
                                if string.find(v.Name,Script.Main.SellPart) then
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
        pcall(function()
            if Script.Main.Wheel then
                shared.CreateThered:newThread(.5,function(self)
                    if not Script.Main.Wheel then
                        self:Disable()
                    end
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("openFortuneWheelRemote"):InvokeServer("openFortuneWheel",workspace:WaitForChild("Fortune Wheel"))
                end)
            end
        end)
    end)

    local SB = Tabs.Boss:AddDropdown("Dropdown", {
        Title = "Select Boss",
        Values = shared.tables.Table.Boss,
        Multi = false,
        Default = 1,
    })

    SB:SetValue(nil)

    SB:OnChanged(function(v)
        Script.Boss.SelectBoss = v
    end)

    Tabs.Boss:AddButton({
        Title = "Update Boss",
        Description = "reset dropdown",
        Callback = function()
            SB:Clear()
            wait(.1)
            for i,v in pairs(workspace.bossFolder:GetChildren()) do
                SB:Add(v.Name)
            end
        end
    })

    local KillBoss = Tabs.Boss:AddToggle("", {Title = "Kill Boss", Default = false })
    KillBoss:OnChanged(function(v)
        Script.Boss.KillBoss = v
        pcall(function()
            if Script.Boss.KillBoss then
                getgenv().needatk = true
            else
                getgenv().needatk = false
            end
        end)
    end)
    
    local InstantBoss = Tabs.Boss:AddToggle("", {Title = "Instant Kill Boss", Description = "get close to boss, to work.", Default = false })
    InstantBoss:OnChanged(function(v)
        Script.Boss.InstantBoss = v
    end)
    
    local InstantAllBoss = Tabs.Boss:AddToggle("", {Title = "Kill All Boss", Description = "get close to boss, to work.", Default = false })
    InstantAllBoss:OnChanged(function(v)
        Script.Boss.InstantAllBoss = v
    end)
    
    local SelectPlr = Tabs.Players:AddDropdown("SelectedPlyer", {
        Title = "Players",
        Values = shared.tables.Table.Players,
        Multi = false,
        Default = 1,
    })
    
    SelectPlr:SetValue("nil")
    
    SelectPlr:OnChanged(function(Value)
        Script.Players.SelectPlayers = Value
    end)
    
    Tabs.Players:AddButton({
        Title = "Refresh Dropdown",
        Description = "Update Players (Lag if Players > 6)",
        Callback = function()
            SelectPlr:Clear()
            wait(.1)
            for _,v in next, Players:GetPlayers() do
                SelectPlr:Add(v.Name)
            end
        end
    })
    
    local SpectatePly = Tabs.Players:AddToggle("ToggleQuanSat", {
        Title = "Spectate Player",
        Default = false
    })
    SpectatePly:OnChanged(function(Value)
        Script.Players.IsSpectator = Value
    end)
    
    local Teleport2Lp = Tabs.Players:AddToggle("ToggleTeleport", {
        Title = "Teleport to Players",
        Default = false
    })
    
    Teleport2Lp:OnChanged(function(Value)
        Script.Players.TeleportPlayers = Value
    end)
    
    Options.ToggleTeleport:SetValue(false)
    
    local Jumped = Tabs.Players:AddSlider("", {
        Title = "Jumppower",
        Description = "",
        Default = 100,
        Min = 50,
        Max = 1000,
        Rounding = 10,
        Callback = function(Value)
            Script.Players.JumpValue = Value / 2
        end
    })
    
    Jumped:SetValue(30)
    
    Jumped:OnChanged(function(Value)
        Script.Players.JumpValue = Value
    end)
    
    local Setloop222 = Tabs.Players:AddToggle("L_542_", {Title = "Jumppower", Description = "", Default = false})
    Setloop222:OnChanged(function(Value)
        Script.Players.JumpToggle = Value
    end)

    local infJumpes = Tabs.Players:AddToggle("", {Title = "inf Jump", Description = "", Default = false})
    infJumpes:OnChanged(function(v)
        getgenv().faGStOFQ6W = v
        if getgenv().faGStOFQ6W then
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
                        if (shared.AngularVC.Parent ~= nil and shared.FlightGyro.Parent ~= nil and shared.FlightBV.Parent ~= nil) then
                            shared.AngularVC.Parent = nil;
                            shared.FlightGyro.Parent = nil;
                            shared.FlightBV.Parent = nil;
                            getchar():FindFirstChildOfClass("Humanoid").PlatformStand = false;
                        end
                    end)
                end)
            end
        end,
    })

    local FlyToggle = Tabs.Players:AddToggle("FlyingMoblie", {Title = "Fly", Description = "Toggle Fly For Mobile Users", Default = false })
    FlyToggle:OnChanged(function(v)
        Script.Players.flightmb = v
        if Script.Players.flightmb and IsOnMobile and not shared.Shion_Debug then
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
                    if (shared.AngularVC.Parent ~= nil and shared.FlightGyro.Parent ~= nil and shared.FlightBV.Parent ~= nil) then
                        shared.AngularVC.Parent = nil;
                        shared.FlightGyro.Parent = nil;
                        shared.FlightBV.Parent = nil;
                        getchar():FindFirstChildOfClass("Humanoid").PlatformStand = false;
                    end
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
    
    local Platformv = Tabs.Players:AddToggle("", {Title = "Platform", Description = "bring part to your beneath you causing you to float", Default = false})
    Platformv:OnChanged(function(v)
        getgenv().Float = v
        pcall(function()
            if getgenv().Float and not float then
                Floating()
            else
                float = false
            end
        end)
    end)

    local SelectIsland = Tabs.Teleports:AddDropdown("Island", {
        Title = "Select Islands to Teleport",
        Values = shared.tables.Table.Island,
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
                    gethumanoidrootpart().CFrame = v.CFrame * CFrame.new(0,15,0)
                end
            end
        end
    })
    
    Tabs.Teleports:AddButton({
        Title = "Unlock All Island",
        Description = "",
        Callback = function()
            for _,index in next, shared.tables.Table.Island do
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
                    gethumanoidrootpart().CFrame = AreaCFrame[1]
                elseif Script.Teleports.SelectArea == "-250 Karma" then
                    gethumanoidrootpart().CFrame = AreaCFrame[3]
                elseif Script.Teleports.SelectArea == "-+2000 Karma" then
                    gethumanoidrootpart().CFrame = AreaCFrame[5]
                elseif Script.Teleports.SelectArea == "-+5000 Karma" then
                    gethumanoidrootpart().CFrame = AreaCFrame[7]
                end
            elseif Script.Teleports.TypeKarma == "Light" then
                if Script.Teleports.SelectArea == "-+100 Karma" then
                    gethumanoidrootpart().CFrame = AreaCFrame[2]
                elseif Script.Teleports.SelectArea == "+1000 Karma" then
                    gethumanoidrootpart().CFrame = AreaCFrame[4]
                elseif Script.Teleports.SelectArea == "-+2000 Karma" then
                    gethumanoidrootpart().CFrame = AreaCFrame[6]
                elseif Script.Teleports.SelectArea == "-+5000 Karma" then
                    gethumanoidrootpart().CFrame = AreaCFrame[8]
                end
            end
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Teleport Dojo",
        Description = "Teleporting to Infinty Stats Dojo",
        Callback = function()
            gethumanoidrootpart().CFrame = workspace.areaTeleportParts.valleyToInfinityStatsDojo.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Teleport Altar",
        Description = "Teleporting to altar Of Elements",
        Callback = function()
            gethumanoidrootpart().CFrame = workspace.areaTeleportParts.valleyToAltarOfElements.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Teleport Cloneing Altar",
        Description = "Teleporting to Pet Cloning Altar",
        Callback = function()
            gethumanoidrootpart().CFrame = workspace.areaTeleportParts.valleyToCloningAltar.CFrame
        end
    })

    local TeleportEgg = Tabs.Eggs:AddDropdown("Eggss", {
        Title = "Select To Teleport",
        Values = shared.tables.Table.Crystal,
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
            gethumanoidrootpart().CFrame = workspace.mapCrystalsFolder[Script.Eggs.SelectTeleport]:GetModelCFrame() * CFrame.new(0,5,0)
        end
    })
    
    local Eggs = Tabs.Eggs:AddDropdown("Eggs", {
        Title = "Select Egg",
        Values = shared.tables.Table.Crystal,
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

    local abop = Tabs.Misc:AddToggle("", {Title = "Allow Return Old Position", Description = "work with all function that mention save old position.", Default = true })
    abop:OnChanged(function(v)
        getgenv().AllowBackOldPos = v
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
        Description = "this update(11/23/2024)max jump is 50",
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
                local hrp = gethumanoidrootpart()
                if hrp then
                    local cf = getgenv().MainPart.CFrame * CFrame.new(0,3,0)
                    hrp.CFrame = cf
                end
            end
        end
    })

    run(function()
        NotificationLoad:NewNotification({
            ["Mode"] = "Info",
            ["Title"] = "all tabs is loaded, please wait.",
            ["Description"] = "",
            ["Timeout"] = 5,
            ["Audio"] = false
        })
    end)

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

LPH_JIT_MAX(function()

    RunService.Heartbeat:Connect(function()

        pcall(function()

            if Script.Main.swing or getgenv().needatk then
                if lp.Character then
                    local Humanoid = lp.Character.Humanoid
                    local get_sword = GetSword()
                    if (get_sword ~= nil and get_sword.Parent ~= nil) then
                        if get_sword.Parent == lp.Character then
                            task.spawn(function()
                                get_sword:Activate()
                                get_sword:Deactivate()
                                CallNinjaEvent("ninjaEvent","swingKatana")
                            end)
                        elseif get_sword.Parent == lp.Backpack then
                            Humanoid:EquipTool(get_sword)
                        end
                    end
                end
            end

            if Script.Main.Chi then
                local chi = findchi()
                gethumanoidrootpart().CFrame = chi.CFrame
            end

            if Script.Boss.KillBoss then
                for i,v in pairs(workspace.bossFolder:GetChildren()) do
                    if v.Name == Script.Boss.SelectBoss and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") then
                        gethumanoidrootpart().CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,math.random(5),math.random(3))
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

                        shared.FlightBV = bodyVelocity
                        shared.FlightGyro = bodyGyro
                        shared.AngularVC = bodyAngularVelocity
                    end
            
                    if Script.Main.flight or Script.Players.flightmb then
                        local camCFrame = Camera.CFrame
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
            
                        if not getgenv().fling then
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
                            bv.Velocity = getgenv().PositionTarget * math.random(10000)
						end
					end
				end
            end

            if Script.Misc.KillAura then
                for _,v in next, Players:GetPlayers() do
                    if v.Name ~= lp.Name then
                        local i = (v.Character:FindFirstChild("HumanoidRootPart").Position - gethumanoidrootpart().Position).magnitude
                        if i <= Script.Misc.RangeRadius and not v.Character:FindFirstChild("inSafezone") and not getchar():FindFirstChild("inSafezone") then
                            getgenv().PositionTarget = v.Character:FindFirstChild("HumanoidRootPart").Position
                            local x = EquipShuriken()
                            if x ~= nil then
                                x.Parent = getchar()
                                wait()
                                local args = {
                                    [1] = "attackShuriken",
                                    [2] = v.Character:FindFirstChild("HumanoidRootPart").Position
                                }
                                CallNinjaEvent("ninjaEvent",unpack(args)) 
                            end
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

            if Script.Players.IsSpectator then
                repeat wait()
                    Camera.CameraSubject = Players:FindFirstChild(Script.Players.SelectPlayers).Character:FindFirstChildOfClass("Humanoid")
                until not Players:FindFirstChild(Script.Players.SelectPlayers) or not Script.Players.IsSpectator
                Camera.CameraSubject = lp.Character:FindFirstChildOfClass("Humanoid")
                wait()
            end
    
            if Script.Players.TeleportPlayers then
                repeat wait()
                    gethumanoidrootpart().CFrame = Players:FindFirstChild(Script.Players.SelectPlayers).Character.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
                until not Players:FindFirstChild(Script.Players.SelectPlayers) or Script.Players.TeleportPlayers == false or not Script.Players.TeleportPlayers
                wait()
            end

        end)

    end)

end)()

--// Safe part
LPH_NO_VIRTUALIZE(function()
	run(function()

        local no_part,yes_part = pcall(function()
-- update for debug
            assert(not getgenv().SafePart)
            getgenv().SafePart = true;
            getgenv().MainPart = Instance.new("Part",shared.Folder)
            getgenv().MainPart.Anchored = true
            getgenv().MainPart.Size = Vector3.new(150,1,150)
            local r = math.random(10000)
            local cf = Vector3.new(35e+3,35e+3,35e+3) + Vector3.new(r,r,r) -- 35e+3 = 35000
            getgenv().MainPart.CFrame = CFrame.new(cf)
            getgenv().MainPart.Material = Enum.Material.ForceField

            shared.CreateThered:newThread(.25,function(self)
                getgenv().MainPart.Name = game:GetService("HttpService"):GenerateGUID(false)
                getgenv().MainPart.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            end)

        end)

        if no_part and not yes_part then
            print("Client created safe part")
        end
        if yes_part then
            print("Client has safe part already")
        end

    end)
end)()

LPH_NO_VIRTUALIZE(function()
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
                        if lp.Character:FindFirstChild("HumanoidRootPart") then

                            if not lp.Character.HumanoidRootPart:FindFirstChild(shared.Yurikusa.Main.Velocity) then
                                if lp.Character:WaitForChild("Humanoid").Sit == true then
                                    lp.Character:WaitForChild("Humanoid").Sit = false
                                end
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand ~= true then
                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = true
                                end
                                local Velocity = Instance.new("BodyVelocity",gethumanoidrootpart()) -- Set Parent to Humanoidrootpart
                                Velocity.Name = shared.Yurikusa.Main.Velocity
                                Velocity.MaxForce = Vector3.new(9e9,9e9,9e9);
                                Velocity.Velocity = Vector3.new(0,0,0);
                            end
                            for _, part in pairs(lp.Character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    if noclipDefaults[part] == nil then
                                        task.wait()
                                        noclipDefaults[part] = part.CanCollide
                                    else
                                        if not Script.Main.Chi or not Script.Boss.KillBoss or lp.Character:FindFirstChildWhichIsA("Humanoid").Health == 0
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
                            if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(shared.Yurikusa.Main.Velocity) then
                                game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(shared.Yurikusa.Main.Velocity):Destroy();
                                wait()
                            end
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand ~= false then
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = false
                                wait()
                            end
                        end
                    end)
                end
            end)
        end)
    end)
end)()

LPH_NO_VIRTUALIZE(function()
	run(function()
        pcall(function()
            
            warn("Unlocked Some Gamepass (Client)")
            for _,v in pairs(ReplicatedStorage.gamepassIds:GetChildren()) do
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
end)()

-- remove ads
LPH_NO_VIRTUALIZE(function()
	run(function()
        if lp:WaitForChild("adsAllowed").Value ~= false then
            lp:WaitForChild("adsAllowed").Value = false
        end
    end)
end)()

--[[
LPH_NO_VIRTUALIZE(function()
	run(function()
		RunService.Stepped:Connect(function()

            pcall(function()

                if setscriptable then
                    setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
                end

                if sethidden then
                    sethidden(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                end

            end)

		end)
	end)
end)()
]]

-- for config~
LPH_NO_VIRTUALIZE(function()
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
                    VirtualUser:Button2Down(Vector2.new(0,0),Camera.CFrame)
                    wait(1)
                    VirtualUser:Button2Up(Vector2.new(0,0),Camera.CFrame)
                end)
            end

        end)
    end)
end)()

print("Load Script Success in "..string.format("%.2f",tick() - LoadingTime).." secs")

NotificationLoad:NewNotification({
    ["Mode"] = "Success",
    ["Title"] = string.format("%.2f",tick() - LoadingTime).." secs",
    ["Description"] = "Done, took load in.",
    ["Timeout"] = 5,
    ["Audio"] = false
})

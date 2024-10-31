local LoadingTime = getgenv().AuthTime or tick()

local function run(func) func() end

-- wait for load
run(function()

    repeat wait() until game:IsLoaded()
    repeat wait() until game.Players
    repeat wait() until game.Players.LocalPlayer
    repeat wait() until game:GetService("ReplicatedStorage")
    repeat wait() until game:GetService("Players").LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
    repeat wait() until game:GetService("Players")

end)

run(function()
    local suc , fail = pcall(function() return setreadonly(task,false) end)
    if suc then
        return getgenv().setreadonly
    else
        return getgenv().setreadonly
    end
    print(getgenv().setreadonly)
end)

function randomString()
	local length = math.random(16,30)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

function randomStr()
    local str = ""
    for _ = 1, math.random(8,15) do
        str = str..string.char(math.random(97,122))
    end
    return str
end

--// variable and service
local MainThread = loadstring(game:HttpGet("https://raw.githubusercontent.com/Milkytillys/Megumint-Utilities/refs/heads/main/ThreadLooper.lua"))()
shared.CreateThered = MainThread.new()

local cloneref = cloneref or function(...) return ... end

local Players = cloneref(game:GetService("Players"))
local workspace = cloneref(game:GetService("Workspace"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local PlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
local Lighting = cloneref(game:GetService("Lighting"))
local RunService = cloneref(game:GetService("RunService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local TweenService = cloneref(game:GetService("TweenService"))

local lp = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
local gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop
local getMouse = Players.LocalPlayer:GetMouse()
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())
local executor_used = tostring(identifyexecutor())
origsettings = {abt = Lighting.Ambient, oabt = Lighting.OutdoorAmbient, brt = Lighting.Brightness, time = Lighting.ClockTime, fe = Lighting.FogEnd, fs = Lighting.FogStart, gs = Lighting.GlobalShadows}

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

-- lazy to obfuscate
local Element = loadstring(game:HttpGet("https://gist.githubusercontent.com/Pri4c1lla/ed34be9357bddcb2b28c6513c5621941/raw/ac26ebcc81d55b005845860079a0a7fb12f2101d/Element.lua"))()

shared.Yurikusa = {
    Main = {
        ["Velocity"] = randomString(),
        ["Folder"] = randomString()
    }
}

run(function()
    if not workspace:FindFirstChild(shared.Yurikusa.Main.Folder) then
        local Pri4cillT1x = Instance.new("Folder")
        Pri4cillT1x.Name = shared.Yurikusa.Main.Folder
        Pri4cillT1x.Parent = workspace
    end
end)

--// Utility function or shity function i make.

local function getchar()
    return lp.Character or lp.CharacterAdded:Wait()
end

local function gethumanoidrootpart()
    return getchar():FindFirstChild("HumanoidRootPart")
end

function r15(plr)
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

--// All Configuration and Table(Main table) Below Here.

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

shared.YuriTables = {
    Table = {
        ["Players"] = {},
        ["Shop"] = {},
        ["Island"] = {},
        ["Crystal"] = {},
        ["SellArea"] = {},
        ["Boss"] = {},
        ["Ranks"] = {},
        ["Chest"] = {}
    }
}

run(function()
    local success,result = pcall(function()

        task.defer(function()

            for _,v in next, Players:GetPlayers() do
                table.insert(shared.YuriTables.Table.Players, v.Name)
            end
    
            for i,v in pairs(workspace:FindFirstChild("islandUnlockParts"):GetChildren()) do
                table.insert(shared.YuriTables.Table.Island, v.Name)
            end
    
            for i,v in pairs(workspace.mapCrystalsFolder:GetChildren()) do
                table.insert(shared.YuriTables.Table.Crystal, v.Name)
            end
    
            for i,v in pairs(workspace.sellAreaCircles:GetChildren()) do
                table.insert(shared.YuriTables.Table.SellArea, v.Name)
            end
    
            for i,v in pairs(workspace.shopAreaCircles:GetChildren()) do
                table.insert(shared.YuriTables.Table.Shop, v.Name)
            end
    
            for i,v in pairs(workspace.bossFolder:GetChildren()) do
                table.insert(shared.YuriTables.Table.Boss, v.Name)
            end
    
            for i,v in pairs(ReplicatedStorage.Ranks.Ground:GetChildren()) do
                table.insert(shared.YuriTables.Table.Ranks, v.Name)
            end
    
            for i,v in pairs(ReplicatedStorage.chestRewards:GetChildren()) do
                table.insert(shared.YuriTables.Table.Chest, v.Name)
            end

        end)

    end)
    if success then
        print("Done")
    else
        print("Error: "..result)
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
        ["FastSwing"] = false,
        ["KillAura"] = false
    },
}

local MainUi = httprequest({
    Url = "https://raw.githubusercontent.com/SixZensED/Scripts/main/main.lua",
    Method = "GET"
})
if MainUi.StatusCode == 200 then
    shared.Fluent = getfenv().loadstring(MainUi.Body)()
    print(shared.Fluent)
end

--// Addon function not in Main

local SkidExecutor = {
    "Xeno",
    "Solara"
}

local function FireTouchPart(Part: BasePart) -- local function FireTouchPart(Part: BasePart). fuck you 
	local TouchTransmitter = Part:FindFirstChildOfClass("TouchTransmitter")
	if not TouchTransmitter then return end

	local Root = gethumanoidrootpart()

	if firetouchinterest then
        if not IsOnMobile and executor_used ~= SkidExecutor then
            firetouchinterest(Root, Part, 0)
            task.wait()
            firetouchinterest(Root, Part, 1)
        elseif executor_used == SkidExecutor then
            firetouchinterest(Root, Part, 1)
            task.wait()
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

local function random_number(min, max)
	return math.random(min, max)
end

local function GetLastIsland()
	return shared.YuriTables.Table.Island[#shared.YuriTables.Table.Island]
end

--! UI Initializer
task.defer(function()
    local Fluent = shared.Fluent
    local Options = Fluent.Options

    local Window = Fluent:CreateWindow({
        Title = "ninja Legends | 10/22/2024",
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

    local Tabs = shared.Tabs -- i just lazy to change Tabs to shared.Tabs.

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
                    game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer("buyAllSwords",GetLastIsland())
                end)
            end
        end)
    end)

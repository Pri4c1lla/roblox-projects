-- in development.....

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

function randomString()
	local length = math.random(16,30)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

--// Var
local MainThread = loadstring(game:HttpGet("https://raw.githubusercontent.com/Milkytillys/Megumint-Utilities/refs/heads/main/ThreadLooper.lua"))()
shared.CreateThered = MainThread.new()
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local PlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local lp = Players.LocalPlayer
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
local gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop
local getMouse = Players.LocalPlayer:GetMouse()
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())

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

shared.Mains = {
    Table = {
        ["Players"] = {},
        ["Weapon"] = {}
    }
}

run(function()
    local success,result = pcall(function()

        for _,v in next, Players:GetPlayers() do
            table.insert(shared.Mains.Table.Players, v.Name)
        end

        for _,v in pairs(ReplicatedStorage.Weapons:GetChildren()) do
            if v:IsA("Tool") then
                table.insert(shared.Mains.Table.Weapon, v.Name)
            end
        end

    end)
    if success then
        return
    else
        print("Error: "..result)
    end
end)

local Script = {
    Main = {
        ["Sample"] = false,
        ["Collect"] = false,
        ["Deposit"] = false,
        ["Upgrade"] = false,
        ["Merge"] = false,
        ["Drops"] = false,
        ["Candy"] = false,
        ["Defense"] = false
    },
    Misc = {
        ["SelectWeapon"] = {},
        ["KillAura"] = false,
        ["LoopKill"] = false,
        ["Killzombies"] = false,
        ["KillBoss"] = false
    },
    Config = {
        ["Parameter"] = {}
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
    }
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

local function FireTouchPart(Part: BasePart) -- local function FireTouchPart(Part: BasePart). fuck you 
	local TouchTransmitter = Part:FindFirstChildOfClass("TouchTransmitter")
	if not TouchTransmitter then return end

	local Root = gethumanoidrootpart()

	if firetouchinterest and not IsOnMobile then
        firetouchinterest(Root, Part, 1)
        wait()
    elseif firetouchinterest and IsOnMobile then
        firetouchinterest(Root, Part, 0)
        wait()
        firetouchinterest(Root, Part, 1)
    else
        return print("Executor is not support function firetouchinterest.")
    end
end

local function GetTycoon()
    for i,v in pairs(game:GetService("Workspace").Tycoon.Tycoons:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Owner") then
            if v:FindFirstChild("Owner").Value == game:GetService("Players").LocalPlayer then
                return v.Name
            end
        end
    end
end

local function TReturnV()
    for i,v in ipairs(lp.Backpack:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == Script.Misc.SelectWeapon then
            return v
        end
    end
    for i,v in ipairs(getchar():GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == Script.Misc.SelectWeapon then
            return v
        end
    end
    return nil
end

local function Equip_()
    if getchar() ~= nil then
        local Humanoid = getchar().Humanoid
        local ReturnedValue = TReturnV()
        if ReturnedValue ~= nil then
            if ReturnedValue.Parent == getchar() then
                ReturnedValue:Activate()
                ReturnedValue:Deactivate()
            elseif ReturnedValue.Parent == lp.Backpack then
                Humanoid:EquipTool(ReturnedValue)
            end
        end
    end
end

local requirename = GetTycoon()

--! UI Initializer

run(function()
    local Fluent = shared.Fluent
    local Options = Fluent.Options

    local Window = Fluent:CreateWindow({
        Title = "Merge Toy | 10/~/2024",
        SubTitle = "By Shion",
        TabWidth = shared.SettingUi.TabWidth,
        Size = UDim2.fromOffset(table.unpack(shared.SettingUi.Size)),
        Theme = shared.SettingUi.Theme,
        Acrylic = shared.SettingUi.Acrylic,
        MinimizeKey = shared.SettingUi.MinimizeKey
    })

    shared.Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "component" }),
        Misc = Window:AddTab({ Title = "Misc", Icon = "align-left" }),
        Con = Window:AddTab({ Title = "Configuration", Icon = "package-check" })
    }

    local Tabs = shared.Tabs -- i just lazy to change Tabs to shared.Tabs.

    local Sample = Tabs.Main:AddToggle("", {Title = "Get Sample", Default = false })
    Sample:OnChanged(function(v)
        Script.Main.Sample = v
    end)

    local Collect = Tabs.Main:AddToggle("", {Title = "Auto Collect Sample", Default = false })
    Collect:OnChanged(function(v)
        Script.Main.Collect = v
    end)

    local Deposit = Tabs.Main:AddToggle("", {Title = "Auto Deposit", Default = false })
    Deposit:OnChanged(function(v)
        Script.Main.Deposit = v
    end)

    local Upgrade = Tabs.Main:AddToggle("", {Title = "Auto Upgrade", Default = false })
    Upgrade:OnChanged(function(v)
        Script.Main.Upgrade = v
    end)

    local Merge = Tabs.Main:AddToggle("", {Title = "Auto Merge", Default = false })
    Merge:OnChanged(function(v)
        Script.Main.Merge = v
    end)

    local Drops = Tabs.Main:AddToggle("", {Title = "Collect Drops", Default = false })
    Drops:OnChanged(function(v)
        Script.Main.Drops = v
    end)

    local Candy = Tabs.Main:AddToggle("", {Title = "Collect Candy", Default = false })
    Candy:OnChanged(function(v)
        Script.Main.Candy = v
    end)

    local Defense = Tabs.Main:AddToggle("", {Title = "Auto Defense", Default = false })
    Defense:OnChanged(function(v)
        Script.Main.Defense = v
    end)

    local SelectedWeapon = Tabs.Misc:AddDropdown("", {
        Title = "Select Weapon",
        Values = shared.Mains.Table.Weapon,
        Multi = false,
        Default = 1,
    })

    SelectedWeapon:SetValue("nil")

    SelectedWeapon:OnChanged(function(v)
        Script.Misc.SelectWeapon = v
    end)

    local SelectPlr = Tabs.Misc:AddDropdown("SelectedPlyer", {
        Title = "Players",
        Values = shared.Mains.Table.Players,
        Multi = false,
        Default = 1,
    })
    
    SelectPlr:SetValue("nil")
    
    SelectPlr:OnChanged(function(Value)
        Script.Players.SelectPlayers = Value
    end)
    
    Tabs.Misc:AddButton({
        Title = "Refresh Dropdown",
        Description = "Update Players",
        Callback = function()
            SelectPlr:Clear()
            wait(.1)
            for _,v in next, Players:GetPlayers() do
                SelectPlr:Add(v.Name)
            end
        end
    })

    local LoopKill = Tabs.Misc:AddToggle("", {Title = "Loop Kill Players", Description = "Select Players First", Default = false })
    LoopKill:OnChanged(function(v)
        Script.Misc.LoopKill = v
        while Script.Misc.LoopKill do task.wait(.1)
            pcall(function()
                Equip_()
            end)
        end
    end)

    local Killallplr = Tabs.Misc:AddToggle("", {Title = "Loop Kill All Players", Default = false })
    Killallplr:OnChanged(function(v)
        Script.Misc.KillAura = v
        while Script.Misc.KillAura do task.wait(.1)
            pcall(function()
                Equip_()
            end)
        end
    end)

    local KillBoss = Tabs.Misc:AddToggle("", {Title = "Kill Boss", Default = false })
    KillBoss:OnChanged(function(v)
        Script.Misc.KillBoss = v
        while Script.Misc.KillBoss do task.wait(.1)
            pcall(function()
                Equip_()
            end)
        end
    end)

    local Killzombies = Tabs.Misc:AddToggle("", {Title = "Loop Kill All Zombies", Default = false })
    Killzombies:OnChanged(function(v)
        Script.Misc.Killzombies = v
        while Script.Misc.Killzombies do task.wait(.1)
            pcall(function()
                Equip_()
            end)
        end
    end)

    Tabs.Con:AddParagraph({
        Title = "Guns Mod",
        Content = ""
    })

    local SetConfiguration = Tabs.Con:AddDropdown("", {
        Title = "Configuration",
        Values = {"Damage", "Firerate", "HeadshotMultiplier", "ReloadTime"},
        Multi = false,
        Default = 1,
    })

    SetConfiguration:SetValue("nil")

    SetConfiguration:OnChanged(function(v)
        Script.Config.Parameter = v
    end)

    Tabs.Con:AddButton({
        Title = "Got it",
        Description = "Very important button",
        Callback = function()
            getchar():FindFirstChildOfClass('Humanoid'):UnequipTools()
            wait()
            for _,v in pairs(lp.Backpack:GetDescendants()) do
                if v:IsA("Tool") and v.Name ~= "CrowBar" then
                    if Script.Config.Parameter == "Firerate" then
                        v.Configuration[Script.Config.Parameter].Value = 0
                    elseif Script.Config.Parameter == "ReloadTime" then
                        v.Configuration[Script.Config.Parameter].Value = 0
                    else
                        v.Configuration[Script.Config.Parameter].Value = math.huge
                    end
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
            
            if Script.Main.Sample then
                local args = {
                    [1] = 17, -- specific number
                    [2] = gethumanoidrootpart().Position * Vector3.new(9e9,9e9,9e9)
                }
                ReplicatedStorage.Signals.RemoteEvents.GetWoolRemote:FireServer(unpack(args))
            end

            if Script.Main.Collect then
                for _,v in pairs(workspace.Tycoon.Tycoons[requirename].Drops:GetChildren()) do
                    if v:IsA("Model") then
                        v.Wool.CFrame = gethumanoidrootpart().CFrame
                        task.wait()
                    end
                end
            end

            if Script.Main.Deposit then
                ReplicatedStorage.Signals.RemoteEvents.PutRemote:FireServer()
            end

            if Script.Main.Upgrade then
                for _,v in pairs(workspace.Tycoon.Tycoons[requirename]["Buttons_E"].Upgrade.Head:GetChildren()) do
                    FireTouchPart(v.Parent)
                end
            end

            if Script.Main.Merge then
                for _,v in pairs(workspace.Tycoon.Tycoons[requirename]["Buttons_E"].Merge.Head:GetChildren()) do
                    FireTouchPart(v.Parent)
                end
            end

            if Script.Main.Drops then
                for _,v in pairs(workspace:GetChildren()) do
                    if v.Name == "Money" then
                        v.CanCollide = false
                        v.CFrame = gethumanoidrootpart().CFrame
                        task.wait()
                    end
                end
            end

            if Script.Main.Candy then
                for _,v in pairs(workspace:GetChildren()) do
                    if v.Name == "Candy_Reward" then
                        v.CanCollide = false
                        v.Part.CanCollide = false
                        v.Part.CFrame = gethumanoidrootpart().CFrame
                        task.wait()
                    end
                end
            end

            if Script.Main.Defense then
                --workspace.Tycoon.Tycoons.F.Round.Pistol
                for _,v in pairs(workspace.Tycoon.Tycoons[requirename].Round:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildWhichIsA("Humanoid") then
                        v:FindFirstChildWhichIsA("Humanoid").Health = 0
                    end
                end
            end

            if Script.Misc.KillAura then
                for _,v in next, Players:GetPlayers() do
                    if v.Name ~= lp.Name then
                        local args = {
                            [1] = v.Character:FindFirstChildWhichIsA("Humanoid"),
                            [2] = math.huge
                        }
                        getchar()[Script.Misc.SelectWeapon].Remotes.TakeDamage:FireServer(unpack(args))
                    end
                end
            end

            if Script.Misc.LoopKill then
                for _,v in next, Players:GetPlayers() do
                    if v.Name == Script.Players.SelectPlayers then
                        if Script.Players.SelectPlayers == lp.Name then return end -- stop silly user.
                        local args = {
                            [1] = v.Character:FindFirstChildWhichIsA("Humanoid"),
                            [2] = math.huge
                        }
                        getchar()[Script.Misc.SelectWeapon].Remotes.TakeDamage:FireServer(unpack(args))
                    end
                end
            end

            if Script.Misc.KillBoss then
                for i,v in pairs(workspace.Boss:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") then
                        local args = {
                            [1] = v.Humanoid,
                            [2] = math.huge
                        }
                        getchar()[Script.Misc.SelectWeapon].Remotes.TakeDamage:FireServer(unpack(args))
                    end
                end
            end

            if Script.Misc.Killzombies then
                for i,v in pairs(workspace.Enemy:GetDescendants()) do -- impossible to use GetChildren. if you use GetDescendants it little bit laging.
                    if v.Name == "AR" then
                        if v:FindFirstChildWhichIsA("Humanoid").Health == 0 then return end
                        if v:FindFirstChildWhichIsA("Humanoid").Health ~= 0 then
                            local args = {
                                [1] = v:FindFirstChildWhichIsA("Humanoid"),
                                [2] = math.huge
                            }
                            getchar()[Script.Misc.SelectWeapon].Remotes.TakeDamage:FireServer(unpack(args))
                        end
                    end
                end                
            end

        end)
    end)
end)()

LPH_NO_VIRTUALIZE(function()
	run(function()
		RunService.Heartbeat:Connect(function()

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

-- for config~
LPH_NO_VIRTUALIZE(function()
    run(function()
        pcall(function()

            warn("anti afk : Is fine")

            NotificationLoad:NewNotification({
                ["Mode"] = "info",
                ["Title"] = "Started Anti AFK",
                ["Description"] = "Thank for using my script. <3",
                ["Timeout"] = 6,
                ["Audio"] = false
            })
            

            local GC = getconnections or get_signal_cons

            if GC then
                for i,v in pairs(GC(lp.Idled)) do
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
end)()

print("Load Script Success in "..string.format("%.2f",tick() - LoadingTime).." secs")

NotificationLoad:NewNotification({
    ["Mode"] = "Success",
    ["Title"] = string.format("%.2f",tick() - LoadingTime).." secs",
    ["Description"] = "Done, took load in.",
    ["Timeout"] = 5,
    ["Audio"] = false
})

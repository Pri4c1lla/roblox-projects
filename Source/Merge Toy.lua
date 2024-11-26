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

--// Var
local MainThread = loadstring(game:HttpGet("https://raw.githubusercontent.com/Milkytillys/Megumint-Utilities/refs/heads/main/ThreadLooper.lua"))()
shared.CreateThered = MainThread.new()

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

function random(x, e)
	return math.random(x, e)
end;

local random_index = random(1, #shared.Theme.Table)

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
        ["Weapon"] = {}
    }
}

run(function()
    local success,result = pcall(function()

        for i,v in next, Players:GetPlayers() do
            table.insert(shared.tables.Table.Players, v.Name)
        end

        for _,v in pairs(ReplicatedStorage.Weapons:GetChildren()) do
            if v:IsA("Tool") then
                table.insert(shared.tables.Table.Weapon, v.Name)
            end
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
        ["Drop"] = false,
        ["Collent"] = false,
        ["Deposit"] = false,
        ["Upgrade"] = false,
        ["Merge"] = false,
        ["Drops"] = false,
        ["Candy"] = false
    },
    Misc = {
        ["SelectWeapon"] = {},
        ["Defense"] = false,
        ["KillAura"] = false,
        ["LoopKill"] = false,
        ["Killsoldier"] = false,
        ["KillBoss"] = false
    },
    Config = {
        ["Parameter"] = {}
    },
    Players = {
        ["IsSpectator"] = false,
        ["TeleportPlayers"] = false,
        ["SpectatePlayers"] = false
    }
}

-- load ui
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

local function ReturnToolNames()
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

local function EquipTools()
    if getchar() ~= nil then
        local Humanoid = getchar().Humanoid
        local ReturnedValue = ReturnToolNames()
        if (ReturnedValue ~= nil and ReturnedValue.Parent ~= nil) then
            if ReturnedValue.Parent == getchar() then
                ReturnedValue:Activate()
                ReturnedValue:Deactivate()
            elseif ReturnedValue.Parent == lp.Backpack then
                Humanoid:EquipTool(ReturnedValue)
            end
        end
    end
end

shared.Tycoon = GetTycoon()

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

    local Drop = Tabs.Main:AddToggle("", {Title = "Get Drop", Default = false })
    Drop:OnChanged(function(v)
        Script.Main.Drop = v
    end)

    local Collect = Tabs.Main:AddToggle("", {Title = "Auto Collect Parts", Default = false })
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

    local SelectedWeapon = Tabs.Misc:AddDropdown("", {
        Title = "Select Weapon",
        Values = shared.tables.Table.Weapon,
        Multi = false,
        Default = 1,
    })

    SelectedWeapon:SetValue("nil")

    SelectedWeapon:OnChanged(function(v)
        Script.Misc.SelectWeapon = v
    end)

    local SelectPlr = Tabs.Misc:AddDropdown("SelectedPlyer", {
        Title = "Players",
        Values = shared.tables.Table.Players,
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
            task.wait(.1)
            for _,v in next, Players:GetPlayers() do
                SelectPlr:Add(v.Name)
            end
        end
    })

    local Defense = Tabs.Misc:AddToggle("", {Title = "Auto Defense", Default = false })
    Defense:OnChanged(function(v)
        Script.Misc.Defense = v
        while Script.Misc.Defense do task.wait(.1)
            pcall(function()
                EquipTools()
            end)
        end
    end)

    local LoopKill = Tabs.Misc:AddToggle("", {Title = "Loop Kill Players", Description = "Select Players First", Default = false })
    LoopKill:OnChanged(function(v)
        Script.Misc.LoopKill = v
        while Script.Misc.LoopKill do task.wait(.1)
            pcall(function()
                EquipTools()
            end)
        end
    end)

    local Killallplr = Tabs.Misc:AddToggle("", {Title = "Kill All Players", Default = false })
    Killallplr:OnChanged(function(v)
        Script.Misc.KillAura = v
        while Script.Misc.KillAura do task.wait(.1)
            pcall(function()
                EquipTools()
            end)
        end
    end)
    
    local KillBoss = Tabs.Misc:AddToggle("", {Title = "Kill Boss", Default = false })
    KillBoss:OnChanged(function(v)
        Script.Misc.KillBoss = v
        while Script.Misc.KillBoss do task.wait(.1)
            pcall(function()
                EquipTools()
            end)
        end
    end)

    local Killsoldier = Tabs.Misc:AddToggle("", {Title = "kill all soldier", Default = false })
    Killsoldier:OnChanged(function(v)
        Script.Misc.Killsoldier = v
        while Script.Misc.Killsoldier do task.wait(.1)
            pcall(function()
                EquipTools()
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
        Title = "got it",
        Description = "...",
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

            if Script.Main.Drop then
                local arg = {
                    [1] = 17,
                    [2] = gethumanoidrootpart().Position * Vector3.new(1e3,1e3,1e3)
                }
                ReplicatedStorage.Signals.RemoteEvents.GetWoolRemote:FireServer(unpack(arg))
            end

            if Script.Main.Collect then
                for _,v in pairs(workspace.Tycoon.Tycoons[shared.Tycoon].Drops:GetChildren()) do
                    if v:IsA("Model") then
                        v.Wool.CanCollide = false
                        v.Wool.CFrame = gethumanoidrootpart().CFrame
                        task.wait()
                    end
                end
            end

            if Script.Main.Deposit then
                ReplicatedStorage.Signals.RemoteEvents.PutRemote:FireServer()
            end

            if Script.Main.Upgrade then
                for _,v in pairs(workspace.Tycoon.Tycoons[shared.Tycoon]["Buttons_E"].Upgrade.Head:GetChildren()) do
                    FireTouchPart(v)
                end
            end

            if Script.Main.Merge then
                for _,v in pairs(workspace.Tycoon.Tycoons[shared.Tycoon]["Buttons_E"].Merge.Head:GetChildren()) do
                    FireTouchPart(v)
                end
            end

            if Script.Main.Drops then
                for i,v in pairs(workspace:GetChildren()) do
                    if string.find(v.Name,"Money") then
                        if v.CanCollide ~= false then v.CanCollide = false end
                        v.Position = gethumanoidrootpart().Position
                        task.wait()
                     end
                end
            end
--// FIXME: issue on tier 8, 
            if Script.Misc.Defense then
                for _,v in pairs(workspace.Tycoon.Tycoons[shared.Tycoon].Round:GetChildren()) do
                    if v:IsA("Model") then
                        if v:FindFirstChildWhichIsA("Humanoid") and v:FindFirstChildWhichIsA("Humanoid").Health ~= 0 then
                            local args = {
                                [1] = v:FindFirstChildWhichIsA("Humanoid"),
                                [2] = math.huge
                            }
                            getchar()[Script.Misc.SelectWeapon].Remotes.TakeDamage:FireServer(unpack(args))
                            task.wait()
                        end
                    end
                end
            end

            if Script.Misc.KillAura then
                for _,v in next, Players:GetPlayers() do
                    if v.Name ~= lp.Name and v.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 then
                        local args = {
                            [1] = v.Character:FindFirstChildWhichIsA("Humanoid"),
                            [2] = math.huge
                        }
                        getchar()[Script.Misc.SelectWeapon].Remotes.TakeDamage:FireServer(unpack(args))
                        task.wait()
                    end
                end
            end

            if Script.Misc.LoopKill then
                for _,v in next, Players:GetPlayers() do
                    if v.Name == Script.Players.SelectPlayers and v.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 then
                        if Script.Players.SelectPlayers == lp.Name then return end -- stop silly user.
                        local args = {
                            [1] = v.Character:FindFirstChildWhichIsA("Humanoid"),
                            [2] = math.huge
                        }
                        getchar()[Script.Misc.SelectWeapon].Remotes.TakeDamage:FireServer(unpack(args))
                        task.wait()
                    end
                end
            end

--// TODO: find Boss folder  -- workspace.BigBoss
            if Script.Misc.KillBoss then
                for i,v in pairs(workspace:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChildOfClass("Humanoid").Health ~= 0 and string.match(v.Name,"BigBoss") then
                        local args = {
                            [1] = v.Humanoid,
                            [2] = math.huge
                        }
                        getchar()[Script.Misc.SelectWeapon].Remotes.TakeDamage:FireServer(unpack(args))
                        task.wait()
                    end
                end
            end

            if Script.Misc.Killsoldier then
                for _, v in pairs(workspace.Enemy:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChildWhichIsA("Humanoid") and v:FindFirstChildWhichIsA("Humanoid").Health ~= 0 then
                        local args = {
                            [1] = v.Humanoid,
                            [2] = math.huge
                        }
                        getchar()[Script.Misc.SelectWeapon].Remotes.TakeDamage:FireServer(unpack(args))
                        task.wait()
                    end
                end
            end

        end)
    end)
end)()

LPH_NO_VIRTUALIZE(function()
    run(function()
        pcall(function()
            game.Players.LocalPlayer.ChildAdded:Connect(function(child)
                for _, part in pairs(lp.Character:GetDescendants()) do
                    local path = part:FindFirstChildOfClass("TouchTransmitter")
                    if not path then return end
                    v:Destroy()
                end
            end)
        end)
    end)
end)()

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

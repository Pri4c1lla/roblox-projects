local LoadingTime = tick()

local function run(func) func() end

local cloneref = cloneref or function(...) return ... end

local Players = cloneref(game:GetService("Players"));
local workspace = cloneref(game:GetService("Workspace"));

local Script = {
    Main = {
        ["Speed"] = false,
        ["SpeedPower"] = 2.5,
        ["SpeedType"] = "CFrame",
        ["KillAura"] = {},
    }
}

if not LPH_OBFUSCATED then
    LPH_JIT_MAX = (function(...) return ... end)
    LPH_NO_VIRTUALIZE = (function(...) return ... end)
    LPH_NO_UPVALUES = (function(...) return ... end) -- fix upvalues
    LPH_JIT = (function(...) return ... end)
end

local lp = Players.LocalPlayer
local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
local gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Scripts/main/main.lua"))()
local Options = Fluent.Options
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Themes = {
    Color = {
        "Dark",
        "Darker",
        "Aqua",
        "Amethyst",
        "Rose",
    }
}

_Random = math.random(1*5)

local MinimizeKey = getgenv().MinimizeKey

shared.Configs = {
    ["MinimizeKey"] = MinimizeKey or Enum.KeyCode.RightShift
}

print(shared.Configs.MinimizeKey)

local Window =
    Fluent:CreateWindow(
    {
        Title = "untitled trip game",
        SubTitle = "By pri4c1lla",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 400),
        Acrylic = true,
        Theme = Themes.Color[_Random],
        MinimizeKey = shared.Configs.MinimizeKey
    }
)

pcall(function()
    setreadonly(task,false)
end, function()
    return nil
end)

local NotificationLoad = loadstring(game:HttpGet(('https://raw.githubusercontent.com/treeofplant/Notif/main/library.lua'),true))()

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "component" }),
}

Tabs.Main:AddButton({
    Title = "Inf Stamina and Hunger",
    Description = "",
    Callback = function()
        for _,v in pairs(PlayerGui.main:GetChildren()) do
            if v:IsA("DoubleConstrainedValue") then
                if v.MaxValue ~= math.huge then
                    v.MaxValue = math.huge or 9e9
                end
                if v.Value ~= math.huge then
                    v.Value = math.huge or 9e9
                end
            end
        end
    end
})

local _Killaura = Tabs.Main:AddToggle("", {Title = "Aura", Description = "", Default = false})
_Killaura:OnChanged(function(Value)
    Script.Main.KillAura = Value
end)

local function Mons()
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildWhichIsA("Humanoid") and v:FindFirstChildWhichIsA("Humanoid").Health > 0 and v:FindFirstChild("AI") then
            return v
        end
    end
end

LPH_JIT_MAX(function()
    RunService.Heartbeat:Connect(function()

        pcall(function()

            if Script.Main.KillAura then
                if sethidden then
                    mons = Mons()
                    NotificationLoad:NewNotification({["Mode"] = "Success",["Title"] = "Killing Mons",["Description"] = "Detected Mons Name is " ..mons.Name,Duration,["Timeout"] = true,["Audio"] = false})
                    mons.Humanoid:ChangeState(15)
                    mons.Humanoid.Health = die
                    mons.Humanoid.Health = 0
                    sethidden(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    print(mons.Name.." Is Deaded")
                else
                    mons = Mons()
                    NotificationLoad:NewNotification({["Mode"] = "Success",["Title"] = "Killing Mons",["Description"] = "Detected Mons Name is " ..mons.Name,Duration,["Timeout"] = true,["Audio"] = false})
                    mons.Humanoid:ChangeState(15)
                    mons.Humanoid.Health = die
                    mons.Humanoid.Health = 0
                    print(mons.Name.." Is Deaded")
                end
            end

        end)

    end)
end)()

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

print("Load Script Success in "..string.format("%.2f",tick() - LoadingTime).." secs")
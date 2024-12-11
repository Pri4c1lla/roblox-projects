-- Xeno executor not work.

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

local cloneref = cloneref or function(...) return ... end

local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local PlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local lp = cloneref(Players.LocalPlayer)
local LocalPlayer = cloneref(game.Players.LocalPlayer)

local Camera = workspace.CurrentCamera
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
local gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop
local getMouse = LocalPlayer:GetMouse()
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())
local executor_used = tostring(identifyexecutor())

local function fileiswork(com)
    local x = httprequest({
        Url = "https://raw.githubusercontent.com/Pri4c1lla/roblox-projects/main/Assets/"..com..".lua",
        Method = "GET"
    })
    if x.StatusCode == 200 then
        return x.Body
    else
        assert(x,"file is removed or else.")
    end
end

local MainThread = getfenv().loadstring(fileiswork("ThreadLooper"))()
shared.CreateThered = MainThread.new()

if not LPH_OBFUSCATED then
    LPH_JIT_MAX = (function(...) return ... end)
    LPH_JIT = (function(...) return ... end)
    LPH_NO_VIRTUALIZE = (function(...) return ... end)
    LPH_NO_UPVALUES = (function(...) return ... end) -- from hookmetamethod or upvalue function
end

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

local random_theme = math.random(1, #shared.Theme.Table)

local float
float = false

local HumanModCons = {}
local noclipDefaults = {}
local movers = {}

function randomStr()
    local str = {}
    for k = 1, math.random(23,36) do
        str[k] = string.char(math.random(97,122))
    end
    return table.concat(str)
end

shared.Shion = {
    Main = {
        ["Velocity"] = randomStr(),
        ["Folder"] = randomStr()
    }
}

local function getchar()
    return lp.Character or lp.CharacterAdded:Wait()
end

local function hrp()
    return getchar():WaitForChild("HumanoidRootPart")
end

function r15(plr)
	if plr.Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15 then
		return true
	end
end

local function Floating()
    float = true
    local Char = getchar()
    local floatName = randomStr()
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
			Float.CFrame = hrp().CFrame * CFrame.new(0,FloatValue,0)
            local qUp; qUp = getMouse.KeyUp:Connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue + 0.5
				end
			end)
			local eUp; eUp = getMouse.KeyUp:Connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue - 0.5
				end
			end)
			local qDown; qDown = getMouse.KeyDown:Connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue - 0.5
				end
			end)
			local eDown; eDown = getMouse.KeyDown:Connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue + 0.5
				end
			end)
            local floatDied; floatDied = lp.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
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
                        Float.CFrame = hrp().CFrame * CFrame.new(0,FloatValue,0)
                        for _,child in pairs(lp.Character:GetDescendants()) do
                            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                                child.CanCollide = false
                            end
                        end
                    end)
                until not float or not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or LocalPlayer.Character.Humanoid.Health < 0
                Float:Destroy()
            end
        end)
    end
end

local MinimizeKey = getgenv().MinimizeKey or _G.MinimizeKey

shared.Mizekey = {
    ["MinimizeKey"] = MinimizeKey or Enum.KeyCode.RightShift
}

shared.SettingUi = {}; shared.SettingUi = {
    ["TabWidth"] = 160,
    ["Size"] = { 580, 460 },
    ["Theme"] = random_theme,
    ["Acrylic"] = true,
    ["Transparency"] = true,
    ["MinimizeKey"] = shared.Mizekey.MinimizeKey,
}

shared.tables = {
    Table = {
        ["Players"] = {},
        ["Structure"] = {},
        ["Tools"] = {}
    },
    Render = {
        Items = {"Bat","Bullets","Crowbar","Flashlight","Food","GPS","Handgun","Hammer","Medkit","Money","Lantern","Shotgun","Shells","Soda"}
    },
}

run(function()
    local success,result = pcall(function()

        for _,v in next, Players:GetPlayers() do
            table.insert(shared.tables.Table.Players, v.Name)
        end

        for _,v in next, workspace.Buildings:GetChildren() do
            if v:IsA("Model") then
                table.insert(shared.tables.Table.Structure, v.Name)
            end
        end

        for _,v in next, ReplicatedStorage.Tools:GetChildren() do
            if v:IsA("Tool") then
                table.insert(shared.tables.Table.Tools, v.Name)
            end
        end

    end)
    if success then
        return
    else
        return warn("Error: "..result)
    end
end)

local Script; Script = {
    Main = {
        ["WeaponsType"] = {},
        ["Respawn"] = false,
        ["Money"] = false,
        ["DelGEF"] = false,
        ["Damage"] = false,
        ["Target"] = false,
        ["RenderRadius"] = {},
        ["Aura"] = false,
        ["FakeAttack"] = false
    },
    Bring = {
        ["Items"] = {}
    },
    Misc = {
        ["ItemType"] = {},
        ["MethodType"] = {},
        ["SelectBuildings"] = {},
        ["IsBuildings"] = false,
        ["Fullbright"] = false,
        ["Nofog"] = false
    },
    Players = {
        ["Movement"] = false,
        ["Speedslider"] = {},
        ["SpeedType"] = "",
        ["flight"] = false,
        ["flightmb"] = false,
        ["FlySpeed"] = {},
        ["Noclip"] = false
    }
}

local x = httprequest({
    Url = "https://raw.githubusercontent.com/SixZensED/Scripts/main/main.lua",
    Method = "GET"
})
if x.StatusCode == 200 then
    shared.Fluent = getfenv().loadstring(x.Body)()
end

local networkownerswitch = tick()

local function isnetworkowner(part)
    local suc, res = pcall(function() return gethidden(part, "NetworkOwnershipRule") end)
	if suc and res == Enum.NetworkOwnership.Manual then
		sethidden(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
		networkownerswitch = tick() + 8
	end
	return networkownerswitch <= tick()
end

local function GetTools()
    for i,v in ipairs(lp.Backpack:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == Script.Main.WeaponsType then
            return v
        end
    end
    for i,v in ipairs(LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == Script.Main.WeaponsType  then
            return v
        end
    end
    return nil
end

local function EquipV()
    if getchar() then
        local Humanoid = getchar().Humanoid
        local get_ = GetTools()
        if (get_ ~= nil and get_.Parent ~= nil) then
            if get_.Parent == getchar() then
                task.spawn(function()
                    get_:Activate()
                    get_:Deactivate()
                end)
            elseif get_.Parent == lp.Backpack then
                Humanoid:EquipTool(get_)
            end
        end
    end
end

local function lookAt(Position)
    local Cam = workspace.CurrentCamera
    if Position then
        Cam.CFrame = CFrame.new(Cam.CFrame.Position, Position)
    end
end

local function SendKeyEvent(KeyCode)
    VirtualInputManager:SendKeyEvent(true, KeyCode, false, game)
    task.wait()
    VirtualInputManager:SendKeyEvent(false, KeyCode, false, game)
end

local function notification(...)
    game.StarterGui:SetCore("SendNotification", {
        Icon = "rbxassetid://9419562118";
        Title = "notif", 
        Text = ...,
    })
end

local function Remotes(file,com,...)
    if file ~= nil and com ~= nil then
        local Remote = ReplicatedStorage:WaitForChild(file):FindFirstChild(com)
        if Remote:IsA("RemoteEvent") then
            Remote:FireServer(...)
        elseif Remote:IsA("RemoteFunction") then
            Remote:InvokeServer(...)
        else
            return game.StarterGui:SetCore("SendNotification", {Icon = "rbxassetid://9419562118";Title = "Fire Remote : Error", Text = "unable to find remote >> "..com,})
        end
    else
        if file == nil then
            local Remote = ReplicatedStorage:WaitForChild(file)
            if Remote:IsA("RemoteEvent") then
                Remote:FireServer(...)
            elseif Remote:IsA("RemoteFunction") then
                Remote:InvokeServer(...)
            else
                return game.StarterGui:SetCore("SendNotification", {Icon = "rbxassetid://9419562118";Title = "Fire Remote : Error", Text = "unable to find remote >> "..file,})
            end
        end
    end
end

local function FireTouchPart(Part: BasePart)
	local TouchTransmitter = Part:FindFirstChildOfClass("TouchTransmitter")
	if not TouchTransmitter then return end

	local Root = hrp()

	if firetouchinterest then
        firetouchinterest(Root, Part, 0)
        task.wait()
        firetouchinterest(Root, Part, 1)
    else
        return notification("Executor is not support function firetouchinterest.")
    end
end

local function IsAlive()
    if LocalPlayer.Character.Humanoid.Health > 0 and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return true
    else
        return false
    end
end

local function getClosestTarget() -- this function took me 2 hour to fix
    local nearestTarget = nil
    local shortestDistance = Script.Main.RenderRadius or math.huge
    for _,v in pairs(workspace.GEFs:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Head") and v:FindFirstChild("Health").Value ~= 0 and IsAlive() then
            local distance = (v:FindFirstChild("Head").Position - hrp().Position).Magnitude
            if distance < shortestDistance then
                nearestTarget = v
            end
        end
    end
    return nearestTarget
end

local function checkHealthy()
    for _,v in pairs(workspace.GEFs:GetChildren()) do
        if v:FindFirstChild("Health") and v:FindFirstChild("Health").Value < 0 then
            v:Destroy()
        end
    end
end

local executor; executor = {
    "Solara",
    "Xeno",
    "Forlorn"
}

local function executor_check()
    for index,used in next, executor do
        if executor_used == used then
            return used
        end
    end
    return nil
end

local GameInfo = MarketplaceService:GetProductInfo(game.PlaceId)

run(function()
    local Fluent = shared.Fluent
    local Options = Fluent.Options

    local Window = Fluent:CreateWindow({
        Title = `{GameInfo.Name}`,
        SubTitle = `By github.com/Pri4c1lla/roblox-projects`,
        TabWidth = shared.SettingUi.TabWidth,
        Size = UDim2.fromOffset(table.unpack(shared.SettingUi.Size)),
        Theme = shared.SettingUi.Theme,
        Acrylic = shared.SettingUi.Acrylic,
        MinimizeKey = shared.SettingUi.MinimizeKey
    })

    shared.Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "component" }),
        Bring = Window:AddTab({ Title = "Bring Items", Icon = "package-plus" }),
        Misc = Window:AddTab({ Title = "Misc // Visuals", Icon = "eye-off" }),
        Players = Window:AddTab({ Title = "Players", Icon = "users" }),
    }

    local Tabs = shared.Tabs

    local SelectWeapons = Tabs.Main:AddDropdown("", {
        Title = "Select Weapons",
        Values = {"Bat","Crowbar"},
        Multi = false,
        Default = 1,
    })
    
    SelectWeapons:SetValue("Bat")
    
    SelectWeapons:OnChanged(function(v)
        Script.Main.WeaponsType = v
    end)

    local Autorespawn = Tabs.Main:AddToggle("Autorespawn", {Title = "Auto respawn", Default = false})
    Autorespawn:OnChanged(function(v)
        Script.Main.Respawn = v
    end)

    local CollectMoney = Tabs.Main:AddToggle("Auto Collect Money", {Title = "Auto collect money", Default = false})
    CollectMoney:OnChanged(function(v)
        Script.Main.Money = v
        if Script.Main.Money then
            oldpos = hrp().CFrame
        end
        while Script.Main.Money do task.wait()
            if Script.Main.Money then
                pcall(function()
                    if lp.DevCameraOcclusionMode ~= Enum.DevCameraOcclusionMode.Invisicam then
                        lp.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam 
                    end
                    if workspace.Pickups:FindFirstChild("Money") then
                        lp.CameraMaxZoomDistance = 0
                    elseif not workspace.Pickups:FindFirstChild("Money") then
                        lp.CameraMaxZoomDistance = 9e9
                    end
                end)
            else
                hrp().CFrame = oldpos
                if lp.DevCameraOcclusionMode ~= Enum.DevCameraOcclusionMode.Zoom then
                    lp.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Zoom 
                end
                workspace.CurrentCamera:remove()
                wait(.1)
                repeat wait() until lp.Character ~= nil
                workspace.CurrentCamera.CameraSubject = LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
                workspace.CurrentCamera.CameraType = "Custom"
                lp.CameraMinZoomDistance = 0.5
                lp.CameraMaxZoomDistance = 400
                lp.CameraMode = "Classic"
                LocalPlayer.Character.Head.Anchored = false
                game.StarterGui:SetCore("SendNotification", {
                    Icon = "rbxassetid://9419562118";
                    Title = "Notification", 
                    Text = "Reset cam",
                })
            end
        end
    end)

    local DelGEF = Tabs.Main:AddToggle("", {Title = "No GEF", Description = "(Client Side) Delete GEF from workspace", Default = false})
    DelGEF:OnChanged(function(v)
        Script.Main.DelGEF = v
    end)
    
    local Damage = Tabs.Main:AddToggle("", {Title = "no damage", Description = "No longer takes damage from GEF", Default = false})
    Damage:OnChanged(function(v)
        Script.Main.Damage = v
    end)
    
    local Target = Tabs.Main:AddToggle("", {Title = "Invisible / ghost", Description = "Remove target from GEF", Default = false})
    Target:OnChanged(function(v)
        Script.Main.Target = v
    end)

    local RenderRadius = Tabs.Main:AddSlider("Range", {
        Title = "RenderRadius",
        Description = "Range",
        Default = 0,
        Min = 1,
        Max = 250,
        Rounding = 10,
        Callback = function(v)
            Script.Main.RenderRadius = v
        end
    })
    
    RenderRadius:OnChanged(function(v)
        Script.Main.RenderRadius = v
    end)
    
    RenderRadius:SetValue(60)
    Script.Main.RenderRadius = 60 -- update value broken by getClosestTarget()

    local killgef = Tabs.Main:AddToggle("", {Title = "Aura", Description = "Auto attack GEF if in radius", Default = false})
    killgef:OnChanged(function(v)
        Script.Main.Aura = v
        pcall(function()
            if Script.Main.Aura then
                shared.CreateThered:newThread(0,function(self)
                    if not Script.Main.Aura then
                        self:Disable()
                    end
                    local target = getClosestTarget()
                    if target and IsAlive() then
                        EquipV()
                        if target:FindFirstChild("Hitbox").CanCollide ~= true then
                            target:FindFirstChild("Hitbox").CanCollide = true
                        end
                        if LocalPlayer.Character:FindFirstChild(Script.Main.WeaponsType) then
                            if LocalPlayer.Character:FindFirstChild(Script.Main.WeaponsType):WaitForChild("Handle").CanCollide ~= false then
                                LocalPlayer.Character:FindFirstChild(Script.Main.WeaponsType):WaitForChild("Handle").CanCollide = false
                            end
                            if LocalPlayer.Character:FindFirstChild(Script.Main.WeaponsType).Damage.Value ~= 9e9 then
                                LocalPlayer.Character:FindFirstChild(Script.Main.WeaponsType).Damage.Value = 9e9
                            end
                            LocalPlayer.Character:FindFirstChild(Script.Main.WeaponsType):WaitForChild("Handle").Position = target:FindFirstChild("Hitbox").Position
                        end
                    end
                end)
            end
        end)
    end)

    local FakeAttack = Tabs.Main:AddToggle("FakeAttack", {Title = "Fake attack", Description = "not work with No damage", Default = false})
    FakeAttack:OnChanged(function(v)
        Script.Main.FakeAttack = v
        pcall(function()
            if Script.Main.FakeAttack and not Script.Main.Damage then
                shared.CreateThered:newThread(.3,function(self)
                    if not Script.Main.FakeAttack then
                        self:Disable()
                    end
                    for _,v in pairs(workspace.GEFs:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("Head") and v:FindFirstChild("Hitbox") and v:FindFirstChild("Hurtbox") and v.Health.Value ~= 0 then
                            if v:FindFirstChild("Hitbox").CanCollide ~= false and not IsOnMobile and executor_used == executor_check() then
                                v.Hitbox.CanCollide = false
                            end
                            FireTouchPart(v:FindFirstChild("Hurtbox"))
                        end
                    end
                end)
            end
        end)
    end)

    local BringItems = Tabs.Bring:AddDropdown("Select", {
        Title = "Select items to bring",
        Values = shared.tables.Render.Items,
        Multi = false,
        Default = 1,
    })
    
    BringItems:SetValue("nil")
    
    BringItems:OnChanged(function(v)
        Script.Bring.Items = v
    end)

    Tabs.Bring:AddButton({
        Title = "Click to bring",
        Description = "only bring item in 200 (distance)",
        Callback = function()
            pcall(function()
                if lp.Character ~= nil and sethidden then
                    for _,v in pairs(workspace.Pickups:GetChildren()) do
                        if v.Name == Script.Bring.Items and isnetworkowner(v) then
                            local getlp = getchar():GetPivot()
                            if lp:DistanceFromCharacter(v.Position) < 200 then
                                v:PivotTo(getlp)
                                sethidden(lp, "SimulationRadius", math.huge)
                                task.wait()
                            else
                                game.StarterGui:SetCore("SendNotification", {
                                    Icon = "rbxassetid://9419562118",
                                    Title = Script.Bring.Items .. " not found",
                                    Text =  "or item is too far",
                                    Duration = 2,
                                    Button1 = "got it"
                                });
                            end
                        end
                    end
                else
                    for _,v in pairs(workspace.Pickups:GetChildren()) do
                        if v.Name == Script.Bring.Items and isnetworkowner(v) then
                            local getlp = getchar():GetPivot()
                            if lp:DistanceFromCharacter(v.Position) < 200 then
                                v:PivotTo(getlp)
                                task.wait()
                            else
                                game.StarterGui:SetCore("SendNotification", {
                                    Icon = "rbxassetid://9419562118",
                                    Title = Script.Bring.Items .. " not found",
                                    Text =  "or item is too far",
                                    Duration = 2,
                                    Button1 = "got it"
                                });
                            end
                        end
                    end
                end
            end)
        end
    })

    Tabs.Bring:AddButton({
        Title = "Teleport To Items",
        Description = "Teleport to items and return old position",
        Callback = function()
            pcall(function()
                for _,v in pairs(workspace.Pickups:GetChildren()) do
                    if string.find(v.Name,Script.Bring.Items) and isnetworkowner(v) then
                        task.defer(function()
                            getgenv().needSendKey = true
                            currentPos = hrp().CFrame
                            lookAt(v.Position)
                            hrp().CFrame = v.CFrame * CFrame.new(0,1,0)
                            wait(1)
                            hrp().CFrame = currentPos
                            getgenv().needSendKey = false
                        end)
                    end
                end
            end)
        end
    })
    
    Tabs.Bring:AddButton({
        Title = "Bring all item",
        Description = "Ignore distance",
        Callback = function()
            pcall(function()
                local getlp = getchar():GetPivot()
                for _,v in pairs(workspace.Pickups:GetChildren()) do
                    if v:IsA("MeshPart") and isnetworkowner(v) then
                        v:PivotTo(getlp)
                        task.wait()
                    end
                end
            end)
        end
    })

    local MethodinfStamina = Tabs.Misc:AddDropdown("Method", {
        Title = "Select Method (Inf Stamina)",
        Values = {"Normal","hookmetamethod"},
        Multi = false,
        Default = 1,
    })
    
    MethodinfStamina:SetValue("Normal")
    
    MethodinfStamina:OnChanged(function(v)
        Script.Misc.MethodType = v
    end)

    Tabs.Misc:AddButton({
        Title = "Inf stamina",
        Description = "",
        Callback = function()
            if Script.Misc.MethodType == "Normal" then
                shared.CreateThered:newThread(0.1,function(self)
                    if lp.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                        local Energy = lp.Character:WaitForChild("Energy")
                        Energy.Value = math.huge
                    else
                        self:Disable()
                    end
                end)
            elseif Script.Misc.MethodType == "hookmetamethod" then
                if hookmetamethod then
                    local Energy = lp.Character:WaitForChild("Energy")
                    local old; old = hookmetamethod(game, "__index", function(self,v)
                        if self == Energy and v == "Value" then
                            return math.huge
                        end
                        return old(self,v)
                    end)
                else
                    return notification("Executor issue","Your exploit does not supported (missing hookmetamethod)")
                end
            else
                shared.CreateThered:newThread(0.1,function(self)
                    if IsAlive() then
                        local Energy = lp.Character:WaitForChild("Energy")
                        Energy.Value = math.huge
                    else
                        self:Disable()
                    end
                end)
            end
        end
    })

    local BuildingsTP = Tabs.Misc:AddDropdown("Selected", {
        Title = "Select Buildings to Teleport",
        Values = shared.tables.Table.Structure,
        Multi = false,
        Default = 1,
    })
    
    BuildingsTP:SetValue("nil")
    
    BuildingsTP:OnChanged(function(Value)
        Script.Misc.SelectBuildings = Value
    end)

    local Teleport2Buildings = Tabs.Misc:AddToggle("", {Title = "Click to Teleport", Default = false})
    Teleport2Buildings:OnChanged(function(Value)
        Script.Misc.IsBuildings = Value
    end)

    local Toolsed = Tabs.Misc:AddDropdown("CloneTools", {
        Title = "Get Items",
        Values = shared.tables.Table.Tools,
        Multi = false,
        Default = 1,
    })
    
    Toolsed:SetValue(nil)
    
    Toolsed:OnChanged(function(v)
        Script.Misc.ItemType = v
    end)
    
    Tabs.Misc:AddButton({
        Title = "Get items",
        Description = "no damage all item",
        Callback = function()
            pcall(function()
                local ToolsToClone = ReplicatedStorage.Tools:FindFirstChild(Script.Misc.ItemType)
                if ToolsToClone then
                    local Tools = ToolsToClone:Clone()
                    Tools.Parent = Players.LocalPlayer.Backpack
                end
            end)
        end
    })

    Tabs.Misc:AddButton({
        Title = "No Tools",
        Description = "Clear all item in inventory / Backpack",
        Callback = function()
            pcall(function()
                if sethidden then
                    for i,v in pairs(lp:FindFirstChildOfClass("Backpack"):GetDescendants()) do
                        if v:IsA('Tool') or v:IsA('HopperBin') then
                            v:Destroy()
                            sethidden(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                    for i,v in pairs(lp.Character:GetDescendants()) do
                        if v:IsA('Tool') or v:IsA('HopperBin') then
                            v:Destroy()
                            sethidden(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                else
                    for i,v in pairs(lp:FindFirstChildOfClass("Backpack"):GetDescendants()) do
                        if v:IsA('Tool') or v:IsA('HopperBin') then
                            v:Destroy()
                        end
                    end
                    for i,v in pairs(lp.Character:GetDescendants()) do
                        if v:IsA('Tool') or v:IsA('HopperBin') then
                            v:Destroy()
                        end
                    end
                end
            end)
        end
    })

    local nofog = Tabs.Misc:AddToggle("", {Title = "No fog", Default = false})
    nofog:OnChanged(function(v)
        Script.Misc.Nofog = v
    end)
    
    local fullbrightness = Tabs.Misc:AddToggle("", {Title = "Full brightness", Default = false})
    fullbrightness:OnChanged(function(v)
        Script.Misc.Fullbright = v
    end)

    Tabs.Misc:AddButton({
        Title = "Remove Tree",
        Description = "",
        Callback = function()
            pcall(function()
                repeat task.wait() -- MeshPart
                    local Trees = workspace:FindFirstChild("TreesNo")
                    for _,v in pairs(Trees:GetChildren()) do
                        if v:IsA("MeshPart") then
                            v:Destroy()
                        end
                    end
                until not Trees:FindFirstChild("Tree")
            end)
        end
    })

    Tabs.Misc:AddButton({
        Title = "Remove All Planks",
        Description = "",
        Callback = function()
            pcall(function()
                for i,v in pairs(workspace.Planks:GetChildren()) do
                    if v:IsA("Part") then
                        v:Destroy()
                    end
                end
            end)
        end
    })
    
    Tabs.Misc:AddButton({
        Title = "Get Candy Cane",
        Description = "Secret item",
        Callback = function()
            pcall(function()
                shared.CreateThered:newThread(0.1,function(self)
                    local CandyCane = PlayerGui:WaitForChild("Candy Cane")
                    if CandyCane then
                        local Tools = CandyCane:Clone()
                        Tools.Parent = Players.LocalPlayer.Backpack
                    end
                end,1)
            end)
        end
    })

    local SpeedKeybind = Tabs.Players:AddKeybind("Flying", {
        Title = "Speed",
        Mode = "Toggle",
        Description = "Keybind",
        Default = "C",
        Callback = function(v)
            Script.Players.Movement = v
            if Script.Players.Movement and Script.Players.SpeedType == "Bypass" then
                local Char = lp.Character or workspace:FindFirstChild(lp.Name)
                local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
                local function WalkSpeedChange()
                    if Char and Human then
                        Human.WalkSpeed = Script.Players.SpeedPower * 100
                    end
                end
                WalkSpeedChange()
                HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
                HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or lp.CharacterAdded:Connect(function(nChar)
                    Char, Human = nChar, nChar:WaitForChild("Humanoid")
                    WalkSpeedChange()
                    HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
                end)
            else
                if not Script.Players.Movement then
                    HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or nil
                    HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or nil
                end
            end
        end,
    })

    local SpeedUp = Tabs.Players:AddToggle("", {Title = "Speed", Default = false })
    SpeedUp:OnChanged(function(v)
        Script.Players.Movement = v
        if Script.Players.Movement and Script.Players.SpeedType == "Bypass" then
            local Char = lp.Character or workspace:FindFirstChild(lp.Name)
            local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
            local function WalkSpeedChange()
                if Char and Human then
                    Human.WalkSpeed = Script.Players.SpeedPower * 100
                end
            end
            WalkSpeedChange()
            HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
            HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or lp.CharacterAdded:Connect(function(nChar)
                Char, Human = nChar, nChar:WaitForChild("Humanoid")
                WalkSpeedChange()
                HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
            end)
        else
            if not Script.Players.Movement then
                HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or nil
                HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or nil
            end
        end
    end)

    local ToogleTypeSP = Tabs.Players:AddDropdown("Speed Toggle", {
        Title = "Method",
        Values = {"CFrame","Bypass"},
        Multi = false,
        Default = 1,
    })
    
    ToogleTypeSP:SetValue("CFrame")
    
    ToogleTypeSP:OnChanged(function(v)
        Script.Players.SpeedType = v
    end)

    local SliderSpeed = Tabs.Players:AddSlider("Slider", {
        Title = "Make Your Walk Faster",
        Description = "Depend On your fps😂",
        Default = 2,
        Min = 3,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            Script.Players.SpeedPower = Value / 40
        end
    })
    
    SliderSpeed:OnChanged(function(Value)
        Script.Players.SpeedPower = Value / 40
    end)
    
    SliderSpeed:SetValue(8)

    local FlysKeybind = Tabs.Players:AddKeybind("Flying", {
        Title = "flight",
        Mode = "Toggle",
        Description = "Noclip Built In",
        Default = "N",
        Callback = function(v)
            Script.Players.flight = v
            if Script.Players.flight then
                while Script.Players.flight do task.wait()
                    local character = getchar()
                    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.PlatformStand = Script.Players.flight
                    end
                end
            else
                run(function()
                    pcall(function()
                        shared.AngularVC.Parent = nil
                        shared.FlightGyro.Parent = nil
                        shared.FlightBV.Parent = nil
                        getchar():FindFirstChildOfClass("Humanoid").PlatformStand = false;
                    end)
                end)
            end
        end,
    })

    local FlyToggle = Tabs.Players:AddToggle("FlyingMoblie", {Title = "Fly", Description = "Toggle Fly For Mobile Users", Default = false })
    FlyToggle:OnChanged(function(v)
        Script.Players.flightmb = v
        if Script.Players.flightmb then
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
                    shared.AngularVC.Parent = nil
                    shared.FlightGyro.Parent = nil
                    shared.FlightBV.Parent = nil
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

    local Platformv = Tabs.Players:AddToggle("", {Title = "Platform", Description = "bring part to your beneath you causing you to float", Default = false})
    Platformv:OnChanged(function(Value)
        getgenv().Float = Value
        pcall(function()
            if getgenv().Float and not float then
                Floating()
            else
                float = false
            end
        end)
    end)

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

            if Script.Main.Respawn then
                if getchar():FindFirstChildOfClass('Humanoid').Health == 0 then
                    Remotes("Events","Spawn")
                end
            end

            if Script.Main.Money then
                local Money = workspace.Pickups:FindFirstChild("Money")
                if Money and IsAlive() then
                    if RandomType == 1 then
                        lookAt(Money.Position)
                        hrp().CFrame = Money.CFrame * CFrame.new(0, 4, 3)
                    elseif RandomType == 2 then
                        lookAt(Money.Position)
                        hrp().CFrame = Money.CFrame * CFrame.new(0, 0, 0)
                    elseif RandomType == 3 then
                        lookAt(Money.Position)
                        hrp().CFrame = Money.CFrame * CFrame.new(3, 4, -2)
                    elseif RandomType == 4 then
                        lookAt(Money.Position)
                        hrp().CFrame = Money.CFrame * CFrame.new(2, 4, 0)
                    elseif RandomType == 5 then
                        lookAt(Money.Position)
                        hrp().CFrame = Money.CFrame * CFrame.new(0, 4, 0)
                    else
                        lookAt(Money.Position)
                        hrp().CFrame = Money.CFrame * CFrame.new(2, 4, 1)
                    end
                elseif getchar():FindFirstChildOfClass('Humanoid').Health == 0 then
                    Remotes("Events","Spawn")
                    wait()
                end
            end

            if Script.Main.Target then
                for _,v in pairs(workspace.GEFs:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Head") and v:FindFirstChild("GoTo") and v:FindFirstChild("Target") then
                        if v:FindFirstChild("GoTo") then
                            v:FindFirstChild("GoTo"):Destroy()
                        end
                        if v:FindFirstChild("Target").Value ~= nil then
                            v:FindFirstChild("Target").Value = nil
                        end
                    end
                end
            end

            if Script.Main.DelGEF then
                for _,v in pairs(workspace.GEFs:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Head") then
                        v:Destroy()
                    end
                end
            end
    
            if Script.Main.Damage then
                for _,v in pairs(workspace.GEFs:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Head") and v:FindFirstChild("Hurtbox") then
                        if v:FindFirstChild("Hurtbox") then
                            v.Hurtbox:Destroy()
                        end
                    end
                end
            end

            if Script.Misc.Fullbright then
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            end

            if Script.Misc.Nofog then
                Lighting.FogEnd = 100000
                for i,v in pairs(Lighting:GetDescendants()) do
                    if v:IsA("Atmosphere") then
                        v:Destroy()
                    end
                end
            end

            if Script.Players.Movement then
                if Script.Players.flight or Script.Players.flightmb then return end
                if Script.Players.SpeedType == "CFrame" then
                    getchar():SetPrimaryPartCFrame(hrp().CFrame + getchar():FindFirstChildWhichIsA("Humanoid").MoveDirection * Script.Players.SpeedPower)
                end
            end

            if Script.Misc.IsBuildings then
                for _,v in pairs(workspace.Buildings:GetChildren()) do
                    if v.Name == Script.Misc.SelectBuildings then
                        hrp().CFrame = v:GetModelCFrame()
                    end
                end
            end
 
            if Script.Players.flight or Script.Players.flightmb then
                if Script.Players.Movement then return end
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
            
                    if Script.Players.flight or Script.Players.flightmb and not Script.Players.Movement then
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

            if Script.Players.Noclip or Script.Players.flight or Script.Players.flightmb then
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

        end)
    end)
end)()

RandomType = 1

LPH_NO_VIRTUALIZE(function()
	task.spawn(function()
		while wait() do
			RandomType = math.random(1,5)
			wait(0.1)
		end
	end)
end)()

run(function()
    if game.GameId ~= 5216419122 then
        return LocalPlayer:Kick("No.")
    end
end)

LPH_NO_VIRTUALIZE(function()
    run(function()
        RunService.Stepped:Connect(function()
            pcall(function()
                checkHealthy()
            end)
            return task.wait(2)
        end)
    end)
end)()

LPH_NO_VIRTUALIZE(function()
	run(function()
		RunService.Stepped:Connect(function()
			pcall(function()
				if getgenv().needSendKey or Script.Main.Money
                then
                    SendKeyEvent(Enum.KeyCode.E)
                end
            end)
        end)
    end)
end)()

LPH_NO_VIRTUALIZE(function()
    run(function()
        pcall(function()

            shared.CreateThered:newThread(.1,function(self)

                for _,v in pairs(workspace.GEFs:GetChildren()) do
                    if v:IsA("Model") and isnetworkowner(v) then

                        if v:FindFirstChild("MiniGEFClient") then
                            v.MiniGEFClient:Destroy()
                        end

                        if v:FindFirstChild("MiniGEFScript") then
                            v.MiniGEFScript:Destroy()
                        end

                    end
                end

            end)

        end)
    end)
end)()

LPH_NO_VIRTUALIZE(function()
	run(function()
		RunService.Stepped:Connect(function()

            pcall(function()

                if setscriptable then
                    setscriptable(LocalPlayer, "SimulationRadius", true)
                end

                if sethidden then
                    sethidden(LocalPlayer, "SimulationRadius", math.huge)
                end

            end)

		end)
	end)
end)()

LPH_NO_VIRTUALIZE(function()
	run(function()
		RunService.Stepped:Connect(function()
            pcall(function()
                if Script.Main.Money or Script.Misc.IsBuildings
                then
                    if syn and syn.request then
                        setfflag("HumanoidParallelRemoveNoPhysics", "False")
                        setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(11)
                        if LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                            LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                        end
                    else
                        if lp.Character:FindFirstChild("HumanoidRootPart") then

                            if not hrp():FindFirstChild(shared.Shion.Main.Velocity) then
                                if LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                                    LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                end
                                if LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand ~= true then
                                    LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = true
                                end
                                local Velocity = Instance.new("BodyVelocity",hrp()) -- Set Parent to Humanoidrootpart
                                Velocity.Name = shared.Shion.Main.Velocity
                                Velocity.MaxForce = Vector3.new(9e9,9e9,9e9);
                                Velocity.Velocity = Vector3.new(0,0,0);
                            end
                            for _, part in pairs(lp.Character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    if noclipDefaults[part] == nil then
                                        task.wait()
                                        noclipDefaults[part] = part.CanCollide
                                    else
                                        if not Script.Main.Money or lp.Character:FindFirstChildWhichIsA("Humanoid").Health == 0
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
                        if not Script.Main.Money or not Script.Misc.IsBuildings
                        then
                            if hrp():FindFirstChild(shared.Shion.Main.Velocity) then
                                hrp():FindFirstChild(shared.Shion.Main.Velocity):Destroy();
                                wait()
                            end
                            if LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand ~= false then
                                LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = false
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

            NotificationLoad:NewNotification({
                ["Mode"] = "info",
                ["Title"] = "Started Anti AFK",
                ["Description"] = "",
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
    ["Description"] = "Thank for using my script. <3, took load in.",
    ["Timeout"] = 5,
    ["Audio"] = false
})

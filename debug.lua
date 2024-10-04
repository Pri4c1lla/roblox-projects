--[[

very extremely messy code

--// original by https://github.com/yofriendfromschool1/debugnation/blob/main/decompilers%20and%20debugging/Debuggers.txt ❤️

]]--

warn(
    [[

                                                     
              ,--.  ,---.       ,--.,--.,--.         
 ,---. ,--.--.`--' /    | ,---./   ||  ||  | ,--,--. 
| .-. ||  .--',--./  '  || .--'`|  ||  ||  |' ,-.  | 
| '-' '|  |   |  |'--|  |\ `--. |  ||  ||  |\ '-'  | 
|  |-' `--'   `--'   `--' `---' `--'`--'`--' `--`--' 
`--'                                                 

]]
)

local L_1_ = (getgenv().AuthTime) or tick()

local L_2_ = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local L_3_ = L_2_.Options
local L_4_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local L_5_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local L_6_ = cloneref or function(...)
	return ...
end

local function L_7_func(L_40_arg0)
	L_40_arg0()
end

local L_8_ = {
	Color = {
		"Dark",
		"Darker",
		"Aqua",
		"Amethyst",
		"Rose",
	}
}

local L_9_ = L_6_(game:GetService("Players"));
local L_10_ = L_6_(game:GetService("CoreGui"));
local L_11_ = L_6_(game:GetService("Workspace"));
local L_12_ = L_6_(game:GetService("ReplicatedStorage"));
local L_13_ = L_6_(game:GetService("VirtualUser"));
local L_14_ = L_6_(game:GetService("VirtualInputManager"));

local L_15_ = L_9_.LocalPlayer:FindFirstChildWhichIsA("PlayerGui");
local L_16_ = L_6_(game:GetService("StarterGui"));
local L_17_ = L_6_(game:GetService("Lighting"));
local L_18_ = L_6_(game:GetService("RunService"));
local L_19_ = L_6_(game:GetService("HttpService"));
local L_20_ = L_6_(game:GetService("TeleportService"));
local L_21_ = L_6_(game:GetService("ProximityPromptService"));
local L_22_ = L_6_(game:GetService("UserInputService"));
local L_23_ = L_6_(game:GetService("TweenService"));

local L_24_ = L_9_.LocalPlayer
local L_25_ = L_11_.CurrentCamera
local L_26_ = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local L_27_ = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local L_28_, L_29_ = game.PlaceId, game.JobId
local L_30_ = sethiddenproperty or set_hidden_property or set_hidden_prop
local L_31_ = gethiddenproperty or get_hidden_property or get_hidden_prop
local L_32_ = L_9_.LocalPlayer:GetMouse()
local L_33_ = table.find({
	Enum.Platform.IOS,
	Enum.Platform.Android
}, L_22_:GetPlatform())
local L_34_ = tostring(identifyexecutor())
local L_35_ = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

function toClipboard(L_41_arg0)
	if L_35_ then
		L_35_(tostring(L_41_arg0))
		print("Clipboard", "Copied to clipboard")
	else
		print("Clipboard", "Your exploit doesn't have the ability to use the clipboard")
	end
end

L_7_func(function()
	if not game:IsLoaded() then
		repeat
			game.Loaded:Wait()
		until game:IsLoaded()
	end
	repeat
		wait()
	until game.Players
	repeat
		wait()
	until game.Players.LocalPlayer
	repeat
		wait()
	until L_12_
	repeat
		wait()
	until L_15_
	repeat
		wait()
	until L_9_

end)

-- anti afk (support all executor)
L_7_func(function()
	print("AntiAfk : On")
	local L_42_ = getconnections or get_signal_cons
	if L_42_ then
		for L_43_forvar0, L_44_forvar1 in pairs(L_42_(L_24_.Idled)) do
			if L_44_forvar1["Disable"] then
				L_44_forvar1["Disable"](L_44_forvar1)
			elseif L_44_forvar1["Disconnect"] then
				L_44_forvar1["Disconnect"](L_44_forvar1)
			end
		end
	else
		L_24_.Idled:Connect(function()
			L_13_:CaptureController()
			L_13_:Button2Down(Vector2.new(0, 0), L_11_.CurrentCamera.CFrame)
			wait(1)
			L_13_:Button2Up(Vector2.new(0, 0), L_11_.CurrentCamera.CFrame)
		end)
	end

end)

_Random = math.random(5)

local L_36_ = getgenv().MinimizeKey

shared.Configs = {
	["MinimizeKey"] = L_36_ or Enum.KeyCode.RightShift
}

local L_37_ =
    L_2_:CreateWindow(
    {
	Title = "Debuggers",
	SubTitle = "Fixed And Rewrite By pri4c1lla",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 400),
	Acrylic = true,
	Theme = L_8_.Color[_Random],
	MinimizeKey = shared.Configs.MinimizeKey
}
)

local L_38_ = {
	Debugs = L_37_:AddTab({
		Title = "Debuggers",
		Icon = ""
	}),
	ACByp = L_37_:AddTab({
		Title = "Anti Cheats",
		Icon = ""
	}),
}

--// debugs first

L_38_.Debugs:AddButton({
	Title = "IY / Infinite Yield",
	Description = "Helps just noclip or doing things faster or fly or wtv",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
})

L_38_.Debugs:AddButton({
	Title = "Dex / Dark Dex",
	Description = "Explorer",
	Callback = function()
		if L_33_ then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
		elseif not L_33_ and not L_34_ == "Xeno" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
		elseif not L_33_ and L_34_ == "Xeno" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Pri4c1lla/luau/refs/heads/main/Assets/Dex.lua"))()
		end
	end
})

L_38_.Debugs:AddButton({
	Title = "SimpleSpy V3",
	Description = "(detection by adonis Ac or namecall detection)",
	Callback = function()
		if L_33_ then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/SimpleSpyV3/mobilemain.lua"))()
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
		end
	end
})

L_38_.Debugs:AddButton({
	Title = "(not work)SimpleSpy Solara Support🔴",
	Description = "lazy to fix error",
	Callback = function()
		local L_45_, L_46_ = pcall(function()
			local L_47_ = {};
			_G.Code = ""
    
            -- StarterGui.sexy spy from tf2
			L_47_["1"] = Instance.new("ScreenGui", L_15_);
			L_47_["1"]["Name"] = "sexy spy from tf2";
			L_47_["1"]["ResetOnSpawn"] = false
			L_47_["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
    
            -- StarterGui.sexy spy from tf2.Frame
			L_47_["2"] = Instance.new("Frame", L_47_["1"]);
			L_47_["2"]["BorderSizePixel"] = 0;
			L_47_["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["2"]["Size"] = UDim2.new(0, 425, 0, 253);
			L_47_["2"]["Position"] = UDim2.new(0.02067, 0, 0.17804, 0);
			L_47_["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    
            -- StarterGui.sexy spy from tf2.Frame.TopBar
			L_47_["3"] = Instance.new("Frame", L_47_["2"]);
			L_47_["3"]["BorderSizePixel"] = 0;
			L_47_["3"]["BackgroundColor3"] = Color3.fromRGB(38, 36, 39);
			L_47_["3"]["Size"] = UDim2.new(0, 425, 0, 18);
			L_47_["3"]["Position"] = UDim2.new(0, 0, -0.00378, 0);
			L_47_["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["3"]["Name"] = [[TopBar]];
    
            -- StarterGui.sexy spy from tf2.Frame.TopBar.Name
			L_47_["4"] = Instance.new("TextLabel", L_47_["3"]);
			L_47_["4"]["BorderSizePixel"] = 0;
			L_47_["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["4"]["TextSize"] = 14;
			L_47_["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["4"]["BackgroundTransparency"] = 1;
			L_47_["4"]["Size"] = UDim2.new(0, 58, 0, 14);
			L_47_["4"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["4"]["Text"] = [[sexy spy from tf2]];
			L_47_["4"]["Name"] = [[Name]];
			L_47_["4"]["Position"] = UDim2.new(0, 0, 0, 0);
    
            -- StarterGui.sexy spy from tf2.Frame.TopBar.X
			L_47_["5"] = Instance.new("TextButton", L_47_["3"]);
			L_47_["5"]["BorderSizePixel"] = 0;
			L_47_["5"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["5"]["TextSize"] = 21;
			L_47_["5"]["TextColor3"] = Color3.fromRGB(205, 205, 205);
			L_47_["5"]["BackgroundColor3"] = Color3.fromRGB(38, 36, 39);
			L_47_["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["5"]["RichText"] = true;
			L_47_["5"]["Size"] = UDim2.new(0, 24, 0, 18);
			L_47_["5"]["Name"] = [[X]];
			L_47_["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["5"]["Text"] = [[X]];
			L_47_["5"]["Position"] = UDim2.new(0.94353, 0, 0, 0);
    
            -- StarterGui.sexy spy from tf2.Frame.Buttons
			L_47_["6"] = Instance.new("Frame", L_47_["2"]);
			L_47_["6"]["BorderSizePixel"] = 0;
			L_47_["6"]["BackgroundColor3"] = Color3.fromRGB(75, 75, 75);
			L_47_["6"]["Size"] = UDim2.new(0, 273, 0, 106);
			L_47_["6"]["Position"] = UDim2.new(0.35765, 0, 0.58103, 0);
			L_47_["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["6"]["Name"] = [[Buttons]];
    
            -- StarterGui.sexy spy from tf2.Frame.Buttons.CopyR
			L_47_["7"] = Instance.new("TextButton", L_47_["6"]);
			L_47_["7"]["TextSize"] = 14;
			L_47_["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["7"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 29);
			L_47_["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["7"]["Size"] = UDim2.new(0, 93, 0, 17);
			L_47_["7"]["Name"] = [[CopyR]];
			L_47_["7"]["BorderColor3"] = Color3.fromRGB(139, 139, 139);
			L_47_["7"]["Text"] = [[Copy Remote]];
			L_47_["7"]["Position"] = UDim2.new(0.32967, 0, 0.08491, 0);
    
            -- StarterGui.sexy spy from tf2.Frame.Buttons.CopyR.Border
			L_47_["8"] = Instance.new("TextLabel", L_47_["7"]);
			L_47_["8"]["BorderSizePixel"] = 0;
			L_47_["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["8"]["TextSize"] = 14;
			L_47_["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["8"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["8"]["Size"] = UDim2.new(0, 8, 0, 17);
			L_47_["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["8"]["Text"] = [[]];
			L_47_["8"]["Name"] = [[Border]];
    
            -- StarterGui.sexy spy from tf2.Frame.Buttons.CopyC
			L_47_["9"] = Instance.new("TextButton", L_47_["6"]);
			L_47_["9"]["TextSize"] = 14;
			L_47_["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["9"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 29);
			L_47_["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["9"]["Size"] = UDim2.new(0, 83, 0, 17);
			L_47_["9"]["Name"] = [[CopyC]];
			L_47_["9"]["BorderColor3"] = Color3.fromRGB(139, 139, 139);
			L_47_["9"]["Text"] = [[Copy Code]];
			L_47_["9"]["Position"] = UDim2.new(0, 0, 0.08491, 0);
			L_47_["9"].MouseButton1Click:Connect(function()
				if L_35_ then
					toClipboard(tostring(_G.Code))
				else
					print("Your executer doesn't support clipboard")
				end
			end)
    
            -- StarterGui.sexy spy from tf2.Frame.Buttons.CopyC.Border
			L_47_["a"] = Instance.new("TextLabel", L_47_["9"]);
			L_47_["a"]["BorderSizePixel"] = 0;
			L_47_["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["a"]["TextSize"] = 14;
			L_47_["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["a"]["Size"] = UDim2.new(0, 8, 0, 17);
			L_47_["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["a"]["Text"] = [[]];
			L_47_["a"]["Name"] = [[Border]];
    
            -- StarterGui.sexy spy from tf2.Frame.Buttons.Run
			L_47_["b"] = Instance.new("TextButton", L_47_["6"]);
			L_47_["b"]["TextSize"] = 14;
			L_47_["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["b"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 29);
			L_47_["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["b"]["Size"] = UDim2.new(0, 81, 0, 17);
			L_47_["b"]["Name"] = [[Run]];
			L_47_["b"]["BorderColor3"] = Color3.fromRGB(139, 139, 139);
			L_47_["b"]["Text"] = [[Run Code]];
			L_47_["b"]["Position"] = UDim2.new(0.7033, 0, 0.08491, 0);
    
            -- StarterGui.sexy spy from tf2.Frame.Buttons.Run.Border
			L_47_["c"] = Instance.new("TextLabel", L_47_["b"]);
			L_47_["c"]["BorderSizePixel"] = 0;
			L_47_["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["c"]["TextSize"] = 14;
			L_47_["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["c"]["Size"] = UDim2.new(0, 8, 0, 17);
			L_47_["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["c"]["Text"] = [[]];
			L_47_["c"]["Name"] = [[Border]];
			L_47_["d2"] = Instance.new("TextButton", L_47_["6"]);
			L_47_["d2"]["TextSize"] = 14;
			L_47_["d2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["d2"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 29);
			L_47_["d2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["d2"]["Size"] = UDim2.new(0, 83, 0, 17);
			L_47_["d2"]["Name"] = [[Clear]];
			L_47_["d2"]["BorderColor3"] = Color3.fromRGB(139, 139, 139);
			L_47_["d2"]["Text"] = [[Clear Output]];
			L_47_["d2"]["Position"] = UDim2.new(0, 0, 0.33962, 0);
			L_47_["e2"] = Instance.new("TextLabel", L_47_["d2"]);
			L_47_["e2"]["BorderSizePixel"] = 0;
			L_47_["e2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["e2"]["TextSize"] = 14;
			L_47_["e2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["e2"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["e2"]["Size"] = UDim2.new(0, 8, 0, 17);
			L_47_["e2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["e2"]["Text"] = [[]];
			L_47_["e2"]["Name"] = [[Border]];
    
            -- StarterGui.sexy spy from tf2.Frame.Remotes
			L_47_["d"] = Instance.new("ScrollingFrame", L_47_["2"]);
			L_47_["d"]["Active"] = true;
			L_47_["d"]["BorderSizePixel"] = 0;
			L_47_["d"]["CanvasSize"] = UDim2.new(9999, 9999, 9999, 9999);
			L_47_["d"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 56);
			L_47_["d"]["Name"] = [[Remotes]];
			L_47_["d"]["ScrollBarImageTransparency"] = 1;
			L_47_["d"]["Size"] = UDim2.new(0, 152, 0, 236);
			L_47_["d"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["d"]["Position"] = UDim2.new(0, 0, 0.06719, 0);
			L_47_["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["d"]["ScrollBarThickness"] = 0;
			L_47_["d"]["LayoutOrder"] = 1;
    
            -- StarterGui.sexy spy from tf2.Frame.Remotes.RemoteExample
			L_47_["e"] = Instance.new("TextButton", L_47_["d"]);
			L_47_["e"]["BorderSizePixel"] = 3;
			L_47_["e"]["TextSize"] = 14;
			L_47_["e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			L_47_["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
			L_47_["e"]["Size"] = UDim2.new(0, 152, 0, 22);
			L_47_["e"]["BackgroundTransparency"] = 0.8;
			L_47_["e"]["Name"] = [[RemoteExample]];
			L_47_["e"]["BorderColor3"] = Color3.fromRGB(93, 96, 102);
			L_47_["e"]["Text"] = [[RemoteName]];
    
            -- StarterGui.sexy spy from tf2.Frame.Remotes.RemoteExample.border
			L_47_["f"] = Instance.new("TextLabel", L_47_["e"]);
			L_47_["f"]["BorderSizePixel"] = 0;
			L_47_["f"]["BackgroundColor3"] = Color3.fromRGB(253, 242, 81);
			L_47_["f"]["TextSize"] = 14;
			L_47_["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["f"]["Size"] = UDim2.new(0, 10, 0, 22);
			L_47_["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["f"]["Text"] = [[]];
			L_47_["f"]["Name"] = [[border]];
    
            -- StarterGui.sexy spy from tf2.Frame.Remotes.UIListLayout
			L_47_["10"] = Instance.new("UIListLayout", L_47_["d"]);
			L_47_["10"]["Padding"] = UDim.new(0, 7);
			L_47_["10"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
    
            -- StarterGui.sexy spy from tf2.Frame.CodeSample
			L_47_["11"] = Instance.new("TextBox", L_47_["2"]);
			L_47_["11"]["CursorPosition"] = -1;
			L_47_["11"]["Interactable"] = false;
			L_47_["11"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["11"]["BorderSizePixel"] = 0;
			L_47_["11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			L_47_["11"]["TextWrapped"] = true;
			L_47_["11"]["TextSize"] = 15;
			L_47_["11"]["Name"] = [[CodeSample]];
			L_47_["11"]["TextYAlignment"] = Enum.TextYAlignment.Top;
			L_47_["11"]["BackgroundColor3"] = Color3.fromRGB(42, 45, 54);
			L_47_["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Balthazar.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			L_47_["11"]["MultiLine"] = true;
			L_47_["11"]["ClearTextOnFocus"] = false;
			L_47_["11"]["Size"] = UDim2.new(0, 272, 0, 130);
			L_47_["11"]["Position"] = UDim2.new(0.35784, 0, 0.06719, 0);
			L_47_["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			L_47_["11"]["Text"] = [[]];
    
            -- StarterGui.sexy spy from tf2.Frame.Drag
			L_47_["12"] = Instance.new("LocalScript", L_47_["2"]);
			L_47_["12"]["Name"] = [[Drag]];
    
            -- StarterGui.sexy spy from tf2.Frame.Main
			L_47_["13"] = Instance.new("LocalScript", L_47_["2"]);
			L_47_["13"]["Name"] = [[Main]];
    
            -- StarterGui.sexy spy from tf2.Frame.Drag
			local function L_48_func()
				local L_57_ = L_47_["12"];
				local L_58_ = L_57_.Parent
				local L_59_ = game:GetService("UserInputService")
				local L_60_
				local L_61_
				local L_62_
				local L_63_
				local function L_64_func(L_65_arg0)
					local L_66_ = L_65_arg0.Position - L_62_
					L_58_.Position = UDim2.new(L_63_.X.Scale, L_63_.X.Offset + L_66_.X, L_63_.Y.Scale, L_63_.Y.Offset + L_66_.Y)
				end
				L_58_.InputBegan:Connect(function(L_67_arg0)
					if L_67_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_67_arg0.UserInputType == Enum.UserInputType.Touch then
						L_60_ = true
						L_62_ = L_67_arg0.Position
						L_63_ = L_58_.Position
						L_67_arg0.Changed:Connect(function()
							if L_67_arg0.UserInputState == Enum.UserInputState.End then
								L_60_ = false
							end
						end)
					end
				end)
				L_58_.InputChanged:Connect(function(L_68_arg0)
					if L_68_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_68_arg0.UserInputType == Enum.UserInputType.Touch then
						L_61_ = L_68_arg0
					end
				end)
				L_59_.InputChanged:Connect(function(L_69_arg0)
					if L_69_arg0 == L_61_ and L_60_ then
						L_64_func(L_69_arg0)
					end
				end)
			end;
			task.spawn(L_48_func);
            -- StarterGui.sexy spy from tf2.Frame.Main
			local function L_49_func()
				local L_70_ = L_47_["13"];
				local L_71_ = game:GetService("TweenService")
				local L_72_ = L_70_.Parent
				local L_73_ = L_72_.TopBar
				local function L_74_func()
					L_72_.Parent:Destroy()
				end
				local function L_75_func()
					L_73_.X.MouseEnter:Connect(function()
						L_71_:Create(L_73_.X, TweenInfo.new(0.2), {
							BackgroundColor3 = Color3.fromRGB(170, 0, 0)
						}):Play()
					end)
					L_73_.X.MouseLeave:Connect(function()
						L_71_:Create(L_73_.X, TweenInfo.new(0.2), {
							BackgroundColor3 = Color3.fromRGB(37, 35, 38)
						}):Play()
					end)
					L_73_.X.MouseButton1Click:Connect(function()
						L_74_func()
					end)
					L_72_.Buttons.Clear.MouseButton1Click:Connect(function()
						for L_77_forvar0, L_78_forvar1 in pairs(L_72_.Remotes:GetChildren()) do
							if L_78_forvar1:IsA("TextButton") then
								L_78_forvar1:Destroy()
							end
						end
					end)
				end
				local function L_76_func()
    
                    -- Close Function
					L_75_func()
				end
				L_76_func()
			end;
			task.spawn(L_49_func);
			local function L_50_func(L_79_arg0)
				local L_80_ = {}
				local L_81_ = L_79_arg0
				while L_81_ and L_81_ ~= game do
					local L_82_ = L_81_.Name
					if L_82_:sub(1, 4) == "Game" then
						L_82_ = "game" .. L_82_:sub(5)
					end
					table.insert(L_80_, 1, L_82_)
					L_81_ = L_81_.Parent
				end
				return table.concat(L_80_, ".")
			end
			local function L_51_func(L_83_arg0)
				if typeof(L_83_arg0) == "string" then
					return string.format("%q", L_83_arg0)
				elseif typeof(L_83_arg0) == "number" then
					return tostring(L_83_arg0)
				elseif typeof(L_83_arg0) == "boolean" then
					return L_83_arg0 and "true" or "false"
				elseif typeof(L_83_arg0) == "Instance" then
					return L_50_func(L_83_arg0)
				else
					return string.format("%q", tostring(L_83_arg0))
				end
			end
			local function L_52_func(L_84_arg0)
				local L_85_ = {}
				for L_86_forvar0, L_87_forvar1 in ipairs(L_84_arg0) do
					L_85_[L_86_forvar0] = string.format("[%d] = %s", L_86_forvar0, L_51_func(L_87_forvar1))
				end
				return L_85_
			end
			local L_53_ = nil
			L_53_ = function(L_88_arg0, L_89_arg1)
				local L_90_ = "{"
				local L_91_ = ""
				for L_93_forvar0 = 1, L_89_arg1 do
					L_91_ = L_91_ .. "	"
				end
				local L_92_ = 0
				for L_94_forvar0, L_95_forvar1 in pairs(L_88_arg0) do
					if type(L_95_forvar1) == "string" then
						L_95_forvar1 = '"' .. L_95_forvar1 .. '"'
					end
					if type(L_95_forvar1) == "table" then
						L_95_forvar1 = L_53_(L_95_forvar1, L_89_arg1 + 1)
					end
					local L_96_ = ",\n"
					passes += 1
					if L_92_ == #L_88_arg0 then
						L_96_ = ""
					end
					if not tonumber(L_94_forvar0) then
						L_94_forvar0 = '"' .. L_94_forvar0 .. '"'
					end
					L_90_ = L_90_ .. L_91_ .. '[' .. L_94_forvar0 .. '] = ' .. tostring(L_95_forvar1) .. L_96_
				end
				L_90_ = L_90_ .. "\n}"
				return L_90_
			end
			local function L_54_func(L_97_arg0)
				local L_98_ = {}
				local L_99_ = L_97_arg0
				while L_99_ and L_99_.Parent ~= game do
					local L_101_ = L_99_.Name
					if L_101_:sub(1, 4) == "Game" then
						L_101_ = "game" .. L_101_:sub(5)
					end
					table.insert(L_98_, 1, L_101_)
					L_99_ = L_99_.Parent
				end
				local L_100_ = table.concat(L_98_, ".")
				if L_97_arg0:IsA("RemoteEvent") then
					L_97_arg0.OnClientEvent:Connect(function(...)
						local L_102_ = {
							...
						}
						local L_103_ = ""
						local L_104_ = 0
						for L_105_forvar0, L_106_forvar1 in pairs(L_102_) do
							local L_107_ = L_106_forvar1
							local L_108_ = L_107_
							if type(L_107_) == "string" then
								L_107_ = '"' .. L_107_ .. '"'
							end
							if type(L_108_) == "table" then
								L_107_ = tablehell(L_108_, 2)
							end
							if type(L_107_) == "userdata" then
								L_107_ = L_107_:GetFullName()
							end
							local L_109_ = ","
							passes += 1
							if L_104_ == #L_108_ then
								L_109_ = ""
							end
							if not tonumber(L_105_forvar0) then
								L_105_forvar0 = '"' .. L_105_forvar0 .. '"'
							end
							L_103_ = L_103_ .. '\n	[' .. L_105_forvar0 .. '] = ' .. tostring(L_107_) .. L_109_
						end
						L_47_["yu"] = L_47_["e"]:Clone()
						L_47_["yu"]["Name"] = L_97_arg0.Name
						L_47_["yu"]["Text"] = L_97_arg0.Name
						L_47_["yu"]["Parent"] = L_47_["d"]
						L_47_["yu"].MouseButton1Click:Connect(function()
							_G.Code = string.format([[local args = {
            %s
            }
            %s:FireServer(unpack(args))
            ]], L_103_, L_100_)
							L_47_["11"]["Text"] = _G.Code
						end)
					end)
				elseif L_97_arg0:IsA("RemoteFunction") then
					L_97_arg0.OnClientInvoke = function(...)
						local L_110_ = {
							...
						}
						local L_111_ = ""
						local L_112_ = 0
						for L_113_forvar0, L_114_forvar1 in pairs(L_110_) do
							local L_115_ = L_114_forvar1
							local L_116_ = L_115_
							if type(L_115_) == "string" then
								L_115_ = '"' .. L_115_ .. '"'
							end
							if type(L_115_) == "userdata" then
								L_115_ = L_115_:GetFullName()
							end
							if type(L_116_) == "table" then
								L_115_ = tablehell(L_116_, 2)
							end
							local L_117_ = ","
							passes += 1
							if L_112_ == #L_116_ then
								L_117_ = ""
							end
							if not tonumber(L_113_forvar0) then
								L_113_forvar0 = '"' .. L_113_forvar0 .. '"'
							end
							L_111_ = L_111_ .. '\n	[' .. L_113_forvar0 .. '] = ' .. tostring(L_115_) .. L_117_
						end
						L_47_["yu2"] = L_47_["e"]:Clone()
						L_47_["yu2"]["Name"] = L_97_arg0.Name
						L_47_["yu2"]["Text"] = L_97_arg0.Name
						L_47_["yu2"]["Parent"] = L_47_["d"]
						L_47_["yu2"].MouseButton1Click:Connect(function()
							_G.Code = string.format([[local args = {
            %s
            }
            %s:InvokeServer(unpack(args))
            ]], L_111_, L_100_)
						end)
						return ...
					end
				end
			end
			local function L_55_func(L_118_arg0)
				for L_119_forvar0, L_120_forvar1 in ipairs(L_118_arg0:GetDescendants()) do
					if L_120_forvar1:IsA("RemoteEvent") or L_120_forvar1:IsA("RemoteFunction") then
						L_54_func(L_120_forvar1)
					end
				end
				L_118_arg0.DescendantAdded:Connect(function(L_121_arg0)
					if L_121_arg0:IsA("RemoteEvent") or L_121_arg0:IsA("RemoteFunction") then
						L_54_func(L_121_arg0)
					end
				end)
			end
			local L_56_ = {
				game.ReplicatedStorage,
				game.StarterGui,
				game.StarterPack,
				game.StarterPlayer
			}
			for L_122_forvar0, L_123_forvar1 in ipairs(L_56_) do
				L_55_func(L_123_forvar1)
				L_123_forvar1.DescendantAdded:Connect(function(L_124_arg0)
					if L_124_arg0:IsA("RemoteEvent") or L_124_arg0:IsA("RemoteFunction") then
						L_54_func(L_124_arg0)
					end
				end)
			end
			return L_47_["1"], require;
		end)
		if L_45_ then
			return print("ok")
		else
			local L_125_ = loadstring(game:HttpGet(('https://raw.githubusercontent.com/treeofplant/Notif/main/library.lua'), true))()
			print("Error: " .. failed)
			L_125_:NewNotification({
				["Mode"] = "Error",
				["Title"] = "failed to run",
				["Description"] = failed,
				["Timeout"] = 15,
				["Audio"] = false
			})
		end
	end
})

L_38_.Debugs:AddButton({
	Title = "Hydroxide",
	Description = "Ultimate remote spy (detection by adonis Ac or namecall detection)",
	Callback = function()
		local L_126_, L_127_ = pcall(function()
			local L_128_ = "Upbolt"
			local L_129_ = "revision"
			local function L_130_func(L_131_arg0)
				return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(L_128_, L_129_, L_131_arg0)), L_131_arg0 .. '.lua')()
			end
			L_130_func("init")
			L_130_func("ui/main")
		end)
		if L_126_ then
			print("Success")
		else
			local L_132_ = loadstring(game:HttpGet(('https://raw.githubusercontent.com/treeofplant/Notif/main/library.lua'), true))()
			print("Error: " .. L_127_)
			L_132_:NewNotification({
				["Mode"] = "Error",
				["Title"] = "failed to run Hydroxide",
				["Description"] = L_127_,
				["Timeout"] = 15,
				["Audio"] = false
			})
		end
	end
})

L_38_.Debugs:AddButton({
	Title = "HttpSpy",
	Description = "Checks for Http request or post",
	Callback = function()
		if not L_34_ == "Xeno" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Httpspy/main/httpspy.txt"))()
		elseif L_34_ == "Xeno" and not L_33_ then
			local L_133_ = loadstring(game:HttpGet(('https://raw.githubusercontent.com/treeofplant/Notif/main/library.lua'), true))()
			Xeno.HttpSpy()
			L_133_:NewNotification({
				["Mode"] = "Info",
				["Title"] = "try run some script",
				["Description"] = "click on xeno executor to view httpspy <3",
				["Timeout"] = 7,
				["Audio"] = false
			})
		end
	end
})

L_38_.Debugs:AddButton({
	Title = "Game Tool Giver",
	Description = "A GUI that gives you tools found in the game by putting it in your backpack.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolgiver.lua"))()
	end
})

L_38_.Debugs:AddButton({
	Title = "Game Tool Equipper",
	Description = "A GUI that equips the tool found in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolequipper.lua"))()
	end
})

L_38_.Debugs:AddButton({
	Title = "Game UI/Frame Viewer",
	Description = "A GUI that allows you to toggle and see hidden guis found in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameuigiver.lua"))()
	end
})

L_38_.Debugs:AddInput("Input", {
	Title = "GUI Stealer",
	Default = "Put name of gui u want to convert must be screengui",
	Placeholder = "Put name of gui u want to convert must be screengui",
	Numeric = false, -- Only allows numbers
	Finished = false, -- Only calls callback when you press enter
	Callback = function(L_134_arg0)
		local L_135_
		for L_136_forvar0, L_137_forvar1 in pairs(game:GetDescendants()) do
			if L_137_forvar1.Name == L_134_arg0 and L_137_forvar1:IsA("ScreenGui") then
				L_135_ = L_137_forvar1
			end
		end
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/debugnation/main/decompilers%20and%20debugging/guistealer.txt"))()
	end
})

L_38_.Debugs:AddButton({
	Title = "Game Fire RemoteEvent FireServer() GUI",
	Description = "A GUI that when clicked calls FireServer() to the found RemoteEvent in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameremotefireserver.lua"))()
	end
})

L_38_.Debugs:AddButton({
	Title = "Game Fire RemoteEvent InvokeClient() GUI",
	Description = "A GUI that when clicked calls InvokeClient() to the found RemoteEvent in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameremoteinvokeclient.lua"))()
	end
})

L_38_.Debugs:AddButton({
	Title = "Game Fire RemoteEvent InvokeServer() GUI",
	Description = "A GUI that when clicked calls InvokeServer() to the found RemoteEvent in the game.",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameinvokeserver.lua"))()
	end
})

L_38_.Debugs:AddButton({
	Title = "animation logger",
	Description = "A GUI that when local player does a animation it logs it",
	Callback = function()
		--This script made by WaveStorag and ChatGPT
		local L_138_ = Instance.new("ScreenGui")
		L_138_.Parent = game:GetService("CoreGui")

		local L_139_ = Instance.new("Frame")
		L_139_.Size = UDim2.new(0.3, 0, 0.4, 0)
		L_139_.Position = UDim2.new(0.35, 0, 0.3, 0)
		L_139_.BackgroundColor3 = Color3.new(0, 0, 0)
		L_139_.BorderSizePixel = 0  -- Remove border
		L_139_.Parent = L_138_

		L_139_.Draggable = true
		L_139_.Active = true

		local L_140_ = Instance.new("Frame")
		L_140_.Size = UDim2.new(1, 0, 0, 30)
		L_140_.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
		L_140_.BorderSizePixel = 0  -- Remove border
		L_140_.Parent = L_139_

		local L_141_ = Instance.new("TextLabel")
		L_141_.Size = UDim2.new(1, -380, 1, 0)
		L_141_.Position = UDim2.new(0, 0, 0, 0)
		L_141_.BackgroundTransparency = 1
		L_141_.Text = "Animation Logger"
		L_141_.Font = Enum.Font.SourceSans
		L_141_.TextColor3 = Color3.new(1, 1, 1)
		L_141_.TextSize = 20
		L_141_.Parent = L_140_

		local L_142_ = Instance.new("TextButton")
		L_142_.Size = UDim2.new(0, 60, 0, 30)
		L_142_.Position = UDim2.new(1, -140, 0, 0)
		L_142_.BackgroundColor3 = Color3.new(1, 0, 0)
		L_142_.Text = "Clear All"
		L_142_.TextColor3 = Color3.new(1, 1, 1)
		L_142_.TextSize = 19
		L_142_.Font = Enum.Font.SourceSans
		L_142_.BackgroundTransparency = 1
		L_142_.Parent = L_140_

		local L_143_ = Instance.new("ScrollingFrame")
		L_143_.Size = UDim2.new(1, 0, 1, -30)
		L_143_.Position = UDim2.new(0, 0, 0, 30)
		L_143_.CanvasSize = UDim2.new(0, 0, 0, 0)
		L_143_.ScrollBarThickness = 10
		L_143_.Parent = L_139_
		L_143_.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)

		local L_144_ = Instance.new("UIListLayout")
		L_144_.Parent = L_143_
		L_144_.SortOrder = Enum.SortOrder.LayoutOrder

		local L_145_ = {}

		local function L_146_func(L_153_arg0, L_154_arg1)
			if L_145_[L_154_arg1] then
				return -- Animation already logged, exit function
			end
			L_145_[L_154_arg1] = true -- Mark animation as logged
			local L_155_ = Instance.new("TextButton")
			L_155_.Size = UDim2.new(1, -10, 0, 60) -- Increased height to accommodate both name and ID
			L_155_.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
			L_155_.Text = string.format("%s\nAnimation ID: %s", L_153_arg0, L_154_arg1) -- Display animation name and ID
			L_155_.TextWrapped = true -- Wrap text to fit within button
			L_155_.Font = Enum.Font.SourceSans
			L_155_.TextColor3 = Color3.new(1, 1, 1)
			L_155_.TextSize = 18
			L_155_.Parent = L_143_
			L_155_.MouseButton1Click:Connect(function()
				toClipboard(L_154_arg1)
			end)
			L_143_.CanvasSize = UDim2.new(0, 0, 0, L_144_.AbsoluteContentSize.Y)
		end

		L_144_:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			L_143_.CanvasSize = UDim2.new(0, 0, 0, L_144_.AbsoluteContentSize.Y)
		end)

		local function L_147_func(L_156_arg0)
			local L_157_ = L_156_arg0.Animation
			if L_157_ then
				local L_158_ = L_157_.AnimationId
				local L_159_ = L_157_.Name or "Unknown Animation"
				L_146_func(L_159_, L_158_)
			end
		end

		local function L_148_func()
			local L_160_ = game:GetService("Players").LocalPlayer
			local L_161_ = L_160_.Character or L_160_.CharacterAdded:Wait()
			local L_162_ = L_161_:WaitForChild("Humanoid")
			L_162_.AnimationPlayed:Connect(L_147_func)
		end

		L_148_func()

		L_142_.MouseButton1Click:Connect(function()
			for L_163_forvar0, L_164_forvar1 in ipairs(L_143_:GetChildren()) do
				if L_164_forvar1:IsA("TextButton") then
					L_164_forvar1:Destroy()
				end
			end
			L_145_ = {}
			L_143_.CanvasSize = UDim2.new(0, 0, 0, 0)
		end)

		local L_149_ = Instance.new("TextButton")
		L_149_.Size = UDim2.new(0, 30, 0, 30)
		L_149_.Position = UDim2.new(1, -30, 0, 0)
		L_149_.BackgroundColor3 = Color3.new(1, 0, 0)
		L_149_.Text = "X"
		L_149_.TextColor3 = Color3.new(1, 1, 1)
		L_149_.TextSize = 24
		L_149_.Font = Enum.Font.SourceSans
		L_149_.BackgroundTransparency = 1
		L_149_.Parent = L_140_

		L_149_.MouseButton1Click:Connect(function()
			L_138_:Destroy()
		end)

		local L_150_ = Instance.new("TextButton")
		L_150_.Size = UDim2.new(0, 30, 0, 30)
		L_150_.Position = UDim2.new(1, -60, 0, 0)
		L_150_.BackgroundColor3 = Color3.new(0, 0, 1)
		L_150_.Text = "–"
		L_150_.TextColor3 = Color3.new(1, 1, 1)
		L_150_.TextSize = 24
		L_150_.Font = Enum.Font.SourceSans
		L_150_.BackgroundTransparency = 1
		L_150_.Parent = L_140_

		-- Functionality to minimize/maximize the GUI when minimize button is clicked
		local L_151_ = false
		local L_152_ = L_139_.Size
		L_150_.MouseButton1Click:Connect(function()
			L_151_ = not L_151_
			if L_151_ then
				L_150_.Text = "+"
				L_139_.Size = UDim2.new(L_152_.X.Scale, L_152_.X.Offset, 0, 30) -- Minimized size
				L_143_.Visible = false
			else
				L_150_.Text = "–"
				L_139_.Size = L_152_ -- Restore to original size
				L_143_.Visible = true
			end
		end)
	end
})
L_38_.Debugs:AddButton({
	Title = "audio logger",
	Description = "A GUI that when audio is played it logs it",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/infyiff/backup/main/audiologger.lua'), true))()
	end
})
L_38_.Debugs:AddButton({
	Title = "Game Subplace viewer",
	Description = "A GUI that shows all the subplaces of the current game and game ids",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/subplaceviewer.txt"))()
	end
})
L_38_.Debugs:AddButton({
	Title = "Mobile Console Viewer",
	Description = "view console on mobile",
	Callback = function()
		local L_165_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/debugnation/main/decompilers%20and%20debugging/Console%20UI.lua"))()
		local L_166_ = L_165_:load()
	end
})
L_38_.Debugs:AddButton({
	Title = "Game saver",
	Description = "uses executor saveinstance()",
	Callback = function()
		saveinstance()
	end
})
L_38_.Debugs:AddButton({
	Title = "Game saver 2",
	Description = "uses executor saveplace()",
	Callback = function()
		saveplace({
			FileName = "SkyHubSavedGame"
		})
	end
})
L_38_.Debugs:AddButton({
	Title = "Game saver 3",
	Description = "uses online or script or sum saveinstance() DONT NEED SAVE INSTANCE",
	Callback = function()
		if saveinstance then
			getgenv().saveinstance = nil
		end
		loadstring(game:HttpGet("https://github.com/MuhXd/Roblox-mobile-script/blob/main/Arecus-X-Neo/Saveinstance.lua?raw=true"))();
	end
})
L_38_.Debugs:AddButton({
	Title = "Xanes Model Recreator",
	Description = "copys link to scriptbloxpage",
	Callback = function()
		toClipboard("https://scriptblox.com/script/Universal-Script-Xanes-Model-Recreator-9892")

	end
})

--//

--// ACBY

L_38_.ACByp:AddButton({
	Title = "Anti Kick",
	Description = "stops local scripts from kicking you",
	Callback = function()
		local L_167_, L_168_ = pcall(function()
			local L_169_ = getrawmetatable(game)
			setreadonly(L_169_, false)
			local L_170_ = L_169_.__namecall
			L_169_.__namecall = newcclosure(function(L_171_arg0, ...)
				local L_172_ = getnamecallmethod()
				if L_172_ == 'Kick' then
					print("Tried To kick")
					wait(387420489)
					return nil
				end
				return L_170_(L_171_arg0, ...)
			end)
			setreadonly(L_169_, true)
		end)
		if L_167_ then
			print("Success")
		else
			local L_173_ = loadstring(game:HttpGet(('https://raw.githubusercontent.com/treeofplant/Notif/main/library.lua'), true))()
			print("Error: " .. L_168_)
			L_173_:NewNotification({
				["Mode"] = "Error",
				["Title"] = "failed to run",
				["Description"] = L_168_,
				["Timeout"] = 15,
				["Audio"] = false
			})
		end
	end
})

L_38_.ACByp:AddButton({
	Title = "Bypass AntiCheats/Kicks",
	Description = "best fr",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/AntiCheat/main/Bypass"))()
	end
})

L_38_.ACByp:AddButton({
	Title = "Bypass Adonis and newindex anticheat",
	Description = "fr",
	Callback = function()
		local L_174_ = getinfo or debug.getinfo
		local L_175_ = false
		local L_176_ = {}

		local L_177_, L_178_

		setthreadidentity(2)

		for L_180_forvar0, L_181_forvar1 in getgc(true) do
			if typeof(L_181_forvar1) == "table" then
				local L_182_ = rawget(L_181_forvar1, "Detected")
				local L_183_ = rawget(L_181_forvar1, "Kill")
			
				if typeof(L_182_) == "function" and not L_177_ then
					L_177_ = L_182_
					
					local L_184_;
					L_184_ = hookfunction(L_177_, function(L_185_arg0, L_186_arg1, L_187_arg2)
						if L_185_arg0 ~= "_" then
							if L_175_ then
								warn("Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}")
							end
						end
						
						return true
					end)

					table.insert(L_176_, L_177_)
				end

				if rawget(L_181_forvar1, "Variables") and rawget(L_181_forvar1, "Process") and typeof(L_183_) == "function" and not L_178_ then
					L_178_ = L_183_
					local L_188_;
					L_188_ = hookfunction(L_178_, function(L_189_arg0)
						if L_175_ then
							warn("Adonis AntiCheat tried to kill (fallback): {Info}")
						end
					end)

					table.insert(L_176_, L_178_)
				end
			end
		end

		local L_179_;
		L_179_ = hookfunction(getrenv().debug.info, newcclosure(function(...)
			local L_190_, L_191_ = ...

			if L_177_ and L_190_ == L_177_ then
				if L_175_ then
					warn("zins | adonis bypassed")
				end

				return coroutine.yield(coroutine.running())
			end
			
			return L_179_(...)
		end))
		-- setthreadidentity(9)
		setthreadidentity(7)

	end
})

L_38_.ACByp:AddButton({
	Title = "Bypass Adonis and newindex anticheat",
	Description = "fr",
	Callback = function()
		local L_192_ = players.LocalPlayer
		local L_193_, L_194_, L_195_
		local function L_196_func()
			L_195_ = L_18_.Heartbeat:Connect(function()
				if L_194_ then
					return 
				end 
				L_193_ = L_192_.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame
			end)
			L_192_.Character:FindFirstChildOfClass('Humanoid').RootPart:GetPropertyChangedSignal('CFrame'):Connect(function()
				L_194_ = true
				L_192_.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame = L_193_
				L_18_.Heartbeat:Wait()
				L_194_ = false
			end)    
			L_192_.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
				L_195_:Disconnect()
			end)
		end

		L_192_.CharacterAdded:Connect(function(L_197_arg0)
			repeat 
				L_18_.Heartbeat:Wait() 
			until L_197_arg0:FindFirstChildOfClass('Humanoid')
			repeat 
				L_18_.Heartbeat:Wait() 
			until L_197_arg0:FindFirstChildOfClass('Humanoid').RootPart
			L_196_func()
		end)

		L_192_.CharacterRemoving:Connect(function()
			L_195_:Disconnect()
		end)

		L_196_func()

	end
})

--//

L_4_:SetLibrary(L_2_)
L_5_:SetLibrary(L_2_)
L_4_:IgnoreThemeSettings()
L_4_:SetIgnoreIndexes({
	'TextboxIdentifier'
})
L_5_:SetFolder("pri4c1lla/Configs")
L_4_:SetFolder("pri4c1lla/Configs")
local L_39_ = L_37_:AddTab({
	Title = "Settings",
	Icon = "settings"
})
L_5_:BuildInterfaceSection(L_39_)
L_4_:BuildConfigSection(L_39_)
L_37_:SelectTab(1)
L_4_:LoadAutoloadConfig()

print("Load Script Success in " .. string.format("%.2f", tick() - L_1_) .. " secs")

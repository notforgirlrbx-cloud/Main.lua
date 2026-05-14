local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/newredzv3/Library/refs/heads/main/Redz-V5-remake/main.luau"))()

local Window = Library:MakeWindow({
  Title = "PhyoX Hub : Blox Fruits",
  SubTitle = "Wand UI Demo",
  ScriptFolder = "PhyoX Hub"
})

local Minimizer = Window:NewMinimizer({
  KeyCode = Enum.KeyCode.LeftControl
})

local MobileButton = Minimizer:CreateMobileMinimizer({
    Image = "rbxassetid://15298567397",
    Size = UDim2.new(0,35,0,35),
    Corner = { CornerRadius = UDim.new(0,6) },
})

local MainTab = Window:MakeTab({
  Title = "Main",
  Icon = "Home"
})

local ConfigTab = Window:MakeTab({
  Title = "Config",
  Icon = "Settings"
})

MainTab:AddSection("Button")
MainTab:AddButton({
  Name = "Jump Boost",
  Callback = function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
    Window:Notify({
      Title = "Clicked",
      Content = "You pressed the button",
      Duration = 3
    })
  end
})

MainTab:AddButton({
  Name = "Jump Boost Disable",
  Callback = function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    Window:Notify({
      Title = "Clicked",
      Content = "You pressed the button",
      Duration = 3
    })
  end
})

MainTab:AddButton({
  Name = "Speed Boost",
  Callback = function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 300
    Window:Notify({
      Title = "Clicked",
      Content = "You pressed the button",
      Duration = 3
    })
  end
})

MainTab:AddButton({
  Name = "Speed Bosst Disable",
  Callback = function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
    Window:Notify({
      Title = "Clicked",
      Content = "You pressed the button",
      Duration = 3
    })
  end
})

MainTab:AddButton({
  Name = "Infinite Jump Toggle",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end
})

MainTab:AddSection("Toggle")
MainTab:AddToggle({
  Name = "Low Gravity",
  Default = false,
  Flag = "jump_boost",
  Callback = function(v)
    Window:Notify({
      Title = "Toggle",
      Content = tostring(v),
      Duration = 3
    })
  end
})

MainTab:AddSection("Slider")
MainTab:AddSlider({
  Name = "JumpPower",
  Min = 0,
  Max = 100,
  Increment = 5,
  Default = 50,
  Callback = function(value)
    print(v)
   end
})

MainTab:AddSection("Dropdown")
MainTab:AddDropdown({
  Name = "Select Fruit",
  Options = {"Light","Dough","Leopard"},
  Default = "Light",
  Callback = function(v)
    print(v)
  end
})

MainTab:AddSection("Dropdown Multi")
MainTab:AddDropdown({
  Name = "Multi Select",
  MultiSelect = true,
  Options = {"A","B","C","D","E","F","G","H","I"},
  Default = {"A"},
  Callback = function(v)
    print(v)
  end
})

MainTab:AddSection("Textbox")
MainTab:AddTextBox({
  Name = "Enter Text",
  Placeholder = "type...",
  ClearOnFocus = true,
  Callback = function(v)
    print(v)
  end
})

MainTab:AddSection("Paragraph")
MainTab:AddParagraph("Info","Line 1\nLine 2")

MainTab:AddSection("Discord")
MainTab:AddDiscordInvite({
  Title = "redz hub : Community",
  Description = "",
  Banner = "rbxassetid://17382040552",
  Logo = "rbxassetid://17382040552",
  Invite = "https://discord.gg/Mkj6W5Rz8E"
})

ConfigTab:AddSection("UI Scale")
ConfigTab:AddSlider({
  Name = "Scale",
  Min = 0.6,
  Max = 1.6,
  Increment = 0.1,
  Default = 1,
  Callback = function(v)
    Library:SetUIScale(v)
  end
})

ConfigTab:AddSection("Theme")
ConfigTab:AddDropdown({
  Name = "Theme",
  Options = Library:GetThemes(),
  Default = Library:GetTheme().Name,
  Callback = function(v)
    Library:SetTheme(v)
  end
})

ConfigTab:AddSection("Flags")
local val = Window:GetFlag("auto_farm") or false
ConfigTab:AddToggle({
  Name = "Auto Farm Sync",
  Default = false,
  Callback = function(v)
    Window:SetFlag("auto_farm", v)
  end
})
Window:Notify({
  Title = 'Script Loaded',
  Content = 'redz hub loaded successfully! Press "LeftControl" to Minimize',
  Image = 'rbxassetid://112146984347920',
  Duration = 5
})
Window:SelectTab(1)

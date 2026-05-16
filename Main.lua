local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/newredzv3/Library/refs/heads/main/Redz-V5-remake/main.luau"))()

local Window = Library:MakeWindow({
  Title = "PhyoX Hub : Blox Fruits",
  SubTitle = "By NotForGirl",
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

MainTab:AddSection("Toggle")
MainTab:AddToggle({
  Name = "Fly Away",
  Default = false,
  Flag = "auto_farm",
  Callback = function()
    Window:Notify({
      Title = "Toggle",
      Content = tostring(v),
      Duration = 3
    })
  end
})

MainTab:AddSection("Best Feature")
MainTab:AddSlider({
  Name = "WalkSpeed",
  Min = 50,
  Max = 1000,
  Increment = 5,
  Default = 50,
  Callback = function(v)
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
   end
})

MainTab:AddSlider({
  Name = "JumpPower",
  Min = 50,
  Max = 1000,
  Increment = 5,
  Default = 50,
  Callback = function(v)
  game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
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

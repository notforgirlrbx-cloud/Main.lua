local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/newredzv3/Library/refs/heads/main/Redz-V5-remake/main.luau"))()

local Window = Library:MakeWindow({
  Title = "Phyoz Hub : Ramdom Game",
  SubTitle = "Good Games",
  ScriptFolder = "wand-ui"
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
  Name = "Test Button",
  Callback = function()
    Window:Notify({
      Title = "Clicked",
      Content = "You pressed the button",
      Duration = 3
    })
  end
})

MainTab:AddSection("Movement")
MainTab:AddButton({
  Name = "Set Speed to 500",
  Callback = function()
   player.Character.Humanoid.WalkSpeed = 500
    Window:Notify({
      Title = "Speed Updated",
      Content = "Your speed is now set to 500!",
      Duration = 3
      })
    end
  })

MainTab:AddSection("Farming")
MainTab:AddToggle({
  Name = "Auto Farm",
  Default = false,
  Flag = "auto_farm",
  Callback = function(v)
    Window:Notify({
      Title = "Farming",
      Content = tostring(v),
      Duration = 3
    })
  end
})

MainTab:AddSection("Farming")
MainTab:AddToggle({
  Name = "Auto Farm Near Mods",
  Default = false,
  Flag = "auto_farm",
  Callback = function(v)
    Window:Notify({
      Title = "Farming",
      Content = tostring(v),
      Duration = 3
    })
  end
})

MainTab:AddSection("Farming")
MainTab:AddToggle({
  Name = "Auto Factory",
  Default = false,
  Flag = "auto_farm",
  Callback = function(v)
    Window:Notify({
      Title = "Farming",
      Content = tostring(v),
      Duration = 3
    })
  end
})

MainTab:AddSection("Slider")
MainTab:AddSlider({
  Name = "Speed",
  Min = 0,
  Max = 100,
  Increment = 5,
  Default = 50,
  Callback = function(v)
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
  Content = 'Phyoz Hub Loaded Successfully! Press "LeftControl" To Minimize',
  Image = 'rbxassetid://112146984347920',
  Duration = 3
})
Window:SelectTab(1)

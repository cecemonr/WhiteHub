local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local validKey = "1"

local function loadWhiteHubCode()
   local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

   local Window = OrionLib:MakeWindow({Name = "White Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
end

local Window = OrionLib:MakeWindow({Name = "White Hub - Key", HidePremium = false, SaveConfig = true, ConfigFolder = "WhiteHub"})

local Tab = Window:MakeTab({
    Name = "Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local userInputKey = ""

Tab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        userInputKey = value
    end
})

Tab:AddButton({
    Name = "Check Key",
    Callback = function()
        if userInputKey == validKey then
            OrionLib:MakeNotification({
                Name = "Success",
                Content = "Key is correct!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            OrionLib:Destroy()
            loadWhiteHubCode()
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Invalid Key, please try again.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

print("tst")

Tab:AddButton({
    Name = "Copy Link",
    Callback = function()
        setclipboard("https://github.com/cecemonr/WhiteHub/blob/main/WhiteHub.txt")
        OrionLib:MakeNotification({
            Name = "Link Copied",
            Content = "Link copied to clipboard!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

OrionLib:Init()

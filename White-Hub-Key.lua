local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local keyUrl = "https://pastebin.com/raw/uiP40nsG"

local function loadWhiteHubCode()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/cecemonr/WhiteHub/refs/heads/main/White-Hub.lua"))()
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

local function checkKey(callback)
    local response = game:HttpGet(keyUrl)
    if response then
        callback(userInputKey == response)
    else
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Не удалось подключиться к серверу.",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
end

Tab:AddButton({
    Name = "Check Key",
    Callback = function()
        checkKey(function(isValid)
            if isValid then
                OrionLib:MakeNotification({
                    Name = "Success",
                    Content = "Ключ верен!",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
                OrionLib:Destroy()
                loadWhiteHubCode()
            else
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Неправильный ключ, попробуйте снова.",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        end)
    end
})

Tab:AddButton({
    Name = "Copy Link",
    Callback = function()
        setclipboard("https://github.com/cecemonr/WhiteHub/blob/main/WhiteHub.txt")
        OrionLib:MakeNotification({
            Name = "Link Copied",
            Content = "Ссылка скопирована в буфер обмена!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

OrionLib:Init()

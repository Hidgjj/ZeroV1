local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Config = require(script.Parent.config)

local UI = {}
local currentTab

function UI.Create()
    local gui = Instance.new("ScreenGui", player.PlayerGui)
    gui.Name = "ZeroHub"
    gui.ResetOnSpawn = false

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0,700,0,400)
    main.Position = UDim2.new(0.5,-350,0.5,-200)
    main.BackgroundColor3 = Color3.fromRGB(15,15,15)
    main.BorderSizePixel = 0
    Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)

    local left = Instance.new("Frame", main)
    left.Size = UDim2.new(0,170,1,0)
    left.BackgroundColor3 = Color3.fromRGB(20,20,20)

    local title = Instance.new("TextLabel", left)
    title.Size = UDim2.new(1,0,0,60)
    title.Text = Config.Name
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Config.Accent
    title.BackgroundTransparency = 1

    local content = Instance.new("Frame", main)
    content.Position = UDim2.new(0,190,0,20)
    content.Size = UDim2.new(1,-210,1,-40)
    content.BackgroundTransparency = 1

    local function clear()
        for _,v in pairs(content:GetChildren()) do
            if v:IsA("Frame") then v:Destroy() end
        end
    end

    local function toggle(text,y,cb)
        local f = Instance.new("Frame", content)
        f.Size = UDim2.new(1,0,0,45)
        f.Position = UDim2.new(0,0,0,y)
        f.BackgroundColor3 = Color3.fromRGB(25,25,25)
        Instance.new("UICorner", f).CornerRadius = UDim.new(0,10)

        local l = Instance.new("TextLabel", f)
        l.Text = text
        l.Size = UDim2.new(1,-60,1,0)
        l.BackgroundTransparency = 1
        l.TextColor3 = Color3.new(1,1,1)
        l.Font = Enum.Font.Gotham

        local b = Instance.new("TextButton", f)
        b.Size = UDim2.new(0,36,0,18)
        b.Position = UDim2.new(1,-46,0.5,-9)
        b.BackgroundColor3 = Color3.fromRGB(60,60,60)
        b.Text = ""
        Instance.new("UICorner", b).CornerRadius = UDim.new(1,0)

        local on=false
        b.MouseButton1Click:Connect(function()
            on=not on
            b.BackgroundColor3 = on and Config.Accent or Color3.fromRGB(60,60,60)
            cb(on)
        end)
    end

    local function tab(name,y,cb)
        local b = Instance.new("TextButton", left)
        b.Size = UDim2.new(1,-20,0,36)
        b.Position = UDim2.new(0,10,0,y)
        b.Text = name
        b.Font = Enum.Font.Gotham
        b.BackgroundColor3 = Color3.fromRGB(30,30,30)
        b.TextColor3 = Color3.new(1,1,1)
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
        b.MouseButton1Click:Connect(cb)
    end

    tab("Main",80,function()
        clear()
        toggle("Speed Boost",0,function() end)
        toggle("Jump Boost",60,function() end)
    end)

    tab("Visual",130,function()
        clear()
        toggle("UI Highlight",0,function() end)
    end)

    tab("Settings",180,function()
        clear()
        toggle("Save Settings",0,function() end)
    end)
end

return UI

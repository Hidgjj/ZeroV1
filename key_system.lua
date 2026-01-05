local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Config = require(script.Parent.config)

local KeySystem = {}
local entered = false

function KeySystem.Start(callback)
    if entered then
        callback()
        return
    end

    local gui = Instance.new("ScreenGui", player.PlayerGui)
    gui.Name = "ZeroKey"
    gui.ResetOnSpawn = false

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0,360,0,200)
    frame.Position = UDim2.new(0.5,-180,0.5,-100)
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,14)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1,0,0,45)
    title.Text = Config.Name .. " | Key"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Config.Accent
    title.BackgroundTransparency = 1

    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(1,-40,0,40)
    box.Position = UDim2.new(0,20,0,65)
    box.PlaceholderText = "Enter key"
    box.BackgroundColor3 = Color3.fromRGB(25,25,25)
    box.TextColor3 = Color3.new(1,1,1)
    box.BorderSizePixel = 0
    Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)

    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1,-40,0,40)
    btn.Position = UDim2.new(0,20,0,125)
    btn.Text = "UNLOCK"
    btn.Font = Enum.Font.GothamBold
    btn.BackgroundColor3 = Config.Accent
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

    btn.MouseButton1Click:Connect(function()
        if box.Text == Config.Key then
            entered = true
            gui:Destroy()
            callback()
        else
            box.Text = ""
            box.PlaceholderText = "Wrong key"
        end
    end)
end

return KeySystem

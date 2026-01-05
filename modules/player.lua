local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Player = {}

function Player.Speed(state)
    if not player.Character then return end
    local hum = player.Character:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = state and 30 or 16
    end
end

function Player.Jump(state)
    if not player.Character then return end
    local hum = player.Character:FindFirstChild("Humanoid")
    if hum then
        hum.JumpPower = state and 90 or 50
    end
end

return Player

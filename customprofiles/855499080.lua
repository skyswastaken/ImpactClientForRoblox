--// https://www.roblox.com/games/855499080
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local src = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Toon-arch/ImpactClientForRoblox/main/customprofiles/MainScript.lua"))()
src.SaveFile("custom/855499080")
local CliSettings = {
    ["Reach"] = false,
    ["Reach_Distance"] = 0.6,
    ["AC"] = false
}

local Combat_Tab_Reach = src.Tabs.Combat.self:create("Toggle", {
    ["Name"] = "Reach",
    ["Default"] = false,
    ["Hint"] = "Give your sword reach",
    ["Callback"] = function(enabled)
        CliSettings.Reach = enabled
    end,
})
local Combat_Tab_Reach_Distance = Combat_Tab_Reach.self:create("Number", {
    ["Name"] = "Distance",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Round"] = 0.01,
    ["Default"] = 0.6,
    ["Hint"] = "Distance of the reach",
    ["Callback"] = function(num)
        CliSettings.Reach_Distance = num
    end,
})

local ExP_Tab = src.GUI:create("Container", {
	["Name"] = "Exploit",
})
local ExP_Tab_ACBypass = ExP_Tab.self:create("Toggle", {
    ["Name"] = "AC Bypass",
    ["Default"] = false,
    ["Hint"] = "Bypass the anticheat",
    ["Callback"] = function(enabled)
        CliSettings.AC = enabled
    end,
})

local CliSetLoop = RunService.RenderStepped:Connect(function()
    if CliSettings.AC then
        local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
        if PlayerGui and PlayerGui:FindFirstChild("Extra") then
            if PlayerGui.Extra:FindFirstChild("AntiSploitClient") and PlayerGui.Extra:FindFirstChild("AntiSploitClient2") then
                PlayerGui.Extra.AntiSploitClient:Destroy()
                PlayerGui.Extra.AntiSploitClient2:Destroy()
            end
        end
    end
    if CliSettings.Reach then
        if LocalPlayer and LocalPlayer.Character and LocalPlayer:FindFirstChildOfClass("Backpack") then
            local Backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
            if Backpack:FindFirstChild("Sword") then
                if Backpack.Sword:IsA("Tool") and Backpack.Sword:FindFirstChild("Handle") then
                    Backpack.Sword.Handle.Massless = true
                    Backpack.Sword.Handle.Size = Vector3.new(0.6, 0.8, CliSettings.Reach_Distance)
                end
            end
            if LocalPlayer.Character:FindFirstChild("Sword") then
                if LocalPlayer.Character.Sword:IsA("Tool") and LocalPlayer.Character.Sword:FindFirstChild("Handle") then
                    LocalPlayer.Character.Sword.Handle.Massless = true
                    LocalPlayer.Character.Sword.Handle.Size = Vector3.new(0.6, 0.8, CliSettings.Reach_Distance)
                end
            end
        end
    else
        if LocalPlayer and LocalPlayer.Character and LocalPlayer:FindFirstChildOfClass("Backpack") then
            local Backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
            if Backpack:FindFirstChild("Sword") then
                if Backpack.Sword:IsA("Tool") and Backpack.Sword:FindFirstChild("Handle") then
                    Backpack.Sword.Handle.Massless = true
                    Backpack.Sword.Handle.Size = Vector3.new(0.6, 0.8, 3.6)
                end
            end
            if LocalPlayer.Character:FindFirstChild("Sword") then
                if LocalPlayer.Character.Sword:IsA("Tool") and LocalPlayer.Character.Sword:FindFirstChild("Handle") then
                    LocalPlayer.Character.Sword.Handle.Massless = true
                    LocalPlayer.Character.Sword.Handle.Size = Vector3.new(0.6, 0.8, 3.6)
                end
            end
        end
    end
end)

src.AddOnSelfDestruct(function()
    if CliSetLoop ~= nil and typeof(CliSetLoop) == "RBXScriptSignal" then
        CliSetLoop:Disconnect()
        CliSetLoop = nil
    end
end)

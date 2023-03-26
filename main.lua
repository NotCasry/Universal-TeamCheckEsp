local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotCasry/SurfaceGui/main/main.lua"))()
local Players = game:GetService("Players")

function create_box(player : Player)
    if player.Name ~= Players.LocalPlayer.Name and workspace:FindFirstChild(player.Name) then
        local Char = workspace:FindFirstChild(player.Name)

        if Char:FindFirstChild("HumanoidRootPart") then
            local hrp = Char:FindFirstChild("HumanoidRootPart")
            
            if not hrp:FindFirstChild("ESP") then
                local Create = Library.Create("ESP", Char.HumanoidRootPart)

                Create.MaxDistance = math.huge
                Create.StudsOffset = Vector3.new(0, 0, 0)
                Create.BillboardSize = UDim2.new(5,0,6,0)
                
                local NewSurface = Create.CreateSurface()
                local NewQuad = Create:CreateQuad("ESP_QUAD", NewSurface)
                
                NewQuad.Frame_BackgroundTransparency = 0.5
                NewQuad.Frame_BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            
                NewQuad.CreateFrame()
                
                print("Created new Quad!")
            end
        end
    end
end

function team_check(player : Player)
    if player.Name ~= Players.LocalPlayer.Name then
        if workspace:FindFirstChild(player.Name) then
            local element = Library.ReturnUIElement("ESP_QUAD", workspace:FindFirstChild(player.Name))

            if element then
                if player.Team ~= Players.LocalPlayer.Team then
                    element.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                elseif player.Team == Players.LocalPlayer.Team then
                    element.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                end
            end
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    create_box(player)
    team_check(player)
end)

while task.wait() do
    for i, player in pairs(Players:GetChildren()) do
        create_box(player)
        team_check(player)
    end
end

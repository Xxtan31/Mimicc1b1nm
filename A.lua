local workspace = game:GetService("Workspace")
local souls = workspace.GameAI.Souls

for _, orb in ipairs(souls:GetChildren()) do
    if orb:IsA("BasePart") then
        local proxPrompt = orb:FindFirstChildOfClass("ProximityPrompt")
        if proxPrompt then
            proxPrompt.HoldDuration = 0
        end
    end
end

wait(0.3)


local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Önce "E" tuşunu buluyoruz
local eKey = Enum.KeyCode.E

-- Ardından bir fonksiyon oluşturuyoruz
local function pressEKey()
    -- Burada "E" tuşuna basmayı simüle ediyoruz
    game:GetService("VirtualInputManager"):SendKeyEvent(true, eKey, false, game)
    
    -- 10 saniye bekliyoruz
    
    -- Ardından "E" tuşunu bırakıyoruz
    game:GetService("VirtualInputManager"):SendKeyEvent(false, eKey, false, game)
end

-- GameAI objesini bulmak için bu döngüyü kullanıyoruz
while true do
    local Map = workspace:FindFirstChild("GameAI")
    if Map then
        local Souls = Map:FindFirstChild("Souls")
        if Souls then
            local Orb = Souls:FindFirstChild("Orb")
            if Orb then
                -- İkinci döngünün içinde hareket kodunu çağırıyoruz
                humanoidRootPart.CFrame = CFrame.new(Orb.Position)
            end
        end
    end
    -- İlk döngü içinde basılan E tuşu fonksiyonunu çağırıyoruz
    pressEKey()
    wait(0.1) -- Her 5 saniyede bir kontrol ediyoruz
end

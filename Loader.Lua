-- BALLXZ HUB Loader
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BALLXZ HUB",
   LoadingTitle = "BALLXZ",
   LoadingSubtitle = "by BALLXZ",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "BALLXZ Hub"
   },
   KeySystem = false,
   KeySettings = {
      Title = "BALLXZ GET KEY",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

Rayfield:Notify({
    Title = "BALLXZ HUB Loaded",
    Content = "Hello",
    Duration = 6,
    Actions = {
        Dismiss = {
            Name = "yes",
            Callback = function()
                print("Hub started.")
            end
        }
    }
})

-- ✅ Tabs
local HomeTab = Window:CreateTab("🏠 Home", 4483362458)
local MainTab = Window:CreateTab("⚙️ Main", 4483362458)

-- 🔁 กลับหน้า Home
MainTab:CreateButton({
   Name = "🔙 กลับไปหน้า Home",
   Callback = function()
      Rayfield:Notify({
         Title = "กลับหน้า Home",
         Content = "คลิกที่ Tab '🏠 Home' ด้านบนเพื่อกลับหน้าแรก",
         Duration = 5
      })
   end
})

-- 🚪 NoClip
MainTab:CreateButton({
   Name = "🚪 NoClip",
   Callback = function()
      _G.noclip = not _G.noclip

      if _G.noclipStarted == nil then
         _G.noclipStarted = true
         game.StarterGui:SetCore("SendNotification", {
            Title = "BALLXZ Hub",
            Text = "NoClip Activated!",
            Duration = 5
         })

         local plr = game:GetService("Players").LocalPlayer
         local char = plr.Character or plr.CharacterAdded:Wait()

         game:GetService("RunService").Stepped:Connect(function()
            if _G.noclip then
               for _, part in pairs(char:GetDescendants()) do
                  if part:IsA("BasePart") and part.CanCollide then
                     part.CanCollide = false
                  end
               end
            end
         end)
      end
   end
})

-- 💨 Toggle Speed
local speedEnabled = false
MainTab:CreateButton({
   Name = "💨 สลับ Speed (On/Off)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local char = player.Character or player.CharacterAdded:Wait()
      local humanoid = char:FindFirstChildOfClass("Humanoid")

      if humanoid then
         speedEnabled = not speedEnabled
         humanoid.WalkSpeed = speedEnabled and 100 or 16

         Rayfield:Notify({
            Title = "Speed",
            Content = speedEnabled and "Speed ON (x6+)" or "Speed OFF (ปกติ)",
            Duration = 4
         })
      end
   end
})

-- 🧩 UI Toggle (กดปุ่มขวา Shift เพื่อเปิด/ปิด)
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(input, gameProcessed)
   if input.KeyCode == Enum.KeyCode.RightShift and not gameProcessed then
      Rayfield:Toggle()
   end
end)

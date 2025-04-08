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

-- สร้างแท็บ
local HomeTab = Window:CreateTab("🏠 Home", 4483362458)
local MainTab = Window:CreateTab("⚙️ Main", 4483362458)

-- ปุ่มกลับหน้า Home
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

-- ปุ่ม NoClip
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

-- ปุ่ม Speed Hack
MainTab:CreateButton({
   Name = "💨 up speed",
   Callback = function()
      local player = game.Players.LocalPlayer
      local char = player.Character or player.CharacterAdded:Wait()
      local humanoid = char:WaitForChild("Humanoid")

      humanoid.WalkSpeed = 200
      Rayfield:Notify({
         Title = "Speed Hack",
         Content = "So fast",
         Duration = 4
      })
   end
})

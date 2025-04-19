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
local MainTab = Window:CreateTab("⚙️ Main", 4483362458)

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

-- 🗡️ วาร์ปไปตีมอนใกล้สุด
MainTab:CreateButton({
   Name = "🗡️ วาร์ปไปตีมอนใกล้สุด",
   Callback = function()
      local plr = game.Players.LocalPlayer
      local char = plr.Character or plr.CharacterAdded:Wait()

      local closestEnemy
      local shortestDistance = math.huge

      for _, mob in pairs(workspace:GetDescendants()) do
         if mob:IsA("Model") and mob:FindFirstChild("Humanoid") and mob ~= char then
            local root = mob:FindFirstChild("HumanoidRootPart")
            if root then
               local dist = (char:WaitForChild("HumanoidRootPart").Position - root.Position).Magnitude
               if dist < shortestDistance then
                  shortestDistance = dist
                  closestEnemy = root
               end
            end
         end
      end

      if closestEnemy then
         char:MoveTo(closestEnemy.Position + Vector3.new(0, 0, 2)) -- วาร์ปไปด้านหน้าศัตรูเล็กน้อย

         -- ตี
         local tool = char:FindFirstChildOfClass("Tool")
         if tool and tool:FindFirstChild("Handle") then
            for i = 1, 3 do
               tool:Activate()
               task.wait(0.2)
            end
         end
      else
         Rayfield:Notify({
            Title = "ไม่พบมอน",
            Content = "ไม่เจอมอนใกล้ๆ",
            Duration = 3
         })
      end
   end
})

-- เพิ่ม Dropdown เพื่อเลือกผู้เล่น
local players = {}
for i, v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(players, v.Name)
end

local selectedPlayer

-- เพิ่ม Dropdown ให้เลือกผู้เล่น
MainTab:CreateDropdown({
    Name = "Select Player",
    Options = players,
    Callback = function(selected)
        selectedPlayer = selected
    end
})

-- เพิ่มปุ่ม Teleport ไปยังผู้เล่นที่เลือก
MainTab:CreateButton({
   Name = "🔮 Teleport to Selected Player",
   Callback = function()
      if selectedPlayer then
          local targetPlayer = game:GetService("Players"):FindFirstChild(selectedPlayer)
          if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
              local rootpart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
              rootpart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
          else
              Rayfield:Notify({
                  Title = "Error",
                  Content = "Player or HumanoidRootPart not found.",
                  Duration = 3
              })
          end
      else
          Rayfield:Notify({
              Title = "Error",
              Content = "No player selected.",
              Duration = 3
          })
      end
   end
})

-- 🎲 สุ่ม Summon ใน Anime Rangers X
MainTab:CreateButton({
   Name = "🎲 Summon (Anime Rangers X)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local char = player.Character or player.CharacterAdded:Wait()
      local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Summon")

      if remote then
         remote:InvokeServer()
         Rayfield:Notify({
            Title = "Summon",
            Content = "เรียกใช้ Summon สำเร็จ",
            Duration = 3
         })
      else
         Rayfield:Notify({
            Title = "Summon",

::contentReference[oaicite:13]{index=13}
 

-- BALLXZ HUB Advanced Macro (2025-05-02 08:21)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players, RunService, VIM = game:GetService("Players"), game:GetService("RunService"), game:GetService("VirtualInputManager")
local LP = Players.LocalPlayer
local Window = Rayfield:CreateWindow({ Name = "BALLXZ HUB", Theme = "Default" })
local MainTab = Window:CreateTab("⚙️ Main", 4483362458)

-- ☑️ Global Vars
local MacroRecording, MacroPlaying, MacroData, AutoMacro = false, false, {}, true

-- 🔴 Start / Stop Macro Recording
MainTab:CreateButton({
   Name = "🔴 เริ่ม/หยุด อัด Macro",
   Callback = function()
      MacroRecording = not MacroRecording
      Rayfield:Notify({
         Title = "Macro",
         Content = MacroRecording and "เริ่มอัด" or "หยุดอัด",
         Duration = 3
      })

      if MacroRecording then
         MacroData = {}
         local startTime = tick()

         RunService.Heartbeat:Connect(function()
            if not MacroRecording then return end
            local char = LP.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end

            table.insert(MacroData, {
               Time = tick() - startTime,
               Position = char.HumanoidRootPart.CFrame,
               ToolUsed = (char:FindFirstChildOfClass("Tool") and char:FindFirstChildOfClass("Tool").Name) or nil
            })
         end)
      end
   end
})

-- ▶️ เล่น Macro
MainTab:CreateButton({
   Name = "▶️ เล่น Macro",
   Callback = function()
      if #MacroData == 0 then
         Rayfield:Notify({ Title = "Macro", Content = "ยังไม่มีการอัด", Duration = 2 })
         return
      end

      MacroPlaying = true
      local char = LP.Character or LP.CharacterAdded:Wait()
      local root = char:WaitForChild("HumanoidRootPart")

      Rayfield:Notify({ Title = "Macro", Content = "กำลังเล่น...", Duration = 3 })

      for i, step in ipairs(MacroData) do
         if not MacroPlaying then break end
         task.wait(step.Time - (MacroData[i-1] and MacroData[i-1].Time or 0))

         root.CFrame = step.Position

         -- ใช้ Tool หากมีชื่อที่ตรง
         if step.ToolUsed and char:FindFirstChild(step.ToolUsed) then
            local tool = char:FindFirstChild(step.ToolUsed)
            tool:Activate()
         end
      end

      MacroPlaying = false
      Rayfield:Notify({ Title = "Macro", Content = "เล่นจบแล้ว", Duration = 3 })
   end
})

-- 🔁 เปิด/ปิด Auto Macro
MainTab:CreateToggle({
   Name = "🟢 เปิด Auto Macro เมื่อเข้าเกม",
   CurrentValue = true,
   Callback = function(state)
      AutoMacro = state
   end
})

-- 🧠 Auto start เมื่อเข้าเกมใหม่
if AutoMacro then
   task.wait(5) -- รอโหลด map
   if #MacroData > 0 then
      local root = LP.Character:WaitForChild("HumanoidRootPart")
      for i, step in ipairs(MacroData) do
         task.wait(step.Time - (MacroData[i-1] and MacroData[i-1].Time or 0))
         root.CFrame = step.Position
         if step.ToolUsed then
            local tool = LP.Character:FindFirstChild(step.ToolUsed)
            if tool then tool:Activate() end
         end
      end
   end
end

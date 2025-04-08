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
local Button = MainTab:CreateButton({
   Name = "NoClip",
   Callback = function()
      -- Toggle state
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
                  if part:IsA("BasePart") and part.CanCollide == true then
                     part.CanCollide = false
                  end
               end
            end
         end)
      end
   end
})


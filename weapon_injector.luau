-- تحميل Orion UI من الإنترنت
loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local OrionLib = OrionLib
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("GiveWeapon") -- لازم يكون في السيرفر

local Window = OrionLib:MakeWindow({
    Name = "سلاح فاسد - اختبار",
    HidePremium = false,
    SaveConfig = false,
    IntroText = "أدخل اسم السلاح واضغط إرسال"
})

local Tab = Window:MakeTab({
    Name = "إعطاء سلاح",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "اسم السلاح",
    Default = "Corrupt",
    TextDisappear = false,
    Callback = function(weaponName)
        remote:FireServer(weaponName)
        OrionLib:MakeNotification({
            Name = "تم الإرسال",
            Content = "طلب إعطاء السلاح " .. weaponName .. " أُرسل للسيرفر.",
            Time = 3
        })
    end
})


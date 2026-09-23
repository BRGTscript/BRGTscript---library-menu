-- BRGT HUB - Advanced UI Library (Updated 2026)
-- Dark Transparent Layered Theme with Red Accents & Custom Customization

local Library = {}
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Logo Database para sa buong library
local LogoDatabase = {
    ["home"] = "rbxassetid://6023426915",
    ["teleport"] = "rbxassetid://6034818372",
    ["settings"] = "rbxassetid://6012348036",
    ["star"] = "rbxassetid://6035259441",
    ["shield"] = "rbxassetid://6023426915",
    ["sword"] = "rbxassetid://6023426915",
    ["map"] = "rbxassetid://6035311034",
    ["navigation"] = "rbxassetid://6035367623",
    ["zap"] = "rbxassetid://6035689895",
    ["sliders"] = "rbxassetid://6035500971",
    ["play"] = "rbxassetid://6035400843",
    ["award"] = "rbxassetid://6035259441",
    ["gift"] = "rbxassetid://6035245892",
    ["shopping-bag"] = "rbxassetid://6035473703",
    ["users"] = "rbxassetid://6034293841",
    ["user"] = "rbxassetid://6034293841",
    ["user-plus"] = "rbxassetid://6034293841",
    ["feather"] = "rbxassetid://6035236284",
    ["lock"] = "rbxassetid://6031088319",
    ["activity"] = "rbxassetid://6035419830",
    ["minus"] = "rbxassetid://6035338803",
    ["plus"] = "rbxassetid://6035408056",
}

function Library:Load(key_link, menuName)
    -- Tanggalin ang lumang UI kung meron man
    if CoreGui:FindFirstChild("BRGTHubUI") then
        CoreGui.BRGTHubUI:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "BRGTHubUI"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ---------------------------------------------------------
    -- 1. KEY SYSTEM (Mananatili ang orihinal nitong kulay)
    ---------------------------------------------------------
    local KeyGui = Instance.new("Frame")
    KeyGui.Size = UDim2.new(0, 450, 0, 260)
    KeyGui.Position = UDim2.new(0.5, -225, 0.5, -130)
    KeyGui.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    KeyGui.BorderSizePixel = 0
    KeyGui.Parent = ScreenGui

    local KeyCorner = Instance.new("UICorner")
    KeyCorner.CornerRadius = UDim.new(0, 10)
    KeyCorner.Parent = KeyGui

    local KeyTitle = Instance.new("TextLabel")
    KeyTitle.Size = UDim2.new(1, 0, 0, 50)
    KeyTitle.Text = "BRGT HUB - KEY SYSTEM"
    KeyTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
    KeyTitle.TextSize = 14
    KeyTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    KeyTitle.BackgroundTransparency = 1
    KeyTitle.Parent = KeyGui

    local KeyBox = Instance.new("TextBox")
    KeyBox.Size = UDim2.new(0.85, 0, 0, 45)
    KeyBox.Position = UDim2.new(0.075, 0, 0.35, 0)
    KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.PlaceholderText = "Enter your key here..."
    KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
    KeyBox.TextSize = 12
    KeyBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    KeyBox.Parent = KeyGui

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 8)
    BoxCorner.Parent = KeyBox

    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Size = UDim2.new(0.85, 0, 0, 45)
    SubmitBtn.Position = UDim2.new(0.075, 0, 0.62, 0)
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
    SubmitBtn.Text = "SUBMIT KEY"
    SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitBtn.TextSize = 13
    SubmitBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    SubmitBtn.Parent = KeyGui

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = SubmitBtn

    local verified = false

    SubmitBtn.MouseButton1Click:Connect(function()
        -- Simpleng Key verification simulasyon base sa Gist link
        verified = true
        KeyGui:Destroy()
        MainFrame.Visible = true
    end)

    ---------------------------------------------------------
    -- 2. MAIN MENU (Habaan, Dark Transparent na iba-iba ang nipis/tapal)
    ---------------------------------------------------------
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 680, 0, 460) -- Mas mahaba at malaki
    MainFrame.Position = UDim2.new(0.5, -340, 0.5, -230)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    MainFrame.BackgroundTransparency = 0.25 -- Layer 1: Dark Transparent Base
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = false
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame

    -- Top Bar / Header
    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, 0, 0, 40)
    Header.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Header.BackgroundTransparency = 0.4 -- Layer 2: Iba ang tapal/nipis ng transparency
    Header.BorderSizePixel = 0
    Header.Parent = MainFrame

    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 12)
    HeaderCorner.Parent = Header

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(0, 400, 1, 0)
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.Text = menuName or "BRGT HUB"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 50, 50) -- Pulay na accent
    TitleLabel.TextSize = 13 -- Maliit, pino at magandang font
    TitleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Header

    -- Left Sidebar (Tab Buttons Container)
    local Sidebar = Instance.new("ScrollingFrame")
    Sidebar.Size = UDim2.new(0, 180, 1, -55)
    Sidebar.Position = UDim2.new(0, 10, 0, 48)
    Sidebar.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
    Sidebar.BackgroundTransparency = 0.5 -- Layer 3: Iba na naman ang nipis
    Sidebar.BorderSizePixel = 0
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
    Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Sidebar.ScrollBarThickness = 2
    Sidebar.Parent = MainFrame

    local SidebarLayout = Instance.new("UIListLayout")
    SidebarLayout.SortOrder = Enum.SortOrder.LayoutIndex
    SidebarLayout.Padding = UDim.new(0, 6)
    SidebarLayout.Parent = Sidebar

    -- Right Container (Tab Content Panel)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -200, 1, -55)
    Container.Position = UDim2.new(0, 195, 0, 48)
    Container.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Container.BackgroundTransparency = 0.6 -- Layer 4: Mas malinaw na dark transparent para sa laman
    Container.BorderSizePixel = 0
    Container.Parent = MainFrame

    local ContainerCorner = Instance.new("UICorner")
    ContainerCorner.CornerRadius = UDim.new(0, 8)
    ContainerCorner.Parent = Container

    local Tabs = {}
    local FirstTab = true

    local WindowObj = {}

    function WindowObj:AddTab(tabName, tabDesc, logoName)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, -10, 0, 36)
        TabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        TabButton.BackgroundTransparency = 0.4
        TabButton.Text = "  " .. tabName
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabButton.TextSize = 11 -- Paliitin ang mga letter
        TabButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
        TabButton.TextXAlignment = Enum.TextXAlignment.Left
        TabButton.Parent = Sidebar

        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 6)
        BtnCorner.Parent = TabButton

        -- Logo sa gilid ng Tab Button
        if logoName and LogoDatabase[logoName] then
            local LogoImg = Instance.new("ImageLabel")
            LogoImg.Size = UDim2.new(0, 18, 0, 18)
            LogoImg.Position = UDim2.new(1, -26, 0.5, -9)
            LogoImg.BackgroundTransparency = 1
            LogoImg.Image = LogoDatabase[logoName]
            LogoImg.ImageColor3 = Color3.fromRGB(255, 50, 50) -- Kulay pula ang logo
            LogoImg.Parent = TabButton
        end

        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.Visible = false
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
        TabContent.ScrollBarThickness = 3
        TabContent.Parent = Container

        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.SortOrder = Enum.SortOrder.LayoutIndex
        ContentLayout.Padding = UDim.new(0, 10) -- May sapat na espasyo at pagitan
        ContentLayout.Parent = TabContent

        local ContentPadding = Instance.new("UIPadding")
        ContentPadding.PaddingTop = UDim.new(0, 10)
        ContentPadding.PaddingLeft = UDim.new(0, 10)
        ContentPadding.PaddingRight = UDim.new(0, 10)
        ContentPadding.Parent = TabContent

        if FirstTab then
            TabContent.Visible = true
            TabButton.TextColor3 = Color3.fromRGB(255, 50, 50)
            FirstTab = false
        end

        TabButton.MouseButton1Click:Connect(function()
            for _, content in pairs(Tabs) do
                content.Visible = false
            end
            for _, btn in pairs(Sidebar:GetChildren()) do
                if btn:IsA("TextButton") then
                    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
                end
            end
            TabContent.Visible = true
            TabButton.TextColor3 = Color3.fromRGB(255, 50, 50)
        end)

        table.insert(Tabs, TabContent)

        local TabObj = {}

        -- Dropdown Tab (Collapsible Section na may parang bilog/pill frame, hiwalay kapag magkatabi)
        function TabObj:AddDropdownTab(sectionName, logoName)
            local DropFrame = Instance.new("Frame")
            DropFrame.Size = UDim2.new(1, 0, 0, 38)
            DropFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
            DropFrame.BackgroundTransparency = 0.3
            DropFrame.BorderSizePixel = 0
            DropFrame.AutomaticSize = Enum.AutomaticSize.Y
            DropFrame.Parent = TabContent

            local DropCorner = Instance.new("UICorner")
            DropCorner.CornerRadius = UDim.new(1, 0) -- Ginawa itong parang bilog/pill ang gilid ng frame box
            DropCorner.Parent = DropFrame

            local DropToggleBtn = Instance.new("TextButton")
            DropToggleBtn.Size = UDim2.new(1, 0, 0, 38)
            DropToggleBtn.BackgroundTransparency = 1
            DropToggleBtn.Text = "   " .. sectionName
            DropToggleBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
            DropToggleBtn.TextSize = 11
            DropToggleBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            DropToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
            DropToggleBtn.Parent = DropFrame

            if logoName and LogoDatabase[logoName] then
                local DropLogo = Instance.new("ImageLabel")
                DropLogo.Size = UDim2.new(0, 16, 0, 16)
                DropLogo.Position = UDim2.new(1, -30, 0.5, -8)
                DropLogo.BackgroundTransparency = 1
                DropLogo.Image = LogoDatabase[logoName]
                DropLogo.ImageColor3 = Color3.fromRGB(255, 50, 50) -- Kulay pulang logo
                DropLogo.Parent = DropToggleBtn
            end

            local InnerContainer = Instance.new("Frame")
            InnerContainer.Size = UDim2.new(1, 0, 0, 0)
            InnerContainer.Position = UDim2.new(0, 0, 0, 40)
            InnerContainer.BackgroundTransparency = 1
            InnerContainer.AutomaticSize = Enum.AutomaticSize.Y
            InnerContainer.Visible = false
            InnerContainer.Parent = DropFrame

            local InnerLayout = Instance.new("UIListLayout")
            InnerLayout.SortOrder = Enum.SortOrder.LayoutIndex
            InnerLayout.Padding = UDim.new(0, 8) -- May distansya at hindi nagdidikitan ang mga items
            InnerLayout.Parent = InnerContainer

            local opened = false
            DropToggleBtn.MouseButton1Click:Connect(function()
                opened = not opened
                InnerContainer.Visible = opened
            end)

            local SectionObj = {}

            -- Button sa loob ng Dropdown Tab
            function SectionObj:AddButton(btnName, btnDesc, logoName, callback)
                local Btn = Instance.new("TextButton")
                Btn.Size = UDim2.new(1, 0, 0, 32)
                Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Btn.BackgroundTransparency = 0.4
                Btn.Text = "  " .. btnName
                Btn.TextColor3 = Color3.fromRGB(220, 220, 220)
                Btn.TextSize = 10 -- Maliit at pino
                Btn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
                Btn.TextXAlignment = Enum.TextXAlignment.Left
                Btn.Parent = InnerContainer

                local BC = Instance.new("UICorner")
                BC.CornerRadius = UDim.new(0, 6)
                BC.Parent = Btn

                if logoName and LogoDatabase[logoName] then
                    local BLogo = Instance.new("ImageLabel")
                    BLogo.Size = UDim2.new(0, 14, 0, 14)
                    BLogo.Position = UDim2.new(1, -24, 0.5, -7)
                    BLogo.BackgroundTransparency = 1
                    BLogo.Image = LogoDatabase[logoName]
                    BLogo.ImageColor3 = Color3.fromRGB(255, 50, 50) -- Pula ang logo ng button
                    BLogo.Parent = Btn
                end

                Btn.MouseButton1Click:Connect(function()
                    if callback then callback() end
                end)
            end

            -- Toggle sa loob ng Dropdown Tab
            function SectionObj:AddToggle(toggleName, toggleDesc, logoName, callback)
                local Tgl = Instance.new("TextButton")
                Tgl.Size = UDim2.new(1, 0, 0, 32)
                Tgl.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Tgl.BackgroundTransparency = 0.4
                Tgl.Text = "  " .. toggleName
                Tgl.TextColor3 = Color3.fromRGB(220, 220, 220)
                Tgl.TextSize = 10
                Tgl.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
                Tgl.TextXAlignment = Enum.TextXAlignment.Left
                Tgl.Parent = InnerContainer

                local TC = Instance.new("UICorner")
                TC.CornerRadius = UDim.new(0, 6)
                TC.Parent = Tgl

                if logoName and LogoDatabase[logoName] then
                    local TLogo = Instance.new("ImageLabel")
                    TLogo.Size = UDim2.new(0, 14, 0, 14)
                    TLogo.Position = UDim2.new(1, -24, 0.5, -7)
                    TLogo.BackgroundTransparency = 1
                    TLogo.Image = LogoDatabase[logoName]
                    TLogo.ImageColor3 = Color3.fromRGB(255, 50, 50) -- Pula ang logo ng toggle
                    TLogo.Parent = Tgl
                end

                local toggled = false
                Tgl.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    if toggled then
                        Tgl.TextColor3 = Color3.fromRGB(255, 50, 50) -- Magiging pula kapag active
                    else
                        Tgl.TextColor3 = Color3.fromRGB(220, 220, 220)
                    end
                    if callback then callback(toggled) end
                end)
            end

            return SectionObj
        end

        return TabObj
    end

    return WindowObj
end

return Library

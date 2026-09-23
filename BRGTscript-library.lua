local UILibrary = {}
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Variable para sa Logo Library loadstring
local loadLogoLibrary = "https://raw.githubusercontent.com/BRGTscript/BRGTscript---library-menu/refs/heads/main/LOGOS.luau"

local function scaleText(textLabel, maxSize)
    textLabel.TextScaled = true
    textLabel.TextWrapped = true
    textLabel.ClipsDescendants = true
    local textConstraint = textLabel:FindFirstChildOfClass("UITextSizeConstraint") or Instance.new("UITextSizeConstraint", textLabel)
    textConstraint.MaxTextSize = maxSize or 7
    textConstraint.MinTextSize = 3
end

function UILibrary:Load(keyUrl, windowTitle)
    local localPlayer = game.Players.LocalPlayer
    if CoreGui:FindFirstChild("KyleKeySystem") then CoreGui.KyleKeySystem:Destroy() end
    if CoreGui:FindFirstChild("KyleBestMenu") then CoreGui.KyleBestMenu:Destroy() end

    local logoRegistry = {}
    pcall(function()
        if loadLogoLibrary and loadLogoLibrary ~= "" then
            logoRegistry = loadstring(game:HttpGet(loadLogoLibrary))() or {}
        end
    end)

    local keyScreenGui = Instance.new("ScreenGui", CoreGui)
    keyScreenGui.Name = "KyleKeySystem"
    keyScreenGui.ResetOnSpawn = false

    local function makeDraggable(dragHandle, targetFrame)
        local dragging, dragInput, dragStart, startPos
        dragHandle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true; dragStart = input.Position; startPos = targetFrame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        dragHandle.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                targetFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    -- KEY SYSTEM FRAME
    local keyFrame = Instance.new("Frame", keyScreenGui)
    keyFrame.Size = UDim2.new(0, 320, 0, 195)
    keyFrame.Position = UDim2.new(0.5, -160, 0.5, -97.5)
    keyFrame.BackgroundColor3 = Color3.fromRGB(28, 12, 16)
    keyFrame.BackgroundTransparency = 0.03
    keyFrame.BorderSizePixel = 1
    keyFrame.BorderColor3 = Color3.fromRGB(220, 45, 55)
    keyFrame.ClipsDescendants = true

    local keyCorner = Instance.new("UICorner", keyFrame)
    keyCorner.CornerRadius = UDim.new(0, 6)

    local keyTitleLabel = Instance.new("TextLabel", keyFrame)
    keyTitleLabel.Size = UDim2.new(1, 0, 0, 36)
    keyTitleLabel.Text = "  [ BRGT HUB ] -- KEY SYSTEM  "
    keyTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyTitleLabel.BackgroundColor3 = Color3.fromRGB(45, 15, 22)
    keyTitleLabel.BackgroundTransparency = 0.08
    keyTitleLabel.Font = Enum.Font.GothamBold
    scaleText(keyTitleLabel, 12)
    makeDraggable(keyTitleLabel, keyFrame)

    local keyTextBox = Instance.new("TextBox", keyFrame)
    keyTextBox.Size = UDim2.new(0.85, 0, 0, 34)
    keyTextBox.Position = UDim2.new(0.075, 0, 0.36, 0)
    keyTextBox.PlaceholderText = "Enter Key Here..."
    keyTextBox.BackgroundColor3 = Color3.fromRGB(40, 18, 24)
    keyTextBox.BackgroundTransparency = 0.1
    keyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyTextBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    keyTextBox.BorderSizePixel = 1
    keyTextBox.BorderColor3 = Color3.fromRGB(180, 35, 45)
    scaleText(keyTextBox, 10)
    
    local boxCorner = Instance.new("UICorner", keyTextBox)
    boxCorner.CornerRadius = UDim.new(0, 4)

    local checkKeyButton = Instance.new("TextButton", keyFrame)
    checkKeyButton.Size = UDim2.new(0.85, 0, 0, 34)
    checkKeyButton.Position = UDim2.new(0.075, 0, 0.66, 0)
    checkKeyButton.BackgroundColor3 = Color3.fromRGB(180, 35, 45)
    checkKeyButton.BackgroundTransparency = 0.05
    checkKeyButton.Text = "CHECK KEY"
    checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkKeyButton.Font = Enum.Font.GothamBold
    checkKeyButton.BorderSizePixel = 1
    checkKeyButton.BorderColor3 = Color3.fromRGB(220, 50, 60)
    scaleText(checkKeyButton, 10)

    local btnCorner = Instance.new("UICorner", checkKeyButton)
    btnCorner.CornerRadius = UDim.new(0, 4)

    local function buildMainWindow()
        local menuScreenGui = Instance.new("ScreenGui", CoreGui)
        menuScreenGui.Name = "KyleBestMenu"
        menuScreenGui.ResetOnSpawn = false

        -- MAIN WINDOW (Mas madilim at mas makapal/solid ang dark background)
        local mainFrame = Instance.new("Frame", menuScreenGui)
        mainFrame.Size = UDim2.new(0, 580, 0, 350)
        mainFrame.Position = UDim2.new(0.5, -290, 0.5, -175)
        mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16) 
        mainFrame.BackgroundTransparency = 0.02
        mainFrame.BorderSizePixel = 1
        mainFrame.BorderColor3 = Color3.fromRGB(50, 50, 65)
        mainFrame.Visible = false

        local mainCorner = Instance.new("UICorner", mainFrame)
        mainCorner.CornerRadius = UDim.new(0, 6)

        local topBarFrame = Instance.new("Frame", mainFrame)
        topBarFrame.Size = UDim2.new(1, 0, 0, 30)
        topBarFrame.Position = UDim2.new(0, 0, 0, -32)
        topBarFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
        topBarFrame.BackgroundTransparency = 0.02
        topBarFrame.BorderSizePixel = 1
        topBarFrame.BorderColor3 = Color3.fromRGB(200, 40, 50)

        local topCorner = Instance.new("UICorner", topBarFrame)
        topCorner.CornerRadius = UDim.new(0, 6)

        local titleLabel = Instance.new("TextLabel", topBarFrame)
        titleLabel.Size = UDim2.new(1, -10, 1, 0)
        titleLabel.Position = UDim2.new(0, 8, 0, 0)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = windowTitle or "KYLE-SCRIPTMAKER -- BRGT HUB"
        titleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
        titleLabel.Font = Enum.Font.GothamBold
        scaleText(titleLabel, 10)
        makeDraggable(topBarFrame, mainFrame)

        local tabScrollingFrame = Instance.new("ScrollingFrame", mainFrame)
        tabScrollingFrame.Size = UDim2.new(0, 130, 1, -12)
        tabScrollingFrame.Position = UDim2.new(0, 6, 0, 6)
        tabScrollingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        tabScrollingFrame.BackgroundTransparency = 0.3
        tabScrollingFrame.BorderSizePixel = 1
        tabScrollingFrame.BorderColor3 = Color3.fromRGB(35, 35, 45)
        tabScrollingFrame.ScrollBarThickness = 2

        local tabLayout = Instance.new("UIListLayout", tabScrollingFrame)
        tabLayout.Padding = UDim.new(0, 5)

        local containerFrame = Instance.new("Frame", mainFrame)
        containerFrame.Size = UDim2.new(1, -144, 1, -12)
        containerFrame.Position = UDim2.new(0, 140, 0, 6)
        containerFrame.BackgroundTransparency = 1
        containerFrame.ClipsDescendants = true

        local toggleOpenButton = Instance.new("TextButton", menuScreenGui)
        toggleOpenButton.Size = UDim2.new(0, 75, 0, 24)
        toggleOpenButton.Position = UDim2.new(0.5, -37.5, 0.03, 0)
        toggleOpenButton.BackgroundColor3 = Color3.fromRGB(180, 35, 45)
        toggleOpenButton.BackgroundTransparency = 0.1
        toggleOpenButton.Text = "CLOSE"
        toggleOpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggleOpenButton.Font = Enum.Font.GothamBold
        toggleOpenButton.BorderSizePixel = 1
        toggleOpenButton.BorderColor3 = Color3.fromRGB(220, 50, 60)
        toggleOpenButton.Draggable = true
        scaleText(toggleOpenButton, 9)
        
        local openCorner = Instance.new("UICorner", toggleOpenButton)
        openCorner.CornerRadius = UDim.new(0, 4)

        toggleOpenButton.MouseButton1Click:Connect(function()
            mainFrame.Visible = not mainFrame.Visible
            toggleOpenButton.Text = mainFrame.Visible and "CLOSE" or "OPEN"
        end)

        local tabContainerRegistry = {}
        local tabButtonRegistry = {}
        local isTweeningTab = false
        local windowAPI = {}

        function windowAPI:AddTab(tabName, tabDescription, logoName)
            -- Tab Button sa gilid
            local tabButton = Instance.new("TextButton", tabScrollingFrame)
            tabButton.Size = UDim2.new(1, -4, 0, 28)
            tabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
            tabButton.BackgroundTransparency = 0.4
            tabButton.Text = "    " .. tabName
            tabButton.TextColor3 = Color3.fromRGB(210, 210, 210)
            tabButton.BorderSizePixel = 1
            tabButton.BorderColor3 = Color3.fromRGB(45, 45, 60)
            tabButton.TextXAlignment = Enum.TextXAlignment.Left
            tabButton.Font = Enum.Font.GothamSemibold
            scaleText(tabButton, 8)

            local tabCorner = Instance.new("UICorner", tabButton)
            tabCorner.CornerRadius = UDim.new(0, 4)

            -- Logo Handler para sa Tab (Kulay red at may sapat na distansya para hindi magkadikit sa title)
            if logoName and logoRegistry and logoRegistry[logoName] then
                local logoImage = Instance.new("ImageLabel", tabButton)
                logoImage.Size = UDim2.new(0, 15, 0, 15)
                logoImage.Position = UDim2.new(0, 6, 0.5, -7.5)
                logoImage.BackgroundTransparency = 1
                logoImage.Image = tostring(logoRegistry[logoName])
                logoImage.ImageColor3 = Color3.fromRGB(220, 40, 50) -- Kulay red ang logo
                tabButton.Text = "        " .. tabName -- Sakto ang layo para hindi ma-overlap ng title
            end

            table.insert(tabButtonRegistry, tabButton)

            local tabContentFrame = Instance.new("Frame", containerFrame)
            tabContentFrame.Size = UDim2.new(1, 0, 1, 0)
            tabContentFrame.BackgroundTransparency = 1
            tabContentFrame.Visible = false

            local descLabel = Instance.new("TextLabel", tabContentFrame)
            descLabel.Size = UDim2.new(1, -5, 0, 0)
            descLabel.AutomaticSize = Enum.AutomaticSize.Y
            descLabel.Position = UDim2.new(0, 0, 0, 0)
            descLabel.BackgroundTransparency = 1
            descLabel.Text = tabDescription or ""
            descLabel.TextColor3 = Color3.fromRGB(210, 210, 210)
            descLabel.Font = Enum.Font.GothamMedium
            descLabel.TextYAlignment = Enum.TextYAlignment.Top
            scaleText(descLabel, 8)

            local contentScrolling = Instance.new("ScrollingFrame", tabContentFrame)
            contentScrolling.Size = UDim2.new(1, 0, 1, 0)
            contentScrolling.BackgroundTransparency = 1
            contentScrolling.ScrollBarThickness = 3
            contentScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)

            local leftColumn = Instance.new("Frame", contentScrolling)
            leftColumn.Size = UDim2.new(0.485, 0, 0, 0)
            leftColumn.Position = UDim2.new(0, 0, 0, 0)
            leftColumn.BackgroundTransparency = 1
            leftColumn.AutomaticSize = Enum.AutomaticSize.Y

            local rightColumn = Instance.new("Frame", contentScrolling)
            rightColumn.Size = UDim2.new(0.485, 0, 0, 0)
            rightColumn.Position = UDim2.new(0.515, 0, 0, 0)
            rightColumn.BackgroundTransparency = 1
            rightColumn.AutomaticSize = Enum.AutomaticSize.Y

            local leftLayout = Instance.new("UIListLayout", leftColumn)
            leftLayout.Padding = UDim.new(0, 8) -- Pinalayo para hindi magkadikit-dikit ang elements
            leftLayout.SortOrder = Enum.SortOrder.LayoutOrder

            local rightLayout = Instance.new("UIListLayout", rightColumn)
            rightLayout.Padding = UDim.new(0, 8) -- Pinalayo para hindi magkadikit-dikit ang elements
            rightLayout.SortOrder = Enum.SortOrder.LayoutOrder

            local columnToggle = 0
            local function getActiveColumn()
                columnToggle = columnToggle + 1
                return columnToggle % 2 == 1 and leftColumn or rightColumn
            end

            local function updateCanvasPosition()
                if descLabel.Text == "" then
                    contentScrolling.Position = UDim2.new(0, 0, 0, 0)
                    contentScrolling.Size = UDim2.new(1, 0, 1, 0)
                else
                    local paddingOffset = 16
                    local descHeight = descLabel.AbsoluteSize.Y + paddingOffset
                    contentScrolling.Position = UDim2.new(0, 0, 0, descHeight)
                    contentScrolling.Size = UDim2.new(1, 0, 1, -descHeight)
                end
            end

            descLabel:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateCanvasPosition)
            task.defer(updateCanvasPosition)

            local function updateCanvasSize()
                local leftHeight = leftLayout.AbsoluteContentSize.Y
                local rightHeight = rightLayout.AbsoluteContentSize.Y
                local maxHeight = math.max(leftHeight, rightHeight)
                contentScrolling.CanvasSize = UDim2.new(0, 0, 0, maxHeight + 20)
            end

            leftLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvasSize)
            rightLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvasSize)

            tabContainerRegistry[tabName] = tabContentFrame
            tabButton.MouseButton1Click:Connect(function()
                if isTweeningTab or tabContentFrame.Visible then return end
                isTweeningTab = true

                -- I-reset ang kulay ng lahat ng tab buttons sa gilid, tapos gawing white highlight ang napindot
                for _, btn in ipairs(tabButtonRegistry) do
                    btn.TextColor3 = Color3.fromRGB(210, 210, 210)
                end
                tabButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White highlight kapag pinindot

                for _, frame in pairs(tabContainerRegistry) do frame.Visible = false end
                tabContentFrame.Position = UDim2.new(1, 0, 0, 0)
                tabContentFrame.Visible = true
                tabContentFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quart", 0.25, true)
                task.wait(0.25)
                isTweeningTab = false
            end)

            local elementAPI = {}

            -- DROPDOWN TAB / SECTION
            function elementAPI:AddDropdownTab(sectionName, logoName)
                local targetColumn = getActiveColumn()
                
                local sectionFrame = Instance.new("Frame", targetColumn)
                sectionFrame.Size = UDim2.new(1, 0, 0, 0)
                sectionFrame.AutomaticSize = Enum.AutomaticSize.Y
                sectionFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
                sectionFrame.BackgroundTransparency = 0.2
                sectionFrame.BorderSizePixel = 1
                sectionFrame.BorderColor3 = Color3.fromRGB(50, 50, 65)

                local secCorner = Instance.new("UICorner", sectionFrame)
                secCorner.CornerRadius = UDim.new(0, 6)

                local sectionHeader = Instance.new("TextButton", sectionFrame)
                sectionHeader.Size = UDim2.new(1, 0, 0, 22)
                sectionHeader.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
                sectionHeader.BackgroundTransparency = 0.15
                sectionHeader.Text = "    " .. sectionName
                sectionHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
                sectionHeader.BorderSizePixel = 0
                sectionHeader.TextXAlignment = Enum.TextXAlignment.Left
                sectionHeader.Font = Enum.Font.GothamBold
                scaleText(sectionHeader, 8)

                local headCorner = Instance.new("UICorner", sectionHeader)
                headCorner.CornerRadius = UDim.new(0, 6)

                -- Logo Handler para sa Section (Kulay red at may sapat na espasyo)
                if logoName and logoRegistry and logoRegistry[logoName] then
                    local logoImage = Instance.new("ImageLabel", sectionHeader)
                    logoImage.Size = UDim2.new(0, 14, 0, 14)
                    logoImage.Position = UDim2.new(0, 5, 0.5, -7)
                    logoImage.BackgroundTransparency = 1
                    logoImage.Image = tostring(logoRegistry[logoName])
                    logoImage.ImageColor3 = Color3.fromRGB(220, 40, 50) -- Kulay red ang logo
                    sectionHeader.Text = "        " .. sectionName
                end

                local arrowLabel = Instance.new("TextLabel", sectionHeader)
                arrowLabel.Size = UDim2.new(0, 20, 1, 0)
                arrowLabel.Position = UDim2.new(1, -22, 0, 0)
                arrowLabel.BackgroundTransparency = 1
                arrowLabel.Text = "▲"
                arrowLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                scaleText(arrowLabel, 7)

                local sectionContent = Instance.new("Frame", sectionFrame)
                sectionContent.Size = UDim2.new(1, 0, 0, 0)
                sectionContent.Position = UDim2.new(0, 0, 0, 24)
                sectionContent.AutomaticSize = Enum.AutomaticSize.Y
                sectionContent.BackgroundTransparency = 1
                sectionContent.ClipsDescendants = true

                local sectionLayout = Instance.new("UIListLayout", sectionContent)
                sectionLayout.Padding = UDim.new(0, 6) -- Sapat na espasyo sa loob ng section
                sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder

                local isSectionOpen = true
                sectionHeader.MouseButton1Click:Connect(function()
                    isSectionOpen = not isSectionOpen
                    sectionContent.Visible = isSectionOpen
                    arrowLabel.Text = isSectionOpen and "▲" or "▼"
                end)

                local subElementAPI = {}

                -- ADD TOGGLE (May sapat na spacing at red logo)
                function subElementAPI:AddToggle(toggleTitle, description, callback, logoName)
                    local wrapper = Instance.new("Frame", sectionContent)
                    wrapper.Size = UDim2.new(1, 0, 0, 20)
                    wrapper.BackgroundTransparency = 1

                    local toggleMain = Instance.new("Frame", wrapper)
                    toggleMain.Size = UDim2.new(1, 0, 0, 20)
                    toggleMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    toggleMain.BackgroundTransparency = 0.92
                    toggleMain.BorderSizePixel = 1
                    toggleMain.BorderColor3 = Color3.fromRGB(80, 80, 100)

                    local tCorner = Instance.new("UICorner", toggleMain)
                    tCorner.CornerRadius = UDim.new(0, 4)

                    local titleText = Instance.new("TextLabel", toggleMain)
                    titleText.Size = UDim2.new(1, -28, 1, 0)
                    titleText.Position = UDim2.new(0, 5, 0, 0)
                    titleText.Text = toggleTitle
                    titleText.TextColor3 = Color3.fromRGB(240, 240, 240)
                    titleText.BackgroundTransparency = 1
                    titleText.TextXAlignment = Enum.TextXAlignment.Left
                    titleText.Font = Enum.Font.GothamMedium
                    scaleText(titleText, 7)

                    if logoName and logoRegistry and logoRegistry[logoName] then
                        local logoImage = Instance.new("ImageLabel", toggleMain)
                        logoImage.Size = UDim2.new(0, 12, 0, 12)
                        logoImage.Position = UDim2.new(0, 4, 0.5, -6)
                        logoImage.BackgroundTransparency = 1
                        logoImage.Image = tostring(logoRegistry[logoName])
                        logoImage.ImageColor3 = Color3.fromRGB(220, 40, 50) -- Kulay red ang logo
                        titleText.Position = UDim2.new(0, 22, 0, 0)
                        titleText.Size = UDim2.new(1, -44, 1, 0)
                    end

                    local toggleButtonBox = Instance.new("TextButton", toggleMain)
                    toggleButtonBox.Size = UDim2.new(0, 12, 0, 12)
                    toggleButtonBox.Position = UDim2.new(1, -16, 0.5, -6)
                    toggleButtonBox.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
                    toggleButtonBox.Text = ""
                    toggleButtonBox.BorderSizePixel = 0
                    
                    local bCorner = Instance.new("UICorner", toggleButtonBox)
                    bCorner.CornerRadius = UDim.new(0, 3)

                    local isToggled = false
                    toggleButtonBox.MouseButton1Click:Connect(function()
                        isToggled = not isToggled
                        toggleButtonBox.BackgroundColor3 = isToggled and Color3.fromRGB(40, 200, 80) or Color3.fromRGB(220, 60, 60)
                        callback(isToggled)
                    end)
                end

                -- ADD BUTTON (May sapat na spacing at red logo)
                function subElementAPI:AddButton(buttonTitle, description, callback, logoName)
                    local wrapper = Instance.new("Frame", sectionContent)
                    wrapper.Size = UDim2.new(1, 0, 0, 20)
                    wrapper.BackgroundTransparency = 1

                    local buttonObject = Instance.new("TextButton", wrapper)
                    buttonObject.Size = UDim2.new(1, 0, 0, 20)
                    buttonObject.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    buttonObject.BackgroundTransparency = 0.90
                    buttonObject.Text = "    " .. buttonTitle
                    buttonObject.TextColor3 = Color3.fromRGB(255, 255, 255)
                    buttonObject.BorderSizePixel = 1
                    buttonObject.BorderColor3 = Color3.fromRGB(80, 80, 100)
                    buttonObject.Font = Enum.Font.GothamSemibold
                    buttonObject.TextXAlignment = Enum.TextXAlignment.Left
                    scaleText(buttonObject, 7)

                    local btnC = Instance.new("UICorner", buttonObject)
                    btnC.CornerRadius = UDim.new(0, 4)

                    if logoName and logoRegistry and logoRegistry[logoName] then
                        local logoImage = Instance.new("ImageLabel", buttonObject)
                        logoImage.Size = UDim2.new(0, 12, 0, 12)
                        logoImage.Position = UDim2.new(0, 4, 0.5, -6)
                        logoImage.BackgroundTransparency = 1
                        logoImage.Image = tostring(logoRegistry[logoName])
                        logoImage.ImageColor3 = Color3.fromRGB(220, 40, 50) -- Kulay red ang logo
                        buttonObject.Text = "        " .. buttonTitle
                    end

                    buttonObject.MouseButton1Click:Connect(function()
                        local originalColor = buttonObject.BackgroundTransparency
                        buttonObject.BackgroundTransparency = 0.70
                        task.wait(0.1)
                        buttonObject.BackgroundTransparency = originalColor
                        callback()
                    end)
                end

                return subElementAPI
            end

            -- Direct AddToggle (Nasa labas ng section)
            function elementAPI:AddToggle(toggleTitle, description, callback, logoName)
                local targetColumn = getActiveColumn()
                local wrapper = Instance.new("Frame", targetColumn)
                wrapper.Size = UDim2.new(1, 0, 0, 20)
                wrapper.BackgroundTransparency = 1

                local toggleMain = Instance.new("Frame", wrapper)
                toggleMain.Size = UDim2.new(1, 0, 0, 20)
                toggleMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggleMain.BackgroundTransparency = 0.92
                toggleMain.BorderSizePixel = 1
                toggleMain.BorderColor3 = Color3.fromRGB(80, 80, 100)

                local tCorner = Instance.new("UICorner", toggleMain)
                tCorner.CornerRadius = UDim.new(0, 4)

                local titleText = Instance.new("TextLabel", toggleMain)
                titleText.Size = UDim2.new(1, -28, 1, 0)
                titleText.Position = UDim2.new(0, 5, 0, 0)
                titleText.Text = toggleTitle
                titleText.TextColor3 = Color3.fromRGB(240, 240, 240)
                titleText.BackgroundTransparency = 1
                titleText.TextXAlignment = Enum.TextXAlignment.Left
                titleText.Font = Enum.Font.GothamMedium
                scaleText(titleText, 7)

                if logoName and logoRegistry and logoRegistry[logoName] then
                    local logoImage = Instance.new("ImageLabel", toggleMain)
                    logoImage.Size = UDim2.new(0, 12, 0, 12)
                    logoImage.Position = UDim2.new(0, 4, 0.5, -6)
                    logoImage.BackgroundTransparency = 1
                    logoImage.Image = tostring(logoRegistry[logoName])
                    logoImage.ImageColor3 = Color3.fromRGB(220, 40, 50) -- Kulay red ang logo
                    titleText.Position = UDim2.new(0, 22, 0, 0)
                    titleText.Size = UDim2.new(1, -44, 1, 0)
                end

                local toggleButtonBox = Instance.new("TextButton", toggleMain)
                toggleButtonBox.Size = UDim2.new(0, 12, 0, 12)
                toggleButtonBox.Position = UDim2.new(1, -16, 0.5, -6)
                toggleButtonBox.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
                toggleButtonBox.Text = ""
                toggleButtonBox.BorderSizePixel = 0

                local bCorner = Instance.new("UICorner", toggleButtonBox)
                bCorner.CornerRadius = UDim.new(0, 3)

                local isToggled = false
                toggleButtonBox.MouseButton1Click:Connect(function()
                    isToggled = not isToggled
                    toggleButtonBox.BackgroundColor3 = isToggled and Color3.fromRGB(40, 200, 80) or Color3.fromRGB(220, 60, 60)
                    callback(isToggled)
                end)
            end

            -- Direct AddButton (Nasa labas ng section)
            function elementAPI:AddButton(buttonTitle, description, callback, logoName)
                local targetColumn = getActiveColumn()
                local wrapper = Instance.new("Frame", targetColumn)
                wrapper.Size = UDim2.new(1, 0, 0, 20)
                wrapper.BackgroundTransparency = 1

                local buttonObject = Instance.new("TextButton", wrapper)
                buttonObject.Size = UDim2.new(1, 0, 0, 20)
                buttonObject.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                buttonObject.BackgroundTransparency = 0.90
                buttonObject.Text = "    " .. buttonTitle
                buttonObject.TextColor3 = Color3.fromRGB(255, 255, 255)
                buttonObject.BorderSizePixel = 1
                buttonObject.BorderColor3 = Color3.fromRGB(80, 80, 100)
                buttonObject.Font = Enum.Font.GothamSemibold
                buttonObject.TextXAlignment = Enum.TextXAlignment.Left
                scaleText(buttonObject, 7)

                local btnC = Instance.new("UICorner", buttonObject)
                btnC.CornerRadius = UDim.new(0, 4)

                if logoName and logoRegistry and logoRegistry[logoName] then
                    local logoImage = Instance.new("ImageLabel", buttonObject)
                    logoImage.Size = UDim2.new(0, 12, 0, 12)
                    logoImage.Position = UDim2.new(0, 4, 0.5, -6)
                    logoImage.BackgroundTransparency = 1
                    logoImage.Image = tostring(logoRegistry[logoName])
                    logoImage.ImageColor3 = Color3.fromRGB(220, 40, 50) -- Kulay red ang logo
                    buttonObject.Text = "        " .. buttonTitle
                end

                buttonObject.MouseButton1Click:Connect(function()
                    local originalColor = buttonObject.BackgroundTransparency
                    buttonObject.BackgroundTransparency = 0.70
                    task.wait(0.1)
                    buttonObject.BackgroundTransparency = originalColor
                    callback()
                end)
            end

            return elementAPI
        end
        return windowAPI
    end

    checkKeyButton.MouseButton1Click:Connect(function()
        local success, fetchedKey = pcall(function()
            return game:HttpGet(keyUrl)
        end)
        if success then
            local cleanKey = fetchedKey:gsub("%s+", "")
            if keyTextBox.Text == cleanKey then
                keyScreenGui:Destroy()
                _G.KyleMenu = buildMainWindow()
            else
                checkKeyButton.Text = "WRONG KEY"
                task.wait(2)
                checkKeyButton.Text = "CHECK KEY"
            end
        end
    end)

    repeat task.wait() until not keyScreenGui.Parent
    return _G.KyleMenu
end

return UILibrary

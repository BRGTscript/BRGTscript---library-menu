local UILibrary = {}
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local loadLogoLibrary = "https://raw.githubusercontent.com/BRGTscript/BRGTscript---library-menu/refs/heads/main/LOGOS.luau"

local function scaleText(textLabel, maxSize)
    textLabel.TextScaled = true
    textLabel.TextWrapped = true
    textLabel.ClipsDescendants = true
    local textConstraint = textLabel:FindFirstChildOfClass("UITextSizeConstraint") or Instance.new("UITextSizeConstraint", textLabel)
    textConstraint.MaxTextSize = maxSize or 8
    textConstraint.MinTextSize = 4
end

function UILibrary:Load(keyUrl, windowTitle)
    local localPlayer = game.Players.LocalPlayer
    if CoreGui:FindFirstChild("KyleKeySystem") then CoreGui.KyleKeySystem:Destroy() end
    if CoreGui:FindFirstChild("KyleBestMenu") then CoreGui.KyleBestMenu:Destroy() end

    local logoRegistry = {}
    pcall(function()
        if loadLogoLibrary and loadLogoLibrary ~= "https://raw.githubusercontent.com/BRGTscript/BRGTscript---library-menu/refs/heads/main/LOGOS.luau" then
            logoRegistry = loadstring(game:HttpGet(loadLogoLibrary))() or {}
        end
    end)

    local keyScreenGui = Instance.new("ScreenGui", CoreGui)
    keyScreenGui.Name = "KyleKeySystem"

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

    local keyFrame = Instance.new("Frame", keyScreenGui)
    keyFrame.Size = UDim2.new(0, 310, 0, 190)
    keyFrame.Position = UDim2.new(0.5, -155, 0.5, -95)
    keyFrame.BackgroundColor3 = Color3.fromRGB(25, 8, 12)
    keyFrame.BackgroundTransparency = 0.05
    keyFrame.BorderSizePixel = 1
    keyFrame.BorderColor3 = Color3.fromRGB(220, 50, 60)
    keyFrame.ClipsDescendants = true

    local keyTitleLabel = Instance.new("TextLabel", keyFrame)
    keyTitleLabel.Size = UDim2.new(1, 0, 0, 35)
    keyTitleLabel.Text = "!! WELCOME TO BRGT HUB !!"
    keyTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyTitleLabel.BackgroundColor3 = Color3.fromRGB(40, 10, 15)
    keyTitleLabel.BackgroundTransparency = 0.1
    keyTitleLabel.Font = Enum.Font.SourceSansBold
    scaleText(keyTitleLabel, 14)
    makeDraggable(keyTitleLabel, keyFrame)

    local keyTextBox = Instance.new("TextBox", keyFrame)
    keyTextBox.Size = UDim2.new(0.85, 0, 0, 32)
    keyTextBox.Position = UDim2.new(0.075, 0, 0.35, 0)
    keyTextBox.PlaceholderText = "Enter Key Here..."
    keyTextBox.BackgroundColor3 = Color3.fromRGB(40, 15, 20)
    keyTextBox.BackgroundTransparency = 0.1
    keyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyTextBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    keyTextBox.BorderSizePixel = 1
    keyTextBox.BorderColor3 = Color3.fromRGB(180, 40, 50)
    scaleText(keyTextBox, 12)

    local checkKeyButton = Instance.new("TextButton", keyFrame)
    checkKeyButton.Size = UDim2.new(0.85, 0, 0, 32)
    checkKeyButton.Position = UDim2.new(0.075, 0, 0.65, 0)
    checkKeyButton.BackgroundColor3 = Color3.fromRGB(180, 40, 50)
    checkKeyButton.BackgroundTransparency = 0.1
    checkKeyButton.Text = "CHECK KEY"
    checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkKeyButton.Font = Enum.Font.SourceSansBold
    checkKeyButton.BorderSizePixel = 1
    checkKeyButton.BorderColor3 = Color3.fromRGB(220, 50, 60)
    scaleText(checkKeyButton, 12)

    local function buildMainWindow()
        local menuScreenGui = Instance.new("ScreenGui", CoreGui)
        menuScreenGui.Name = "KyleBestMenu"
        menuScreenGui.ResetOnSpawn = false

        local mainFrame = Instance.new("Frame", menuScreenGui)
        mainFrame.Size = UDim2.new(0, 540, 0, 320)
        mainFrame.Position = UDim2.new(0.5, -270, 0.5, -160)
        mainFrame.BackgroundColor3 = Color3.fromRGB(20, 8, 12)
        mainFrame.BackgroundTransparency = 0.05
        mainFrame.BorderSizePixel = 1
        mainFrame.BorderColor3 = Color3.fromRGB(220, 50, 60)
        mainFrame.Visible = false

        local topBarFrame = Instance.new("Frame", mainFrame)
        topBarFrame.Size = UDim2.new(1, 0, 0, 28)
        topBarFrame.Position = UDim2.new(0, 0, 0, -30)
        topBarFrame.BackgroundColor3 = Color3.fromRGB(30, 10, 15)
        topBarFrame.BackgroundTransparency = 0.1
        topBarFrame.BorderSizePixel = 1
        topBarFrame.BorderColor3 = Color3.fromRGB(220, 50, 60)

        local titleLabel = Instance.new("TextLabel", topBarFrame)
        titleLabel.Size = UDim2.new(1, -10, 1, 0)
        titleLabel.Position = UDim2.new(0, 5, 0, 0)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = windowTitle or "KYLE-SCRIPTMAKER"
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLabel.Font = Enum.Font.SourceSansBold
        scaleText(titleLabel, 12)
        makeDraggable(topBarFrame, mainFrame)

        local tabScrollingFrame = Instance.new("ScrollingFrame", mainFrame)
        tabScrollingFrame.Size = UDim2.new(0, 115, 1, -10)
        tabScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
        tabScrollingFrame.BackgroundColor3 = Color3.fromRGB(35, 10, 15)
        tabScrollingFrame.BackgroundTransparency = 0.1
        tabScrollingFrame.BorderSizePixel = 0
        tabScrollingFrame.ScrollBarThickness = 2

        local tabLayout = Instance.new("UIListLayout", tabScrollingFrame)
        tabLayout.Padding = UDim.new(0, 4)

        local containerFrame = Instance.new("Frame", mainFrame)
        containerFrame.Size = UDim2.new(1, -130, 1, -10)
        containerFrame.Position = UDim2.new(0, 125, 0, 5)
        containerFrame.BackgroundTransparency = 1
        containerFrame.ClipsDescendants = true

        local toggleOpenButton = Instance.new("TextButton", menuScreenGui)
        toggleOpenButton.Size = UDim2.new(0, 70, 0, 24)
        toggleOpenButton.Position = UDim2.new(0.5, -35, 0.04, 0)
        toggleOpenButton.BackgroundColor3 = Color3.fromRGB(180, 30, 40)
        toggleOpenButton.BackgroundTransparency = 0.1
        toggleOpenButton.Text = "OPEN"
        toggleOpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggleOpenButton.Font = Enum.Font.SourceSansBold
        toggleOpenButton.BorderSizePixel = 1
        toggleOpenButton.BorderColor3 = Color3.fromRGB(220, 50, 60)
        toggleOpenButton.Draggable = true
        scaleText(toggleOpenButton, 10)

        toggleOpenButton.MouseButton1Click:Connect(function()
            mainFrame.Visible = not mainFrame.Visible
            toggleOpenButton.Text = mainFrame.Visible and "CLOSE" or "OPEN"
        end)

        local tabContainerRegistry = {}
        local isTweeningTab = false
        local windowAPI = {}

        function windowAPI:AddTab(tabName, tabDescription, logoName)
            local tabButton = Instance.new("TextButton", tabScrollingFrame)
            tabButton.Size = UDim2.new(1, -4, 0, 26)
            tabButton.BackgroundColor3 = Color3.fromRGB(120, 30, 40)
            tabButton.BackgroundTransparency = 0.15
            tabButton.Text = "  " .. tabName
            tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            tabButton.BorderSizePixel = 1
            tabButton.BorderColor3 = Color3.fromRGB(180, 40, 50)
            tabButton.TextXAlignment = Enum.TextXAlignment.Left
            scaleText(tabButton, 9)

            if logoName and logoRegistry[logoName] then
                local logoImage = Instance.new("ImageLabel", tabButton)
                logoImage.Size = UDim2.new(0, 16, 0, 16)
                logoImage.Position = UDim2.new(0, 5, 0.5, -8)
                logoImage.BackgroundTransparency = 1
                logoImage.Image = logoRegistry[logoName]
                logoImage.ImageColor3 = Color3.fromRGB(220, 50, 60)
                tabButton.Text = "      " .. tabName
            end

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
            descLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            descLabel.Font = Enum.Font.SourceSansBold
            descLabel.TextYAlignment = Enum.TextYAlignment.Top
            scaleText(descLabel, 9)

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
            leftLayout.Padding = UDim.new(0, 6)
            leftLayout.SortOrder = Enum.SortOrder.LayoutOrder

            local rightLayout = Instance.new("UIListLayout", rightColumn)
            rightLayout.Padding = UDim.new(0, 6)
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
                    local paddingOffset = 14
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
                contentScrolling.CanvasSize = UDim2.new(0, 0, 0, maxHeight + 15)
            end

            leftLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvasSize)
            rightLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvasSize)

            tabContainerRegistry[tabName] = tabContentFrame
            tabButton.MouseButton1Click:Connect(function()
                if isTweeningTab or tabContentFrame.Visible then return end
                isTweeningTab = true
                for _, frame in pairs(tabContainerRegistry) do frame.Visible = false end
                tabContentFrame.Position = UDim2.new(1, 0, 0, 0)
                tabContentFrame.Visible = true
                tabContentFrame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quart", 0.25, true)
                task.wait(0.25)
                isTweeningTab = false
            end)

            local elementAPI = {}

            function elementAPI:AddDropdownTab(sectionName)
                local targetColumn = getActiveColumn()
                local sectionFrame = Instance.new("Frame", targetColumn)
                sectionFrame.Size = UDim2.new(1, 0, 0, 0)
                sectionFrame.AutomaticSize = Enum.AutomaticSize.Y
                sectionFrame.BackgroundTransparency = 1

                local sectionHeader = Instance.new("TextButton", sectionFrame)
                sectionHeader.Size = UDim2.new(1, 0, 0, 24)
                sectionHeader.BackgroundColor3 = Color3.fromRGB(40, 12, 17)
                sectionHeader.BackgroundTransparency = 0.1
                sectionHeader.Text = "  " .. sectionName
                sectionHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
                sectionHeader.BorderSizePixel = 1
                sectionHeader.BorderColor3 = Color3.fromRGB(150, 40, 50)
                sectionHeader.TextXAlignment = Enum.TextXAlignment.Left
                scaleText(sectionHeader, 8)

                local arrowLabel = Instance.new("TextLabel", sectionHeader)
                arrowLabel.Size = UDim2.new(0, 20, 1, 0)
                arrowLabel.Position = UDim2.new(1, -22, 0, 0)
                arrowLabel.BackgroundTransparency = 1
                arrowLabel.Text = "▲"
                arrowLabel.TextColor3 = Color3.fromRGB(220, 50, 60)
                scaleText(arrowLabel, 8)

                local sectionContent = Instance.new("Frame", sectionFrame)
                sectionContent.Size = UDim2.new(1, 0, 0, 0)
                sectionContent.Position = UDim2.new(0, 0, 0, 26)
                sectionContent.AutomaticSize = Enum.AutomaticSize.Y
                sectionContent.BackgroundTransparency = 1
                sectionContent.ClipsDescendants = true

                local sectionLayout = Instance.new("UIListLayout", sectionContent)
                sectionLayout.Padding = UDim.new(0, 5)
                sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder

                local isSectionOpen = true
                sectionHeader.MouseButton1Click:Connect(function()
                    isSectionOpen = not isSectionOpen
                    sectionContent.Visible = isSectionOpen
                    arrowLabel.Text = isSectionOpen and "▲" or "▼"
                end)

                local subElementAPI = {}
                function subElementAPI:AddToggle(toggleTitle, description, callback)
                    local wrapper = Instance.new("Frame", sectionContent)
                    wrapper.Size = UDim2.new(1, 0, 0, 24)
                    wrapper.BackgroundTransparency = 1

                    local toggleMain = Instance.new("Frame", wrapper)
                    toggleMain.Size = UDim2.new(1, 0, 0, 24)
                    toggleMain.BackgroundColor3 = Color3.fromRGB(50, 15, 20)
                    toggleMain.BackgroundTransparency = 0.1
                    toggleMain.BorderSizePixel = 1
                    toggleMain.BorderColor3 = Color3.fromRGB(150, 40, 50)

                    local titleText = Instance.new("TextLabel", toggleMain)
                    titleText.Size = UDim2.new(1, -30, 1, 0)
                    titleText.Position = UDim2.new(0, 5, 0, 0)
                    titleText.Text = toggleTitle
                    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
                    titleText.BackgroundTransparency = 1
                    titleText.TextXAlignment = Enum.TextXAlignment.Left
                    scaleText(titleText, 8)

                    local toggleButtonBox = Instance.new("TextButton", toggleMain)
                    toggleButtonBox.Size = UDim2.new(0, 12, 0, 12)
                    toggleButtonBox.Position = UDim2.new(1, -22, 0.5, -6)
                    toggleButtonBox.BackgroundColor3 = Color3.fromRGB(220, 40, 40)
                    toggleButtonBox.Text = ""
                    toggleButtonBox.BorderSizePixel = 1
                    toggleButtonBox.BorderColor3 = Color3.fromRGB(0, 0, 0)

                    local isToggled = false
                    toggleButtonBox.MouseButton1Click:Connect(function()
                        isToggled = not isToggled
                        toggleButtonBox.BackgroundColor3 = isToggled and Color3.fromRGB(40, 200, 80) or Color3.fromRGB(220, 40, 40)
                        callback(isToggled)
                    end)
                end

                function subElementAPI:AddButton(buttonTitle, description, callback)
                    local wrapper = Instance.new("Frame", sectionContent)
                    wrapper.Size = UDim2.new(1, 0, 0, 24)
                    wrapper.BackgroundTransparency = 1

                    local buttonObject = Instance.new("TextButton", wrapper)
                    buttonObject.Size = UDim2.new(1, 0, 0, 24)
                    buttonObject.BackgroundColor3 = Color3.fromRGB(80, 20, 30)
                    buttonObject.BackgroundTransparency = 0.1
                    buttonObject.Text = buttonTitle
                    buttonObject.TextColor3 = Color3.fromRGB(255, 255, 255)
                    buttonObject.BorderSizePixel = 1
                    buttonObject.BorderColor3 = Color3.fromRGB(150, 40, 50)
                    scaleText(buttonObject, 8)

                    buttonObject.MouseButton1Click:Connect(function()
                        local originalColor = buttonObject.BackgroundColor3
                        buttonObject.BackgroundColor3 = Color3.fromRGB(220, 50, 60)
                        task.wait(0.1)
                        buttonObject.BackgroundColor3 = originalColor
                        callback()
                    end)
                end

                return subElementAPI
            end

            function elementAPI:AddToggle(toggleTitle, description, callback)
                local targetColumn = getActiveColumn()
                local wrapper = Instance.new("Frame", targetColumn)
                wrapper.Size = UDim2.new(1, 0, 0, 24)
                wrapper.BackgroundTransparency = 1

                local toggleMain = Instance.new("Frame", wrapper)
                toggleMain.Size = UDim2.new(1, 0, 0, 24)
                toggleMain.BackgroundColor3 = Color3.fromRGB(50, 15, 20)
                toggleMain.BackgroundTransparency = 0.1
                toggleMain.BorderSizePixel = 1
                toggleMain.BorderColor3 = Color3.fromRGB(150, 40, 50)

                local titleText = Instance.new("TextLabel", toggleMain)
                titleText.Size = UDim2.new(1, -30, 1, 0)
                titleText.Position = UDim2.new(0, 5, 0, 0)
                titleText.Text = toggleTitle
                titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
                titleText.BackgroundTransparency = 1
                titleText.TextXAlignment = Enum.TextXAlignment.Left
                scaleText(titleText, 8)

                local toggleButtonBox = Instance.new("TextButton", toggleMain)
                toggleButtonBox.Size = UDim2.new(0, 12, 0, 12)
                toggleButtonBox.Position = UDim2.new(1, -22, 0.5, -6)
                toggleButtonBox.BackgroundColor3 = Color3.fromRGB(220, 40, 40)
                toggleButtonBox.Text = ""
                toggleButtonBox.BorderSizePixel = 1
                toggleButtonBox.BorderColor3 = Color3.fromRGB(0, 0, 0)

                local isToggled = false
                toggleButtonBox.MouseButton1Click:Connect(function()
                    isToggled = not isToggled
                    toggleButtonBox.BackgroundColor3 = isToggled and Color3.fromRGB(40, 200, 80) or Color3.fromRGB(220, 40, 40)
                    callback(isToggled)
                end)
            end

            function elementAPI:AddButton(buttonTitle, description, callback)
                local targetColumn = getActiveColumn()
                local wrapper = Instance.new("Frame", targetColumn)
                wrapper.Size = UDim2.new(1, 0, 0, 24)
                wrapper.BackgroundTransparency = 1

                local buttonObject = Instance.new("TextButton", wrapper)
                buttonObject.Size = UDim2.new(1, 0, 0, 24)
                buttonObject.BackgroundColor3 = Color3.fromRGB(80, 20, 30)
                buttonObject.BackgroundTransparency = 0.1
                buttonObject.Text = buttonTitle
                buttonObject.TextColor3 = Color3.fromRGB(255, 255, 255)
                buttonObject.BorderSizePixel = 1
                buttonObject.BorderColor3 = Color3.fromRGB(150, 40, 50)
                scaleText(buttonObject, 8)

                buttonObject.MouseButton1Click:Connect(function()
                    local originalColor = buttonObject.BackgroundColor3
                    buttonObject.BackgroundColor3 = Color3.fromRGB(220, 50, 60)
                    task.wait(0.1)
                    buttonObject.BackgroundColor3 = originalColor
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

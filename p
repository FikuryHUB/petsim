getgenv().Settings = {
    --AutoFarm [Third Sea]
	["Auto Farm Level"] = false,
	["Fast Farm Level"] = false,
	["Auto Farm Bone"] = false,
	["Auto Random Suprise"] = false,
	["Auto Farm Nearest"] = false,
	--[Second Sea]
	["Auto Farm Factory"] = false,
	["Auto Farm Ectoplasm"] = false,
	["Auto Third Sea Quest"] = false,
	--[First Sea]
	["Auto Second Sea Quest"] = false,
	----------------------------------------------------------------------------
	--Settings
	["Select Weapon"] = nil or "Select Weapon",
    ["Fast Attack"] = false,
    ["Super Fast Attack"] = false,
    ["Old Fast Attack"] = false,
	["Level Lock"] = 2300,
--	["Level Lock Toggle"] = false,
    ["Distance Mastery"] = 40,
    ["Kill At"] = 15,
    ["Distance Player"] = 20,
	
	----------------------------------------------------------------------------
	--Auto Fighting Styles
	["Auto Superhuman"] = false,
	["Auto DeathStep"] = false,
	["Auto Sharkman Karate"] = false,
	["Auto Electric Claw"] = false,
	["Auto Dragon Talon"] = false,
	
	----------------------------------------------------------------------------
	--Auto Boss
	--getgenv().Settings["Auto Sharkman Karate"]
	["Auto Farm Boss"] = false,
	["Auto Farm All Boss"] = false,
	["Auto Farm All Boss Hop"] = false,
    ["All Boss"] = false,
	-- Boss Drops
	["Auto Chest"] = false,
	["Auto Chest Hop"] = false,
	-- [ Third Sea ]
	["Auto Katakuri"] = false,
	["Auto Buddy"] = false,
	["Auto Buddy Hop"] = false,
	["Auto Elite Hunter"] = false,
	["Auto Elite Hop"] = false,
	["Auto Elite God"] = false,
	["Auto Hallow"] = false,
	["Auto Hallow Hop"] = false,
	["Auto Color"] = false,
	["Auto Color Hop"] = false,
	["Auto Dark Dagger"] = false,
	["Auto Dark Dagger Hop"] = false,
	["Auto Farm Observation"] = false,
	["Auto Farm Observation Hop"] = false,
	["Auto Farm Observation V2"] = false,
	-- [ Second Sea ]
	["Auto Farm Swan Glasses"] = false,
	["Auto Farm Swan Glasses Hop"] = false,
	["Auto Legendary Sword"] = false,
	["Auto Legendary Sword Hop"] = false,
	["Auto Black Beard"] = false,
	["Auto Black Beard Hop"] = false,
	-- [ First Sea ]
	["Auto Pole V1"] = false,
	["Auto Pole V1 Hop"]= false,
	["Auto Saber"] = false,
	["Auto Saber Hop"] = false,
	----------------------------------------------------------------------------
	--Stats
	["Auto Melee"] = false,
	["Auto Defense"] = false,
	["Auto Sword"] = false,
	["Auto Gun"] = false,
	["Auto Devil Fruits"] = false,
	["Stat Points"] = 1,
	----------------------------------------------------------------------------
	-- Bounty
	["Auto Farm Bounty"] = false,
	["Auto Farm Bounty Hop"] = false,
	["Lock Bounty"] = 750000,
--	["Start Bounty Lock"] = false,
	----------------------------------------------------------------------------
	--Player
	--["Dodge No CD"] = false,
	["Inf Energy"] = false,
	--["Inf Ken"] = false,
	["Inf Geppo"] = false,
	["Inf Soru"] = false,
	["Auto Buy Random Fruit"] = false,
    ["Store Fruit"] = false,
	----------------------------------------------------------------------------
	-- UI Color
	["First Color"] = _G.Color,
	["Second Color"] = _G.Color2,
	
}


function Load()
	if readfile and writefile and isfile and isfolder then
		if isfolder("ThunderZ") == false then
			makefolder("ThunderZ")
		end
		if isfile("/ThunderZ/BloxFruit-" .. game.Players.LocalPlayer.DisplayName .. ".json") == false then
			writefile("/ThunderZ/BloxFruit-" .. game.Players.LocalPlayer.DisplayName .. ".json", game:GetService("HttpService"):JSONEncode(getgenv().Settings))
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile("/ThunderZ/BloxFruit-" .. game.Players.LocalPlayer.DisplayName .. ".json"))
			for i,v in pairs(Decode) do
				getgenv().Settings[i] = v
			end
		end
	else
		warn("Failed Load")
		return false
	end
end
function Save()
	if readfile and writefile and isfile then
		if isfile("/ThunderZ/BloxFruit-" .. game.Players.LocalPlayer.DisplayName .. ".json") == false then
			Load()
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile("/ThunderZ/BloxFruit-" .. game.Players.LocalPlayer.DisplayName .. ".json"))
			local Array = {}
			for i,v in pairs(getgenv().Settings) do
				Array[i] = v
			end
			writefile("/ThunderZ/BloxFruit-" .. game.Players.LocalPlayer.DisplayName .. ".json", game:GetService("HttpService"):JSONEncode(Array))
		end
	else
		warn("Failed Save")
		return false
	end
end

Load()
Save()
if game.PlaceId == 2753915549 then
end

-- // UI LIBRARY \\
-- \\ CREDIT XENON HUB //
local library = { 
    flags = { }, 
    items = { } 
}
if _G.Color == nil then _G.Color = Color3.fromRGB(0, 225, 225) end
if _G.Color2 == nil then _G.Color2 = Color3.fromRGB(255, 255, 255) end
-- Services
local players = game:GetService("Players")
	local uis = game:GetService("UserInputService")
	local runservice = game:GetService("RunService")
	local tweenservice = game:GetService("TweenService")
	local marketplaceservice = game:GetService("MarketplaceService")
	local textservice = game:GetService("TextService")
	local coregui = game:GetService("CoreGui")
	local httpservice = game:GetService("HttpService")
	local player = players.LocalPlayer
	local mouse = player:GetMouse()
	local camera = game.Workspace.CurrentCamera
	library.theme = {
        fontsize = 15,
        titlesize = 20,
        font = Enum.Font.Code,
        background = "rbxassetid://5553946656",
        tilesize = 50,
        cursor = false,
        cursorimg = "https://t0.rbxcdn.com/42f66da98c40252ee151326a82aab51f",
        backgroundcolor = Color3.fromRGB(20, 20, 20),
        tabstextcolor = Color3.fromRGB(240, 240, 240),
        bordercolor = Color3.fromRGB(60, 60, 60),
        accentcolor = _G.Color,
        accentcolor2 = _G.Color2,
        outlinecolor = Color3.fromRGB(60, 60, 60),
        outlinecolor2 = Color3.fromRGB(0, 0, 0),
        sectorcolor = Color3.fromRGB(30, 30, 30),
        toptextcolor = _G.Color,
        topheight = 48,
        topcolor = Color3.fromRGB(30, 30, 30),
        topcolor2 = Color3.fromRGB(15, 15, 15),
        buttoncolor = Color3.fromRGB(49, 49, 49),
        buttoncolor2 = Color3.fromRGB(39, 39, 39),
        itemscolor = Color3.fromRGB(200, 200, 200),
        itemscolor2 = Color3.fromRGB(210, 210, 210)}
	if library.theme.cursor and Drawing then
		local success = pcall(function()
			library.cursor = Drawing.new("Image")
			library.cursor.Data = game:HttpGet(library.theme.cursorimg)
			library.cursor.Size = Vector2.new(64, 64)
			library.cursor.Visible = uis.MouseEnabled
			library.cursor.Rounding = 0
			library.cursor.Position = Vector2.new(mouse.X - 32, mouse.Y + 6)
		end)
		if success and library.cursor then
			uis.InputChanged:Connect(function(input)
				if uis.MouseEnabled then
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						library.cursor.Position = Vector2.new(input.Position.X - 32, input.Position.Y + 7)
					end
				end
			end)
			game:GetService("RunService").RenderStepped:Connect(function()
				uis.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
				library.cursor.Visible = uis.MouseEnabled and (uis.MouseIconEnabled or game:GetService("GuiService").MenuIsOpen)
			end)
		elseif not success and library.cursor then
			library.cursor:Remove()
		end
	end


function library:CreateWatermark(name, position)
    local gamename = marketplaceservice:GetProductInfo(game.PlaceId).Name
    local watermark = { }
    watermark.Visible = true
    watermark.text = " " .. name:gsub("{game}", gamename):gsub("{fps}", "0 FPS") .. " "

    watermark.main = Instance.new("ScreenGui", coregui)
    watermark.main.Name = "Watermark"
    if syn then
        syn.protect_gui(watermark.main)
    end

    if getgenv().watermark then
        getgenv().watermark:Remove()
    end
    getgenv().watermark = watermark.main
    
    watermark.mainbar = Instance.new("Frame", watermark.main)
    watermark.mainbar.Name = "Main"
    watermark.mainbar.BorderColor3 = Color3.fromRGB(80, 80, 80)
    watermark.mainbar.Visible = watermark.Visible
    watermark.mainbar.BorderSizePixel = 0
    watermark.mainbar.ZIndex = 5
    watermark.mainbar.Position = UDim2.new(0, position and position.X or 10, 0, position and position.Y or 10)
    watermark.mainbar.Size = UDim2.new(0, 0, 0, 25)

    watermark.Gradient = Instance.new("UIGradient", watermark.mainbar)
    watermark.Gradient.Rotation = 90
    watermark.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, Color3.fromRGB(40, 40, 40)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 10, 10)) })

    watermark.Outline = Instance.new("Frame", watermark.mainbar)
    watermark.Outline.Name = "outline"
    watermark.Outline.ZIndex = 4
    watermark.Outline.BorderSizePixel = 0
    watermark.Outline.Visible = watermark.Visible
    watermark.Outline.BackgroundColor3 = library.theme.outlinecolor
    watermark.Outline.Position = UDim2.fromOffset(-1, -1)

    watermark.BlackOutline = Instance.new("Frame", watermark.mainbar)
    watermark.BlackOutline.Name = "blackline"
    watermark.BlackOutline.ZIndex = 3
    watermark.BlackOutline.BorderSizePixel = 0
    watermark.BlackOutline.BackgroundColor3 = library.theme.outlinecolor2
    watermark.BlackOutline.Visible = watermark.Visible
    watermark.BlackOutline.Position = UDim2.fromOffset(-2, -2)

    watermark.label = Instance.new("TextLabel", watermark.mainbar)
    watermark.label.Name = "FPSLabel"
    watermark.label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    watermark.label.BackgroundTransparency = 1.000
    watermark.label.Position = UDim2.new(0, 0, 0, 0)
    watermark.label.Size = UDim2.new(0, 238, 0, 25)
    watermark.label.Font = library.theme.font
    watermark.label.ZIndex = 6
    watermark.label.Visible = watermark.Visible
    watermark.label.Text = watermark.text
    watermark.label.TextColor3 = Color3.fromRGB(255, 255, 255)
    watermark.label.TextSize = 15
    watermark.label.TextStrokeTransparency = 0.000
    watermark.label.TextXAlignment = Enum.TextXAlignment.Left
    watermark.label.Size = UDim2.new(0, watermark.label.TextBounds.X+10, 0, 25)
    
    watermark.topbar = Instance.new("Frame", watermark.mainbar)
    watermark.topbar.Name = "TopBar"
    watermark.topbar.ZIndex = 6
    watermark.topbar.BackgroundColor3 = library.theme.accentcolor
    watermark.topbar.BorderSizePixel = 0
    watermark.topbar.Visible = watermark.Visible
    watermark.topbar.Size = UDim2.new(0, 0, 0, 1)

    watermark.mainbar.Size = UDim2.new(0, watermark.label.TextBounds.X, 0, 25)
    watermark.topbar.Size = UDim2.new(0, watermark.label.TextBounds.X+6, 0, 1)
    watermark.Outline.Size = watermark.mainbar.Size + UDim2.fromOffset(2, 2)
    watermark.BlackOutline.Size = watermark.mainbar.Size + UDim2.fromOffset(4, 4)

    watermark.mainbar.Size = UDim2.new(0, watermark.label.TextBounds.X+4, 0, 25)    
    watermark.label.Size = UDim2.new(0, watermark.label.TextBounds.X+4, 0, 25)
    watermark.topbar.Size = UDim2.new(0, watermark.label.TextBounds.X+6, 0, 1)
    watermark.Outline.Size = watermark.mainbar.Size + UDim2.fromOffset(2, 2)
    watermark.BlackOutline.Size = watermark.mainbar.Size + UDim2.fromOffset(4, 4)

    local startTime, counter, oldfps = os.clock(), 0, nil
    runservice.Heartbeat:Connect(function()
        watermark.label.Visible = watermark.Visible
        watermark.mainbar.Visible = watermark.Visible
        watermark.topbar.Visible = watermark.Visible
        watermark.Outline.Visible = watermark.Visible
        watermark.BlackOutline.Visible = watermark.Visible

        if not name:find("{fps}") then
            watermark.label.Text = " " .. name:gsub("{game}", gamename):gsub("{fps}", "0 FPS") .. " "
        end

        if name:find("{fps}") then
            local currentTime = os.clock()
            counter = counter + 1
            if currentTime - startTime >= 1 then 
                local fps = math.floor(counter / (currentTime - startTime))
                counter = 0
                startTime = currentTime

                if fps ~= oldfps then
                    watermark.label.Text = " " .. name:gsub("{game}", gamename):gsub("{fps}", fps .. " FPS") .. " "
        
                    watermark.label.Size = UDim2.new(0, watermark.label.TextBounds.X+10, 0, 25)
                    watermark.mainbar.Size = UDim2.new(0, watermark.label.TextBounds.X, 0, 25)
                    watermark.topbar.Size = UDim2.new(0, watermark.label.TextBounds.X, 0, 1)

                    watermark.Outline.Size = watermark.mainbar.Size + UDim2.fromOffset(2, 2)
                    watermark.BlackOutline.Size = watermark.mainbar.Size + UDim2.fromOffset(4, 4)
                end
                oldfps = fps
            end
        end
    end)

    watermark.mainbar.MouseEnter:Connect(function()
        tweenservice:Create(watermark.mainbar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { BackgroundTransparency = 1, Active = false }):Play()
        tweenservice:Create(watermark.topbar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { BackgroundTransparency = 1, Active = false }):Play()
        tweenservice:Create(watermark.label, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { TextTransparency = 1, Active = false }):Play()
        tweenservice:Create(watermark.Outline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { BackgroundTransparency = 1, Active = false }):Play()
        tweenservice:Create(watermark.BlackOutline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { BackgroundTransparency = 1, Active = false }):Play()
    end)
    
    watermark.mainbar.MouseLeave:Connect(function()
        tweenservice:Create(watermark.mainbar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { BackgroundTransparency = 0, Active = true }):Play()
        tweenservice:Create(watermark.topbar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { BackgroundTransparency = 0, Active = true }):Play()
        tweenservice:Create(watermark.label, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { TextTransparency = 0, Active = true }):Play()
        tweenservice:Create(watermark.Outline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { BackgroundTransparency = 0, Active = true }):Play()
        tweenservice:Create(watermark.BlackOutline, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { BackgroundTransparency = 0, Active = true }):Play()
    end)

    function watermark:UpdateTheme(theme)
        theme = theme or library.theme
        watermark.Outline.BackgroundColor3 = theme.outlinecolor
        watermark.BlackOutline.BackgroundColor3 = theme.outlinecolor2
        watermark.label.Font = theme.font
        watermark.topbar.BackgroundColor3 = theme.accentcolor
    end

    return watermark
end

function library:CreateWindow(name, size, hidebutton)
    local window = { }
    local Folder = game:GetObjects("rbxassetid://7141683860")[1]
    window.name = name or ""
    window.size = size and UDim2.fromOffset(size.X, size.Y) or UDim2.fromOffset(492, 544)
    window.hidebutton = hidebutton or Enum.KeyCode.RightControl
    window.theme = library.theme

    local updateevent = Instance.new("BindableEvent")
    function window:UpdateTheme(theme)
        updateevent:Fire(theme or library.theme)
        window.theme = (theme or library.theme)
    end

    window.Main = Instance.new("ScreenGui", coregui)
    window.Main.Name = name
    window.Main.DisplayOrder = 15
    if syn then
        syn.protect_gui(window.Main)
    end

    if getgenv().uilib then
        getgenv().uilib:Remove()
    end
    getgenv().uilib = window.Main

    local dragging, dragInput, dragStart, startPos
    uis.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            window.Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    local dragstart = function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = window.Frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end

    local dragend = function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end

    window.Frame = Instance.new("TextButton", window.Main)
    window.Frame.Name = "main"
    window.Frame.Position = UDim2.fromScale(0.5, 0.5)
    window.Frame.BorderSizePixel = 0
    window.Frame.Size = window.size
    window.Frame.AutoButtonColor = false
    window.Frame.Text = ""
    window.Frame.BackgroundColor3 = window.theme.backgroundcolor
    window.Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    updateevent.Event:Connect(function(theme)
        window.Frame.BackgroundColor3 = theme.backgroundcolor
    end)

    

    uis.InputBegan:Connect(function(key)
        if key.KeyCode == window.hidebutton then
            window.Frame.Visible = not window.Frame.Visible
        end
    end)

    local function checkIfGuiInFront(Pos)
        local objects = coregui:GetGuiObjectsAtPosition(Pos.X, Pos.Y)
        for i,v in pairs(objects) do 
            if not string.find(v:GetFullName(), window.name) then 
                table.remove(objects, i)
            end 
        end
        return (#objects ~= 0 and objects[1].AbsolutePosition ~= Pos)
    end

    window.BlackOutline = Instance.new("Frame", window.Frame)
    window.BlackOutline.Name = "outline"
    window.BlackOutline.ZIndex = 1
    window.BlackOutline.Size = window.size + UDim2.fromOffset(2, 2)
    window.BlackOutline.BorderSizePixel = 0
    window.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
    window.BlackOutline.Position = UDim2.fromOffset(-1, -1)
    updateevent.Event:Connect(function(theme)
        window.BlackOutline.BackgroundColor3 = theme.outlinecolor2
    end)

    window.Outline = Instance.new("Frame", window.Frame)
    window.Outline.Name = "outline"
    window.Outline.ZIndex = 0
    window.Outline.Size = window.size + UDim2.fromOffset(4, 4)
    window.Outline.BorderSizePixel = 0
    window.Outline.BackgroundColor3 = window.theme.outlinecolor
    window.Outline.Position = UDim2.fromOffset(-2, -2)
    updateevent.Event:Connect(function(theme)
        window.Outline.BackgroundColor3 = theme.outlinecolor
    end)

    window.BlackOutline2 = Instance.new("Frame", window.Frame)
    window.BlackOutline2.Name = "outline"
    window.BlackOutline2.ZIndex = -1
    window.BlackOutline2.Size = window.size + UDim2.fromOffset(6, 6)
    window.BlackOutline2.BorderSizePixel = 0
    window.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
    window.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
    updateevent.Event:Connect(function(theme)
        window.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
    end)

    window.TopBar = Instance.new("Frame", window.Frame)
    window.TopBar.Name = "top"
    window.TopBar.Size = UDim2.fromOffset(window.size.X.Offset, window.theme.topheight)
    window.TopBar.BorderSizePixel = 0
    window.TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    window.TopBar.InputBegan:Connect(dragstart)
    window.TopBar.InputChanged:Connect(dragend)
    updateevent.Event:Connect(function(theme)
        window.TopBar.Size = UDim2.fromOffset(window.size.X.Offset, theme.topheight)
    end)

    window.TopGradient = Instance.new("UIGradient", window.TopBar)
    window.TopGradient.Rotation = 90
    window.TopGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, window.theme.topcolor), ColorSequenceKeypoint.new(1.00, window.theme.topcolor2) })
    updateevent.Event:Connect(function(theme)
        window.TopGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, theme.topcolor), ColorSequenceKeypoint.new(1.00, theme.topcolor2) })
    end)

    window.NameLabel = Instance.new("TextLabel", window.TopBar)
    window.NameLabel.TextColor3 = window.theme.toptextcolor
    window.NameLabel.Text = window.name
    window.NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    window.NameLabel.Font = window.theme.font
    window.NameLabel.Name = "title"
    window.NameLabel.Position = UDim2.fromOffset(4, -2)
    window.NameLabel.BackgroundTransparency = 1
    window.NameLabel.Size = UDim2.fromOffset(190, window.TopBar.AbsoluteSize.Y / 2 - 2)
    window.NameLabel.TextSize = window.theme.titlesize
    updateevent.Event:Connect(function(theme)
        window.NameLabel.TextColor3 = theme.toptextcolor
        window.NameLabel.Font = theme.font
        window.NameLabel.TextSize = theme.titlesize
    end)

    window.Line2 = Instance.new("Frame", window.TopBar)
    window.Line2.Name = "line"
    window.Line2.Position = UDim2.fromOffset(0, window.TopBar.AbsoluteSize.Y / 2.1)
    window.Line2.Size = UDim2.fromOffset(window.size.X.Offset, 1)
    window.Line2.BorderSizePixel = 0
    window.Line2.BackgroundColor3 = window.theme.accentcolor
    updateevent.Event:Connect(function(theme)
        window.Line2.BackgroundColor3 = theme.accentcolor
    end)

    window.TabList = Instance.new("Frame", window.TopBar)
    window.TabList.Name = "tablist"
    window.TabList.BackgroundTransparency = 1
    window.TabList.Position = UDim2.fromOffset(0, window.TopBar.AbsoluteSize.Y / 2 + 1)
    window.TabList.Size = UDim2.fromOffset(window.size.X.Offset, window.TopBar.AbsoluteSize.Y / 2)
    window.TabList.BorderSizePixel = 0
    window.TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

    window.TabList.InputBegan:Connect(dragstart)
    window.TabList.InputChanged:Connect(dragend)

    window.BlackLine = Instance.new("Frame", window.Frame)
    window.BlackLine.Name = "blackline"
    window.BlackLine.Size = UDim2.fromOffset(window.size.X.Offset, 1)
    window.BlackLine.BorderSizePixel = 0
    window.BlackLine.ZIndex = 9
    window.BlackLine.BackgroundColor3 = window.theme.outlinecolor2
    window.BlackLine.Position = UDim2.fromOffset(0, window.TopBar.AbsoluteSize.Y)
    updateevent.Event:Connect(function(theme)
        window.BlackLine.BackgroundColor3 = theme.outlinecolor2
    end)

    window.BackgroundImage = Instance.new("ImageLabel", window.Frame)
    window.BackgroundImage.Name = "background"
    window.BackgroundImage.BorderSizePixel = 0
    window.BackgroundImage.ScaleType = Enum.ScaleType.Tile
    window.BackgroundImage.Position = window.BlackLine.Position + UDim2.fromOffset(0, 1)
    window.BackgroundImage.Size = UDim2.fromOffset(window.size.X.Offset, window.size.Y.Offset - window.TopBar.AbsoluteSize.Y - 1)
    window.BackgroundImage.Image = window.theme.background or ""
    window.BackgroundImage.ImageTransparency = window.BackgroundImage.Image ~= "" and 0 or 1
    window.BackgroundImage.ImageColor3 = Color3.new() 
    window.BackgroundImage.BackgroundColor3 = window.theme.backgroundcolor
    window.BackgroundImage.TileSize = UDim2.new(0, window.theme.tilesize, 0, window.theme.tilesize)
    updateevent.Event:Connect(function(theme)
        window.BackgroundImage.Image = theme.background or ""
        window.BackgroundImage.ImageTransparency = window.BackgroundImage.Image ~= "" and 0 or 1
        window.BackgroundImage.BackgroundColor3 = theme.backgroundcolor
        window.BackgroundImage.TileSize = UDim2.new(0, theme.tilesize, 0, theme.tilesize)
    end)

    window.Line = Instance.new("Frame", window.Frame)
    window.Line.Name = "line"
    window.Line.Position = UDim2.fromOffset(0, 0)
    window.Line.Size = UDim2.fromOffset(60, 1)
    window.Line.BorderSizePixel = 0
    window.Line.BackgroundColor3 = window.theme.accentcolor
    updateevent.Event:Connect(function(theme)
        window.Line.BackgroundColor3 = theme.accentcolor
    end)

    window.ListLayout = Instance.new("UIListLayout", window.TabList)
    window.ListLayout.FillDirection = Enum.FillDirection.Horizontal
    window.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    window.OpenedColorPickers = { }
    window.Tabs = { }

    function window:CreateTab(name)
        local tab = { }
        tab.name = name or ""

        local textservice = game:GetService("TextService")
        local size = textservice:GetTextSize(tab.name, window.theme.fontsize, window.theme.font, Vector2.new(200,300))

        tab.TabButton = Instance.new("TextButton", window.TabList)
        tab.TabButton.TextColor3 = window.theme.tabstextcolor
        tab.TabButton.Text = tab.name
        tab.TabButton.AutoButtonColor = false
        tab.TabButton.Font = window.theme.font
        tab.TabButton.TextYAlignment = Enum.TextYAlignment.Center
        tab.TabButton.BackgroundTransparency = 1
        tab.TabButton.BorderSizePixel = 0
        tab.TabButton.Size = UDim2.fromOffset(size.X + 15, window.TabList.AbsoluteSize.Y - 1)
        tab.TabButton.Name = tab.name
        tab.TabButton.TextSize = window.theme.fontsize
        updateevent.Event:Connect(function(theme)
            local size = textservice:GetTextSize(tab.name, theme.fontsize, theme.font, Vector2.new(200,300))
            tab.TabButton.TextColor3 = tab.TabButton.Name == "SelectedTab" and theme.accentcolor or theme.tabstextcolor
            tab.TabButton.Font = theme.font
            tab.TabButton.Size = UDim2.fromOffset(size.X + 15, window.TabList.AbsoluteSize.Y - 1)
            tab.TabButton.TextSize = theme.fontsize
        end)

        tab.Left = Instance.new("ScrollingFrame", window.Frame) 
        tab.Left.Name = "leftside"
        tab.Left.BorderSizePixel = 0
        tab.Left.Size = UDim2.fromOffset(window.size.X.Offset / 2, window.size.Y.Offset - (window.TopBar.AbsoluteSize.Y + 1))
        tab.Left.BackgroundTransparency = 1
        tab.Left.Visible = false
        tab.Left.ScrollBarThickness = 2
        tab.Left.ScrollingDirection = "Y"
        tab.Left.Position = window.BlackLine.Position + UDim2.fromOffset(0, 1)

        tab.LeftListLayout = Instance.new("UIListLayout", tab.Left)
        tab.LeftListLayout.FillDirection = Enum.FillDirection.Vertical
        tab.LeftListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        tab.LeftListLayout.Padding = UDim.new(0, 12)

        tab.LeftListPadding = Instance.new("UIPadding", tab.Left)
        tab.LeftListPadding.PaddingTop = UDim.new(0, 12)
        tab.LeftListPadding.PaddingLeft = UDim.new(0, 12)
        tab.LeftListPadding.PaddingRight = UDim.new(0, 12)

        tab.Right = Instance.new("ScrollingFrame", window.Frame) 
        tab.Right.Name = "rightside"
        tab.Right.ScrollBarThickness = 2
        tab.Right.ScrollingDirection = "Y"
        tab.Right.Visible = false
        tab.Right.BorderSizePixel = 0
        tab.Right.Size = UDim2.fromOffset(window.size.X.Offset / 2, window.size.Y.Offset - (window.TopBar.AbsoluteSize.Y + 1))
        tab.Right.BackgroundTransparency = 1
        tab.Right.Position = tab.Left.Position + UDim2.fromOffset(tab.Left.AbsoluteSize.X, 0)

        tab.RightListLayout = Instance.new("UIListLayout", tab.Right)
        tab.RightListLayout.FillDirection = Enum.FillDirection.Vertical
        tab.RightListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        tab.RightListLayout.Padding = UDim.new(0, 12)

        tab.RightListPadding = Instance.new("UIPadding", tab.Right)
        tab.RightListPadding.PaddingTop = UDim.new(0, 12)
        tab.RightListPadding.PaddingLeft = UDim.new(0, 6)
        tab.RightListPadding.PaddingRight = UDim.new(0, 12)

        local block = false
        function tab:SelectTab()
            repeat 
                wait()
            until block == false

            block = true
            for i,v in pairs(window.Tabs) do
                if v ~= tab then
                    v.TabButton.TextColor3 = Color3.fromRGB(230, 230, 230)
                    v.TabButton.Name = "Tab"
                    v.Left.Visible = false
                    v.Right.Visible = false
                end
            end

            tab.TabButton.TextColor3 = window.theme.accentcolor
            tab.TabButton.Name = "SelectedTab"
            tab.Right.Visible = true
            tab.Left.Visible = true
            window.Line:TweenSizeAndPosition(UDim2.fromOffset(size.X + 15, 1), UDim2.new(0, (tab.TabButton.AbsolutePosition.X - window.Frame.AbsolutePosition.X), 0, 0) + (window.BlackLine.Position - UDim2.fromOffset(0, 1)), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15)
            wait(0.2)
            block = false
        end
    
        if #window.Tabs == 0 then
            tab:SelectTab()
        end

        tab.TabButton.MouseButton1Down:Connect(function()
            tab:SelectTab()
        end)

        tab.SectorsLeft = { }
        tab.SectorsRight = { }

        function tab:CreateSector(name,side)
            local sector = { }
            sector.name = name or ""
            sector.side = side:lower() or "left"
            
            sector.Main = Instance.new("Frame", sector.side == "left" and tab.Left or tab.Right) 
            sector.Main.Name = sector.name:gsub(" ", "") .. "Sector"
            sector.Main.BorderSizePixel = 0
            sector.Main.ZIndex = 4
            sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, 20)
            sector.Main.BackgroundColor3 = window.theme.sectorcolor
            --sector.Main.Position = sector.side == "left" and UDim2.new(0, 11, 0, 12) or UDim2.new(0, window.size.X.Offset - sector.Main.AbsoluteSize.X - 11, 0, 12)
            updateevent.Event:Connect(function(theme)
                sector.Main.BackgroundColor3 = theme.sectorcolor
            end)

            sector.Line = Instance.new("Frame", sector.Main)
            sector.Line.Name = "line"
            sector.Line.ZIndex = 4
            sector.Line.Size = UDim2.fromOffset(sector.Main.Size.X.Offset + 4, 1)
            sector.Line.BorderSizePixel = 0
            sector.Line.Position = UDim2.fromOffset(-2, -2)
            sector.Line.BackgroundColor3 = window.theme.accentcolor
            updateevent.Event:Connect(function(theme)
                sector.Line.BackgroundColor3 = theme.accentcolor
            end)

            sector.BlackOutline = Instance.new("Frame", sector.Main)
            sector.BlackOutline.Name = "outline"
            sector.BlackOutline.ZIndex = 3
            sector.BlackOutline.Size = sector.Main.Size + UDim2.fromOffset(2, 2)
            sector.BlackOutline.BorderSizePixel = 0
            sector.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
            sector.BlackOutline.Position = UDim2.fromOffset(-1, -1)
            sector.Main:GetPropertyChangedSignal("Size"):Connect(function()
                sector.BlackOutline.Size = sector.Main.Size + UDim2.fromOffset(2, 2)
            end)
            updateevent.Event:Connect(function(theme)
                sector.BlackOutline.BackgroundColor3 = theme.outlinecolor2
            end)


            sector.Outline = Instance.new("Frame", sector.Main)
            sector.Outline.Name = "outline"
            sector.Outline.ZIndex = 2
            sector.Outline.Size = sector.Main.Size + UDim2.fromOffset(4, 4)
            sector.Outline.BorderSizePixel = 0
            sector.Outline.BackgroundColor3 = window.theme.outlinecolor
            sector.Outline.Position = UDim2.fromOffset(-2, -2)
            sector.Main:GetPropertyChangedSignal("Size"):Connect(function()
                sector.Outline.Size = sector.Main.Size + UDim2.fromOffset(4, 4)
            end)
            updateevent.Event:Connect(function(theme)
                sector.Outline.BackgroundColor3 = theme.outlinecolor
            end)

            sector.BlackOutline2 = Instance.new("Frame", sector.Main)
            sector.BlackOutline2.Name = "outline"
            sector.BlackOutline2.ZIndex = 1
            sector.BlackOutline2.Size = sector.Main.Size + UDim2.fromOffset(6, 6)
            sector.BlackOutline2.BorderSizePixel = 0
            sector.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
            sector.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
            sector.Main:GetPropertyChangedSignal("Size"):Connect(function()
                sector.BlackOutline2.Size = sector.Main.Size + UDim2.fromOffset(6, 6)
            end)
            updateevent.Event:Connect(function(theme)
                sector.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
            end)

            local size = textservice:GetTextSize(sector.name, 15, window.theme.font, Vector2.new(2000, 2000))
            sector.Label = Instance.new("TextLabel", sector.Main)
            sector.Label.AnchorPoint = Vector2.new(0,0.5)
            sector.Label.Position = UDim2.fromOffset(12, -1)
            sector.Label.Size = UDim2.fromOffset(math.clamp(textservice:GetTextSize(sector.name, 15, window.theme.font, Vector2.new(200,300)).X + 13, 0, sector.Main.Size.X.Offset), size.Y)
            sector.Label.BackgroundTransparency = 1
            sector.Label.BorderSizePixel = 0
            sector.Label.ZIndex = 6
            sector.Label.Text = sector.name
            sector.Label.TextColor3 = Color3.new(1,1,2552/255)
            sector.Label.TextStrokeTransparency = 1
            sector.Label.Font = window.theme.font
            sector.Label.TextSize = 15
            updateevent.Event:Connect(function(theme)
                local size = textservice:GetTextSize(sector.name, 15, theme.font, Vector2.new(2000, 2000))
                sector.Label.Size = UDim2.fromOffset(math.clamp(textservice:GetTextSize(sector.name, 15, theme.font, Vector2.new(200,300)).X + 13, 0, sector.Main.Size.X.Offset), size.Y)
                sector.Label.Font = theme.font
            end)

            sector.LabelBackFrame = Instance.new("Frame", sector.Main)
            sector.LabelBackFrame.Name = "labelframe"
            sector.LabelBackFrame.ZIndex = 5
            sector.LabelBackFrame.Size = UDim2.fromOffset(sector.Label.Size.X.Offset, 10)
            sector.LabelBackFrame.BorderSizePixel = 0
            sector.LabelBackFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            sector.LabelBackFrame.Position = UDim2.fromOffset(sector.Label.Position.X.Offset, sector.BlackOutline2.Position.Y.Offset)

            sector.Items = Instance.new("Frame", sector.Main) 
            sector.Items.Name = "items"
            sector.Items.ZIndex = 2
            sector.Items.BackgroundTransparency = 1
            sector.Items.Size = UDim2.fromOffset(170, 140)
            sector.Items.AutomaticSize = Enum.AutomaticSize.Y
            sector.Items.BorderSizePixel = 0

            sector.ListLayout = Instance.new("UIListLayout", sector.Items)
            sector.ListLayout.FillDirection = Enum.FillDirection.Vertical
            sector.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            sector.ListLayout.Padding = UDim.new(0, 10)

            sector.ListPadding = Instance.new("UIPadding", sector.Items)
            sector.ListPadding.PaddingTop = UDim.new(0, 15)
            sector.ListPadding.PaddingLeft = UDim.new(0, 6)
            sector.ListPadding.PaddingRight = UDim.new(0, 6)

            table.insert(sector.side:lower() == "left" and tab.SectorsLeft or tab.SectorsRight, sector)

            function sector:FixSize()
                sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 22)
                local sizeleft, sizeright = 0, 0
                for i,v in pairs(tab.SectorsLeft) do
                    sizeleft = sizeleft + v.Main.AbsoluteSize.Y
                end
                for i,v in pairs(tab.SectorsRight) do
                    sizeright = sizeright + v.Main.AbsoluteSize.Y
                end

                tab.Left.CanvasSize = UDim2.fromOffset(tab.Left.AbsoluteSize.X, sizeleft + ((#tab.SectorsLeft - 1) * tab.LeftListPadding.PaddingTop.Offset) + 20)
                tab.Right.CanvasSize = UDim2.fromOffset(tab.Right.AbsoluteSize.X, sizeright + ((#tab.SectorsRight - 1) * tab.RightListPadding.PaddingTop.Offset) + 20)
            end

            function sector:AddButton(text, callback)
                local button = { }
                button.text = text or ""
                button.callback = callback or function() end

                button.Main = Instance.new("TextButton", sector.Items)
                button.Main.BorderSizePixel = 0
                button.Main.Text = ""
                button.Main.AutoButtonColor = false
                button.Main.Name = "button"
                button.Main.ZIndex = 5
                button.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 14)
                button.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

                button.Gradient = Instance.new("UIGradient", button.Main)
                button.Gradient.Rotation = 90
                button.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, window.theme.buttoncolor), ColorSequenceKeypoint.new(1.00, window.theme.buttoncolor2) })
                updateevent.Event:Connect(function(theme)
                    button.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, theme.buttoncolor), ColorSequenceKeypoint.new(1.00, theme.buttoncolor2) })
                end)

                button.BlackOutline2 = Instance.new("Frame", button.Main)
                button.BlackOutline2.Name = "blackline"
                button.BlackOutline2.ZIndex = 4
                button.BlackOutline2.Size = button.Main.Size + UDim2.fromOffset(6, 6)
                button.BlackOutline2.BorderSizePixel = 0
                button.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                button.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                updateevent.Event:Connect(function(theme)
                    button.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
                end)

                button.Outline = Instance.new("Frame", button.Main)
                button.Outline.Name = "blackline"
                button.Outline.ZIndex = 4
                button.Outline.Size = button.Main.Size + UDim2.fromOffset(4, 4)
                button.Outline.BorderSizePixel = 0
                button.Outline.BackgroundColor3 = window.theme.outlinecolor
                button.Outline.Position = UDim2.fromOffset(-2, -2)
                updateevent.Event:Connect(function(theme)
                    button.Outline.BackgroundColor3 = theme.outlinecolor
                end)

                button.BlackOutline = Instance.new("Frame", button.Main)
                button.BlackOutline.Name = "blackline"
                button.BlackOutline.ZIndex = 4
                button.BlackOutline.Size = button.Main.Size + UDim2.fromOffset(2, 2)
                button.BlackOutline.BorderSizePixel = 0
                button.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                button.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                updateevent.Event:Connect(function(theme)
                    button.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                end)

                button.Label = Instance.new("TextLabel", button.Main)
                button.Label.Name = "Label"
                button.Label.BackgroundTransparency = 1
                button.Label.Position = UDim2.new(0, -1, 0, 0)
                button.Label.ZIndex = 5
                button.Label.Size = button.Main.Size
                button.Label.Font = window.theme.font
                button.Label.Text = button.text
                button.Label.TextColor3 = window.theme.itemscolor2
                button.Label.TextSize = 15
                button.Label.TextStrokeTransparency = 1
                button.Label.TextXAlignment = Enum.TextXAlignment.Center
                button.Main.MouseButton1Down:Connect(button.callback)
                updateevent.Event:Connect(function(theme)
                    button.Label.Font = theme.font
                    button.Label.TextColor3 = theme.itemscolor
                end)

                button.BlackOutline2.MouseEnter:Connect(function()
                    button.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                end)

                button.BlackOutline2.MouseLeave:Connect(function()
                    button.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                end)

                sector:FixSize()
                return button
            end

            function sector:AddLabel(text)
                local label = { }

                label.Main = Instance.new("TextLabel", sector.Items)
                label.Main.Name = "Label"
                label.Main.BackgroundTransparency = 1
                label.Main.Position = UDim2.new(0, -1, 0, 0)
                label.Main.ZIndex = 4
                label.Main.AutomaticSize = Enum.AutomaticSize.XY
                label.Main.Font = window.theme.font
                label.Main.Text = text
                label.Main.TextColor3 = window.theme.itemscolor
                label.Main.TextSize = 15
                label.Main.TextStrokeTransparency = 1
                label.Main.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    label.Main.Font = theme.font
                    label.Main.TextColor3 = theme.itemscolor
                end)

                function label:Set(value)
                    label.Main.Text = value
                end

                sector:FixSize()
                return label
            end
            
            function sector:AddToggle(text, default, callback, flag)
                local toggle = { }
                toggle.text = text or ""
                toggle.default = default or false
                toggle.callback = callback or function(value) end
                toggle.flag = flag or text or ""
                
                toggle.value = toggle.default

                toggle.Main = Instance.new("TextButton", sector.Items)
                toggle.Main.Name = "toggle"
                toggle.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggle.Main.BorderColor3 = window.theme.outlinecolor
                toggle.Main.BorderSizePixel = 0
                toggle.Main.Size = UDim2.fromOffset(8, 8)
                toggle.Main.AutoButtonColor = false
                toggle.Main.ZIndex = 5
                toggle.Main.Font = Enum.Font.SourceSans
                toggle.Main.Text = ""
                toggle.Main.TextColor3 = Color3.fromRGB(0, 0, 0)
                toggle.Main.TextSize = 15
                updateevent.Event:Connect(function(theme)
                    toggle.Main.BorderColor3 = theme.outlinecolor
                end)

                toggle.BlackOutline2 = Instance.new("Frame", toggle.Main)
                toggle.BlackOutline2.Name = "blackline"
                toggle.BlackOutline2.ZIndex = 4
                toggle.BlackOutline2.Size = toggle.Main.Size + UDim2.fromOffset(6, 6)
                toggle.BlackOutline2.BorderSizePixel = 0
                toggle.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                toggle.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                updateevent.Event:Connect(function(theme)
                    toggle.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
                end)
                
                toggle.Outline = Instance.new("Frame", toggle.Main)
                toggle.Outline.Name = "blackline"
                toggle.Outline.ZIndex = 4
                toggle.Outline.Size = toggle.Main.Size + UDim2.fromOffset(4, 4)
                toggle.Outline.BorderSizePixel = 0
                toggle.Outline.BackgroundColor3 = window.theme.outlinecolor
                toggle.Outline.Position = UDim2.fromOffset(-2, -2)
                updateevent.Event:Connect(function(theme)
                    toggle.Outline.BackgroundColor3 = theme.outlinecolor
                end)

                toggle.BlackOutline = Instance.new("Frame", toggle.Main)
                toggle.BlackOutline.Name = "blackline"
                toggle.BlackOutline.ZIndex = 4
                toggle.BlackOutline.Size = toggle.Main.Size + UDim2.fromOffset(2, 2)
                toggle.BlackOutline.BorderSizePixel = 0
                toggle.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                toggle.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                updateevent.Event:Connect(function(theme)
                    toggle.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                end)

                toggle.Gradient = Instance.new("UIGradient", toggle.Main)
                toggle.Gradient.Rotation = (22.5 * 13)
                toggle.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 45, 45)) })

                toggle.Label = Instance.new("TextButton", toggle.Main)
                toggle.Label.Name = "Label"
                toggle.Label.AutoButtonColor = false
                toggle.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggle.Label.BackgroundTransparency = 1
                toggle.Label.Position = UDim2.fromOffset(toggle.Main.AbsoluteSize.X + 10, -2)
                toggle.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 71, toggle.BlackOutline.Size.Y.Offset)
                toggle.Label.Font = window.theme.font
                toggle.Label.ZIndex = 5
                toggle.Label.Text = toggle.text
                toggle.Label.TextColor3 = window.theme.itemscolor
                toggle.Label.TextSize = 15
                toggle.Label.TextStrokeTransparency = 1
                toggle.Label.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    toggle.Label.Font = theme.font
                    toggle.Label.TextColor3 = toggle.value and window.theme.itemscolor2 or theme.itemscolor
                end)

                toggle.CheckedFrame = Instance.new("Frame", toggle.Main)
                toggle.CheckedFrame.ZIndex = 5
                toggle.CheckedFrame.BorderSizePixel = 0
                toggle.CheckedFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Color3.fromRGB(204, 0, 102)
                toggle.CheckedFrame.Size = toggle.Main.Size

                toggle.Gradient2 = Instance.new("UIGradient", toggle.CheckedFrame)
                toggle.Gradient2.Rotation = (22.5 * 13)
                toggle.Gradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, window.theme.accentcolor2), ColorSequenceKeypoint.new(1.00, window.theme.accentcolor) })
                updateevent.Event:Connect(function(theme)
                    toggle.Gradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, theme.accentcolor2), ColorSequenceKeypoint.new(1.00, theme.accentcolor) })
                end)

                toggle.Items = Instance.new("Frame", toggle.Main)
                toggle.Items.Name = "\n"
                toggle.Items.ZIndex = 4
                toggle.Items.Size = UDim2.fromOffset(60, toggle.BlackOutline.AbsoluteSize.Y)
                toggle.Items.BorderSizePixel = 0
                toggle.Items.BackgroundTransparency = 1
                toggle.Items.BackgroundColor3 = Color3.new(0, 0, 0)
                toggle.Items.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 71, 0)

                toggle.ListLayout = Instance.new("UIListLayout", toggle.Items)
                toggle.ListLayout.FillDirection = Enum.FillDirection.Horizontal
                toggle.ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
                toggle.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                toggle.ListLayout.Padding = UDim.new(0.04, 6)

                if toggle.flag and toggle.flag ~= "" then
                    library.flags[toggle.flag] = toggle.default or false
                end

                function toggle:Set(value) 
                    if value then
                        toggle.Label.TextColor3 = window.theme.itemscolor2
                    else
                        toggle.Label.TextColor3 = window.theme.itemscolor
                    end

                    toggle.value = value
                    toggle.CheckedFrame.Visible = value
                    if toggle.flag and toggle.flag ~= "" then
                        library.flags[toggle.flag] = toggle.value
                    end
                    pcall(toggle.callback, value)
                end
                function toggle:Get() 
                    return toggle.value
                end
                toggle:Set(toggle.default)

                function toggle:AddKeybind(default, flag)
                    local keybind = { }

                    keybind.default = default or "None"
                    keybind.value = keybind.default
                    keybind.flag = flag or ( (toggle.text or "") .. tostring(#toggle.Items:GetChildren()))

                    local shorter_keycodes = {
                        ["LeftShift"] = "LSHIFT",
                        ["RightShift"] = "RSHIFT",
                        ["LeftControl"] = "LCTRL",
                        ["RightControl"] = "RCTRL",
                        ["LeftAlt"] = "LALT",
                        ["RightAlt"] = "RALT"
                    }

                    local text = keybind.default == "None" and "[None]" or "[" .. (shorter_keycodes[keybind.default.Name] or keybind.default.Name) .. "]"
                    local size = textservice:GetTextSize(text, 15, window.theme.font, Vector2.new(2000, 2000))

                    keybind.Main = Instance.new("TextButton", toggle.Items)
                    keybind.Main.Name = "keybind"
                    keybind.Main.BackgroundTransparency = 1
                    keybind.Main.BorderSizePixel = 0
                    keybind.Main.ZIndex = 5
                    keybind.Main.Size = UDim2.fromOffset(size.X + 2, size.Y - 7)
                    keybind.Main.Text = text
                    keybind.Main.Font = window.theme.font
                    keybind.Main.TextColor3 = Color3.fromRGB(136, 136, 136)
                    keybind.Main.TextSize = 15
                    keybind.Main.TextXAlignment = Enum.TextXAlignment.Right
                    keybind.Main.MouseButton1Down:Connect(function()
                        keybind.Main.Text = "[...]"
                        keybind.Main.TextColor3 = window.theme.accentcolor
                    end)
                    updateevent.Event:Connect(function(theme)
                        keybind.Main.Font = theme.font
                        if keybind.Main.Text == "[...]" then
                            keybind.Main.TextColor3 = theme.accentcolor
                        else
                            keybind.Main.TextColor3 = Color3.fromRGB(136, 136, 136)
                        end
                    end)

                    if keybind.flag and keybind.flag ~= "" then
                        library.flags[keybind.flag] = keybind.default
                    end
                    function keybind:Set(key)
                        if key == "None" then
                            keybind.Main.Text = "[" .. key .. "]"
                            keybind.value = key
                            if keybind.flag and keybind.flag ~= "" then
                                library.flags[keybind.flag] = key
                            end
                        end
                        keybind.Main.Text = "[" .. (shorter_keycodes[key.Name] or key.Name) .. "]"
                        keybind.value = key
                        if keybind.flag and keybind.flag ~= "" then
                            library.flags[keybind.flag] = keybind.value
                        end
                    end

                    function keybind:Get()
                        return keybind.value
                    end

                    uis.InputBegan:Connect(function(input, gameProcessed)
                        if not gameProcessed then
                            if keybind.Main.Text == "[...]" then
                                keybind.Main.TextColor3 = Color3.fromRGB(136, 136, 136)
                                if input.UserInputType == Enum.UserInputType.Keyboard then
                                    keybind:Set(input.KeyCode)
                                else
                                    keybind:Set("None")
                                end
                            else
                                if keybind.value ~= "None" and input.KeyCode == keybind.value then
                                    toggle:Set(not toggle.CheckedFrame.Visible)
                                end
                            end
                        end
                    end)

                    table.insert(library.items, keybind)
                    return keybind
                end

                function toggle:AddTextbox(default, callback, flag)
                    local textbox = { }
                    textbox.callback = callback or function() end
                    textbox.default = default
                    textbox.value = ""
                    textbox.flag = flag or ( (toggle.text or "") .. tostring(#(sector.Items:GetChildren())) .. "a")
    
                    textbox.Holder = Instance.new("Frame", sector.Items)
                    textbox.Holder.Name = "holder"
                    textbox.Holder.ZIndex = 5
                    textbox.Holder.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 14)
                    textbox.Holder.BorderSizePixel = 0
                    textbox.Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    
                    textbox.Gradient = Instance.new("UIGradient", textbox.Holder)
                    textbox.Gradient.Rotation = 90
                    textbox.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 39, 39)) })
    
                    textbox.Main = Instance.new("TextBox", textbox.Holder)
                    textbox.Main.PlaceholderText = ""
                    textbox.Main.Text = ""
                    textbox.Main.BackgroundTransparency = 1
                    textbox.Main.Font = window.theme.font
                    textbox.Main.Name = "textbox"
                    textbox.Main.MultiLine = false
                    textbox.Main.ClearTextOnFocus = false
                    textbox.Main.ZIndex = 5
                    textbox.Main.TextScaled = true
                    textbox.Main.Size = textbox.Holder.Size
                    textbox.Main.TextSize = 15
                    textbox.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
                    textbox.Main.BorderSizePixel = 0
                    textbox.Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    textbox.Main.TextXAlignment = Enum.TextXAlignment.Left
    
                    if textbox.flag and textbox.flag ~= "" then
                        library.flags[textbox.flag] = textbox.default or ""
                    end

                    function textbox:Set(text)
                        textbox.value = text
                        textbox.Main.Text = text
                        if textbox.flag and textbox.flag ~= "" then
                            library.flags[textbox.flag] = text
                        end
                        pcall(textbox.callback, text)
                    end
                    updateevent.Event:Connect(function(theme)
                        textbox.Main.Font = theme.font
                    end)
    
                    function textbox:Get()
                        return textbox.value
                    end
    
                    if textbox.default then 
                        textbox:Set(textbox.default)
                    end
    
                    textbox.Main.FocusLost:Connect(function()
                        textbox:Set(textbox.Main.Text)
                    end)
    
                    textbox.BlackOutline2 = Instance.new("Frame", textbox.Main)
                    textbox.BlackOutline2.Name = "blackline"
                    textbox.BlackOutline2.ZIndex = 4
                    textbox.BlackOutline2.Size = textbox.Main.Size + UDim2.fromOffset(6, 6)
                    textbox.BlackOutline2.BorderSizePixel = 0
                    textbox.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                    textbox.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                    updateevent.Event:Connect(function(theme)
                        textbox.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
                    end)
                    
                    textbox.Outline = Instance.new("Frame", textbox.Main)
                    textbox.Outline.Name = "blackline"
                    textbox.Outline.ZIndex = 4
                    textbox.Outline.Size = textbox.Main.Size + UDim2.fromOffset(4, 4)
                    textbox.Outline.BorderSizePixel = 0
                    textbox.Outline.BackgroundColor3 = window.theme.outlinecolor
                    textbox.Outline.Position = UDim2.fromOffset(-2, -2)
                    updateevent.Event:Connect(function(theme)
                        textbox.Outline.BackgroundColor3 = theme.outlinecolor
                    end)
    
                    textbox.BlackOutline = Instance.new("Frame", textbox.Main)
                    textbox.BlackOutline.Name = "blackline"
                    textbox.BlackOutline.ZIndex = 4
                    textbox.BlackOutline.Size = textbox.Main.Size + UDim2.fromOffset(2, 2)
                    textbox.BlackOutline.BorderSizePixel = 0
                    textbox.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    textbox.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                    updateevent.Event:Connect(function(theme)
                        textbox.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                    end)
    
                    textbox.BlackOutline2.MouseEnter:Connect(function()
                        textbox.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                    end)
                    textbox.BlackOutline2.MouseLeave:Connect(function()
                        textbox.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                    end)
    
                    sector:FixSize()
                    table.insert(library.items, textbox)
                    return textbox
                end

                function toggle:AddColorpicker(default, callback, flag)
                    local colorpicker = { }

                    colorpicker.callback = callback or function() end
                    colorpicker.default = default or Color3.fromRGB(255, 255, 255)
                    colorpicker.value = colorpicker.default
                    colorpicker.flag = flag or ( (toggle.text or "") .. tostring(#toggle.Items:GetChildren()))

                    colorpicker.Main = Instance.new("Frame", toggle.Items)
                    colorpicker.Main.ZIndex = 6
                    colorpicker.Main.BorderSizePixel = 0
                    colorpicker.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    colorpicker.Main.Size = UDim2.fromOffset(16, 10)

                    colorpicker.Gradient = Instance.new("UIGradient", colorpicker.Main)
                    colorpicker.Gradient.Rotation = 90

                    local clr = Color3.new(math.clamp(colorpicker.value.R / 1.7, 0, 1), math.clamp(colorpicker.value.G / 1.7, 0, 1), math.clamp(colorpicker.value.B / 1.7, 0, 1))
                    colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, colorpicker.value), ColorSequenceKeypoint.new(1.00, clr) })

                    colorpicker.BlackOutline2 = Instance.new("Frame", colorpicker.Main)
                    colorpicker.BlackOutline2.Name = "blackline"
                    colorpicker.BlackOutline2.ZIndex = 4
                    colorpicker.BlackOutline2.Size = colorpicker.Main.Size + UDim2.fromOffset(6, 6)
                    colorpicker.BlackOutline2.BorderSizePixel = 0
                    colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                    colorpicker.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                    updateevent.Event:Connect(function(theme)
                        if window.OpenedColorPickers[colorpicker.MainPicker] then
                            colorpicker.BlackOutline2.BackgroundColor3 = theme.accentcolor
                        else
                            colorpicker.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
                        end
                    end)
                    
                    colorpicker.Outline = Instance.new("Frame", colorpicker.Main)
                    colorpicker.Outline.Name = "blackline"
                    colorpicker.Outline.ZIndex = 4
                    colorpicker.Outline.Size = colorpicker.Main.Size + UDim2.fromOffset(4, 4)
                    colorpicker.Outline.BorderSizePixel = 0
                    colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
                    colorpicker.Outline.Position = UDim2.fromOffset(-2, -2)
                    updateevent.Event:Connect(function(theme)
                        colorpicker.Outline.BackgroundColor3 = theme.outlinecolor
                    end)
    
                    colorpicker.BlackOutline = Instance.new("Frame", colorpicker.Main)
                    colorpicker.BlackOutline.Name = "blackline"
                    colorpicker.BlackOutline.ZIndex = 4
                    colorpicker.BlackOutline.Size = colorpicker.Main.Size + UDim2.fromOffset(2, 2)
                    colorpicker.BlackOutline.BorderSizePixel = 0
                    colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    colorpicker.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                    updateevent.Event:Connect(function(theme)
                        colorpicker.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                    end)

                    colorpicker.BlackOutline2.MouseEnter:Connect(function()
                        colorpicker.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                    end)

                    colorpicker.BlackOutline2.MouseLeave:Connect(function()
                        if not window.OpenedColorPickers[colorpicker.MainPicker] then
                            colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                        end
                    end)

                    colorpicker.MainPicker = Instance.new("TextButton", colorpicker.Main)
                    colorpicker.MainPicker.Name = "picker"
                    colorpicker.MainPicker.ZIndex = 100
                    colorpicker.MainPicker.Visible = false
                    colorpicker.MainPicker.AutoButtonColor = false
                    colorpicker.MainPicker.Text = ""
                    window.OpenedColorPickers[colorpicker.MainPicker] = false
                    colorpicker.MainPicker.Size = UDim2.fromOffset(180, 196)
                    colorpicker.MainPicker.BorderSizePixel = 0
                    colorpicker.MainPicker.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    colorpicker.MainPicker.Rotation = 0.000000000000001
                    colorpicker.MainPicker.Position = UDim2.fromOffset(-colorpicker.MainPicker.AbsoluteSize.X + colorpicker.Main.AbsoluteSize.X, 17)

                    colorpicker.BlackOutline3 = Instance.new("Frame", colorpicker.MainPicker)
                    colorpicker.BlackOutline3.Name = "blackline"
                    colorpicker.BlackOutline3.ZIndex = 98
                    colorpicker.BlackOutline3.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(6, 6)
                    colorpicker.BlackOutline3.BorderSizePixel = 0
                    colorpicker.BlackOutline3.BackgroundColor3 = window.theme.outlinecolor2
                    colorpicker.BlackOutline3.Position = UDim2.fromOffset(-3, -3)
                    updateevent.Event:Connect(function(theme)
                        colorpicker.BlackOutline3.BackgroundColor3 = theme.outlinecolor2
                    end)
                    
                    colorpicker.Outline2 = Instance.new("Frame", colorpicker.MainPicker)
                    colorpicker.Outline2.Name = "blackline"
                    colorpicker.Outline2.ZIndex = 98
                    colorpicker.Outline2.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(4, 4)
                    colorpicker.Outline2.BorderSizePixel = 0
                    colorpicker.Outline2.BackgroundColor3 = window.theme.outlinecolor
                    colorpicker.Outline2.Position = UDim2.fromOffset(-2, -2)
                    updateevent.Event:Connect(function(theme)
                        colorpicker.Outline2.BackgroundColor3 = theme.outlinecolor
                    end)
    
                    colorpicker.BlackOutline3 = Instance.new("Frame", colorpicker.MainPicker)
                    colorpicker.BlackOutline3.Name = "blackline"
                    colorpicker.BlackOutline3.ZIndex = 98
                    colorpicker.BlackOutline3.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(2, 2)
                    colorpicker.BlackOutline3.BorderSizePixel = 0
                    colorpicker.BlackOutline3.BackgroundColor3 = window.theme.outlinecolor2
                    colorpicker.BlackOutline3.Position = UDim2.fromOffset(-1, -1)
                    updateevent.Event:Connect(function(theme)
                        colorpicker.BlackOutline3.BackgroundColor3 = theme.outlinecolor2
                    end)

                    colorpicker.hue = Instance.new("ImageLabel", colorpicker.MainPicker)
                    colorpicker.hue.ZIndex = 101
                    colorpicker.hue.Position = UDim2.new(0,3,0,3)
                    colorpicker.hue.Size = UDim2.new(0,172,0,172)
                    colorpicker.hue.Image = "rbxassetid://4155801252"
                    colorpicker.hue.ScaleType = Enum.ScaleType.Stretch
                    colorpicker.hue.BackgroundColor3 = Color3.new(1,0,0)
                    colorpicker.hue.BorderColor3 = window.theme.outlinecolor2
                    updateevent.Event:Connect(function(theme)
                        colorpicker.hue.BorderColor3 = theme.outlinecolor2
                    end)

                    colorpicker.hueselectorpointer = Instance.new("ImageLabel", colorpicker.MainPicker)
                    colorpicker.hueselectorpointer.ZIndex = 101
                    colorpicker.hueselectorpointer.BackgroundTransparency = 1
                    colorpicker.hueselectorpointer.BorderSizePixel = 0
                    colorpicker.hueselectorpointer.Position = UDim2.new(0, 0, 0, 0)
                    colorpicker.hueselectorpointer.Size = UDim2.new(0, 7, 0, 7)
                    colorpicker.hueselectorpointer.Image = "rbxassetid://6885856475"

                    colorpicker.selector = Instance.new("TextLabel", colorpicker.MainPicker)
                    colorpicker.selector.ZIndex = 100
                    colorpicker.selector.Position = UDim2.new(0,3,0,181)
                    colorpicker.selector.Size = UDim2.new(0,173,0,10)
                    colorpicker.selector.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    colorpicker.selector.BorderColor3 = window.theme.outlinecolor2
                    colorpicker.selector.Text = ""
                    updateevent.Event:Connect(function(theme)
                        colorpicker.selector.BorderColor3 = theme.outlinecolor2
                    end)
        
                    colorpicker.gradient = Instance.new("UIGradient", colorpicker.selector)
                    colorpicker.gradient.Color = ColorSequence.new({ 
                        ColorSequenceKeypoint.new(0, Color3.new(1,0,0)), 
                        ColorSequenceKeypoint.new(0.17, Color3.new(1,0,1)), 
                        ColorSequenceKeypoint.new(0.33,Color3.new(0,0,1)), 
                        ColorSequenceKeypoint.new(0.5,Color3.new(0,1,1)), 
                        ColorSequenceKeypoint.new(0.67, Color3.new(0,1,0)), 
                        ColorSequenceKeypoint.new(0.83, Color3.new(1,1,0)), 
                        ColorSequenceKeypoint.new(1, Color3.new(1,0,0))
                    })

                    colorpicker.pointer = Instance.new("Frame", colorpicker.selector)
                    colorpicker.pointer.ZIndex = 101
                    colorpicker.pointer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    colorpicker.pointer.Position = UDim2.new(0,0,0,0)
                    colorpicker.pointer.Size = UDim2.new(0,2,0,10)
                    colorpicker.pointer.BorderColor3 = Color3.fromRGB(255, 255, 255)

                    if colorpicker.flag and colorpicker.flag ~= "" then
                        library.flags[colorpicker.flag] = colorpicker.default
                    end

                    function colorpicker:RefreshHue()
                        local x = (mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X
                        local y = (mouse.Y - colorpicker.hue.AbsolutePosition.Y) / colorpicker.hue.AbsoluteSize.Y
                        colorpicker.hueselectorpointer:TweenPosition(UDim2.new(math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 0.952 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 0, math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 0.885 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                        colorpicker:Set(Color3.fromHSV(colorpicker.color, math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 1 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 1 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y)))
                    end

                    function colorpicker:RefreshSelector()
                        local pos = math.clamp((mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X, 0, 1)
                        colorpicker.color = 1 - pos
                        colorpicker.pointer:TweenPosition(UDim2.new(pos, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                        colorpicker.hue.BackgroundColor3 = Color3.fromHSV(1 - pos, 1, 1)

                        local x = (colorpicker.hueselectorpointer.AbsolutePosition.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X
                        local y = (colorpicker.hueselectorpointer.AbsolutePosition.Y - colorpicker.hue.AbsolutePosition.Y) / colorpicker.hue.AbsoluteSize.Y
                        colorpicker:Set(Color3.fromHSV(colorpicker.color, math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 1 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 1 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y)))
                    end

                    function colorpicker:Set(value)
                        local color = Color3.new(math.clamp(value.r, 0, 1), math.clamp(value.g, 0, 1), math.clamp(value.b, 0, 1))
                        colorpicker.value = color
                        if colorpicker.flag and colorpicker.flag ~= "" then
                            library.flags[colorpicker.flag] = color
                        end
                        local clr = Color3.new(math.clamp(color.R / 1.7, 0, 1), math.clamp(color.G / 1.7, 0, 1), math.clamp(color.B / 1.7, 0, 1))
                        colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, color), ColorSequenceKeypoint.new(1.00, clr) })
                        pcall(colorpicker.callback, color)
                    end

                    function colorpicker:Get(value)
                        return colorpicker.value
                    end
                    colorpicker:Set(colorpicker.default)

                    local dragging_selector = false
                    local dragging_hue = false

                    colorpicker.selector.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging_selector = true
                            colorpicker:RefreshSelector()
                        end
                    end)
    
                    colorpicker.selector.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging_selector = false
                            colorpicker:RefreshSelector()
                        end
                    end)

                    colorpicker.hue.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging_hue = true
                            colorpicker:RefreshHue()
                        end
                    end)
    
                    colorpicker.hue.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging_hue = false
                            colorpicker:RefreshHue()
                        end
                    end)
    
                    uis.InputChanged:Connect(function(input)
                        if dragging_selector and input.UserInputType == Enum.UserInputType.MouseMovement then
                            colorpicker:RefreshSelector()
                        end
                        if dragging_hue and input.UserInputType == Enum.UserInputType.MouseMovement then
                            colorpicker:RefreshHue()
                        end
                    end)

                    local inputBegan = function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            for i,v in pairs(window.OpenedColorPickers) do
                                if v and i ~= colorpicker.MainPicker then
                                    i.Visible = false
                                    window.OpenedColorPickers[i] = false
                                end
                            end

                            colorpicker.MainPicker.Visible = not colorpicker.MainPicker.Visible
                            window.OpenedColorPickers[colorpicker.MainPicker] = colorpicker.MainPicker.Visible
                            if window.OpenedColorPickers[colorpicker.MainPicker] then
                                colorpicker.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                            else
                                colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                            end
                        end
                    end

                    colorpicker.Main.InputBegan:Connect(inputBegan)
                    colorpicker.Outline.InputBegan:Connect(inputBegan)
                    colorpicker.BlackOutline2.InputBegan:Connect(inputBegan)
                    table.insert(library.items, colorpicker)
                    return colorpicker
                end

                function toggle:AddSlider(min, default, max, decimals, callback, flag)
                    local slider = { }
                    slider.text = text or ""
                    slider.callback = callback or function(value) end
                    slider.min = min or 0
                    slider.max = max or 100
                    slider.decimals = decimals or 1
                    slider.default = default or slider.min
                    slider.flag = flag or ( (toggle.text or "") .. tostring(#toggle.Items:GetChildren()))
    
                    slider.value = slider.default
                    local dragging = false
    
                    slider.Main = Instance.new("TextButton", sector.Items)
                    slider.Main.Name = "slider"
                    slider.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    slider.Main.Position = UDim2.fromOffset(0, 0)
                    slider.Main.BorderSizePixel = 0
                    slider.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 12)
                    slider.Main.AutoButtonColor = false
                    slider.Main.Text = ""
                    slider.Main.ZIndex = 7

                    slider.InputLabel = Instance.new("TextLabel", slider.Main)
                    slider.InputLabel.BackgroundTransparency = 1
                    slider.InputLabel.Size = slider.Main.Size
                    slider.InputLabel.Font = window.theme.font
                    slider.InputLabel.Text = "0"
                    slider.InputLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
                    slider.InputLabel.Position = slider.Main.Position
                    slider.InputLabel.Selectable = false
                    slider.InputLabel.TextSize = 15
                    slider.InputLabel.ZIndex = 9
                    slider.InputLabel.TextStrokeTransparency = 1
                    slider.InputLabel.TextXAlignment = Enum.TextXAlignment.Center
                    updateevent.Event:Connect(function(theme)
                        slider.InputLabel.Font = theme.font
                        slider.InputLabel.TextColor3 = theme.itemscolor
                    end)
    
                    slider.BlackOutline2 = Instance.new("Frame", slider.Main)
                    slider.BlackOutline2.Name = "blackline"
                    slider.BlackOutline2.ZIndex = 4
                    slider.BlackOutline2.Size = slider.Main.Size + UDim2.fromOffset(6, 6)
                    slider.BlackOutline2.BorderSizePixel = 0
                    slider.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                    slider.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                    updateevent.Event:Connect(function(theme)
                        slider.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
                    end)
                    
                    slider.Outline = Instance.new("Frame", slider.Main)
                    slider.Outline.Name = "blackline"
                    slider.Outline.ZIndex = 4
                    slider.Outline.Size = slider.Main.Size + UDim2.fromOffset(4, 4)
                    slider.Outline.BorderSizePixel = 0
                    slider.Outline.BackgroundColor3 = window.theme.outlinecolor
                    slider.Outline.Position = UDim2.fromOffset(-2, -2)
                    updateevent.Event:Connect(function(theme)
                        slider.Outline.BackgroundColor3 = theme.outlinecolor
                    end)
    
                    slider.BlackOutline = Instance.new("Frame", slider.Main)
                    slider.BlackOutline.Name = "blackline"
                    slider.BlackOutline.ZIndex = 4
                    slider.BlackOutline.Size = slider.Main.Size + UDim2.fromOffset(2, 2)
                    slider.BlackOutline.BorderSizePixel = 0
                    slider.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    slider.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                    updateevent.Event:Connect(function(theme)
                        slider.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                    end)
    
                    slider.Gradient = Instance.new("UIGradient", slider.Main)
                    slider.Gradient.Rotation = 90
                    slider.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(41, 41, 41)) })
    
                    slider.SlideBar = Instance.new("Frame", slider.Main)
                    slider.SlideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255) --Color3.fromRGB(204, 0, 102)
                    slider.SlideBar.ZIndex = 8
                    slider.SlideBar.BorderSizePixel = 0
                    slider.SlideBar.Size = UDim2.fromOffset(0, slider.Main.Size.Y.Offset)
    
                    slider.Gradient2 = Instance.new("UIGradient", slider.SlideBar)
                    slider.Gradient2.Rotation = 90
                    slider.Gradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, window.theme.accentcolor), ColorSequenceKeypoint.new(1.00, window.theme.accentcolor2) })
                    updateevent.Event:Connect(function(theme)
                        slider.Gradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, theme.accentcolor), ColorSequenceKeypoint.new(1.00, theme.accentcolor2) })
                    end)
    
                    slider.BlackOutline2.MouseEnter:Connect(function()
                        slider.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                    end)
                    slider.BlackOutline2.MouseLeave:Connect(function()
                        slider.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                    end)
    
                    if slider.flag and slider.flag ~= "" then
                        library.flags[slider.flag] = slider.default or slider.min or 0
                    end

                    function slider:Get()
                        return slider.value
                    end
    
                    function slider:Set(value)
                        slider.value = math.clamp(math.round(value * slider.decimals) / slider.decimals, slider.min, slider.max)
                        local percent = 1 - ((slider.max - slider.value) / (slider.max - slider.min))
                        if slider.flag and slider.flag ~= "" then
                            library.flags[slider.flag] = slider.value
                        end
                        slider.SlideBar:TweenSize(UDim2.fromOffset(percent * slider.Main.AbsoluteSize.X, slider.Main.AbsoluteSize.Y), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                        slider.InputLabel.Text = slider.value
                        pcall(slider.callback, slider.value)
                    end
                    slider:Set(slider.default)
    
                    function slider:Refresh()
                        local mousePos = camera:WorldToViewportPoint(mouse.Hit.p)
                        local percent = math.clamp(mousePos.X - slider.SlideBar.AbsolutePosition.X, 0, slider.Main.AbsoluteSize.X) / slider.Main.AbsoluteSize.X
                        local value = math.floor((slider.min + (slider.max - slider.min) * percent) * slider.decimals) / slider.decimals
                        value = math.clamp(value, slider.min, slider.max)
                        slider:Set(value)
                    end
    
                    slider.SlideBar.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true
                            slider:Refresh()
                        end
                    end)
    
                    slider.SlideBar.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                        end
                    end)
    
                    slider.Main.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true
                            slider:Refresh()
                        end
                    end)
    
                    slider.Main.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                        end
                    end)
    
                    uis.InputChanged:Connect(function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            slider:Refresh()
                        end
                    end)
    
                    sector:FixSize()
                    table.insert(library.items, slider)
                    return slider
                end

                toggle.Main.MouseButton1Down:Connect(function()
                    toggle:Set(not toggle.CheckedFrame.Visible)
                end)
                toggle.Label.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        toggle:Set(not toggle.CheckedFrame.Visible)
                    end
                end)

                local MouseEnter = function()
                    toggle.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                end
                local MouseLeave = function()
                    toggle.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                end

                toggle.Label.MouseEnter:Connect(MouseEnter)
                toggle.Label.MouseLeave:Connect(MouseLeave)
                toggle.BlackOutline2.MouseEnter:Connect(MouseEnter)
                toggle.BlackOutline2.MouseLeave:Connect(MouseLeave)

                sector:FixSize()
                table.insert(library.items, toggle)
                return toggle
            end

            function sector:AddTextbox(text, default, callback, flag)
                local textbox = { }
                textbox.text = text or ""
                textbox.callback = callback or function() end
                textbox.default = default
                textbox.value = ""
                textbox.flag = flag or text or ""

                textbox.Label = Instance.new("TextButton", sector.Items)
                textbox.Label.Name = "Label"
                textbox.Label.AutoButtonColor = false
                textbox.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                textbox.Label.BackgroundTransparency = 1
                textbox.Label.Position = UDim2.fromOffset(sector.Main.Size.X.Offset, 0)
                textbox.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 0)
                textbox.Label.Font = window.theme.font
                textbox.Label.ZIndex = 5
                textbox.Label.Text = textbox.text
                textbox.Label.TextColor3 = window.theme.itemscolor
                textbox.Label.TextSize = 15
                textbox.Label.TextStrokeTransparency = 1
                textbox.Label.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    textbox.Label.Font = theme.font
                end)

                textbox.Holder = Instance.new("Frame", sector.Items)
                textbox.Holder.Name = "holder"
                textbox.Holder.ZIndex = 5
                textbox.Holder.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 14)
                textbox.Holder.BorderSizePixel = 0
                textbox.Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

                textbox.Gradient = Instance.new("UIGradient", textbox.Holder)
                textbox.Gradient.Rotation = 90
                textbox.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 39, 39)) })

                textbox.Main = Instance.new("TextBox", textbox.Holder)
                textbox.Main.PlaceholderText = textbox.text
                textbox.Main.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
                textbox.Main.Text = ""
                textbox.Main.BackgroundTransparency = 1
                textbox.Main.Font = window.theme.font
                textbox.Main.Name = "textbox"
                textbox.Main.MultiLine = false
                textbox.Main.ClearTextOnFocus = false
                textbox.Main.ZIndex = 5
                textbox.Main.TextScaled = true
                textbox.Main.Size = textbox.Holder.Size
                textbox.Main.TextSize = 15
                textbox.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
                textbox.Main.BorderSizePixel = 0
                textbox.Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                textbox.Main.TextXAlignment = Enum.TextXAlignment.Left

                if textbox.flag and textbox.flag ~= "" then
                    library.flags[textbox.flag] = textbox.default or ""
                end

                function textbox:Set(text)
                    textbox.value = text
                    textbox.Main.Text = text
                    if textbox.flag and textbox.flag ~= "" then
                        library.flags[textbox.flag] = text
                    end
                    pcall(textbox.callback, text)
                end
                updateevent.Event:Connect(function(theme)
                    textbox.Main.Font = theme.font
                end)

                function textbox:Get()
                    return textbox.value
                end

                if textbox.default then 
                    textbox:Set(textbox.default)
                end

                textbox.Main.FocusLost:Connect(function()
                    textbox:Set(textbox.Main.Text)
                end)

                textbox.BlackOutline2 = Instance.new("Frame", textbox.Main)
                textbox.BlackOutline2.Name = "blackline"
                textbox.BlackOutline2.ZIndex = 4
                textbox.BlackOutline2.Size = textbox.Main.Size + UDim2.fromOffset(6, 6)
                textbox.BlackOutline2.BorderSizePixel = 0
                textbox.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                textbox.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                updateevent.Event:Connect(function(theme)
                    textbox.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
                end)
                
                textbox.Outline = Instance.new("Frame", textbox.Main)
                textbox.Outline.Name = "blackline"
                textbox.Outline.ZIndex = 4
                textbox.Outline.Size = textbox.Main.Size + UDim2.fromOffset(4, 4)
                textbox.Outline.BorderSizePixel = 0
                textbox.Outline.BackgroundColor3 = window.theme.outlinecolor
                textbox.Outline.Position = UDim2.fromOffset(-2, -2)
                updateevent.Event:Connect(function(theme)
                    textbox.Outline.BackgroundColor3 = theme.outlinecolor
                end)

                textbox.BlackOutline = Instance.new("Frame", textbox.Main)
                textbox.BlackOutline.Name = "blackline"
                textbox.BlackOutline.ZIndex = 4
                textbox.BlackOutline.Size = textbox.Main.Size + UDim2.fromOffset(2, 2)
                textbox.BlackOutline.BorderSizePixel = 0
                textbox.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                textbox.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                updateevent.Event:Connect(function(theme)
                    textbox.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                end)

                textbox.BlackOutline2.MouseEnter:Connect(function()
                    textbox.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                end)
                textbox.BlackOutline2.MouseLeave:Connect(function()
                    textbox.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                end)

                sector:FixSize()
                table.insert(library.items, textbox)
                return textbox
            end
            
            function sector:AddSlider(text, min, default, max, decimals, callback, flag)
                local slider = { }
                slider.text = text or ""
                slider.callback = callback or function(value) end
                slider.min = min or 0
                slider.max = max or 100
                slider.decimals = decimals or 1
                slider.default = default or slider.min
                slider.flag = flag or text or ""

                slider.value = slider.default
                local dragging = false

                slider.MainBack = Instance.new("Frame", sector.Items)
                slider.MainBack.Name = "MainBack"
                slider.MainBack.ZIndex = 7
                slider.MainBack.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 25)
                slider.MainBack.BorderSizePixel = 0
                slider.MainBack.BackgroundTransparency = 1

                slider.Label = Instance.new("TextLabel", slider.MainBack)
                slider.Label.BackgroundTransparency = 1
                slider.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 6)
                slider.Label.Font = window.theme.font
                slider.Label.Text = slider.text .. ":"
                slider.Label.TextColor3 = window.theme.itemscolor
                slider.Label.Position = UDim2.fromOffset(0, 0)
                slider.Label.TextSize = 15
                slider.Label.ZIndex = 4
                slider.Label.TextStrokeTransparency = 1
                slider.Label.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    slider.Label.Font = theme.font
                    slider.Label.TextColor3 = theme.itemscolor
                end)

                local size = textservice:GetTextSize(slider.Label.Text, slider.Label.TextSize, slider.Label.Font, Vector2.new(200,300))
                slider.InputLabel = Instance.new("TextBox", slider.MainBack)
                slider.InputLabel.BackgroundTransparency = 1
                slider.InputLabel.ClearTextOnFocus = false
                slider.InputLabel.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - size.X - 15, 12)
                slider.InputLabel.Font = window.theme.font
                slider.InputLabel.Text = "0"
                slider.InputLabel.TextColor3 = window.theme.itemscolor
                slider.InputLabel.Position = UDim2.fromOffset(size.X + 3, -3)
                slider.InputLabel.TextSize = 15
                slider.InputLabel.ZIndex = 4
                slider.InputLabel.TextStrokeTransparency = 1
                slider.InputLabel.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    slider.InputLabel.Font = theme.font
                    slider.InputLabel.TextColor3 = theme.itemscolor

                    local size = textservice:GetTextSize(slider.Label.Text, slider.Label.TextSize, slider.Label.Font, Vector2.new(200,300))
                    slider.InputLabel.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - size.X - 15, 12)
                end)

                slider.Main = Instance.new("TextButton", slider.MainBack)
                slider.Main.Name = "slider"
                slider.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                slider.Main.Position = UDim2.fromOffset(0, 15)
                slider.Main.BorderSizePixel = 0
                slider.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 12)
                slider.Main.AutoButtonColor = false
                slider.Main.Text = ""
                slider.Main.ZIndex = 5

                slider.BlackOutline2 = Instance.new("Frame", slider.Main)
                slider.BlackOutline2.Name = "blackline"
                slider.BlackOutline2.ZIndex = 4
                slider.BlackOutline2.Size = slider.Main.Size + UDim2.fromOffset(6, 6)
                slider.BlackOutline2.BorderSizePixel = 0
                slider.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                slider.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                updateevent.Event:Connect(function(theme)
                    slider.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
                end)
                
                slider.Outline = Instance.new("Frame", slider.Main)
                slider.Outline.Name = "blackline"
                slider.Outline.ZIndex = 4
                slider.Outline.Size = slider.Main.Size + UDim2.fromOffset(4, 4)
                slider.Outline.BorderSizePixel = 0
                slider.Outline.BackgroundColor3 = window.theme.outlinecolor
                slider.Outline.Position = UDim2.fromOffset(-2, -2)
                updateevent.Event:Connect(function(theme)
                    slider.Outline.BackgroundColor3 = theme.outlinecolor
                end)

                slider.BlackOutline = Instance.new("Frame", slider.Main)
                slider.BlackOutline.Name = "blackline"
                slider.BlackOutline.ZIndex = 4
                slider.BlackOutline.Size = slider.Main.Size + UDim2.fromOffset(2, 2)
                slider.BlackOutline.BorderSizePixel = 0
                slider.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                slider.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                updateevent.Event:Connect(function(theme)
                    slider.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                end)

                slider.Gradient = Instance.new("UIGradient", slider.Main)
                slider.Gradient.Rotation = 90
                slider.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(41, 41, 41)) })

                slider.SlideBar = Instance.new("Frame", slider.Main)
                slider.SlideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255) --Color3.fromRGB(204, 0, 102)
                slider.SlideBar.ZIndex = 5
                slider.SlideBar.BorderSizePixel = 0
                slider.SlideBar.Size = UDim2.fromOffset(0, slider.Main.Size.Y.Offset)

                slider.Gradient2 = Instance.new("UIGradient", slider.SlideBar)
                slider.Gradient2.Rotation = 90
                slider.Gradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, window.theme.accentcolor), ColorSequenceKeypoint.new(1.00, window.theme.accentcolor2) })
                updateevent.Event:Connect(function(theme)
                    slider.Gradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, theme.accentcolor), ColorSequenceKeypoint.new(1.00, theme.accentcolor2) })
                end)

                slider.BlackOutline2.MouseEnter:Connect(function()
                    slider.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                end)
                slider.BlackOutline2.MouseLeave:Connect(function()
                    slider.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                end)

                if slider.flag and slider.flag ~= "" then
                    library.flags[slider.flag] = slider.default or slider.min or 0
                end

                function slider:Get()
                    return slider.value
                end

                function slider:Set(value)
                    slider.value = math.clamp(math.round(value * slider.decimals) / slider.decimals, slider.min, slider.max)
                    local percent = 1 - ((slider.max - slider.value) / (slider.max - slider.min))
                    if slider.flag and slider.flag ~= "" then
                        library.flags[slider.flag] = slider.value
                    end
                    slider.SlideBar:TweenSize(UDim2.fromOffset(percent * slider.Main.AbsoluteSize.X, slider.Main.AbsoluteSize.Y), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                    slider.InputLabel.Text = slider.value
                    pcall(slider.callback, slider.value)
                end
                slider:Set(slider.default)

                slider.InputLabel.FocusLost:Connect(function(Return)
                    if not Return then 
                        return 
                    end
                    if (slider.InputLabel.Text:match("^%d+$")) then
                        slider:Set(tonumber(slider.InputLabel.Text))
                    else
                        slider.InputLabel.Text = tostring(slider.value)
                    end
                end)

                function slider:Refresh()
                    local mousePos = camera:WorldToViewportPoint(mouse.Hit.p)
                    local percent = math.clamp(mousePos.X - slider.SlideBar.AbsolutePosition.X, 0, slider.Main.AbsoluteSize.X) / slider.Main.AbsoluteSize.X
                    local value = math.floor((slider.min + (slider.max - slider.min) * percent) * slider.decimals) / slider.decimals
                    value = math.clamp(value, slider.min, slider.max)
                    slider:Set(value)
                end

                slider.SlideBar.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        slider:Refresh()
                    end
                end)

                slider.SlideBar.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

                slider.Main.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        slider:Refresh()
                    end
                end)

                slider.Main.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

                uis.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        slider:Refresh()
                    end
                end)

                sector:FixSize()
                table.insert(library.items, slider)
                return slider
            end

            function sector:AddColorpicker(text, default, callback, flag)
                local colorpicker = { }

                colorpicker.text = text or ""
                colorpicker.callback = callback or function() end
                colorpicker.default = default or Color3.fromRGB(255, 255, 255)
                colorpicker.value = colorpicker.default
                colorpicker.flag = flag or text or ""

                colorpicker.Label = Instance.new("TextLabel", sector.Items)
                colorpicker.Label.BackgroundTransparency = 1
                colorpicker.Label.Size = UDim2.fromOffset(156, 10)
                colorpicker.Label.ZIndex = 4
                colorpicker.Label.Font = window.theme.font
                colorpicker.Label.Text = colorpicker.text
                colorpicker.Label.TextColor3 = window.theme.itemscolor
                colorpicker.Label.TextSize = 15
                colorpicker.Label.TextStrokeTransparency = 1
                colorpicker.Label.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    colorpicker.Label.Font = theme.font
                    colorpicker.Label.TextColor3 = theme.itemscolor
                end)

                colorpicker.Main = Instance.new("Frame", colorpicker.Label)
                colorpicker.Main.ZIndex = 6
                colorpicker.Main.BorderSizePixel = 0
                colorpicker.Main.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 29, 0)
                colorpicker.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                colorpicker.Main.Size = UDim2.fromOffset(16, 10)

                colorpicker.Gradient = Instance.new("UIGradient", colorpicker.Main)
                colorpicker.Gradient.Rotation = 90

                local clr = Color3.new(math.clamp(colorpicker.value.R / 1.7, 0, 1), math.clamp(colorpicker.value.G / 1.7, 0, 1), math.clamp(colorpicker.value.B / 1.7, 0, 1))
                colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, colorpicker.value), ColorSequenceKeypoint.new(1.00, clr) })

                colorpicker.BlackOutline2 = Instance.new("Frame", colorpicker.Main)
                colorpicker.BlackOutline2.Name = "blackline"
                colorpicker.BlackOutline2.ZIndex = 4
                colorpicker.BlackOutline2.Size = colorpicker.Main.Size + UDim2.fromOffset(6, 6)
                colorpicker.BlackOutline2.BorderSizePixel = 0
                colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                colorpicker.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                updateevent.Event:Connect(function(theme)
                    colorpicker.BlackOutline2.BackgroundColor3 = window.OpenedColorPickers[colorpicker.MainPicker] and theme.accentcolor or theme.outlinecolor2
                end)
                
                colorpicker.Outline = Instance.new("Frame", colorpicker.Main)
                colorpicker.Outline.Name = "blackline"
                colorpicker.Outline.ZIndex = 4
                colorpicker.Outline.Size = colorpicker.Main.Size + UDim2.fromOffset(4, 4)
                colorpicker.Outline.BorderSizePixel = 0
                colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
                colorpicker.Outline.Position = UDim2.fromOffset(-2, -2)
                updateevent.Event:Connect(function(theme)
                    colorpicker.Outline.BackgroundColor3 = theme.outlinecolor
                end)

                colorpicker.BlackOutline = Instance.new("Frame", colorpicker.Main)
                colorpicker.BlackOutline.Name = "blackline"
                colorpicker.BlackOutline.ZIndex = 4
                colorpicker.BlackOutline.Size = colorpicker.Main.Size + UDim2.fromOffset(2, 2)
                colorpicker.BlackOutline.BorderSizePixel = 0
                colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                colorpicker.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                updateevent.Event:Connect(function(theme)
                    colorpicker.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                end)

                colorpicker.BlackOutline2.MouseEnter:Connect(function()
                    colorpicker.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                end)
                colorpicker.BlackOutline2.MouseLeave:Connect(function()
                    if not window.OpenedColorPickers[colorpicker.MainPicker] then
                        colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                    end
                end)

                colorpicker.MainPicker = Instance.new("TextButton", colorpicker.Main)
                colorpicker.MainPicker.Name = "picker"
                colorpicker.MainPicker.ZIndex = 100
                colorpicker.MainPicker.Visible = false
                colorpicker.MainPicker.AutoButtonColor = false
                colorpicker.MainPicker.Text = ""
                window.OpenedColorPickers[colorpicker.MainPicker] = false
                colorpicker.MainPicker.Size = UDim2.fromOffset(180, 196)
                colorpicker.MainPicker.BorderSizePixel = 0
                colorpicker.MainPicker.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                colorpicker.MainPicker.Rotation = 0.000000000000001
                colorpicker.MainPicker.Position = UDim2.fromOffset(-colorpicker.MainPicker.AbsoluteSize.X + colorpicker.Main.AbsoluteSize.X, 15)

                colorpicker.BlackOutline3 = Instance.new("Frame", colorpicker.MainPicker)
                colorpicker.BlackOutline3.Name = "blackline"
                colorpicker.BlackOutline3.ZIndex = 98
                colorpicker.BlackOutline3.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(6, 6)
                colorpicker.BlackOutline3.BorderSizePixel = 0
                colorpicker.BlackOutline3.BackgroundColor3 = window.theme.outlinecolor2
                colorpicker.BlackOutline3.Position = UDim2.fromOffset(-3, -3)
                updateevent.Event:Connect(function(theme)
                    colorpicker.BlackOutline3.BackgroundColor3 = theme.outlinecolor2
                end)
                
                colorpicker.Outline2 = Instance.new("Frame", colorpicker.MainPicker)
                colorpicker.Outline2.Name = "blackline"
                colorpicker.Outline2.ZIndex = 98
                colorpicker.Outline2.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(4, 4)
                colorpicker.Outline2.BorderSizePixel = 0
                colorpicker.Outline2.BackgroundColor3 = window.theme.outlinecolor
                colorpicker.Outline2.Position = UDim2.fromOffset(-2, -2)
                updateevent.Event:Connect(function(theme)
                    colorpicker.Outline2.BackgroundColor3 = theme.outlinecolor
                end)

                colorpicker.BlackOutline3 = Instance.new("Frame", colorpicker.MainPicker)
                colorpicker.BlackOutline3.Name = "blackline"
                colorpicker.BlackOutline3.ZIndex = 98
                colorpicker.BlackOutline3.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(2, 2)
                colorpicker.BlackOutline3.BorderSizePixel = 0
                colorpicker.BlackOutline3.BackgroundColor3 = window.theme.outlinecolor2
                colorpicker.BlackOutline3.Position = UDim2.fromOffset(-1, -1)
                updateevent.Event:Connect(function(theme)
                    colorpicker.BlackOutline3.BackgroundColor3 = theme.outlinecolor2
                end)

                colorpicker.hue = Instance.new("ImageLabel", colorpicker.MainPicker)
                colorpicker.hue.ZIndex = 101
                colorpicker.hue.Position = UDim2.new(0,3,0,3)
                colorpicker.hue.Size = UDim2.new(0,172,0,172)
                colorpicker.hue.Image = "rbxassetid://4155801252"
                colorpicker.hue.ScaleType = Enum.ScaleType.Stretch
                colorpicker.hue.BackgroundColor3 = Color3.new(1,0,0)
                colorpicker.hue.BorderColor3 = window.theme.outlinecolor2
                updateevent.Event:Connect(function(theme)
                    colorpicker.hue.BorderColor3 = theme.outlinecolor2
                end)

                colorpicker.hueselectorpointer = Instance.new("ImageLabel", colorpicker.MainPicker)
                colorpicker.hueselectorpointer.ZIndex = 101
                colorpicker.hueselectorpointer.BackgroundTransparency = 1
                colorpicker.hueselectorpointer.BorderSizePixel = 0
                colorpicker.hueselectorpointer.Position = UDim2.new(0, 0, 0, 0)
                colorpicker.hueselectorpointer.Size = UDim2.new(0, 7, 0, 7)
                colorpicker.hueselectorpointer.Image = "rbxassetid://6885856475"

                colorpicker.selector = Instance.new("TextLabel", colorpicker.MainPicker)
                colorpicker.selector.ZIndex = 100
                colorpicker.selector.Position = UDim2.new(0,3,0,181)
                colorpicker.selector.Size = UDim2.new(0,173,0,10)
                colorpicker.selector.BackgroundColor3 = Color3.fromRGB(255,255,255)
                colorpicker.selector.BorderColor3 = window.theme.outlinecolor2
                colorpicker.selector.Text = ""
                updateevent.Event:Connect(function(theme)
                    colorpicker.selector.BorderColor3 = theme.outlinecolor2
                end)
    
                colorpicker.gradient = Instance.new("UIGradient", colorpicker.selector)
                colorpicker.gradient.Color = ColorSequence.new({ 
                    ColorSequenceKeypoint.new(0, Color3.new(1,0,0)), 
                    ColorSequenceKeypoint.new(0.17, Color3.new(1,0,1)), 
                    ColorSequenceKeypoint.new(0.33,Color3.new(0,0,1)), 
                    ColorSequenceKeypoint.new(0.5,Color3.new(0,1,1)), 
                    ColorSequenceKeypoint.new(0.67, Color3.new(0,1,0)), 
                    ColorSequenceKeypoint.new(0.83, Color3.new(1,1,0)), 
                    ColorSequenceKeypoint.new(1, Color3.new(1,0,0))
                })

                colorpicker.pointer = Instance.new("Frame", colorpicker.selector)
                colorpicker.pointer.ZIndex = 101
                colorpicker.pointer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                colorpicker.pointer.Position = UDim2.new(0,0,0,0)
                colorpicker.pointer.Size = UDim2.new(0,2,0,10)
                colorpicker.pointer.BorderColor3 = Color3.fromRGB(255, 255, 255)

                if colorpicker.flag and colorpicker.flag ~= "" then
                    library.flags[colorpicker.flag] = colorpicker.default
                end

                function colorpicker:RefreshSelector()
                    local pos = math.clamp((mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X, 0, 1)
                    colorpicker.color = 1 - pos
                    colorpicker.pointer:TweenPosition(UDim2.new(pos, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                    colorpicker.hue.BackgroundColor3 = Color3.fromHSV(1 - pos, 1, 1)
                end

                function colorpicker:RefreshHue()
                    local x = (mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X
                    local y = (mouse.Y - colorpicker.hue.AbsolutePosition.Y) / colorpicker.hue.AbsoluteSize.Y
                    colorpicker.hueselectorpointer:TweenPosition(UDim2.new(math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 0.952 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 0, math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 0.885 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                    colorpicker:Set(Color3.fromHSV(colorpicker.color, math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 1 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 1 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y)))
                end

                function colorpicker:Set(value)
                    local color = Color3.new(math.clamp(value.r, 0, 1), math.clamp(value.g, 0, 1), math.clamp(value.b, 0, 1))
                    colorpicker.value = color
                    if colorpicker.flag and colorpicker.flag ~= "" then
                        library.flags[colorpicker.flag] = color
                    end
                    local clr = Color3.new(math.clamp(color.R / 1.7, 0, 1), math.clamp(color.G / 1.7, 0, 1), math.clamp(color.B / 1.7, 0, 1))
                    colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, color), ColorSequenceKeypoint.new(1.00, clr) })
                    pcall(colorpicker.callback, color)
                end
                function colorpicker:Get()
                    return colorpicker.value
                end
                colorpicker:Set(colorpicker.default)

                function colorpicker:AddDropdown(items, default, callback, flag)
                    local dropdown = { }

                    dropdown.defaultitems = items or { }
                    dropdown.default = default
                    dropdown.callback = callback or function() end
                   -- dropdown.multichoice = multichoice or false
                    dropdown.values = { }
                    dropdown.flag = flag or ((colorpicker.text or "") .. tostring( #(sector.Items:GetChildren()) ))
    
                    dropdown.Main = Instance.new("TextButton", sector.Items)
                    dropdown.Main.Name = "dropdown"
                    dropdown.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    dropdown.Main.BorderSizePixel = 0
                    dropdown.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 16)
                    dropdown.Main.Position = UDim2.fromOffset(0, 0)
                    dropdown.Main.ZIndex = 5
                    dropdown.Main.AutoButtonColor = false
                    dropdown.Main.Font = window.theme.font
                    dropdown.Main.Text = ""
                    dropdown.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
                    dropdown.Main.TextSize = 15
                    dropdown.Main.TextXAlignment = Enum.TextXAlignment.Left
                    updateevent.Event:Connect(function(theme)
                        dropdown.Main.Font = theme.font
                    end)
    
                    dropdown.Gradient = Instance.new("UIGradient", dropdown.Main)
                    dropdown.Gradient.Rotation = 90
                    dropdown.Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 39, 39))}
    
                    dropdown.SelectedLabel = Instance.new("TextLabel", dropdown.Main)
                    dropdown.SelectedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    dropdown.SelectedLabel.BackgroundTransparency = 1
                    dropdown.SelectedLabel.Position = UDim2.fromOffset(5, 2)
                    dropdown.SelectedLabel.Size = UDim2.fromOffset(130, 13)
                    dropdown.SelectedLabel.Font = window.theme.font
                    dropdown.SelectedLabel.Text = colorpicker.text
                    dropdown.SelectedLabel.ZIndex = 5
                    dropdown.SelectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    dropdown.SelectedLabel.TextSize = 15
                    dropdown.SelectedLabel.TextStrokeTransparency = 1
                    dropdown.SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left
                    updateevent.Event:Connect(function(theme)
                        dropdown.SelectedLabel.Font = theme.font
                    end)

                    dropdown.Nav = Instance.new("ImageButton", dropdown.Main)
                    dropdown.Nav.Name = "navigation"
                    dropdown.Nav.BackgroundTransparency = 1
                    dropdown.Nav.LayoutOrder = 10
                    dropdown.Nav.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 26, 5)
                    dropdown.Nav.Rotation = 90
                    dropdown.Nav.ZIndex = 5
                    dropdown.Nav.Size = UDim2.fromOffset(8, 8)
                    dropdown.Nav.Image = "rbxassetid://4918373417"
                    dropdown.Nav.ImageColor3 = Color3.fromRGB(210, 210, 210)
    
                    dropdown.BlackOutline2 = Instance.new("Frame", dropdown.Main)
                    dropdown.BlackOutline2.Name = "blackline"
                    dropdown.BlackOutline2.ZIndex = 4
                    dropdown.BlackOutline2.Size = dropdown.Main.Size + UDim2.fromOffset(6, 6)
                    dropdown.BlackOutline2.BorderSizePixel = 0
                    dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                    dropdown.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                    updateevent.Event:Connect(function(theme)
                        dropdown.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
                    end)
    
                    dropdown.Outline = Instance.new("Frame", dropdown.Main)
                    dropdown.Outline.Name = "blackline"
                    dropdown.Outline.ZIndex = 4
                    dropdown.Outline.Size = dropdown.Main.Size + UDim2.fromOffset(4, 4)
                    dropdown.Outline.BorderSizePixel = 0
                    dropdown.Outline.BackgroundColor3 = window.theme.outlinecolor
                    dropdown.Outline.Position = UDim2.fromOffset(-2, -2)
                    updateevent.Event:Connect(function(theme)
                        dropdown.Outline.BackgroundColor3 = theme.outlinecolor
                    end)
    
                    dropdown.BlackOutline = Instance.new("Frame", dropdown.Main)
                    dropdown.BlackOutline.Name = "blackline"
                    dropdown.BlackOutline.ZIndex = 4
                    dropdown.BlackOutline.Size = dropdown.Main.Size + UDim2.fromOffset(2, 2)
                    dropdown.BlackOutline.BorderSizePixel = 0
                    dropdown.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    dropdown.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                    updateevent.Event:Connect(function(theme)
                        dropdown.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                    end)
    
                    dropdown.ItemsFrame = Instance.new("ScrollingFrame", dropdown.Main)
                    dropdown.ItemsFrame.Name = "itemsframe"
                    dropdown.ItemsFrame.BorderSizePixel = 0
                    dropdown.ItemsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    dropdown.ItemsFrame.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
                    dropdown.ItemsFrame.ScrollBarThickness = 2
                    dropdown.ItemsFrame.ZIndex = 8
                    dropdown.ItemsFrame.ScrollingDirection = "Y"
                    dropdown.ItemsFrame.Visible = false
                    dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.Main.AbsoluteSize.X, 0)
    
                    dropdown.ListLayout = Instance.new("UIListLayout", dropdown.ItemsFrame)
                    dropdown.ListLayout.FillDirection = Enum.FillDirection.Vertical
                    dropdown.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
                    dropdown.ListPadding = Instance.new("UIPadding", dropdown.ItemsFrame)
                    dropdown.ListPadding.PaddingTop = UDim.new(0, 2)
                    dropdown.ListPadding.PaddingBottom = UDim.new(0, 2)
                    dropdown.ListPadding.PaddingLeft = UDim.new(0, 2)
                    dropdown.ListPadding.PaddingRight = UDim.new(0, 2)
    
                    dropdown.BlackOutline2Items = Instance.new("Frame", dropdown.Main)
                    dropdown.BlackOutline2Items.Name = "blackline"
                    dropdown.BlackOutline2Items.ZIndex = 7
                    dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
                    dropdown.BlackOutline2Items.BorderSizePixel = 0
                    dropdown.BlackOutline2Items.BackgroundColor3 = window.theme.outlinecolor2
                    dropdown.BlackOutline2Items.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-3, -3)
                    dropdown.BlackOutline2Items.Visible = false
                    updateevent.Event:Connect(function(theme)
                        dropdown.BlackOutline2Items.BackgroundColor3 = theme.outlinecolor2
                    end)
                    
                    dropdown.OutlineItems = Instance.new("Frame", dropdown.Main)
                    dropdown.OutlineItems.Name = "blackline"
                    dropdown.OutlineItems.ZIndex = 7
                    dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
                    dropdown.OutlineItems.BorderSizePixel = 0
                    dropdown.OutlineItems.BackgroundColor3 = window.theme.outlinecolor
                    dropdown.OutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-2, -2)
                    dropdown.OutlineItems.Visible = false
                    updateevent.Event:Connect(function(theme)
                        dropdown.OutlineItems.BackgroundColor3 = theme.outlinecolor
                    end)
    
                    dropdown.BlackOutlineItems = Instance.new("Frame", dropdown.Main)
                    dropdown.BlackOutlineItems.Name = "blackline"
                    dropdown.BlackOutlineItems.ZIndex = 7
                    dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(-2, -2)
                    dropdown.BlackOutlineItems.BorderSizePixel = 0
                    dropdown.BlackOutlineItems.BackgroundColor3 = window.theme.outlinecolor2
                    dropdown.BlackOutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-1, -1)
                    dropdown.BlackOutlineItems.Visible = false
                    updateevent.Event:Connect(function(theme)
                        dropdown.BlackOutlineItems.BackgroundColor3 = theme.outlinecolor2
                    end)
    
                    dropdown.IgnoreBackButtons = Instance.new("TextButton", dropdown.Main)
                    dropdown.IgnoreBackButtons.BackgroundTransparency = 1
                    dropdown.IgnoreBackButtons.BorderSizePixel = 0
                    dropdown.IgnoreBackButtons.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
                    dropdown.IgnoreBackButtons.Size = UDim2.new(0, 0, 0, 0)
                    dropdown.IgnoreBackButtons.ZIndex = 7
                    dropdown.IgnoreBackButtons.Text = ""
                    dropdown.IgnoreBackButtons.Visible = false
                    dropdown.IgnoreBackButtons.AutoButtonColor = false

                    if dropdown.flag and dropdown.flag ~= "" then
                        library.flags[dropdown.flag] = dropdown.multichoice and { dropdown.default or dropdown.defaultitems[1] or "" } or (dropdown.default or dropdown.defaultitems[1] or "")
                    end

                    function dropdown:isSelected(item)
                        for i, v in pairs(dropdown.values) do
                            if v == item then
                                return true
                            end
                        end
                        return false
                    end
    
                    function dropdown:updateText(text)
                        if #text >= 27 then
                            text = text:sub(1, 25) .. ".."
                        end
                        dropdown.SelectedLabel.Text = text
                    end
    
                    dropdown.Changed = Instance.new("BindableEvent")
                    function dropdown:Set(value)
                        if type(value) == "table" then
                            dropdown.values = value
                            dropdown:updateText(table.concat(value, ", "))
                            pcall(dropdown.callback, value)
                        else
                            dropdown:updateText(value)
                            dropdown.values = { value }
                            pcall(dropdown.callback, value)
                        end
                        
                        dropdown.Changed:Fire(value)
                        if dropdown.flag and dropdown.flag ~= "" then
                            library.flags[dropdown.flag] = dropdown.multichoice and dropdown.values or dropdown.values[1]
                        end
                    end
    
                    function dropdown:Get()
                        return dropdown.multichoice and dropdown.values or dropdown.values[1]
                    end
                    dropdown.items = { }
                    function dropdown:Add(v)
                        local Item = Instance.new("TextButton", dropdown.ItemsFrame)
                        Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Item.BorderSizePixel = 0
                        Item.Position = UDim2.fromOffset(0, 0)
                        Item.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset - 4, 20)
                        Item.ZIndex = 9
                        Item.Text = v
                        Item.Name = v
                        Item.AutoButtonColor = false
                        Item.Font = window.theme.font
                        Item.TextSize = 15
                        Item.TextXAlignment = Enum.TextXAlignment.Left
                        Item.TextStrokeTransparency = 1
                        dropdown.ItemsFrame.CanvasSize = dropdown.ItemsFrame.CanvasSize + UDim2.fromOffset(0, Item.AbsoluteSize.Y)
    
                        Item.MouseButton1Down:Connect(function()
                            if dropdown.multichoice then
                                if dropdown:isSelected(v) then
                                    for i2, v2 in pairs(dropdown.values) do
                                        if v2 == v then
                                            table.remove(dropdown.values, i2)
                                        end
                                    end
                                    dropdown:Set(dropdown.values)
                                else
                                    table.insert(dropdown.values, v)
                                    dropdown:Set(dropdown.values)
                                end
    
                                return
                            else
                                dropdown.Nav.Rotation = 90
                                dropdown.ItemsFrame.Visible = false
                                dropdown.ItemsFrame.Active = false
                                dropdown.OutlineItems.Visible = false
                                dropdown.BlackOutlineItems.Visible = false
                                dropdown.BlackOutline2Items.Visible = false
                                dropdown.IgnoreBackButtons.Visible = false
                                dropdown.IgnoreBackButtons.Active = false
                            end
    
                            dropdown:Set(v)
                            return
                        end)
    
                        runservice.RenderStepped:Connect(function()
                            if dropdown.multichoice and dropdown:isSelected(v) or dropdown.values[1] == v then
                                Item.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
                                Item.TextColor3 = window.theme.accentcolor
                                Item.Text = " " .. v
                            else
                                Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                                Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                                Item.Text = v
                            end
                        end)
    
                        table.insert(dropdown.items, v)
                        dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * Item.AbsoluteSize.Y, 20, 156) + 4)
                        dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * Item.AbsoluteSize.Y) + 4)
    
                        dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
                        dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
                        dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
                        dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size
                    end

                    function dropdown:Remove(value)
                        local item = dropdown.ItemsFrame:FindFirstChild(value)
                        if item then
                            for i,v in pairs(dropdown.items) do
                                if v == value then
                                    table.remove(dropdown.items, i)
                                end
                            end
    
                            dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * item.AbsoluteSize.Y, 20, 156) + 4)
                            dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * item.AbsoluteSize.Y) + 4)
        
                            dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
                            dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
                            dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
                            dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size
    
                            item:Remove()
                        end
                    end 

                    function dropdown:Refresh()
                        for _, Option in pairs(dropdown.ItemsFrame:GetChildren()) do
                            if Option:IsA("TextButton") then
                                Option:Destroy()
                            end
                        end
                        dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * item.AbsoluteSize.Y, 20, 156) + 4)
                        dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * item.AbsoluteSize.Y) + 4)
                        dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
                        dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
                        dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
                        dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size
                    end

                    function dropdown:getList()
                        return dropdown.items
                    end
                    for i,v in pairs(dropdown.defaultitems) do
                        dropdown:Add(v)
                    end
    
                    if dropdown.default then
                        dropdown:Set(dropdown.default)
                    end
    
                    local MouseButton1Down = function()
                        if dropdown.Nav.Rotation == 90 then
                            dropdown.ItemsFrame.ScrollingEnabled = true
                            sector.Main.Parent.ScrollingEnabled = true
                            tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { Rotation = -90 }):Play()
                            dropdown.ItemsFrame.Visible = true
                            dropdown.ItemsFrame.Active = true
                            dropdown.IgnoreBackButtons.Visible = true
                            dropdown.IgnoreBackButtons.Active = true
                            dropdown.OutlineItems.Visible = true
                            dropdown.BlackOutlineItems.Visible = true
                            dropdown.BlackOutline2Items.Visible = true
                        else
                            dropdown.ItemsFrame.ScrollingEnabled = true
                            sector.Main.Parent.ScrollingEnabled = true
                            tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { Rotation = 90 }):Play()
                            dropdown.ItemsFrame.Visible = false
                            dropdown.ItemsFrame.Active = false
                            dropdown.IgnoreBackButtons.Visible = false
                            dropdown.IgnoreBackButtons.Active = false
                            dropdown.OutlineItems.Visible = false
                            dropdown.BlackOutlineItems.Visible = false
                            dropdown.BlackOutline2Items.Visible = false
                        end
                    end
    
                    dropdown.Main.MouseButton1Down:Connect(MouseButton1Down)
                    dropdown.Nav.MouseButton1Down:Connect(MouseButton1Down)
    
                    dropdown.BlackOutline2.MouseEnter:Connect(function()
                        dropdown.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                    end)
                    dropdown.BlackOutline2.MouseLeave:Connect(function()
                        dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                    end)
    
                    sector:FixSize()
                    table.insert(library.items, dropdown)
                    return dropdown
                end

                local dragging_selector = false
                local dragging_hue = false

                colorpicker.selector.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging_selector = true
                        colorpicker:RefreshSelector()
                    end
                end)

                colorpicker.selector.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging_selector = false
                        colorpicker:RefreshSelector()
                    end
                end)

                colorpicker.hue.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging_hue = true
                        colorpicker:RefreshHue()
                    end
                end)

                colorpicker.hue.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging_hue = false
                        colorpicker:RefreshHue()
                    end
                end)

                uis.InputChanged:Connect(function(input)
                    if dragging_selector and input.UserInputType == Enum.UserInputType.MouseMovement then
                        colorpicker:RefreshSelector()
                    end
                    if dragging_hue and input.UserInputType == Enum.UserInputType.MouseMovement then
                        colorpicker:RefreshHue()
                    end
                end)

                local inputBegan = function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        for i,v in pairs(window.OpenedColorPickers) do
                            if v and i ~= colorpicker.MainPicker then
                                i.Visible = false
                                window.OpenedColorPickers[i] = false
                            end
                        end

                        colorpicker.MainPicker.Visible = not colorpicker.MainPicker.Visible
                        window.OpenedColorPickers[colorpicker.MainPicker] = colorpicker.MainPicker.Visible
                        if window.OpenedColorPickers[colorpicker.MainPicker] then
                            colorpicker.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                        else
                            colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                        end
                    end
                end

                colorpicker.Main.InputBegan:Connect(inputBegan)
                colorpicker.Outline.InputBegan:Connect(inputBegan)
                colorpicker.BlackOutline2.InputBegan:Connect(inputBegan)

                sector:FixSize()
                table.insert(library.items, colorpicker)
                return colorpicker
            end

            function sector:AddKeybind(text,default,newkeycallback,callback,flag)
                local keybind = { }

                keybind.text = text or ""
                keybind.default = default or "None"
                keybind.callback = callback or function() end
                keybind.newkeycallback = newkeycallback or function(key) end
                keybind.flag = flag or text or ""

                keybind.value = keybind.default

                keybind.Main = Instance.new("TextLabel", sector.Items)
                keybind.Main.BackgroundTransparency = 1
                keybind.Main.Size = UDim2.fromOffset(156, 10)
                keybind.Main.ZIndex = 4
                keybind.Main.Font = window.theme.font
                keybind.Main.Text = keybind.text
                keybind.Main.TextColor3 = window.theme.itemscolor
                keybind.Main.TextSize = 15
                keybind.Main.TextStrokeTransparency = 1
                keybind.Main.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    keybind.Main.Font = theme.font
                    keybind.Main.TextColor3 = theme.itemscolor
                end)

                keybind.Bind = Instance.new("TextButton", keybind.Main)
                keybind.Bind.Name = "keybind"
                keybind.Bind.BackgroundTransparency = 1
                keybind.Bind.BorderColor3 = window.theme.outlinecolor
                keybind.Bind.ZIndex = 5
                keybind.Bind.BorderSizePixel = 0
                keybind.Bind.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 10, 0)
                keybind.Bind.Font = window.theme.font
                keybind.Bind.TextColor3 = Color3.fromRGB(136, 136, 136)
                keybind.Bind.TextSize = 15
                keybind.Bind.TextXAlignment = Enum.TextXAlignment.Right
                keybind.Bind.MouseButton1Down:Connect(function()
                    keybind.Bind.Text = "[...]"
                    keybind.Bind.TextColor3 = window.theme.accentcolor
                end)
                updateevent.Event:Connect(function(theme)
                    keybind.Bind.BorderColor3 = theme.outlinecolor
                    keybind.Bind.Font = theme.font
                end)

                if keybind.flag and keybind.flag ~= "" then
                    library.flags[keybind.flag] = keybind.default
                end

                local shorter_keycodes = {
                    ["LeftShift"] = "LSHIFT",
                    ["RightShift"] = "RSHIFT",
                    ["LeftControl"] = "LCTRL",
                    ["RightControl"] = "RCTRL",
                    ["LeftAlt"] = "LALT",
                    ["RightAlt"] = "RALT"
                }

                function keybind:Set(value)
                    if value == "None" then
                        keybind.value = value
                        keybind.Bind.Text = "[" .. value .. "]"
    
                        local size = textservice:GetTextSize(keybind.Bind.Text, keybind.Bind.TextSize, keybind.Bind.Font, Vector2.new(2000, 2000))
                        keybind.Bind.Size = UDim2.fromOffset(size.X, size.Y)
                        keybind.Bind.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 10 - keybind.Bind.AbsoluteSize.X, 0)
                        if keybind.flag and keybind.flag ~= "" then
                            library.flags[keybind.flag] = value
                        end
                        pcall(keybind.newkeycallback, value)
                    end

                    keybind.value = value
                    keybind.Bind.Text = "[" .. (shorter_keycodes[value.Name or value] or (value.Name or value)) .. "]"

                    local size = textservice:GetTextSize(keybind.Bind.Text, keybind.Bind.TextSize, keybind.Bind.Font, Vector2.new(2000, 2000))
                    keybind.Bind.Size = UDim2.fromOffset(size.X, size.Y)
                    keybind.Bind.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 10 - keybind.Bind.AbsoluteSize.X, 0)
                    if keybind.flag and keybind.flag ~= "" then
                        library.flags[keybind.flag] = value
                    end
                    pcall(keybind.newkeycallback, value)
                end
                keybind:Set(keybind.default and keybind.default or "None")

                function keybind:Get()
                    return keybind.value
                end

                uis.InputBegan:Connect(function(input, gameProcessed)
                    if not gameProcessed then
                        if keybind.Bind.Text == "[...]" then
                            keybind.Bind.TextColor3 = Color3.fromRGB(136, 136, 136)
                            if input.UserInputType == Enum.UserInputType.Keyboard then
                                keybind:Set(input.KeyCode)
                            else
                                keybind:Set("None")
                            end
                        else
                            if keybind.value ~= "None" and input.KeyCode == keybind.value then
                                pcall(keybind.callback)
                            end
                        end
                    end
                end)

                sector:FixSize()
                table.insert(library.items, keybind)
                return keybind
            end

            function sector:AddDropdown(text, items, default, callback, flag)
                local dropdown = { }             
                dropdown.text = text or ""
                dropdown.defaultitems = items or { }
                dropdown.default = default
                dropdown.callback = callback or function()
                end
               -- dropdown.multichoice = multichoice or false
                dropdown.values = { }
                dropdown.flag = flag or text or ""
                dropdown.MainBack = Instance.new("Frame", sector.Items)
                dropdown.MainBack.Name = "backlabel"
                dropdown.MainBack.ZIndex = 7
                dropdown.MainBack.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 34)
                dropdown.MainBack.BorderSizePixel = 0
                dropdown.MainBack.BackgroundTransparency = 1
                dropdown.Label = Instance.new("TextLabel", dropdown.MainBack)
                dropdown.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.Label.BackgroundTransparency = 1
                dropdown.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 10)
                dropdown.Label.Position = UDim2.fromOffset(0, 0)
                dropdown.Label.Font = window.theme.font
                dropdown.Label.Text = dropdown.text
                dropdown.Label.ZIndex = 4
                dropdown.Label.TextColor3 = window.theme.itemscolor
                dropdown.Label.TextSize = 15
                dropdown.Label.TextStrokeTransparency = 1
                dropdown.Label.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    dropdown.Label.Font = theme.font
                    dropdown.Label.TextColor3 = theme.itemscolor
                end)
                dropdown.Main = Instance.new("TextButton", dropdown.MainBack)
                dropdown.Main.Name = "dropdown"
                dropdown.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.Main.BorderSizePixel = 0
                dropdown.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 16)
                dropdown.Main.Position = UDim2.fromOffset(0, 17)
                dropdown.Main.ZIndex = 5
                dropdown.Main.AutoButtonColor = false
                dropdown.Main.Font = window.theme.font
                dropdown.Main.Text = ""
                dropdown.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.Main.TextSize = 15
                dropdown.Main.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    dropdown.Main.Font = theme.font
                end)
                dropdown.Gradient = Instance.new("UIGradient", dropdown.Main)
                dropdown.Gradient.Rotation = 90
                dropdown.Gradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)),
                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 39, 39))
                }
                dropdown.SelectedLabel = Instance.new("TextLabel", dropdown.Main)
                dropdown.SelectedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.SelectedLabel.BackgroundTransparency = 1
                dropdown.SelectedLabel.Position = UDim2.fromOffset(5, 2)
                dropdown.SelectedLabel.Size = UDim2.fromOffset(130, 13)
                dropdown.SelectedLabel.Font = window.theme.font
                dropdown.SelectedLabel.Text = dropdown.text
                dropdown.SelectedLabel.ZIndex = 5
                dropdown.SelectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.SelectedLabel.TextSize = 15
                dropdown.SelectedLabel.TextStrokeTransparency = 1
                dropdown.SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left
                updateevent.Event:Connect(function(theme)
                    dropdown.SelectedLabel.Font = theme.font
                end)
                dropdown.Nav = Instance.new("ImageButton", dropdown.Main)
                dropdown.Nav.Name = "navigation"
                dropdown.Nav.BackgroundTransparency = 1
                dropdown.Nav.LayoutOrder = 10
                dropdown.Nav.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 26, 5)
                dropdown.Nav.Rotation = 90
                dropdown.Nav.ZIndex = 5
                dropdown.Nav.Size = UDim2.fromOffset(8, 8)
                dropdown.Nav.Image = "rbxassetid://4918373417"
                dropdown.Nav.ImageColor3 = Color3.fromRGB(210, 210, 210)
                dropdown.BlackOutline2 = Instance.new("Frame", dropdown.Main)
                dropdown.BlackOutline2.Name = "blackline"
                dropdown.BlackOutline2.ZIndex = 4
                dropdown.BlackOutline2.Size = dropdown.Main.Size + UDim2.fromOffset(6, 6)
                dropdown.BlackOutline2.BorderSizePixel = 0
                dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                dropdown.BlackOutline2.Position = UDim2.fromOffset(-3, -3)
                updateevent.Event:Connect(function(theme)
                    dropdown.BlackOutline2.BackgroundColor3 = theme.outlinecolor2
                end)
                dropdown.Outline = Instance.new("Frame", dropdown.Main)
                dropdown.Outline.Name = "blackline"
                dropdown.Outline.ZIndex = 4
                dropdown.Outline.Size = dropdown.Main.Size + UDim2.fromOffset(4, 4)
                dropdown.Outline.BorderSizePixel = 0
                dropdown.Outline.BackgroundColor3 = window.theme.outlinecolor
                dropdown.Outline.Position = UDim2.fromOffset(-2, -2)
                updateevent.Event:Connect(function(theme)
                    dropdown.Outline.BackgroundColor3 = theme.outlinecolor
                end)
                dropdown.BlackOutline = Instance.new("Frame", dropdown.Main)
                dropdown.BlackOutline.Name = "blackline"
                dropdown.BlackOutline.ZIndex = 4
                dropdown.BlackOutline.Size = dropdown.Main.Size + UDim2.fromOffset(2, 2)
                dropdown.BlackOutline.BorderSizePixel = 0
                dropdown.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                dropdown.BlackOutline.Position = UDim2.fromOffset(-1, -1)
                updateevent.Event:Connect(function(theme)
                    dropdown.BlackOutline.BackgroundColor3 = theme.outlinecolor2
                end)
                dropdown.ItemsFrame = Instance.new("ScrollingFrame", dropdown.Main)
                dropdown.ItemsFrame.Name = "itemsframe"
                dropdown.ItemsFrame.BorderSizePixel = 0
                dropdown.ItemsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                dropdown.ItemsFrame.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
                dropdown.ItemsFrame.ScrollBarThickness = 2
                dropdown.ItemsFrame.ZIndex = 8
                dropdown.ItemsFrame.ScrollingDirection = "Y"
                dropdown.ItemsFrame.Visible = false
                dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.Main.AbsoluteSize.X, 0)
                dropdown.ListLayout = Instance.new("UIListLayout", dropdown.ItemsFrame)
                dropdown.ListLayout.FillDirection = Enum.FillDirection.Vertical
                dropdown.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                dropdown.ListPadding = Instance.new("UIPadding", dropdown.ItemsFrame)
                dropdown.ListPadding.PaddingTop = UDim.new(0, 2)
                dropdown.ListPadding.PaddingBottom = UDim.new(0, 2)
                dropdown.ListPadding.PaddingLeft = UDim.new(0, 2)
                dropdown.ListPadding.PaddingRight = UDim.new(0, 2)
                dropdown.BlackOutline2Items = Instance.new("Frame", dropdown.Main)
                dropdown.BlackOutline2Items.Name = "blackline"
                dropdown.BlackOutline2Items.ZIndex = 7
                dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
                dropdown.BlackOutline2Items.BorderSizePixel = 0
                dropdown.BlackOutline2Items.BackgroundColor3 = window.theme.outlinecolor2
                dropdown.BlackOutline2Items.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-3, -3)
                dropdown.BlackOutline2Items.Visible = false
                updateevent.Event:Connect(function(theme)
                    dropdown.BlackOutline2Items.BackgroundColor3 = theme.outlinecolor2
                end)
                dropdown.OutlineItems = Instance.new("Frame", dropdown.Main)
                dropdown.OutlineItems.Name = "blackline"
                dropdown.OutlineItems.ZIndex = 7
                dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
                dropdown.OutlineItems.BorderSizePixel = 0
                dropdown.OutlineItems.BackgroundColor3 = window.theme.outlinecolor
                dropdown.OutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-2, -2)
                dropdown.OutlineItems.Visible = false
                updateevent.Event:Connect(function(theme)
                    dropdown.OutlineItems.BackgroundColor3 = theme.outlinecolor
                end)
                dropdown.BlackOutlineItems = Instance.new("Frame", dropdown.Main)
                dropdown.BlackOutlineItems.Name = "blackline"
                dropdown.BlackOutlineItems.ZIndex = 7
                dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(-2, -2)
                dropdown.BlackOutlineItems.BorderSizePixel = 0
                dropdown.BlackOutlineItems.BackgroundColor3 = window.theme.outlinecolor2
                dropdown.BlackOutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-1, -1)
                dropdown.BlackOutlineItems.Visible = false
                updateevent.Event:Connect(function(theme)
                    dropdown.BlackOutlineItems.BackgroundColor3 = theme.outlinecolor2
                end)
                dropdown.IgnoreBackButtons = Instance.new("TextButton", dropdown.Main)
                dropdown.IgnoreBackButtons.BackgroundTransparency = 1
                dropdown.IgnoreBackButtons.BorderSizePixel = 0
                dropdown.IgnoreBackButtons.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
                dropdown.IgnoreBackButtons.Size = UDim2.new(0, 0, 0, 0)
                dropdown.IgnoreBackButtons.ZIndex = 7
                dropdown.IgnoreBackButtons.Text = ""
                dropdown.IgnoreBackButtons.Visible = false
                dropdown.IgnoreBackButtons.AutoButtonColor = false
                if dropdown.flag and dropdown.flag ~= "" then
                    library.flags[dropdown.flag] = dropdown.multichoice and {
                        dropdown.default or dropdown.defaultitems[1] or ""
                    } or (dropdown.default or dropdown.defaultitems[1] or "")
                end
                function dropdown:isSelected(item)
                    for i, v in pairs(dropdown.values) do
                        if v == item then
                            return true
                        end
                    end
                    return false
                end
                function dropdown:GetOptions()
                    return dropdown.values
                end
                function dropdown:updateText(text)
                    if #text >= 27 then
                        text = text:sub(1, 25) .. ".."
                    end
                    dropdown.SelectedLabel.Text = text
                end
                dropdown.Changed = Instance.new("BindableEvent")
                function dropdown:Set(value)
                    if type(value) == "table" then
                        dropdown.values = value
                        dropdown:updateText(table.concat(value, ", "))
                        pcall(dropdown.callback, value)
                    else
                        dropdown:updateText(value)
                        dropdown.values = {
                            value
                        }
                        pcall(dropdown.callback, value)
                    end
                    dropdown.Changed:Fire(value)
                    if dropdown.flag and dropdown.flag ~= "" then
                        library.flags[dropdown.flag] = dropdown.multichoice and dropdown.values or dropdown.values[1]
                    end
                end
                function dropdown:Get()
                    return dropdown.multichoice and dropdown.values or dropdown.values[1]
                end

                dropdown.items = { }
                function dropdown:Add(v)
                    local Item = Instance.new("TextButton", dropdown.ItemsFrame)
                    Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Item.BorderSizePixel = 0
                    Item.Position = UDim2.fromOffset(0, 0)
                    Item.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset - 4, 20)
                    Item.ZIndex = 9
                    Item.Text = v
                    Item.Name = v
                    Item.AutoButtonColor = false
                    Item.Font = window.theme.font
                    Item.TextSize = 15
                    Item.TextXAlignment = Enum.TextXAlignment.Left
                    Item.TextStrokeTransparency = 1
                    dropdown.ItemsFrame.CanvasSize = dropdown.ItemsFrame.CanvasSize + UDim2.fromOffset(0, Item.AbsoluteSize.Y)
                    Item.MouseButton1Down:Connect(function()
                        if dropdown.multichoice then
                            if dropdown:isSelected(v) then
                                for i2, v2 in pairs(dropdown.values) do
                                    if v2 == v then
                                        table.remove(dropdown.values, i2)
                                    end
                                end
                                dropdown:Set(dropdown.values)
                            else
                                table.insert(dropdown.values, v)
                                dropdown:Set(dropdown.values)
                            end
                            return
                        else
                            dropdown.Nav.Rotation = 90
                            dropdown.ItemsFrame.Visible = false
                            dropdown.ItemsFrame.Active = false
                            dropdown.OutlineItems.Visible = false
                            dropdown.BlackOutlineItems.Visible = false
                            dropdown.BlackOutline2Items.Visible = false
                            dropdown.IgnoreBackButtons.Visible = false
                            dropdown.IgnoreBackButtons.Active = false
                        end
                        dropdown:Set(v)
                        return
                    end)
                    runservice.RenderStepped:Connect(function()
                        if dropdown.multichoice and dropdown:isSelected(v) or dropdown.values[1] == v then
                            Item.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
                            Item.TextColor3 = window.theme.accentcolor
                            Item.Text = " " .. v
                        else
                            Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                            Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Item.Text = v
                        end
                    end)
                    table.insert(dropdown.items, v)
                    dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * Item.AbsoluteSize.Y, 20, 156) + 4)
                    dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * Item.AbsoluteSize.Y) + 4)
                    dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
                    dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
                    dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
                    dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size
                end
                function dropdown:Remove(value)
                    local item = dropdown.ItemsFrame:FindFirstChild(value)
                    if item then
                        for i, v in pairs(dropdown.items) do
                            if v == value then
                                table.remove(dropdown.items, i)
                            end
                        end
                        dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * item.AbsoluteSize.Y, 20, 156) + 4)
                        dropdown.ItemsFrame.CanvasSize = UDim2.fromOffset(dropdown.ItemsFrame.AbsoluteSize.X, (#dropdown.items * item.AbsoluteSize.Y) + 4)
                        dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
                        dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
                        dropdown.BlackOutline2Items.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(6, 6)
                        dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size
                        item:Remove()
                    end
                end
                function dropdown:Refresh()
                    for _, Option in pairs(dropdown.ItemsFrame:GetChildren()) do
                        if Option:IsA("TextButton") then
                            Option:Destroy()
                        end
                    end
                    dropdown.Nav.Rotation = 90
                    dropdown.ItemsFrame.Visible = false
                    dropdown.ItemsFrame.Active = false
                    dropdown.OutlineItems.Visible = false
                    dropdown.BlackOutlineItems.Visible = false
                    dropdown.BlackOutline2Items.Visible = false
                    dropdown.IgnoreBackButtons.Visible = false
                    dropdown.IgnoreBackButtons.Active = false
                end
                function dropdown:getList()
                    return dropdown.items
                end
                for i, v in pairs(dropdown.defaultitems) do
                    dropdown:Add(v)
                end
                if dropdown.default then
                    dropdown:Set(dropdown.default)
                end
                local MouseButton1Down = function()
                    if dropdown.Nav.Rotation == 90 then
                        tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Rotation = -90
                        }):Play()
                        if dropdown.items and #dropdown.items ~= 0 then
                            dropdown.ItemsFrame.ScrollingEnabled = true
                            sector.Main.Parent.ScrollingEnabled = true
                            dropdown.ItemsFrame.Visible = true
                            dropdown.ItemsFrame.Active = true
                            dropdown.IgnoreBackButtons.Visible = true
                            dropdown.IgnoreBackButtons.Active = true
                            dropdown.OutlineItems.Visible = true
                            dropdown.BlackOutlineItems.Visible = true
                            dropdown.BlackOutline2Items.Visible = true
                        end
                    else
                        tweenservice:Create(dropdown.Nav, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Rotation = 90
                        }):Play()
                        dropdown.ItemsFrame.ScrollingEnabled = true
                        sector.Main.Parent.ScrollingEnabled = true
                        dropdown.ItemsFrame.Visible = false
                        dropdown.ItemsFrame.Active = false
                        dropdown.IgnoreBackButtons.Visible = false
                        dropdown.IgnoreBackButtons.Active = false
                        dropdown.OutlineItems.Visible = false
                        dropdown.BlackOutlineItems.Visible = false
                        dropdown.BlackOutline2Items.Visible = false
                    end
                end
                dropdown.Main.MouseButton1Down:Connect(MouseButton1Down)
                dropdown.Nav.MouseButton1Down:Connect(MouseButton1Down)
                dropdown.BlackOutline2.MouseEnter:Connect(function()
                    dropdown.BlackOutline2.BackgroundColor3 = window.theme.accentcolor
                end)
                dropdown.BlackOutline2.MouseLeave:Connect(function()
                    dropdown.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                end)
                sector:FixSize()
                table.insert(library.items, dropdown)
                return dropdown
            end

            function sector:AddSeperator(text)
                local seperator = { }
                seperator.text = text or ""

                seperator.main = Instance.new("Frame", sector.Items)
                seperator.main.Name = "Main"
                seperator.main.ZIndex = 5
                seperator.main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 10)
                seperator.main.BorderSizePixel = 0
                seperator.main.BackgroundTransparency = 1

                seperator.line = Instance.new("Frame", seperator.main)
                seperator.line.Name = "Line"
                seperator.line.ZIndex = 7
                seperator.line.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                seperator.line.BorderSizePixel = 0
                seperator.line.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 26, 1)
                seperator.line.Position = UDim2.fromOffset(7, 5)

                seperator.outline = Instance.new("Frame", seperator.line)
                seperator.outline.Name = "Outline"
                seperator.outline.ZIndex = 6
                seperator.outline.BorderSizePixel = 0
                seperator.outline.BackgroundColor3 = window.theme.outlinecolor2
                seperator.outline.Position = UDim2.fromOffset(-1, -1)
                seperator.outline.Size = seperator.line.Size - UDim2.fromOffset(-2, -2)
                updateevent.Event:Connect(function(theme)
                    seperator.outline.BackgroundColor3 = theme.outlinecolor2
                end)

                seperator.label = Instance.new("TextLabel", seperator.main)
                seperator.label.Name = "Label"
                seperator.label.BackgroundTransparency = 1
                seperator.label.Size = seperator.main.Size
                seperator.label.Font = window.theme.font
                seperator.label.ZIndex = 8
                seperator.label.Text = seperator.text
                seperator.label.TextColor3 = Color3.fromRGB(255, 255, 255)
                seperator.label.TextSize = window.theme.fontsize
                seperator.label.TextStrokeTransparency = 1
                seperator.label.TextXAlignment = Enum.TextXAlignment.Center
                updateevent.Event:Connect(function(theme)
                    seperator.label.Font = theme.font
                    seperator.label.TextSize = theme.fontsize
                end)

                local textSize = textservice:GetTextSize(seperator.text, window.theme.fontsize, window.theme.font, Vector2.new(2000, 2000))
                local textStart = seperator.main.AbsoluteSize.X / 2 - (textSize.X / 2)

                sector.LabelBackFrame = Instance.new("Frame", seperator.main)
                sector.LabelBackFrame.Name = "LabelBack"
                sector.LabelBackFrame.ZIndex = 7
                sector.LabelBackFrame.Size = UDim2.fromOffset(textSize.X + 12, 10)
                sector.LabelBackFrame.BorderSizePixel = 0
                sector.LabelBackFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                sector.LabelBackFrame.Position = UDim2.new(0, textStart - 6, 0, 0)
                updateevent.Event:Connect(function(theme)
                    textSize = textservice:GetTextSize(seperator.text, theme.fontsize, theme.font, Vector2.new(2000, 2000))
                    textStart = seperator.main.AbsoluteSize.X / 2 - (textSize.X / 2)

                    sector.LabelBackFrame.Size = UDim2.fromOffset(textSize.X + 12, 10)
                    sector.LabelBackFrame.Position = UDim2.new(0, textStart - 6, 0, 0)
                end)
                function seperator:Set(value)
                    seperator.label.Text = value
                end
                sector:FixSize()
                return seperator
            end

            return sector
        end
     

        table.insert(window.Tabs, tab)
        return tab
    end

    return window
end


	
----------------------------------------------------------------------------
if game.PlaceId == 2753915549 then
        World1 = true
    elseif game.PlaceId == 4442272183 then
        World2 = true
    elseif game.PlaceId == 7449423635 then
        World3 = true
        else
            game.Players.LocalPlayer:Kick("Game Doesnt Support Our Script")
    end
----------------------------------------------------------------------------
-- \\ Function //
function CheckQuest() 
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if World1 then
        if MyLevel == 1 or MyLevel <= 9 or SelectMonster == "Bandit [Lv. 5]" then
            Mon = "Bandit [Lv. 5]"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif MyLevel == 10 or MyLevel <= 14 or SelectMonster == "Monkey [Lv. 14]" then
            Mon = "Monkey [Lv. 14]"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif MyLevel == 15 or MyLevel <= 29 or SelectMonster == "Gorilla [Lv. 20]" then
            Mon = "Gorilla [Lv. 20]"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
        elseif MyLevel == 30 or MyLevel <= 39 or SelectMonster == "Pirate [Lv. 35]" then
            Mon = "Pirate [Lv. 35]"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif MyLevel == 40 or MyLevel <= 59 or SelectMonster == "Brute [Lv. 45]" then
            Mon = "Brute [Lv. 45]"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif MyLevel == 60 or MyLevel <= 74 or SelectMonster == "Desert Bandit [Lv. 60]" then
            Mon = "Desert Bandit [Lv. 60]"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif MyLevel == 75 or MyLevel <= 89 or SelectMonster == "Desert Officer [Lv. 70]" then
            Mon = "Desert Officer [Lv. 70]"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif MyLevel == 90 or MyLevel <= 99 or SelectMonster == "Snow Bandit [Lv. 90]" then
            Mon = "Snow Bandit [Lv. 90]"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif MyLevel == 100 or MyLevel <= 119 or SelectMonster == "Snowman [Lv. 100]" then
            Mon = "Snowman [Lv. 100]"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif MyLevel == 120 or MyLevel <= 149 or SelectMonster == "Chief Petty Officer [Lv. 120]" then
            Mon = "Chief Petty Officer [Lv. 120]"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif MyLevel == 150 or MyLevel <= 174 or SelectMonster == "Sky Bandit [Lv. 150]" then
            Mon = "Sky Bandit [Lv. 150]"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif MyLevel == 175 or MyLevel <= 189 or SelectMonster == "Dark Master [Lv. 175]" then
            Mon = "Dark Master [Lv. 175]"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif MyLevel == 190 or MyLevel <= 209 or SelectMonster == "Prisoner [Lv. 190]" then
            Mon = "Prisoner [Lv. 190]"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
        elseif MyLevel == 210 or MyLevel <= 249 or SelectMonster == "Dangerous Prisoner [Lv. 210]" then
            Mon = "Dangerous Prisoner [Lv. 210]"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
        elseif MyLevel == 250 or MyLevel <= 274 or SelectMonster == "Toga Warrior [Lv. 250]" then
            Mon = "Toga Warrior [Lv. 250]"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif MyLevel == 275 or MyLevel <= 299 or SelectMonster == "Gladiator [Lv. 275]" then
            Mon = "Gladiator [Lv. 275]"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
        elseif MyLevel == 300 or MyLevel <= 324 or SelectMonster == "Military Soldier [Lv. 300]" then
            Mon = "Military Soldier [Lv. 300]"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
        elseif MyLevel == 325 or MyLevel <= 374 or SelectMonster == "Military Spy [Lv. 325]" then
            Mon = "Military Spy [Lv. 325]"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5984.0532226563, 82.14656829834, 8753.326171875)
        elseif MyLevel == 375 or MyLevel <= 399 or SelectMonster == "Fishman Warrior [Lv. 375]" then
            Mon = "Fishman Warrior [Lv. 375]"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
            if getgenv().Settings["Auto Farm Level"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel == 400 or MyLevel <= 449 or SelectMonster == "Fishman Commando [Lv. 400]" then
            Mon = "Fishman Commando [Lv. 400]"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
            if getgenv().Settings["Auto Farm Level"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel == 450 or MyLevel <= 474 or SelectMonster == "God's Guard [Lv. 450]" then
            Mon = "God's Guard [Lv. 450]"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
            if getgenv().Settings["Auto Farm Level"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif MyLevel == 475 or MyLevel <= 524 or SelectMonster == "Shanda [Lv. 475]" then
            Mon = "Shanda [Lv. 475]"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
            if getgenv().Settings["Auto Farm Level"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif MyLevel == 525 or MyLevel <= 549 or SelectMonster == "Royal Squad [Lv. 525]" then
            Mon = "Royal Squad [Lv. 525]"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif MyLevel == 550 or MyLevel <= 624 or SelectMonster == "Royal Soldier [Lv. 550]" then
            Mon = "Royal Soldier [Lv. 550]"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif MyLevel == 625 or MyLevel <= 649 or SelectMonster == "Galley Pirate [Lv. 625]" then
            Mon = "Galley Pirate [Lv. 625]"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif MyLevel >= 650 or SelectMonster == "Galley Captain [Lv. 650]" then
            Mon = "Galley Captain [Lv. 650]"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    elseif World2 then
        if MyLevel == 700 or MyLevel <= 724 or SelectMonster == "Raider [Lv. 700]" then
            Mon = "Raider [Lv. 700]"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif MyLevel == 725 or MyLevel <= 774 or SelectMonster == "Mercenary [Lv. 725]" then
            Mon = "Mercenary [Lv. 725]"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
        elseif MyLevel == 775 or MyLevel <= 799 or SelectMonster == "Swan Pirate [Lv. 775]" then
            Mon = "Swan Pirate [Lv. 775]"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif MyLevel == 800 or MyLevel <= 874 or SelectMonster == "Factory Staff [Lv. 800]" then
            Mon = "Factory Staff [Lv. 800]"
            NameQuest = "Area2Quest"
            LevelQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
        elseif MyLevel == 875 or MyLevel <= 899 or SelectMonster == "Marine Lieutenant [Lv. 875]" then
            Mon = "Marine Lieutenant [Lv. 875]"
            LevelQuest = 1
            NameQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
        elseif MyLevel == 900 or MyLevel <= 949 or SelectMonster == "Marine Captain [Lv. 900]" then
            Mon = "Marine Captain [Lv. 900]"
            LevelQuest = 2
            NameQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
        elseif MyLevel == 950 or MyLevel <= 974 or SelectMonster == "Zombie [Lv. 950]" then
            Mon = "Zombie [Lv. 950]"
            LevelQuest = 1
            NameQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif MyLevel == 975 or MyLevel <= 999 or SelectMonster == "Vampire [Lv. 975]" then
            Mon = "Vampire [Lv. 975]"
            LevelQuest = 2
            NameQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
        elseif MyLevel == 1000 or MyLevel <= 1049 or SelectMonster == "Snow Trooper [Lv. 1000]" then
            Mon = "Snow Trooper [Lv. 1000]"
            LevelQuest = 1
            NameQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif MyLevel == 1050 or MyLevel <= 1099 or SelectMonster == "Winter Warrior [Lv. 1050]" then
            Mon = "Winter Warrior [Lv. 1050]"
            LevelQuest = 2
            NameQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif MyLevel == 1100 or MyLevel <= 1124 or SelectMonster == "Lab Subordinate [Lv. 1100]" then
            Mon = "Lab Subordinate [Lv. 1100]"
            LevelQuest = 1
            NameQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
        elseif MyLevel == 1125 or MyLevel <= 1174 or SelectMonster == "Horned Warrior [Lv. 1125]" then
            Mon = "Horned Warrior [Lv. 1125]"
            LevelQuest = 2
            NameQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
        elseif MyLevel == 1175 or MyLevel <= 1199 or SelectMonster == "Magma Ninja [Lv. 1175]" then
            Mon = "Magma Ninja [Lv. 1175]"
            LevelQuest = 1
            NameQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif MyLevel == 1200 or MyLevel <= 1249 or SelectMonster == "Lava Pirate [Lv. 1200]" then
            Mon = "Lava Pirate [Lv. 1200]"
            LevelQuest = 2
            NameQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif MyLevel == 1250 or MyLevel <= 1274 or SelectMonster == "Ship Deckhand [Lv. 1250]" then
            Mon = "Ship Deckhand [Lv. 1250]"
            LevelQuest = 1
            NameQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if getgenv().Settings["Auto Farm Level"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1275 or MyLevel <= 1299 or SelectMonster == "Ship Engineer [Lv. 1275]" then
            Mon = "Ship Engineer [Lv. 1275]"
            LevelQuest = 2
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
            if getgenv().Settings["Auto Farm Level"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end             
        elseif MyLevel == 1300 or MyLevel <= 1324 or SelectMonster == "Ship Steward [Lv. 1300]" then
            Mon = "Ship Steward [Lv. 1300]"
            LevelQuest = 1
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            if getgenv().Settings["Auto Farm Level"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1325 or MyLevel <= 1349 or SelectMonster == "Ship Officer [Lv. 1325]" then
            Mon = "Ship Officer [Lv. 1325]"
            LevelQuest = 2
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            if getgenv().Settings["Auto Farm Level"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1350 or MyLevel <= 1374 or SelectMonster == "Arctic Warrior [Lv. 1350]" then
            Mon = "Arctic Warrior [Lv. 1350]"
            LevelQuest = 1
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
            if getgenv().Settings["Auto Farm Level"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
            end
        elseif MyLevel == 1375 or MyLevel <= 1424 or SelectMonster == "Snow Lurker [Lv. 1375]" then
            Mon = "Snow Lurker [Lv. 1375]"
            LevelQuest = 2
            NameQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif MyLevel == 1425 or MyLevel <= 1449 or SelectMonster == "Sea Soldier [Lv. 1425]" then
            Mon = "Sea Soldier [Lv. 1425]"
            LevelQuest = 1
            NameQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif MyLevel >= 1450 or SelectMonster == "Water Fighter [Lv. 1450]" then
            Mon = "Water Fighter [Lv. 1450]"
            LevelQuest = 2
            NameQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
        end
    elseif World3 then
        if MyLevel == 1500 or MyLevel <= 1524 or SelectMonster == "Pirate Millionaire [Lv. 1500]" then
            Mon = "Pirate Millionaire [Lv. 1500]"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
        elseif MyLevel == 1525 or MyLevel <= 1574 or SelectMonster == "Pistol Billionaire [Lv. 1525]" then
            Mon = "Pistol Billionaire [Lv. 1525]"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
        elseif MyLevel == 1575 or MyLevel <= 1599 or SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then
            Mon = "Dragon Crew Warrior [Lv. 1575]"
            LevelQuest = 1
            NameQuest = "AmazonQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
            CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
        elseif MyLevel == 1600 or MyLevel <= 1624 or SelectMonster == "Dragon Crew Archer [Lv. 1600]" then 
            Mon = "Dragon Crew Archer [Lv. 1600]"
            NameQuest = "AmazonQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
        elseif MyLevel == 1625 or MyLevel <= 1649 or SelectMonster == "Female Islander [Lv. 1625]" then
            Mon = "Female Islander [Lv. 1625]"
            NameQuest = "AmazonQuest2"
            LevelQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
        elseif MyLevel == 1650 or MyLevel <= 1699 or SelectMonster == "Giant Islander [Lv. 1650]" then 
            Mon = "Giant Islander [Lv. 1650]"
            NameQuest = "AmazonQuest2"
            LevelQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
        elseif MyLevel == 1700 or MyLevel <= 1724 or SelectMonster == "Marine Commodore [Lv. 1700]" then
            Mon = "Marine Commodore [Lv. 1700]"
            LevelQuest = 1
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
        elseif MyLevel == 1725 or MyLevel <= 1774 or SelectMonster == "Marine Rear Admiral [Lv. 1725]" then
            Mon = "Marine Rear Admiral [Lv. 1725]"
            NameMon = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            LevelQuest = 2
            CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
        elseif MyLevel == 1775 or MyLevel <= 1799 or SelectMonster == "Fishman Raider [Lv. 1775]" then
            Mon = "Fishman Raider [Lv. 1775]"
            LevelQuest = 1
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
        elseif MyLevel == 1800 or MyLevel <= 1824 or SelectMonster == "Fishman Captain [Lv. 1800]" then
            Mon = "Fishman Captain [Lv. 1800]"
            LevelQuest = 2
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)  
            CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125) 
        elseif MyLevel == 1825 or MyLevel <= 1849 or SelectMonster == "Forest Pirate [Lv. 1825]" then
            Mon = "Forest Pirate [Lv. 1825]"
            LevelQuest = 1
            NameQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
            CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
        elseif MyLevel == 1850 or MyLevel <= 1899 or SelectMonster == "Mythological Pirate [Lv. 1850]" then
            Mon = "Mythological Pirate [Lv. 1850]"
            LevelQuest = 2
            NameQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
            CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)   
        elseif MyLevel == 1900 or MyLevel <= 1924 or SelectMonster == "Jungle Pirate [Lv. 1900]" then
            Mon = "Jungle Pirate [Lv. 1900]"
            LevelQuest = 1
            NameQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
        elseif MyLevel == 1925 or MyLevel <= 1974 or SelectMonster == "Musketeer Pirate [Lv. 1925]" then
            Mon = "Musketeer Pirate [Lv. 1925]"
            LevelQuest = 2
            NameQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
        elseif MyLevel == 1975 or MyLevel <= 1999 or SelectMonster == "Reborn Skeleton [Lv. 1975]" then
            Mon = "Reborn Skeleton [Lv. 1975]"
            LevelQuest = 1
            NameQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif MyLevel == 2000 or MyLevel <= 2024 or SelectMonster == "Living Zombie [Lv. 2000]" then
            Mon = "Living Zombie [Lv. 2000]"
            LevelQuest = 2
            NameQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)	
        elseif MyLevel == 2025 or MyLevel <= 2049 or SelectMonster == "Demonic Soul [Lv. 2025]" then
            Mon = "Demonic Soul [Lv. 2025]"
            LevelQuest = 1
            NameQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
            CFrameMon = CFrame.new(-9709.30762, 204.695892, 6044.04688, -0.845798075, -3.4587876e-07, -0.533503294, -4.46235369e-08, 1, -5.77571257e-07, 0.533503294, -4.64701827e-07, -0.845798075)
        elseif MyLevel == 2050 or MyLevel <= 2074 or SelectMonster == "Posessed Mummy [Lv. 2050]" then
            Mon = "Posessed Mummy [Lv. 2050]"
            LevelQuest = 2
            NameQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-9554.11035, 65.6141663, 6041.73584, -0.877069294, 5.33355795e-08, -0.480364174, 2.06420765e-08, 1, 7.33423562e-08, 0.480364174, 5.44105987e-08, -0.877069294)
        elseif MyLevel == 2075 or MyLevel <= 2099 or SelectMonster == "Peanut Scout [Lv. 2075]" then
            Mon = "Peanut Scout [Lv. 2075]"
            LevelQuest = 1
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-2126.47998, 192.095154, -10204.6553, 0.0779861137, -9.29044361e-08, 0.996954441, 6.59006432e-08, 1, 8.80332109e-08, -0.996954441, 5.88345728e-08, 0.0779861137)
        elseif MyLevel == 2100 or MyLevel <= 2124 or SelectMonster == "Peanut President [Lv. 2100]" then
            Mon = "Peanut President [Lv. 2100]"
            LevelQuest = 2
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-2126.47998, 192.095154, -10204.6553, 0.0779861137, -9.29044361e-08, 0.996954441, 6.59006432e-08, 1, 8.80332109e-08, -0.996954441, 5.88345728e-08, 0.0779861137)
        elseif MyLevel == 2125 or MyLevel <= 2149 or SelectMonster == "Ice Cream Chef [Lv. 2125]" then
            Mon = "Ice Cream Chef [Lv. 2125]"
            LevelQuest = 1
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
        elseif MyLevel == 2150 or MyLevel <= 2199 or SelectMonster == "Ice Cream Commander [Lv. 2150]" then
            Mon = "Ice Cream Commander [Lv. 2150]"
            LevelQuest = 2
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, -0, -0.997525156, -0, 1.00000012, -0, 0.997525275, 0, -0.0703101456)
        elseif MyLevel == 2200 or MyLevel <= 2224 or SelectMonster == "Cookie Crafter [Lv. 2200]" then
            Mon = "Cookie Crafter [Lv. 2200]"
            LevelQuest = 1
            NameQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
        elseif MyLevel == 2225 or MyLevel <= 2249 or SelectMonster == "Cake Guard [Lv. 2225]" then
            Mon = "Cake Guard [Lv. 2225]"
            LevelQuest = 2
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
        elseif MyLevel == 2250 or MyLevel <= 2274 or SelectMonster == "Baking Staff [Lv. 2250]" then
            Mon = "Baking Staff [Lv. 2250]"
            LevelQuest = 1
            NameQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
        elseif MyLevel >= 2275 or SelectMonster == "Head Baker [Lv. 2275]" then 
            Mon = "Head Baker [Lv. 2275]"
            LevelQuest = 2
            NameQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-2288.795166015625, 106.9419174194336, -12811.111328125)
        end
    end
end

function isnil(thing)
        return (thing == nil)
    end
    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end
    Number = math.random(1, 1000000)
    function UpdateEspPlayer()
        if ESPPlayer then
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if not isnil(v.Character) then
                    if not v.Character.Head:FindFirstChild('NameEsp'..v.Name) then
                        local BillboardGui = Instance.new("BillboardGui")
                        local ESP = Instance.new("TextLabel")
                        local HealthESP = Instance.new("TextLabel")
                        BillboardGui.Parent = v.Character.Head
                        BillboardGui.Name = 'NameEsp'..v.Name
                        BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        BillboardGui.Size = UDim2.new(1,200,1,30)
                        BillboardGui.Adornee = v.Character.Head
                        BillboardGui.AlwaysOnTop = true
                        ESP.Name = "ESP"
                        ESP.Parent = BillboardGui
                        ESP.TextTransparency = 0
                        ESP.BackgroundTransparency = 1
                        ESP.Size = UDim2.new(0, 200, 0, 30)
                        ESP.Position = UDim2.new(0,25,0,0)
                        ESP.Font = Enum.Font.Gotham
                        ESP.Text = (v.Name ..' '.."[ "..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M'.." ]")
                        if v.Team == game:GetService("Players").LocalPlayer.Team then
                            ESP.TextColor3 = Color3.new(0, 255, 255)
                        else
                            ESP.TextColor3 = Color3.new(255, 0, 0)
                        end
                        ESP.TextSize = 14
                        ESP.TextStrokeTransparency = 0.500
                        ESP.TextWrapped = true
                        HealthESP.Name = "HealthESP"
                        HealthESP.Parent = ESP
                        HealthESP.TextTransparency = 0
                        HealthESP.BackgroundTransparency = 1
                        HealthESP.Position = ESP.Position + UDim2.new(0, -25, 0, 15)
                        HealthESP.Size = UDim2.new(0, 200, 0, 30)
                        HealthESP.Font = Enum.Font.Gotham
                        HealthESP.TextColor3 = Color3.fromRGB(255, 0, 0)
                        HealthESP.TextSize = 14
                        HealthESP.TextStrokeTransparency = 0.500
                        HealthESP.TextWrapped = true
                        HealthESP.Text = "Health "..math.floor(v.Character.Humanoid.Health).."/"..math.floor(v.Character.Humanoid.MaxHealth)
                    else
                        v.Character.Head['NameEsp'..v.Name].ESP.Text = (v.Name ..' '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                        v.Character.Head['NameEsp'..v.Name].ESP.HealthESP.Text = "Health "..math.floor(v.Character.Humanoid.Health).."/"..math.floor(v.Character.Humanoid.MaxHealth)
                        v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.TextTransparency = 0
                        v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.HealthESP.TextTransparency = 0
                    end
                end
            end
        else
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Character.Head:FindFirstChild('NameEsp'..v.Name) then
                    v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.TextTransparency = 1
                    v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.HealthESP.TextTransparency = 1
                end
            end
        end     
    end
    
    function UpdateIslandESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then 
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end
    
    function UpdateChestEsp() 
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            pcall(function()
                if string.find(v.Name,"Chest") then
                    if ChestESP then
                        if string.find(v.Name,"Chest") then
                            if not v:FindFirstChild('NameEsp'..Number) then
                                local bill = Instance.new('BillboardGui',v)
                                bill.Name = 'NameEsp'..Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1,200,1,30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new('TextLabel',bill)
                                name.Font = "GothamBold"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1,0,1,0)
                                name.TextYAlignment = 'Top'
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                --name.TextColor3 = Color3.fromRGB(0, 255, 255)
                            if v.Name == "Chest1" then
                                name.Text = ("Silver Chest" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                                name.TextColor3 = Color3.fromRGB(192, 192, 192)  
                            end
                            if v.Name == "Chest2" then
                                name.Text = ("Gold Chest" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                                name.TextColor3 = Color3.fromRGB(255,215,0)
                            end
                        if v.Name == "Chest3" then
                            name.Text = ("Platinum Chest" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            name.TextColor3 = Color3.fromRGB(0, 170, 204)
                        end
                        else
                            v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
                end
            end)
        end
    end
    
    function UpdateBfEsp() 
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            pcall(function()
                if DevilFruitESP then
                    if string.find(v.Name, "Fruit") then   
                        if not v.Handle:FindFirstChild('NameEsp'..Number) then
                            local bill = Instance.new('BillboardGui',v.Handle)
                            bill.Name = 'NameEsp'..Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v.Handle
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                            name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                        else
                            v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v.Handle:FindFirstChild('NameEsp'..Number) then
                        v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                        end
                end
            end)
        end
    end
    
    function UpdateFlowerEsp() 
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            pcall(function()
                if v.Name == "Flower2" or v.Name == "Flower1" then
                    if FlowerESP then 
                        if not v:FindFirstChild('NameEsp'..Number) then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'..Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if v.Name == "Flower1" then 
                            name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            name.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if v.Name == "Flower2" then
                            name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                    else
                        if v:FindFirstChild('NameEsp'..Number) then
                            v:FindFirstChild('NameEsp'..Number):Destroy()
                        end
                    end
                end   
            end)
        end
    end
    
    
    local LocalPlayer = game:GetService'Players'.LocalPlayer
    local originalstam = LocalPlayer.Character.Energy.Value
    function infinitestam()
        LocalPlayer.Character.Energy.Changed:connect(function()
            if getgenv().Settings["Inf Energy"] then
                LocalPlayer.Character.Energy.Value = originalstam
            end 
        end)
    end
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if getgenv().Settings["Inf Energy"] then
                    wait(0.3)
                    originalstam = LocalPlayer.Character.Energy.Value
                    infinitestam()
                end
            end
        end)
    end)
    
    function NoDodgeCool()
        if _G.NoDodgeCD then
            for i,v in next, getgc() do
                if game:GetService("Players").LocalPlayer.Character.Dodge then
                    if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Dodge then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(v2) == "0.4" then
                            repeat wait(.1)
                                setupvalue(v,i2,0)
                            until not _G.NoDodgeCD
                            end
                        end
                    end
                end
            end
        end
    end
    
    function fly()
        local mouse=game:GetService("Players").LocalPlayer:GetMouse''
        localplayer=game:GetService("Players").LocalPlayer
        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        local speedSET=25
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                    wait()
                    localplayer.Character.Humanoid.PlatformStand=true
                    local new=gyro.CFrame - gyro.CFrame.p + pos.position
                    if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=1
                    end
                    if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+speedSET
                    end
                    if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+speedSET
                    end
                    if speed>speedSET then
                    speed=speedSET
                    end
                    pos.position=new.p
                    if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                    elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                    else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
            until not Fly
            if gyro then 
                    gyro:Destroy() 
            end
            if pos then 
                    pos:Destroy() 
            end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=0
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then 
                    flying=false e1:disconnect() e2:disconnect() return 
            end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start()
    end

function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end   

 
function Click()
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(.1)
        _G.NotAutoEquip = false
    end
end

function EquipWeapon(ToolSe)
    if not _G.NotAutoEquip then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
        end
    end
end

function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
    if Distance <= 250 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
        tween:Cancel()
        _G.Clip = false
    end
end

function GetDistance(target)
    return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
end

function TP(Pos)
    Distance = (Pos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 250 then
        Speed = 600
    elseif Distance >= 1000 then
        Speed = 200
    end
    game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
    _G.Clip = true
    wait(Distance/Speed)
    _G.Clip = false
end

spawn(function()
    pcall(function()
        while wait() do
            if getgenv().Settings["Farm Fast Level"] or getgenv().Settings["All Boss"] or getgenv().Settings["Auto Farm Nearest"] or getgenv().Settings["Auto Farm Observation V2"] or _G.AutoFactory or _G.AutoAdvanceDungeon or getgenv().Settings["Auto Katakuri"] or _G.Auto_DungeonMobAura or _G.AutoFarmChest or getgenv().Settings["Auto Hallow"] or getgenv().Settings["Auto Black Beard"] or getgenv().Settings["Auto Swan Glasses"] or _G.AutoLongSword or _G.AutoBlackSpikeycoat or getgenv().Settings["Auto Electric Claw"] or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or getgenv().Settings["Auto Farm Boss"] or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or getgenv().Settings["Auto Saber"] or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.AutoFarmSelectMonster or _G.TeleportNPC or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or getgenv().Settings["Auto Farm Observation"] or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or getgenv().Settings["Auto Farm Observation"] or getgenv().Settings["Auto Dark Dagger"] or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or getgenv().Settings["Auto Farm All Boss"] or _G.Auto_Bounty or getgenv().Settings["Auto Sharkman Karate"] or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or getgenv().Settings["Auto Pole V1"] or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or getgenv().Settings["Auto Farm Bounty"] or _G.Holy_Torch or getgenv().Settings["Auto Farm Level"] or _G.Clip or FarmBoss or getgenv().Settings["Elite Hunter"] or _G.AutoThirdSea or getgenv().Settings["Auto Farm Bone"] or getgenv().Settings["Auto Chest"]  == true then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().Settings["Farm Fast Level"] or getgenv().Settings["All Boss"] or getgenv().Settings["Auto Farm Nearest"] or getgenv().Settings["Auto Farm Observation V2"] or _G.AutoFactory or _G.AutoAdvanceDungeon or getgenv().Settings["Auto Katakuri"] or _G.Auto_DungeonMobAura or _G.AutoFarmChest or getgenv().Settings["Auto Hallow"] or getgenv().Settings["Auto Black Beard"] or  getgenv().Settings["Auto Swan Glasses"] or _G.AutoLongSword or _G.AutoBlackSpikeycoat or getgenv().Settings["Auto Electric Claw"] or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or getgenv().Settings["Auto Farm Boss"] or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or getgenv().Settings["Auto Saber"] or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.AutoFarmSelectMonster or _G.TeleportNPC or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or getgenv().Settings["Auto Farm Observation"] or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or getgenv().Settings["Auto Farm Observation"] or getgenv().Settings["Auto Dark Dagger"] or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or getgenv().Settings["Auto Farm All Boss"] or _G.Auto_Bounty or getgenv().Settings["Auto Sharkman Karate"] or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or getgenv().Settings["Auto Pole V1"] or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or getgenv().Settings["Auto Farm Bounty"] or _G.Holy_Torch or getgenv().Settings["Auto Farm Level"] or _G.Clip or getgenv().Settings["Elite Hunter"] or _G.AutoThirdSea or getgenv().Settings["Auto Farm Bone"] or getgenv().Settings["Auto Chest"] == true then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

spawn(function()
    while wait() do
        if getgenv().Settings["Auto Farm Observation V2"] or getgenv().Settings["Auto Katakuri"] or _G.Auto_DungeonMobAura or _G.AutoFarmChest or getgenv().Settings["Auto Hallow"] or getgenv().Settings["Auto Black Beard"] or getgenv().Settings["Auto Swan Glasses"] or _G.AutoLongSword or _G.AutoBlackSpikeycoat or getgenv().Settings["Auto Electric Claw"] or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or getgenv().Settings["Auto Farm Boss"] or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or getgenv().Settings["Auto Saber"] or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.AutoFarmSelectMonster or _G.TeleportNPC or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or getgenv().Settings["Auto Farm Observation"] or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or getgenv().Settings["Auto Farm Observation"] or getgenv().Settings["Auto Dark Dagger"] or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or getgenv().Settings["Auto Farm All Boss"] or _G.Auto_Bounty or getgenv().Settings["Auto Sharkman Karate"] or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or getgenv().Settings["Auto Pole V1"] or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or getgenv().Settings["Auto Farm Level"] or _G.Clip or getgenv().Settings["Elite Hunter"] or _G.AutoThirdSea or getgenv().Settings["Auto Farm Bone"] or getgenv().Settings["Auto Chest"] == true then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
            end)
        end    
    end
end)

spawn(function()
game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().Settings["Farm Fast Level"] or getgenv().Settings["All Boss"] or _G.AutoFarmFruitMastery or getgenv().Settings["Auto Farm Nearest"] or getgenv().Settings["Auto Farm Observation V2"] or _G.AutoFactory or _G.AutoAdvanceDungeon or getgenv().Settings["Auto Katakuri"] or _G.Auto_DungeonMobAura or _G.AutoFarmChest or getgenv().Settings["Auto Black Beard"] or getgenv().Settings["Auto Hallow"] or getgenv().Settings["Auto Swan Glasses"] or _G.AutoLongSword or _G.AutoBlackSpikeycoat or getgenv().Settings["Auto Electric Claw"] or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or getgenv().Settings["Auto Farm Boss"] or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or getgenv().Settings["Auto Saber"]  or _G.AutoFarmGunMastery or _G.AutoFarmSelectMonster or _G.TeleportNPC or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or getgenv().Settings["Auto Farm Observation"] or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or getgenv().Settings["Auto Farm Observation"] or getgenv().Settings["Auto Dark Dagger"] or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or getgenv().Settings["Auto Farm All Boss"] or _G.Auto_Bounty or getgenv().Settings["Auto Sharkman Karate"] or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or getgenv().Settings["Auto Pole V1"] or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.AutoFarmSelectMonster or _G.TeleportNPC or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or getgenv().Settings["Auto Farm Bounty"] or _G.Holy_Torch or getgenv().Settings["Auto Farm Level"] or _G.Clip or FarmBoss or getgenv().Settings["Elite Hunter"] or _G.AutoThirdSea or getgenv().Settings["Auto Farm Bone"] or getgenv().Settings["Auto Chest"] == true then
        if not game:GetService("Workspace"):FindFirstChild("LOL") then
            local LOL = Instance.new("Part")
            LOL.Name = "LOL"
            LOL.Parent = game.Workspace
            LOL.Anchored = true
            LOL.Transparency = 1
            LOL.Size = Vector3.new(30,-0.5,30)
        elseif game:GetService("Workspace"):FindFirstChild("LOL") then
            game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
        end
    else
        if game:GetService("Workspace"):FindFirstChild("LOL") then
            game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
        end
    end
end)
end)

function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
end

spawn(function()
    pcall(function()
        while wait() do
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                if v:IsA("Tool") then
                    if v:FindFirstChild("RemoteFunctionShoot") then 
                        SelectWeaponGun = v.Name
                    end
                end
            end
        end
    end)
end)

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

spawn(function()
        while task.wait() do
            pcall(function()
                if _G.BringMonster then
                    CheckQuest()
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if getgenv().Settings["Auto Farm Level"] and StartMagnet and v.Name == Mon and (Mon == "Factory Staff [Lv. 800]" or Mon == "Monkey [Lv. 14]" or Mon == "Dragon Crew Warrior [Lv. 1575]" or Mon == "Dragon Crew Archer [Lv. 1600]") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        elseif getgenv().Settings["Auto Farm Level"] and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 275 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        end
                        
                        if getgenv().Settings["Farm Fast Level"] and FastMagnet and v.Name == Mon and (Mon == "Factory Staff [Lv. 800]" or Mon == "Monkey [Lv. 14]" or Mon == "Dragon Crew Warrior [Lv. 1575]" or Mon == "Dragon Crew Archer [Lv. 1600]") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosFast
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        elseif getgenv().Settings["Farm Fast Level"] and FastMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 275 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosFast
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        end
                        
                        if _G.AutoEctoplasm and StartEctoplasmMagnet then
                            if string.find(v.Name, "Ship") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - EctoplasmMon.Position).Magnitude <= 250 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.HumanoidRootPart.CFrame = EctoplasmMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoFarmSelectMonster then
					if v.Name == Mon and (v.HumanoidRootPart.Position - PosMonSelectMonster.Position).Magnitude <= 400 then
						v.Head.CanCollide = false
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
						v.HumanoidRootPart.CFrame = PosMonSelectMonster
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
					end
					end
                        if _G.AutoRengoku and StartRengokuMagnet then
                            if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and (v.HumanoidRootPart.Position - RengokuMon.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = RengokuMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoMusketeerHat and StartMagnetMusketeerhat then
                            if v.Name == "Forest Pirate [Lv. 1825]" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = MusketeerHatMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.Auto_EvoRace and StartEvoMagnet then
                            if v.Name == "Zombie [Lv. 950]" and (v.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonEvo
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoBartilo and AutoBartiloBring then
                            if v.Name == "Swan Pirate [Lv. 775]" and (v.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonBarto
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoLawRaid and StartLawMagnet then
                            if v.Name == "Order [Lv. 1250] [Raid Boss]" and (v.HumanoidRootPart.Position - LawMon.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = LawMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoFarmFruitMastery and StartMasteryFruitMagnet then
                            if v.Name == "Monkey [Lv. 14]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == "Factory Staff [Lv. 800]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == Mon then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                        if _G.AutoFarmGunMastery and StartMasteryGunMagnet then
                            if v.Name == "Monkey [Lv. 14]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == "Factory Staff [Lv. 800]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            elseif v.Name == Mon then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                        if getgenv().Settings["Auto Farm Bone"] and StartMagnetBoneMon then
                            if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonBone
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if getgenv().Settings["Auto Katakuri"] and MagnetDought then
                            if (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoCandy and StartMagnetCandy then
                            if (v.HumanoidRootPart.Position - PosMonCandy.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonCandy
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                    end
                end
            end)
        end
end)

local ScreenGui = Instance.new("ScreenGui")
    local Toggless = Instance.new("TextButton")
    
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui

    Toggless.Name = "Toggless"
    Toggless.Parent = ScreenGui
    Toggless.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Toggless.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggless.Size = UDim2.new(0, 50, 0, 50)
    Toggless.Font = Enum.Font.DenkOne
    Toggless.Text = "HIDE"
    Toggless.TextColor3 = Color3.fromRGB(0, 225,225)
    Toggless.TextScaled = true
    Toggless.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
    end)

repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
 
local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')
 
po.ChildAdded:connect(function(a)
    if a.Name == 'ErrorPrompt' then
        repeat
            ts:Teleport(game.PlaceId)
            wait(2)
        until false
    end
end)

----------------------------------------------------------------------------
-- \\ Window //
local window = library:CreateWindow("THUNDER Z | BLOX FRUIT           [Right Control]",RightControl)
----------------------------------------------------------------------------
-- \\ Tab //
local Main = window:CreateTab("Main")
local Combats = window:CreateTab("Combat - Stats")
--local Statss = window:CreateTab("Stats")
local Teleports = window:CreateTab("Teleport")
local Dungeons = window:CreateTab("Dungeon")
local DFs = window:CreateTab("Fruit")
local Shops = window:CreateTab("Shop")
local Miscs = window:CreateTab("Misc")
----------------------------------------------------------------------------
-- \\ Sector //
--[ \\ Auto Farm // ]
local AutoFarm = Main:CreateSector("// Auto Farm //" , "left") -- ("left/right")
local AutoFarmSetting = Main:CreateSector("// Settings - Credits //" , "right")
local Auto = Main:CreateSector("// Auto Fighting Styles //" , "left")
local Auto2 = Main:CreateSector("// Auto Mastery //" , "right")
local Auto3 = Main:CreateSector("// Auto Boss - Drops //" , "left")
local Auto4 = Main:CreateSector("// Misc //" , "right")
local Combat = Combats:CreateSector("// Combat //" , "left")
local Bounti = Combats:CreateSector("// Bounty //" , "right")
local Stats = Combats:CreateSector("// Stats //" , "right")
local Teleport = Teleports:CreateSector("// TP Island - NPC //" , "left")
local Teleport2 = Teleports:CreateSector("// TP World - SB //" , "right")
local Dungeon = Dungeons:CreateSector("// Manual Raid //" , "left")
local Dungeon2 = Dungeons:CreateSector("// Auto Raid //" , "right")
local LawRaid = Dungeons:CreateSector("// Law Raid //" , "left")
local DevilFruito = DFs:CreateSector("// Devil Fruit Snipe //" , "left")
local DevilFruitoa = DFs:CreateSector("// Other //" , "right")
local Shop = Shops:CreateSector("// Races - Stats //" , "left")
local Shop2 = Shops:CreateSector("// Fighting Styles //" , "right")
local Shop3 = Shops:CreateSector("// Swords //" , "left")
local Shop4 = Shops:CreateSector("// Guns //" , "right")
local Shop5 = Shops:CreateSector("// Abilitys //" , "left")
local Shop6 = Shops:CreateSector("// Accessories //" , "right")
local Misc = Miscs:CreateSector("// Server - ESP //" , "left")
local Misc2 = Miscs:CreateSector("// Local Player //" , "right")
local Misc3 = Miscs:CreateSector("// Boost - Codes //" , "left")
local Misc4 = Miscs:CreateSector("// Haki - Grapic //" , "right")
local Misc5 = Miscs:CreateSector("// Ui //" , "left")
local Misc6 = Miscs:CreateSector("// Teams //" , "right")
local Misc7 = Miscs:CreateSector("// Features //" , "right")

----------------------------------------------------------------------------
-- \\ Button , Toggle and ETC! //
AutoFarm:AddSeperator(" / Auto Farm \\ ")
AutoFarm:AddToggle("Auto Farm Level" , getgenv().Settings["Auto Farm Level"] , function(value)
  -- if getgenv().Settings["Select Weapon"] == "" then
          --  DiscordLib:Notification("Thunder Z","Select Weapon First !", 3)
          --  else
		getgenv().Settings["Auto Farm Level"] = value
		SelectMonster = ""
        if value == false
        then
        StopTween(getgenv().Settings["Auto Farm Level"])
       -- end
        end
        Save()
end)

AutoFarm:AddToggle("Fast Farm Level" , getgenv().Settings["Farm Fast Level"] , function(value)
    getgenv().Settings["Farm Fast Level"] = value
		SelectMonster = ""
        if value == false
        then
        StopTween(getgenv().Settings["Farm Fast Level"])
        end
        Save()
    end)

spawn(function()
while wait() do
    if getgenv().Settings["Farm Fast Level"] then
        local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            --game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
            Usefastattack = false 
            StartMagnet = false
            CheckQuest()
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 400 then
                --print("Asu")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                --game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
           else
               --if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 1 then
               -- print("Tot")
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
                --game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                wait(0.2)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
              --  end
            end
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            pcall(function()
                CheckQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == Mon and v:FindFirstChild("Humanoid") then
                            if v.Humanoid.Health > 0 then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            EquipWeapon(getgenv().Settings["Select Weapon"])
                                            AutoHaki()
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
                                            PosFast = v.HumanoidRootPart.CFrame
                                            Usefastattack = true 
                                            FastMagnet = true
                                        else
                                            Usefastattack = false 
                                            FastMagnet = false  
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    else
                                        Usefastattack = false 
                                        FastMagnet = false
                                        CheckQuest()
                                        topos(CFrameMon)
                                    end
                                until not v.Parent or v.Humanoid.Health <= 0 or getgenv().Settings["Farm Fast Level"] == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                else
                    Usefastattack = false 
                    StartMagnet = false
                    topos(CFrameMon)
                end
            end)
        end
    end
end
end)

spawn(function()
while wait() do
    if getgenv().Settings["Auto Farm Level"] then
        local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            Usefastattack = false 
             StartMagnet = false
            CheckQuest()
            topos(CFrameQuest)
            if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                wait(1.1)
                CheckQuest()
                if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                        wait(1.2)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                        wait(0.5)
                    
                else
                    topos(CFrameQuest)
                end
            end
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            pcall(function()
                CheckQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == Mon and v:FindFirstChild("Humanoid") then
                            if v.Humanoid.Health > 0 then
                                repeat game:GetService("RunService").Heartbeat:wait()
                                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            EquipWeapon(getgenv().Settings["Select Weapon"])
                                            AutoHaki()
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
                                            PosMon = v.HumanoidRootPart.CFrame
                                            Usefastattack = true 
                                            StartMagnet = true
                                        else
                                            Usefastattack = false 
                                            StartMagnet = false  
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    else
                                        Usefastattack = false 
                                            StartMagnet = false
                                        CheckQuest()
                                        topos(CFrameMon)
                                    end
                                until not v.Parent or v.Humanoid.Health <= 0 or getgenv().Settings["Auto Farm Level"] == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                            end
                        end
                    end
                else
                    Usefastattack = false 
                    StartMagnet = false
                    CheckQuest()
                    topos(CFrameMon)
                end
            end)
        end
    end
end
end)

    if World1 then
        AutoFarm:AddSeperator(" / Auto Sea \\")
        AutoFarm:AddToggle("Auto Second Sea Quest" , _G.AutoSecondSea , function(value)
            _G.AutoSecondSea = value
                StopTween(_G.AutoSecondSea)
        end)
        spawn(function()
            while wait() do 
                if _G.AutoSecondSea then
                    pcall(function()
                        local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
                        if MyLevel >= 700 and World1 then
                            if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 0 then
                                local CFrame1 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                                repeat topos(CFrame1) wait() until (CFrame1.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                                wait(0.5)
                                EquipWeapon("Key")
                                repeat topos(CFrame.new(1347.7124, 37.3751602, -1325.6488)) wait() until (Vector3.new(1347.7124, 37.3751602, -1325.6488)-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false
                                wait(0.5)
                            else
                                if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                                if not v.Humanoid.Health <= 0 then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        OldCFrameSecond = v.HumanoidRootPart.CFrame
                                                        repeat task.wait()
                                                            AutoHaki()
                                                            EquipWeapon(getgenv().Settings["Select Weapon"])
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.Humanoid.WalkSpeed = 0
                                                            v.Head.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                            v.HumanoidRootPart.CFrame = OldCFrameSecond
                                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                            game:GetService("VirtualUser"):CaptureController()
                                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                                        until not _G.AutoSecondSea or not v.Parent or v.Humanoid.Health <= 0
                                                    end
                                                else 
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                                end
                                            end
                                        end
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral [Lv. 700] [Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
        
if World2 then
    AutoFarm:AddToggle("Auto Farm Factory" , _G.AutoFactory , function(value)
    --    if getgenv().Settings["Select Weapon"] == "" then
          --  DiscordLib:Notification("Thunder Z","Select Weapon First !", 3)
         --   else
            _G.AutoFactory = value
            StopTween(_G.AutoFactory)
          --  end
    end)
    
    spawn(function()
            while wait() do
                pcall(function()
                    if _G.AutoFactory and World2 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Core" and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()         
                                        EquipWeapon(getgenv().Settings["Select Weapon"])           
                                        topos(CFrame.new(448.46756, 199.356781, -441.389252))                                  
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until v.Humanoid.Health <= 0 or _G.AutoFactory == false
                                end
                            end
                        else
                            topos(CFrame.new(448.46756, 199.356781, -441.389252))
                        end
                    end
                end)
            end
        end)
    
    AutoFarm:AddToggle("Auto Farm Ectoplasm",_G.AutoEctoplasm,function(value)
        _G.AutoEctoplasm = value
        StopTween(_G.AutoEctoplasm)
    end)
       
       spawn(function()
       while wait() do 
           if _G.AutoEctoplasm and World2 then
               pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") then
                       for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                           if v.Name == "Ship Deckhand [Lv. 1250]" or v.Name == "Ship Engineer [Lv. 1275]" or v.Name == "Ship Steward [Lv. 1300]" or v.Name == "Ship Officer [Lv. 1325]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                   repeat task.wait()
                                       AutoHaki()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                       v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                       StartEctoplasmMagnet = true
                                       Usefastattack = true
                                     EctoplasmMon = v.HumanoidRootPart.CFrame
                                      topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                       game:GetService("VirtualUser"):CaptureController()
                                      game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.AutoEctoplasm or not v.Parent or v.Humanoid.Health <= 0
                               end
                            end
                       end
                   else
                        StartEctoplasmMagnet = false
                        for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                            if v.Name == "Ship Deckhand [Lv. 1250]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                           elseif v.Name == "Ship Engineer [Lv. 1275]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                          elseif v.Name == "Ship Steward [Lv. 1300]" then
                              topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                            elseif v.Name == "Ship Officer [Lv. 1325]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                            end
                        end
                    end
                end)
            end
       end
end)
end
       
if World2 then
    AutoFarm:AddSeperator(" / Auto Sea \\")
    AutoFarm:AddToggle("Auto Third Sea Quest" , _G.AutoThirdSea , function(value)
        _G.AutoThirdSea = value
            StopTween(_G.AutoThirdSea)
    end)
    spawn(function()
            while wait() do
                if _G.AutoThirdSea then
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then
                            getgenv().Settings["Auto Farm Level"] = false
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Check") == 0 then
                                topos(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
                                if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                                end
                                wait(1.8)
                                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "rip_indra [Lv. 1500] [Boss]" then
                                            OldCFrameThird = v.HumanoidRootPart.CFrame
                                            repeat task.wait()
                                                AutoHaki()
                                                EquipWeapon(getgenv().Settings["Select Weapon"])
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                v.HumanoidRootPart.CFrame = OldCFrameThird
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            until _G.AutoThirdSea == false or v.Humanoid.Health <= 0 or not v.Parent
                                        end
                                    end
                                elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                                    topos(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
    
if World3 then
    AutoFarm:AddToggle("Auto Farm Bone", getgenv().Settings["Auto Farm Bone"] , function(value)
      --  if getgenv().Settings["Select Weapon"] == "" then
         --   DiscordLib:Notification("Thunder Z","Select Weapon First !", 3)
         --   else
        getgenv().Settings["Auto Farm Bone"] = value
        StopTween(getgenv().Settings["Auto Farm Bone"])
       -- end
        Save()
    end)
    AutoFarm:AddToggle("Teleport to Mirage Island",_G.AutoMysticIsland,function(value)
           _G.AutoMysticIsland = value
       end)
    
        spawn(function()
           while wait() do
               if _G.AutoMysticIsland then
                    pcall(function()
                       if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                           topos(game:GetService("Workspace").Map:FindFirstChild("MysticIsland").HumanoidRootPart.CFrame * CFrame.new(0,500,-100))
                        end
                    end)
               end
           end
        end)
        
        spawn(function()
       while wait() do 
           if getgenv().Settings["Auto Farm Bone"] and World3 then
               pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
                       for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                           if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                   repeat task.wait()
                                       AutoHaki()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                       v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                       StartMagnetBoneMon = true
                                       Usefastattack = true
                                     PosMonBone = v.HumanoidRootPart.CFrame
                                      topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                       game:GetService("VirtualUser"):CaptureController()
                                      game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not getgenv().Settings["Auto Farm Bone"] or not v.Parent or v.Humanoid.Health <= 0
                               end
                            end
                       end
                   else
                        StartMagnetBoneMon = false
                        for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                            if v.Name == "Reborn Skeleton [Lv. 1975]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                           elseif v.Name == "Living Zombie [Lv. 2000]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                          elseif v.Name == "Demonic Soul [Lv. 2025]" then
                              topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                            elseif v.Name == "Posessed Mummy [Lv. 2050]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                            end
                        end
                    end
                end)
            end
       end
        end)
        
        AutoFarm:AddToggle("Auto Random Surprise",getgenv().Settings["Auto Random Suprise"],function(value)
        getgenv().Settings["Auto Random Suprise"] = value
        Save()
    end)
    
    spawn(function()
        pcall(function()
           while wait(.1) do
               if getgenv().Settings["Auto Random Suprise"] then    
                   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
               end
            end
        end)
    end)
    else
        getgenv().Settings["Auto Farm Bone"] = false
end
AutoFarm:AddSeperator("/ Farm Monster \\")
if World1 then
	tableMon = {"Bandit [Lv. 5]","Monkey [Lv. 14]","Gorilla [Lv. 20]","Pirate [Lv. 35]","Brute [Lv. 45]","Desert Bandit [Lv. 60]","Desert Officer [Lv. 70]","Snow Bandit [Lv. 90]","Snowman [Lv. 100]","Chief Petty Officer [Lv. 120]","Sky Bandit [Lv. 150]","Dark Master [Lv. 175]","Toga Warrior [Lv. 225]","Gladiator [Lv. 275]","Military Soldier [Lv. 300]","Military Spy [Lv. 330]","Fishman Warrior [Lv. 375]","Fishman Commando [Lv. 400]","God's Guard [Lv. 450]","Shanda [Lv. 475]","Royal Squad [Lv. 525]","Royal Soldier [Lv. 550]","Galley Pirate [Lv. 625]","Galley Captain [Lv. 650]"}
elseif World2 then
	tableMon = {"Raider [Lv. 700]","Mercenary [Lv. 725]","Swan Pirate [Lv. 775]","Factory Staff [Lv. 800]","Marine Lieutenant [Lv. 875]","Marine Captain [Lv. 900]","Zombie [Lv. 950]","Vampire [Lv. 975]","Snow Trooper [Lv. 1000]","Winter Warrior [Lv. 1050]","Lab Subordinate [Lv. 1100]","Horned Warrior [Lv. 1125]","Magma Ninja [Lv. 1175]","Lava Pirate [Lv. 1200]","Ship Deckhand [Lv. 1250]","Ship Engineer [Lv. 1275]","Ship Steward [Lv. 1300]","Ship Officer [Lv. 1325]","Arctic Warrior [Lv. 1350]","Snow Lurker [Lv. 1375]","Sea Soldier [Lv. 1425]","Water Fighter [Lv. 1450]"}
elseif World3 then
	tableMon = {"Pirate Millionaire [Lv. 1500]","Dragon Crew Warrior [Lv. 1575]","Dragon Crew Archer [Lv. 1600]","Female Islander [Lv. 1625]","Giant Islander [Lv. 1650]","Marine Commodore [Lv. 1700]","Marine Rear Admiral [Lv. 1725]","Fishman Raider [Lv. 1775]","Fishman Captain [Lv. 1800]","Forest Pirate [Lv. 1825]","Mythological Pirate [Lv. 1850]","Jungle Pirate [Lv. 1900]","Musketeer Pirate [Lv. 1925]","Reborn Skeleton [Lv. 1975]","Living Zombie [Lv. 2000]","Demonic Soul [Lv. 2025]","Posessed Mummy [Lv. 2050]" ,"Peanut Scout [Lv. 2075]","Peanut President [Lv. 2100]","Ice Cream Chef [Lv. 2125]","Ice Cream Commander [Lv. 2150]","Cookie Crafter [Lv. 2200]","Cake Guard [Lv. 2225]","Baking Staff [Lv. 2250]","Head Baker [Lv. 2275]"}
end
SelectMonster = ""
AutoFarm:AddDropdown("Select Monsters" , tableMon , false, function(value)
    SelectMonster = value
    end)
AutoFarm:AddToggle("Auto Farm Select Monster" , false , function(value)
  --  if SelectMonster == "" then
          -- DiscordLib:Notification("Thunder Z","Select Monster First !", 3)
--            else
	_G.AutoFarmSelectMonster = value
        StopTween(_G.AutoFarmSelectMonster)
--end
        end)
spawn(function()
        while wait() do
            if _G.AutoFarmSelectMonster then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        Usefastattack = false
                        StartMagnet = false
                        CheckQuest()
                        repeat wait() topos(CFrameQuest) until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoFarmSelectMonster
                        if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            wait(1.2)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                            wait(0.5)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            repeat task.wait()
                                                EquipWeapon(getgenv().Settings["Select Weapon"])
                                                AutoHaki()                                            
                                                PosMonSelectMonster = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                Usefastattack = true
                                                StartMagnet = true
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            until not _G.AutoFarmSelectMonster or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            Usefastattack = false
                                            StartMagnet = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            Usefastattack = false
                            StartMagnet = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                            else
                                if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                                    if PosMon ~= nil then
                                        topos(PosMon * CFrame.new(5,10,7))
                                    else
                                       CheckQuest()
							AutoFarmSelectMonster = false
							topos(CFrameMon)
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
end)
----------------------------------------------------------------------------
--// Auto Farm nearest \\
AutoFarm:AddToggle("Auto Farm Nearest Monster" , getgenv().Settings["Auto Farm Nearest"] , function(value)
  --  if SelectMonster == "" then
          -- DiscordLib:Notification("Thunder Z","Select Monster First !", 3)
--            else
	getgenv().Settings["Auto Farm Nearest"] = value
        StopTween(getgenv().Settings["Auto Farm Nearest"])
        Save()
--end
end)
    
    

spawn(function()
	while wait(.1) do
		if getgenv().Settings["Auto Farm Nearest"] then
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
			    if v.Name and v:FindFirstChild("Humanoid") then
			        if v.Humanoid.Health > 0 then
			            repeat game:GetService("RunService").Heartbeat:wait()
			                EquipWeapon(getgenv().Settings["Select Weapon"])
                            AutoHaki()   
			                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
			                v.HumanoidRootPart.CanCollide = false
			                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
			                game:GetService("VirtualUser"):CaptureController()
						    game:GetService("VirtualUser"):CaptureController()
				       	    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672),workspace.CurrentCamera.CFrame)
				       	    NearestMagnet = true
				       	    Usefastattack = true
				       	    PosMonNearest = v.HumanoidRootPart.CFrame
			            until not getgenv().Settings["Auto Farm Nearest"] or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
			        end
			    end
			end
		end
	end
end)
spawn(function()
	while wait() do
	    pcall(function()
	        if getgenv().Settings["Auto Farm Nearest"] and NearestMagnet then
		    	for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if v.Name and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			            if (v.HumanoidRootPart.Position - PosMonNearest.Position).Magnitude <= 400 then
			    	        v.Head.CanCollide = false
			   	    	    v.HumanoidRootPart.CanCollide = false
			   	    	    v.Humanoid:ChangeState(14)
		   	        	    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
		   	        	    v.HumanoidRootPart.CFrame = PosMonNearest
		   	        	    if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
			           	    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
					    end
					end
				end
			end
		end)
	end
end)

----------------------------------------------------------------------------
Time = AutoFarmSetting:AddLabel("")
Time2 = AutoFarmSetting:AddLabel("")
Time3 = AutoFarmSetting:AddLabel("")

function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    Time:Set("Hour : "..Hour)
    Time2:Set("Minute : "..Minute)
    Time3:Set("Second : "..Second)
end

spawn(function()
    while true do
        UpdateTime()
        wait()
    end
end)

Client = AutoFarmSetting:AddLabel("")
Client2 = AutoFarmSetting:AddLabel("")

function UpdateClient()
    local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local Fps = workspace:GetRealPhysicsFPS()
    Client:Set("Fps : "..Fps)
    Client2:Set("Ping : "..Ping)
end

spawn(function()
    while true do wait(.1)
        UpdateClient()
    end
end)

AutoFarmSetting:AddSeperator("// UI COLOR \\\\")
AutoFarmSetting:AddLabel("Must Execute Again")
AutoFarmSetting:AddLabel("To Show New Color")
AutoFarmSetting:AddColorpicker("Color 1" , getgenv().Settings["First Color"] , function(value)
    _G.Color = value
    Save()
end)
AutoFarmSetting:AddColorpicker("Color 2" , getgenv().Settings["Second Color"] , function(value)
    _G.Color2 = value
    Save()
end)
AutoFarmSetting:AddSeperator("/ Settings \\")
--if getgenv().Settings["Select Weapon"] == nil then
--	SelectWeapontot = "Select Weapons"
	--end
WeaponList = {}
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(WeaponList ,v.Name)
        end
    end
    --getgenv().Settings["Select Weapon"] = ""
local SelectWeapona = AutoFarmSetting:AddDropdown(getgenv().Settings["Select Weapon"] ,WeaponList, false ,function(value)
    getgenv().Settings["Select Weapon"] = value
    Save()
end)
AutoFarmSetting:AddButton("Refresh Weapon",function()
    SelectWeapona:Refresh()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
        SelectWeapona:Add(v.Name)
    end
    Save()
end)
AutoFarmSetting:AddToggle("Auto Set Spawn" , true , function(value)
    _G.AutoSetSpawn = value
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoSetSpawn then
                    if game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                end
            end
        end)
    end)
end)
AutoFarmSetting:AddToggle("Old Fast Attack" , getgenv().Settings["Old Fast Attack"] , function(value)
    getgenv().Settings["Old Fast Attack"] = value
    Save()
end)

local Kamera = require(game.ReplicatedStorage.Util.CameraShaker)
Script = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(Script)[2]
--local yAttack = -0.1 -(math.huge^math.huge^math.huge^math.huge^math.huge)
local yAttack = -1 -(math.huge^math.huge^math.huge^math.huge^math.huge)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().Settings["Old Fast Attack"] then
            if typeof(y) == "table" then
                pcall(function()
                    Kamera:Stop()
                                --y.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
                                y.activeController.timeToNextAttack = yAttack
                                y.activeController.attacking = false
                                y.activeController.increment = 3
                                y.activeController.blocking = false                            
                                y.activeController.hitboxMagnitude = 120
    		                    y.activeController.humanoid.AutoRotate = true
    	                      	y.activeController.focusStart = 0
    	                      	y.activeController.currentAttackTrack = 0
    	                        game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
                                game.Players.LocalPlayer.Character.Humanoid.xNerosplayxNerostanceType = "None"
                                game.Players.LocalPlayer.Character.Stun.Value = 0
                                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                game.Players.LocalPlayer.Character.Busy.Value = false
                                game.Players.LocalPlayer.SimulationRaxNerous = math.huge * math.huge, math.huge * math.huge * 0 / 0 * 0 / 0 * 0 / 0 * 0 / 0 * 0 / 0
                                setscriptable(game:GetService("Players").LocalPlayer, "SimulationRaxNerous", math.huge)
                end)
            end
        end
    end)
end)

AutoFarmSetting:AddLabel("Dont Enable Fast Attack ,\nVery Fast Attack Together!")
AutoFarmSetting:AddToggle("Fast Attack" , getgenv().Settings["Fast Attack"] , function(value)
    getgenv().Settings["Fast Attack"] = value
    Save()
end)

AutoFarmSetting:AddToggle("Very Fast Attack" , getgenv().Settings["Super Fast Attack"] ,function(value)
    getgenv().Settings["Super Fast Attack"] = value
    Save()
end)

local KameraBergetar = require(game.ReplicatedStorage.Util.CameraShaker)
--local Anjink = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
--local CombatFrameworkR = getupvalues(Anjink)[2]
local plr = game.Players.LocalPlayer
local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end
function AttackNoCD() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            55
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end                  
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end


if getgenv().Settings["Fast Attack"] or getgenv().Settings["Super Fast Attack"] then 
	cac=task.wait
	--CombatFrameworkR.activeController.hitboxMagnitude = 55
	KameraBergetar:Stop()
	print("Slebew")
else
	cac = wait
end

spawn(function()
        while task.wait() do
            pcall(function()
while cac() do 
     if getgenv().Settings["Farm Fast Level"] or getgenv().Settings["All Boss"] or getgenv().Settings["Auto Farm Nearest"] or getgenv().Settings["Auto Farm Observation V2"] or _G.AutoFactory or _G.AutoAdvanceDungeon or getgenv().Settings["Auto Katakuri"] or _G.Auto_DungeonMobAura or _G.AutoFarmChest or getgenv().Settings["Auto Hallow"] or getgenv().Settings["Auto Black Beard"] or getgenv().Settings["Auto Swan Glasses"] or _G.AutoLongSword or _G.AutoBlackSpikeycoat or getgenv().Settings["Auto Electric Claw"] or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or getgenv().Settings["Auto Farm Boss"] or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or getgenv().Settings["Auto Saber"] or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.AutoFarmSelectMonster or _G.TeleportNPC or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or getgenv().Settings["Auto Farm Observation"] or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or getgenv().Settings["Auto Farm Observation"] or getgenv().Settings["Auto Dark Dagger"] or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or getgenv().Settings["Auto Farm All Boss"] or _G.Auto_Bounty or getgenv().Settings["Auto Sharkman Karate"] or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or getgenv().Settings["Auto Pole V1"] or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or getgenv().Settings["Auto Farm Bounty"] or _G.Holy_Torch or getgenv().Settings["Auto Farm Level"] or _G.Clip or FarmBoss or getgenv().Settings["Elite Hunter"] or _G.AutoThirdSea or getgenv().Settings["Auto Farm Bone"] or getgenv().Settings["Auto Chest"]  == true then
    if getgenv().Settings["Fast Attack"] then 
    wait(0.05)
	AttackNoCD()
    wait(0.05)
--	print("ashiap")
else
    if getgenv().Settings["Super Fast Attack"] then 
       --wait()
	AttackNoCD()
    wait(0.06435363466)
--	print("Puki")
    end
end
end
end
end)
end
end)

AutoFarmSetting:AddToggle("Bring Monster" , true , function(value)
    _G.BringMonster = value
    spawn(function()
        while task.wait() do
            pcall(function()
                if _G.BringMonster then
                    CheckQuest()
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if getgenv().Settings["Auto Farm Level"] and StartMagnet and v.Name == Mon and (Mon == "Factory Staff [Lv. 800]" or Mon == "Monkey [Lv. 14]" or Mon == "Dragon Crew Warrior [Lv. 1575]" or Mon == "Dragon Crew Archer [Lv. 1600]") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                        elseif getgenv().Settings["Auto Farm Level"] and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 275 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                       end
                    end
                end
            end)
        end
    end)
end)
AutoFarmSetting:AddToggle("Remove Effects" , true , function(value)
    _G.SFX = value
    spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        if _G.SFX then
            
        --if Usefastattack then
           -- if fastattack the
                
            
            for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
                if v.Name == "CurvedRing" or v.Name == "SwordSlash" or v.Name == "SlashHit" or v.Name == "DamageCounter" then
                    v:Destroy() 
                end
            --end
            end
                end
           

    end)
end)
      end)
    
    spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        if _G.SFX then
    for i, v in pairs(game.Workspace["_WorldOrigin"].Sounds:GetChildren()) do
                if v.Name == "ProxySound" then
                    v:Destroy() 
                end
    end
        end
        end)
   -- end)
end)

AutoFarmSetting:AddToggle("Auto Observation Haki", false, function(vu)
	_G.Kentot = vu
end)   
 spawn(function()
	while wait() do
		if _G.Kentot then
			if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
				wait(1)
				game:GetService('VirtualUser'):CaptureController()
				game:GetService('VirtualUser'):SetKeyDown('0x65')
			   	wait(2)
			   	game:GetService('VirtualUser'):SetKeyUp('0x65')
			end
		end
	end
end)

AutoFarmSetting:AddSeperator("/ Level Lock \\")
	LockLevelValue = 2300
	OldLevel = game.Players.localPlayer.Data.Level.Value
	AutoFarmSetting:AddSlider("Select Level Lock",1,getgenv().Settings["Lock Level"] ,LockLevelValue,nil,function(value)
		getgenv().Settings["Lock Level"] = value
		Save()
	end)
	AutoFarmSetting:AddToggle("Lock Level Kick Game",_G.LockLevelValueToggle,function(value)
		_G.LockLevelValueToggle = value
		--Save()
	end)
    
	spawn(function()
		while wait(.1) do
			if _G.LockLevelValueToggle then
				if game.Players.localPlayer.Data.Level.Value >= getgenv().Settings["Lock Level"] then
				    wait(8)
					game.Players.localPlayer:Kick("\n Auto Farm Completed Level : "..game.Players.localPlayer.Data.Level.Value.."\n Old Level : "..OldLevel.."\nUsername : "..game.Players.LocalPlayer.Name)
				end
			end
		end
	end)
	
AutoFarmSetting:AddSeperator("/ Credit \\")
AutoFarmSetting:AddLabel("Script Made By : Fikury#7140")
AutoFarmSetting:AddLabel("UI Used : Xenon")
AutoFarmSetting:AddButton("Copy Discord Link" , function()
    setclipboard("https://discord.gg/EAasK6nBMr")
    end)
----------------------------------------------------------------------------
-- // Auto Fighting Styles
Auto:AddToggle("Auto Superhuman",getgenv().Settings["Auto Superhuman"],function(value)
        getgenv().Settings["Auto Superhuman"] = value
        Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait() do 
                if getgenv().Settings["Auto Superhuman"] then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 150000 then
                        UnEquipWeapon("Combat")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end   
                    if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                        getgenv().Settings["Select Weapon"] = "Superhuman"
                    end  
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                            getgenv().Settings["Select Weapon"] = "Black Leg"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                            getgenv().Settings["Select Weapon"] = "Electro"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                            getgenv().Settings["Select Weapon"] = "Fishman Karate"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                            getgenv().Settings["Select Weapon"] = "Dragon Claw"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end 
                    end
                end
            end
        end)
    end)
    
    Auto:AddToggle("Auto DeathStep",getgenv().Settings["Auto DeathStep"],function(value)
        getgenv().Settings["Auto DeathStep"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do wait()
            if getgenv().Settings["Auto DeathStep"] then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        getgenv().Settings["Select Weapon"] = "Death Step"
                    end  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        getgenv().Settings["Select Weapon"] = "Death Step"
                    end  
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
                        getgenv().Settings["Select Weapon"] = "Black Leg"
                    end 
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                end
            end
        end
    end)
    
    Auto:AddToggle("Auto Sharkman Karate",getgenv().Settings["Auto Sharkman Karate"],function(value)
        getgenv().Settings["Auto Sharkman Karate"] = value
        StopTween(getgenv().Settings["Auto Sharkman Karate"])
        Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if getgenv().Settings["Auto Sharkman Karate"] then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
                            topos(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                        else 
                            Ms = "Tide Keeper [Lv. 1475] [Boss]"
                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then   
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then    
                                        OldCFrameShark = v.HumanoidRootPart.CFrame
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipWeapon(getgenv().Settings["Select Weapon"])
                                            v.Head.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            v.HumanoidRootPart.CFrame = OldCFrameShark
                                            topos(v.HumanoidRootPart.CFrame*CFrame.new(5,10,7))
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                        until not v.Parent or v.Humanoid.Health <= 0 or getgenv().Settings["Auto Sharkman Karate"] == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                                    end
                                end
                            else
                                topos(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202))
                                wait(3)
                            end
                        end
                    else 
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    end
                end
            end
        end)
    end)
    
    Auto:AddToggle("Auto Electric Claw",getgenv().Settings["Auto Electric Claw"],function(value)
        getgenv().Settings["Auto Electric Claw"] = value
        StopTween(getgenv().Settings["Auto Electric Claw"])
        Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait() do 
                if getgenv().Settings["Auto Electric Claw"] then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electric Claw") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            getgenv().Settings["Select Weapon"] = "Electric Claw"
                        end  
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            getgenv().Settings["Select Weapon"] = "Electric Claw"
                        end  
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then
                            getgenv().Settings["Select Weapon"] = "Electro"
                        end 
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                    end
                end
                if getgenv().Settings["Auto Electric Claw"] then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                            if getgenv().Settings["Auto Farm Level"] == false then
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not getgenv().Settings["Auto Electric Claw"] or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                                wait(2)
                                repeat task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not getgenv().Settings["Auto Electric Claw"] or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not getgenv().Settings["Auto Electric Claw"] or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            elseif getgenv().Settings["Auto Farm Level"] == true then
                                getgenv().Settings["Auto Farm Level"] = false
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not getgenv().Settings["Auto Electric Claw"] or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                                wait(2)
                                repeat task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not getgenv().Settings["Auto Electric Claw"] or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10
                                wait(1)
                                repeat task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not getgenv().Settings["Auto Electric Claw"] or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                getgenv().Settings["Select Weapon"] = "Electric Claw"
                                wait(.1)
                                getgenv().Settings["Auto Farm Level"] = true
                            end
                        end
                    end
                end
            end
        end)
    end)
    
    Auto:AddToggle("Auto Dragon Talon",getgenv().Settings["Auto Dragon Talon"],function(value)
        getgenv().Settings["Auto Dragon Talon"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Dragon Talon"] then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        getgenv().Settings["Select Weapon"] = "Dragon Talon"
                    end  
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        getgenv().Settings["Select Weapon"] = "Dragon Talon"
                    end  
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 then
                        getgenv().Settings["Select Weapon"] = "Dragon Claw"
                    end 
                else 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                end
            end
        end
    end)
----------------------------------------------------------------------------
-- // Auto Mastery \\
--getgenv().Settings["Distance Mastery"] = 40
Auto2:AddToggle("Auto Farm DF Mastery",_G.AutoFarmFruitMastery,function(value)
        _G.AutoFarmFruitMastery = value
        StopTween(_G.AutoFarmFruitMastery)
        if _G.AutoFarmFruitMastery == false then
            UseSkill = false 
        end
end)



spawn(function()
	while wait(.1) do
		if _G.AutoFarmFruitMastery then
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				StartMasteryFruitMagnet = false
				CheckQuest()
				topos(CFrameQuest)
				if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
					wait(1.1)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
				end
			elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				CheckQuest()
				if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
					pcall(function()
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == Mon then
								repeat game:GetService("RunService").Heartbeat:wait()
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
										HealthMs = v.Humanoid.MaxHealth * getgenv().Settings["Kill At"]/100
										if v.Humanoid.Health <= HealthMs then
											EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
											v.Head.CanCollide = false
											--game:GetService("VirtualUser"):CaptureController(Vector2.new(1280, 672))
										    v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(2,2,1)
											topos(v.HumanoidRootPart.CFrame * CFrame.new(0,getgenv().Settings["Distance Mastery"],1) * CFrame.Angles(math.rad(-90), 0, 0))
											getgenv().Settings["Aimbot Skill"] = false
											local args = {
                                                [1] = PosMonMasteryFruit.Position
                                            }
                                            USEBF = true
											--wait(0.5)
										else
										   --wait(0.2)
											USEBF = false
											EquipWeapon(getgenv().Settings["Select Weapon"])
											AutoHaki()
                                            v.Head.CanCollide = false
											v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(40,40,40)
											topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
											game:GetService("VirtualUser"):CaptureController()
											game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
										end
										StartMasteryFruitMagnet = true
										PosMonMasteryFruit = v.HumanoidRootPart.CFrame
									else
										StartMasteryFruitMagnet = false
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
									end
								until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoFarmFruitMastery == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
								USEBF = false
							end
						end
					end)
				else
					StartMasteryFruitMagnet = false
					topos(CFrameMon)
				end 
			end
		end
	end
end)


spawn(function()
	while wait(.1) do
		if USEBF then
			pcall(function()
				CheckQuest()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
					if _G.SkillZ then
                        wait(0.1)
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.SkillX then
                        wait(0.3)
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.SkillC then
                        wait(0.3)
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                    if _G.SkillV then
                        wait(0.3)
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                    if _G.SkillZ and game.Players.LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(2, 2.0199999809265, 1) then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                        wait(.3)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.SkillX then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.SkillC then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                    if _G.SkillV then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
                    if _G.SkillZ then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                  --  if _G.SkillX then
					--	local args = {
					--		[1] = PosMonMasteryFruit.Position
					--	}
					--	game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        --topos(v.HumanoidRootPart.CFrame * CFrame.new(0,2,0))
                      --  wait(0.5)
                      --  game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                      --  wait(0.3)
                      --  game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                  --  end
                    if _G.SkillC then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough-Dough") then
                    if _G.SkillZ then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.SkillX then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.SkillC then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    if _G.SkillV then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                        wait(2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") then
                    if _G.SkillZ then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.SkillX then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.SkillC then
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then
                    if _G.SkillZ then
                        wait(0.1)
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.SkillX then
                        wait(0.5)
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.SkillC then
                        wait(0.5)
						local args = {
							[1] = PosMonMasteryFruit.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end 
                    
                         end
                      end
                   end
               -- end
			end)
		end
	end
end)



spawn(function()
    pcall(function()
		game:GetService("RunService").RenderStepped:Connect(function()
            if USEBF and PosMonMasteryFruit ~= nil then
                local args = {
                    [1] = PosMonMasteryFruit.Position
                }
                game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
            end
        end)
    end)
end)

    
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                if _G.AutoFarmFruitMastery then
                    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                        if v.Name == "NotificationTemplate" then
                            if string.find(v.Text,"Skill locked!") then
                                v:Destroy()
                            end
                        end
                    end
                end
            end)
        end)
    end)



    
    Auto2:AddToggle("Auto Farm Gun Mastery",_G.AutoFarmGunMastery,function(value)
        _G.AutoFarmGunMastery = value
        StopTween(_G.AutoFarmGunMastery)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoFarmGunMastery then
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        Usefastattack = false
                        Magnet = false                                      
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        Usefastattack = false
                        StartMasteryGunMagnet = false
                        CheckQuest()
                        topos(CFrameQuest)
                        if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1.2)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                       CheckQuest()
				if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
					pcall(function()
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == Mon then
								repeat game:GetService("RunService").Heartbeat:wait()
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
										HealthMin = v.Humanoid.MaxHealth * getgenv().Settings["Kill At"]/100
										if v.Humanoid.Health <= HealthMin then
											EquipWeapon(SelectWeaponGun)
											topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
											local args = {
												[1] = v.HumanoidRootPart.Position,
												[2] = v.HumanoidRootPart
											}
											game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new())
                                                else
                                                    AutoHaki()
                                                    EquipWeapon(getgenv().Settings["Select Weapon"])
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.CanCollide = false
                                                    Usefastattack = true
                                                    v.Head.CanCollide = false               
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                    game:GetService'VirtualUser':CaptureController()
                                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                end
                                                StartMasteryGunMagnet = true 
                                                PosMonMasteryGun = v.HumanoidRootPart.CFrame
                                            else
                                                StartMasteryGunMagnet = false
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                            end
                                        until v.Humanoid.Health <= 0 or _G.AutoFarmGunMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        StartMasteryGunMagnet = false
                                    end
                                end
                            end)
                        else
                            StartMasteryGunMagnet = false
                            local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                            if Mob then
                                topos(Mob.HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                            else
                                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                    task.wait()
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                                    topos(CFrameMon)
                                end
                            end
                        end 
                    end
                end
            end
        end)
    end)
    
    
    
Auto2:AddSeperator("/ Mastery Settings \\")
    Auto2:AddSlider("Mastery DF Distance",1,getgenv().Settings["Distance Mastery"],55,false,function(value)
        getgenv().Settings["Distance Mastery"] = value
        Save()
    end)
    
    --_G.Kill_At = 15
    Auto2:AddSlider("Kill At %",1,getgenv().Settings["Kill At"],100,false,function(value)
        getgenv().Settings["Kill At"] = value
        Save()
    end)
    Auto2:AddToggle("Skill Z",true,function(value)
        _G.SkillZ = value
    end)
    
    Auto2:AddToggle("Skill X",true,function(value)
        _G.SkillX = value
    end)
    
    Auto2:AddToggle("Skill C",true,function(value)
        _G.SkillC = value
    end)
    
    Auto2:AddToggle("Skill V",true,function(value)
        _G.SkillV = value
    end)
----------------------------------------------------------------------------
-- // Auto Boss \\
local Boss = {}
    
    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if string.find(v.Name, "Boss") then
            if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                else
                table.insert(Boss, v.Name)
            end
        end
    end
    
    local BossName = Auto3:AddDropdown("Select Boss",Boss,false,function(value)
        _G.SelectBoss = value
    end)
    
    Auto3:AddButton("Refresh Boss",function()
        BossName:Refresh()
            for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if string.find(v.Name, "Boss") then
                BossName:Add(v.Name) 
            end
        end
    end)
    
    Auto3:AddToggle("Auto Farm Boss",getgenv().Settings["Auto Farm Boss"],function(value)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
       -- if getgenv().Settings["Select Weapon"] == "" then
         --   DiscordLib:Notification("Thunder Z", "Select Weapon First", 3)
          --  else
        getgenv().Settings["Auto Farm Boss"] = value
        StopTween(getgenv().Settings["Auto Farm Boss"])
      --  end
     Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Farm Boss"] then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == _G.SelectBoss then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        v.HumanoidRootPart.CanCollide = false
                                        Usefastattack = true
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not getgenv().Settings["Auto Farm Boss"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                        end
                    end
                end)
            end
        end
    end)
    
    Auto3:AddToggle("Auto Farm All Boss",getgenv().Settings["Auto Farm All Boss"],function(value)
      --  if getgenv().Settings["Select Weapon"] == "" then
          --  DiscordLib:Notification("Thunder Z", "Select Weapon First", 3)
          --  else
        getgenv().Settings["Auto Farm All Boss"] = value
        StopTween(getgenv().Settings["Auto Farm All Boss"])
       -- end
      Save()
    end)
    
    Auto3:AddToggle("Farm All Boss [ Fast ]" , getgenv().Settings["All Boss"], function(value)
        getgenv().Settings["All Boss"] = value
        StopTween(getgenv().Settings["All Boss"])
        Save()
    end)
    
    Auto3:AddToggle("Auto Farm All Boss Hop",getgenv().Settings["Auto Farm All Boss Hop"],function(value)
        getgenv().Settings["Auto Farm All Boss Hop"] = value
       Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Farm All Boss"] then
                pcall(function()
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if string.find(v.Name,"Boss") then
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 17000 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(getgenv().Settings["Select Weapon"])
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    Usefastattack = true
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                                    topos(v.HumanoidRootPart.CFrame*CFrame.new(5,10,7))
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until v.Humanoid.Health <= 0 or getgenv().Settings["Auto Farm All Boss"] == false or not v.Parent
                            end
                        else
                            if getgenv().Settings["Auto Farm All Boss Hop"] then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    
    spawn(function()
        while wait() do
            if getgenv().Settings["All Boss"] then
                pcall(function()
                    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if string.find(v.Name,"Boss") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
                            --if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 97000 then
                                repeat task.wait()
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                    AutoHaki()
                                    EquipWeapon(getgenv().Settings["Select Weapon"])
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    Usefastattack = true
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                                    topos(v.HumanoidRootPart.CFrame*CFrame.new(5,10,7))
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until v.Humanoid.Health <= 0 or getgenv().Settings["All Boss"] == false or not v.Parent
                              --  end
                          -- end
                        else
                            if getgenv().Settings["Auto Farm All Boss Hop"] then
                                Hop()
                              --  end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    
----------------------------------------------------------------------------
--// Auto Farm Boss Drops \\
Auto3:AddSeperator("/ Auto Chest \\")
Auto3:AddToggle("Auto Farm Chest" , getgenv().Settings["Auto Chest"] , function(value)
        getgenv().Settings["Auto Chest"] = value
        StopTween(getgenv().Settings["Auto Chest"])
       Save()
    end)
    Auto3:AddToggle("Instant Teleport To Chest ( Very Risk )" , false , function(value)
        _G.InstantChest = value
    end)
    
    Auto3:AddToggle("Auto Farm Chest Hop" , false , function(value)
        getgenv().Settings["Auto Chest Hop"] = value
       Save()
    end)
    _G.MagnitudeAdd = 0
    spawn(function()
		while wait() do 
			pcall(function()
				if getgenv().Settings["Auto Chest"] then
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
						if v.Name:find("Chest") then
							if game:GetService("Workspace"):FindFirstChild(v.Name) then
								if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 6000 then--+_G.MagnitudeAdd then
									repeat wait()
										if game:GetService("Workspace"):FindFirstChild(v.Name) then
											topos(v.CFrame)
										end
									until getgenv().Settings["Auto Chest"] == false or not v.Parent
									--_G.MagnitudeAdd = _G.MagnitudeAdd+1500
								end
								else
								    if getgenv().Settings["Auto Chest Hop"] then
								        Hop()
								end
							end
						end
					end
				end
			end)
		end
	end)
    
    spawn(function()
        while wait() do
    if _G.InstantChest then
wait()
for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if string.find(v.Name, "Chest") then
        print(v.Name)
        wait(0.20)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
    end
end

else
    
								    if _G.ChestHop then
								        Hop()
    end
    end
end
end)
----------------------------------------------------------------------------
if World3 then
    Auto3:AddSeperator("/ Dought Boss \\")
    local MobKilled = Auto3:AddLabel("Killed")
    
    spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                    MobKilled:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                    MobKilled:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                    MobKilled:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39))
                else
                    MobKilled:Set("Boss Is Spawning")
                end
            end)
        end
    end)
    
    Auto3:AddToggle("Auto Dought Boss",getgenv().Settings["Auto Katakuri"],function(value)
        --if getgenv().Settings["Select Weapon"] == "" then
          --  DiscordLib:Notification("Thunder Z", "Select Weapon First", 3)
           -- else
        getgenv().Settings["Auto Katakuri"] = value
        StopTween(getgenv().Settings["Auto Katakuri"])
        --if World2 then
        --value = false
       -- StopTween(getgenv().Settings["Auto Katakuri"])
        --end
       -- end
    Save()
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41)) - 500)
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),40,41)) - 500)
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),41,41)) - 500)
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Katakuri"] then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        Usefastattack = true
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not getgenv().Settings["Auto Katakuri"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                        else
                            if KillMob == 0 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",true)
                            end                    
                            if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]" then
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                repeat task.wait()
                                                    AutoHaki()
                                                    EquipWeapon(getgenv().Settings["Select Weapon"])
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false 
                                                    Usefastattack = true
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    MagnetDought = true
                                                    PosMonDoughtOpenDoor = v.HumanoidRootPart.CFrame
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                                until not getgenv().Settings["Auto Katakuri"] or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                            end
                                        end
                                    end
                                else
                                    MagnetDought = false
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter [Lv. 2200]") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter [Lv. 2200]").HumanoidRootPart.CFrame * CFrame.new(5,10,7)) 
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard [Lv. 2225]") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard [Lv. 2225]").HumanoidRootPart.CFrame * CFrame.new(5,10,7)) 
                                        else
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff [Lv. 2250]") then
                                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff [Lv. 2250]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                            else
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker [Lv. 2275]") then
                                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker [Lv. 2275]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                                end
                                            end
                                        end
                                    end                       
                                end
                            else
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                                    topos(game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    else
        getgenv().Settings["Auto Katakuri"] = false
end
----------------------------------------------------------------------------
Auto3:AddSeperator("/ Boss Drops \\")
if World3 then
    Auto3:AddLabel("Buddy Sword")
Auto3:AddToggle("Auto Buddy Sword",_G.AutoBudySword,function(value)
        _G.AutoBudySword = value
        StopTween(_G.AutoBudySword)
      Save()
    end)
 
    Auto3:AddToggle("Auto Buddy Sword Hop",getgenv().Settings["Auto Buddy Hop"],function(value)
        getgenv().Settings["Auto Buddy Hop"] = value
     Save()
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoBudySword then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Queen [Lv. 2175] [Boss]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.AutoBudySword or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                        else
                            if getgenv().Settings["Auto Buddy Hop"] then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    Auto3:AddSeperator("/ Elite Hunter \\")
    local EliteProgress = Auto3:AddLabel("")
    
    spawn(function()
        pcall(function()
            while wait() do
                EliteProgress:Set("Elite Progress : "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
            end
        end)
    end)
    
    Auto3:AddToggle("Auto Elite Hunter",getgenv().Settings["Elite Hunter"],function(value)
        getgenv().Settings["Elite Hunter"] = value
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        StopTween(getgenv().Settings["Elite Hunter"])
        Save()
    end)
    Auto3:AddToggle("Stop When got Chalice",getgenv().Settings["Elite Hunter God"],function(value)
        getgenv().Settings["Elite Hunter God"] = value
       Save()
    end)
    Auto3:AddToggle("Auto Elite Hunter Hop",getgenv().Settings["Auto Elite Hop"],function(value)
        getgenv().Settings["Auto Elite Hop"] = value
       Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Elite Hop"] and game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later." then
                Hop()
                else
                     if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") then
                        getgenv().Settings["Auto Elite Hop"] = false
                end
            end
        end
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Elite Hunter"] then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                       -- repeat  wait()
                            wait(0.55)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                            wait(1)
                        --until not getgenv().Settings["Elite Hunter"]
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if string.find(QuestTitle,"Diablo") or string.find(QuestTitle,"Deandre") or string.find(QuestTitle,"Urban") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Diablo [Lv. 1750]" or v.Name == "Deandre [Lv. 1750]" or v.Name == "Urban [Lv. 1750]" then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat task.wait()
                                                AutoHaki()
                                                EquipWeapon(getgenv().Settings["Select Weapon"])
                                                v.HumanoidRootPart.CanCollide = false
                                                Usefastattack = true
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            until getgenv().Settings["Elite Hunter"] == false or v.Humanoid.Health <= 0 or not v.Parent
                                        end
                                    end
                                end
                            else
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                           -- else
                                   --if getgenv().Settings["Auto Elite Hop"] and game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later." then
                                      --  Hop()
                                   -- end
                                end
                            end                    
                        end
                    end
                end)
            end
        end
    end)
    
    
     spawn(function()
        while wait() do
            if getgenv().Settings["Elite Hunter God"] then
                pcall(function()
                   if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") then
                    getgenv().Settings["Auto Elite Hunter"] = false
                    getgenv().Settings["Auto Elite Hop"] = false
                   end
                end)
            end
        end
     end)
                    
    Auto3:AddLabel("Hallow Scythe")
    Auto3:AddToggle("Auto Hallow Scythe",getgenv().Settings["Auto Hallow"],function(value)
        getgenv().Settings["Auto Hallow"] = value
        StopTween(getgenv().Settings["Auto Hallow"])
        Save()
    end)
    
    Auto3:AddToggle("Auto Hallow Scythe Hop",getgenv().Settings["Auto Hallow Hop"],function(value)
        getgenv().Settings["Auto Hallow Hop"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Hallow"] then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v.Name , "Soul Reaper") then
                                repeat task.wait()
                                    EquipWeapon(getgenv().Settings["Select Weapon"])
                                    AutoHaki()
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame*CFrame.new(5,10,7))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                    v.HumanoidRootPart.Transparency = 1
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until v.Humanoid.Health <= 0 or getgenv().Settings["Auto Hallow"] == false
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                        repeat topos(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8                        
                        EquipWeapon("Hallow Essence")
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                        else
                            if getgenv().Settings["Auto Hallow Hop"] then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    Auto3:AddLabel("Dark Dagger")
    Auto3:AddToggle("Auto Dark Dagger",getgenv().Settings["Auto Dark Dagger"],function(value)
        getgenv().Settings["Auto Dark Dagger"] = value
        StopTween(getgenv().Settings["Auto Dark Dagger"])
       Save()
    end)
        
    spawn(function()
        pcall(function()
            while wait() do
                if getgenv().Settings["Auto Dark Dagger"] then
                    if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 5000] [Raid Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == ("rip_indra True Form [Lv. 5000] [Raid Boss]" or v.Name == "rip_indra [Lv. 5000] [Raid Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    pcall(function()
                                        AutoHaki()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
                                    end)
                                until getgenv().Settings["Auto Dark Dagger"] == false or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        topos(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                    end
                end
            end
        end)
    end)
    
    Auto3:AddToggle("Auto Dark Dagger Hop",getgenv().Settings["Auto Dark Dagger Hop"],function(value)
       getgenv().Settings["Auto Dark Dagger Hop"] = value
         Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if (getgenv().Settings["Auto Dark Dagger"] and getgenv().Settings["Auto Dark Dagger Hop"]) and World3 and not game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") and not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                    Hop()
                end
            end
        end)
    end)
    
    Auto3:AddLabel("Enchancement Color")
    Auto3:AddToggle("Auto Enchancement Color", getgenv().Settings["Auto Color"] ,function(value)
        getgenv().Settings["Auto Color"] = value
        Save()
    end)
    
    Auto3:AddToggle("Auto Enchancement Hop",getgenv().Settings["Auto Color Hop"],function(value)
        getgenv().Settings["Auto Color Hop"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Color"] then
                local args = {
                    [1] = "ColorsDealer",
                    [2] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if getgenv().Settings["Auto Color Hop"] and getgenv().Settings["Auto Color"] and not World1 then
                    wait(10)
                    Hop()
                end
            end 
        end
    end)
    
    
    local ObservationRange = Auto3:AddLabel("")
    
    spawn(function()
        while wait() do
            pcall(function()
                ObservationRange:Set("Range Level : "..math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
            end)
        end
    end)
    
    Auto3:AddToggle("Auto Farm Observation",getgenv().Settings["Auto Farm Observation"],function(value)
        getgenv().Settings["Auto Farm Observation"] = value
        StopTween(getgenv().Settings["Auto Farm Observation"])
       Save()
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Farm Observation"] then
                    repeat task.wait()
                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            game:GetService('VirtualUser'):CaptureController()
                            game:GetService('VirtualUser'):SetKeyDown('0x65')
                            wait(2)
                            game:GetService('VirtualUser'):SetKeyUp('0x65')
                        end
                    until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not getgenv().Settings["Auto Farm Observation"]
                end
            end)
        end
    end)
    
    
    Auto3:AddToggle("Auto Farm Observation Hop",getgenv().Settings["Auto Farm Observation Hop"],function(value)
        getgenv().Settings["Auto Farm Observation Hop"] = value
       Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if getgenv().Settings["Auto Farm Observation"] then
                    if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000 then
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Icon = "rbxassetid://0";
                            Title = "Observation", 
                            Text = "You Have Max Points"
                        })
                        wait(2)
                    else
                        if World2 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until getgenv().Settings["Auto Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]").HumanoidRootPart.CFrame * CFrame.new(0,50,0)+
                                            wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and getgenv().Settings["Auto Farm Observation Hop"] == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until getgenv().Settings["Auto Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                            end
                        elseif World1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until getgenv().Settings["Auto Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and getgenv().Settings["Auto Farm Observation Hop"]== true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until getgenv().Settings["Auto Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                            end
                        elseif World3 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until getgenv().Settings["Auto Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and getgenv().Settings["Auto Farm Observation Hop"] == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until getgenv().Settings["Auto Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                            end
                        end
                    end
                end
            end
        end)
    end)
    else
        getgenv().Settings["Elite Hunter"] = false
        getgenv().Settings["Auto Hallow"] = false
        getgenv().Settings["Auto Dark Dagger"] = false
      --  getgenv().Settings["Auto Farm Observation"] = false
end
if World2 then
    Auto3:AddLabel("Swan Glasses")
    Auto3:AddToggle("Auto Swan Glasses",getgenv().Settings["Auto Swan Glasses"],function(value)
        getgenv().Settings["Auto Swan Glasses"] = value
        StopTween(getgenv().Settings["Auto Swan Glasses"])
        Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if getgenv().Settings["Auto Swan Glasses"] then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Don Swan [Lv. 1000] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    pcall(function()
                                        AutoHaki()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    end)
                                until getgenv().Settings["Auto Swan Glasses"] == false or v.Humanoid.Health <= 0
                            end
                        end
                    else 
                        repeat task.wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320801, 905.48291015625)) 
                        until (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 or getgenv().Settings["Auto Swan Glasses"] == false
                    end
                end
            end
        end)
    end)
    
    Auto3:AddToggle("Auto Swan Glasses Hop",getgenv().Settings["Auto Swan Glasses Hop"],function(value)
        getgenv().Settings["Auto Swan Glasses Hop"] = value
        Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if (getgenv().Settings["Auto Swan Glasses"] and getgenv().Settings["Auto Swan Glasses Hop"]) and World2 and not game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") and not game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                    Hop()
                end
            end
        end)
    end)
    
    Auto3:AddLabel("Legendary Sword")
    Auto3:AddToggle("Auto Legendary Sword",getgenv().Settings["Auto Legendary Sword"],function(value)
        getgenv().Settings["Auto Legendary Sword"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Legendary Sword Hop"] then
                pcall(function()
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "1"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "3"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    if getgenv().Settings["Auto Legendary Sword Hop"] and getgenv().Settings["Auto Legendary Sword"] and World2 then
                        wait(10)
                        Hop()
                    end
                end)
            end 
        end
    end)
    
    Auto3:AddToggle("Auto Legendary Sword Hop",getgenv().Settings["Auto Legendary Sword Hop"],function(value)
        getgenv().Settings["Auto Legendary Sword Hop"] = value
        Save()
    end)
    Auto3:AddLabel("Enchancement Color")
    Auto3:AddToggle("Auto Enchancement Color", getgenv().Settings["Auto Color"] ,function(value)
        getgenv().Settings["Auto Color"] = value
        Save()
    end)
    
    Auto3:AddToggle("Auto Enchancement Hop",getgenv().Settings["Auto Color Hop"],function(value)
        getgenv().Settings["Auto Color Hop"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Color"] then
                local args = {
                    [1] = "ColorsDealer",
                    [2] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if getgenv().Settings["Auto Color Hop"] and getgenv().Settings["Auto Color"] and not World1 then
                    wait(10)
                    Hop()
                end
            end 
        end
    end)
    Auto3:AddLabel("Black Beard")
    Auto3:AddToggle("Auto Black Beard",getgenv().Settings["Auto Black Beard"],function(value)
        getgenv().Settings["Auto Black Beard"] = value
        StopTween(getgenv().Settings["Auto Black Beard"])
        Save()
    end)
    
    Auto3:AddToggle("Auto Black Beard Hop",getgenv().Settings["Auto Black Beard Hop"],function(value)
        getgenv().Settings["Auto Black Beard Hop"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Black Beard"] then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v.Name , "Darkbeard") then
                                repeat task.wait()
                                    EquipWeapon(getgenv().Settings["Select Weapon"])
                                    AutoHaki()
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame*CFrame.new(5,10,7))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                    v.HumanoidRootPart.Transparency = 1
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until v.Humanoid.Health <= 0 or getgenv().Settings["Auto Black Beard"] == false
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
                        repeat topos(CFrame.new(3777, 15, -3500)) wait() until (CFrame.new(3777, 15, -3500).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8                        
                        EquipWeapon("Fist of Darkness")
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                        else
                            if getgenv().Settings["Auto Black Beard Hop"] then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    local ObservationRange = Auto3:AddLabel("")
    
    spawn(function()
        while wait() do
            pcall(function()
                ObservationRange:Set("Range Level : "..math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
            end)
        end
    end)
    
    Auto3:AddToggle("Auto Farm Observation",getgenv().Settings["Auto Farm Observation"],function(value)
        getgenv().Settings["Auto Farm Observation"] = value
        StopTween(getgenv().Settings["Auto Farm Observation"])
        Save()
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Farm Observation"] then
                    repeat task.wait()
                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            game:GetService('VirtualUser'):CaptureController()
                            game:GetService('VirtualUser'):SetKeyDown('0x65')
                            wait(2)
                            game:GetService('VirtualUser'):SetKeyUp('0x65')
                        end
                    until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not getgenv().Settings["Auto Farm Observation"]
                end
            end)
        end
    end)
    
    Auto3:AddToggle("Auto Farm Observation Hop",getgenv().Settings["Auto Farm Observation Hop"],function(value)
        getgenv().Settings["Auto Farm Observation Hop"] = value
        Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if getgenv().Settings["Auto Farm Observation"] then
                    if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000 then
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Icon = "rbxassetid://0";
                            Title = "Observation", 
                            Text = "You Have Max Points"
                        })
                        wait(2)
                    else
                        if World2 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until getgenv().Settings["Auto Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]").HumanoidRootPart.CFrame * CFrame.new(0,50,0)+
                                            wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and getgenv().Settings["Auto Farm Observation Hop"] == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until getgenv().Settings["Auto Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                            end
                        elseif World1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until getgenv().Settings["Auto Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and getgenv().Settings["Auto Farm Observation Hop"]== true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until getgenv().Settings["Auto Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                            end
                        elseif World3 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until getgenv().Settings["Auto Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and getgenv().Settings["Auto Farm Observation Hop"] == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until getgenv().Settings["Auto Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                            end
                        end
                    end
                end
            end
        end)
    end)
else
    getgenv().Settings["Auto Swan Glasses"] = false
    getgenv().Settings["Auto Black Beard"] = false
   -- getgenv().Settings["Auto Farm Observation"] = false
end
if World1 then
    Auto3:AddLabel("Auto Pole V1")
    Auto3:AddToggle("Auto Pole V1" , getgenv().Settings["Auto Pole V1"], function(value)
        getgenv().Settings["Auto Pole V1"] = value
        StopTween(getgenv().Settings["Auto Pole V1"])
        Save()
    end)
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Pole V1"] then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Thunder God [Lv. 575] [Boss]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        v.HumanoidRootPart.CanCollide = false
                                        Usefastattack = true
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not getgenv().Settings["Auto Pole V1"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                        end
                    end
                end)
                else 
                if getgenv().Settings["Auto Pole V1 Hop"] then
                    Hop()
                else
                    getgenv().Settings["Auto Pole V1"] = false
            end
        end
    end
end)
    
    Auto3:AddToggle("Auto Pole V1 Hop" , getgenv().Settings["Auto Pole V1 Hop"] , function(value)
        getgenv().Settings["Auto Pole V1 Hop"] = value
        --StopTween(getgenv().Settings["Auto Pole V1"])
        Save()
    end)
    Auto3:AddLabel("Auto Saber")
    Auto3:AddToggle("Auto Saber",getgenv().Settings["Auto Saber"],function(value)
        getgenv().Settings["Auto Saber"] = value
        StopTween(getgenv().Settings["Auto Saber"])
        Save()
    end)
    
    Auto3:AddToggle("Auto Saber Hop",getgenv().Settings["Auto Saber Hop"],function(value)
        getgenv().Settings["Auto Saber Hop"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Saber"] then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Saber Expert [Lv. 200] [Boss]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    PosMonSaber = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        v.HumanoidRootPart.CanCollide = false
                                        Usefastattack = true
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CFrame = PosMonSaber
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not getgenv().Settings["Auto Saber"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                        else
                            if getgenv().Settings["Auto Saber Hop"] then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    local ObservationRange = Auto3:AddLabel("")
    
    spawn(function()
        while wait() do
            pcall(function()
                ObservationRange:Set("Range Level : "..math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
            end)
        end
    end)
    
    Auto3:AddToggle("Auto Farm Observation",getgenv().Settings["Auto Farm Observation"],function(value)
        getgenv().Settings["Auto Farm Observation"] = value
        StopTween(getgenv().Settings["Auto Farm Observation"])
        Save()
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Farm Observation"] then
                    repeat task.wait()
                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            game:GetService('VirtualUser'):CaptureController()
                            game:GetService('VirtualUser'):SetKeyDown('0x65')
                            wait(2)
                            game:GetService('VirtualUser'):SetKeyUp('0x65')
                        end
                    until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not getgenv().Settings["Auto Farm Observation"]
                end
            end)
        end
    end)
    
    Auto3:AddToggle("Auto Farm Observation Hop",getgenv().Settings["Auto Farm Observation Hop"] ,function(value)
       getgenv().Settings["Auto Farm Observation Hop"] = value
       Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if getgenv().Settings["Auto Farm Observation"] then
                    if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000 then
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Icon = "rbxassetid://0";
                            Title = "Observation", 
                            Text = "You Have Max Points"
                        })
                        wait(2)
                    else
                        if World2 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until getgenv().Settings["Auto Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]").HumanoidRootPart.CFrame * CFrame.new(0,50,0)+
                                            wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and getgenv().Settings["Auto Farm Observation Hop"] == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until getgenv().Settings["Auto Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                            end
                        elseif World1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until getgenv().Settings["Auto Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and getgenv().Settings["Auto Farm Observation Hop"] == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until getgenv().Settings["Auto Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                            end
                        elseif World3 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                    until getgenv().Settings["Auto Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                else
                                    repeat task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and getgenv().Settings["Auto Farm Observation Hop"] == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                        end
                                    until getgenv().Settings["Auto Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                                end
                            else
                                topos(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                            end
                        end
                    end
                end
            end
        end)
    end)
    else
        getgenv().Settings["Auto Pole V1"] = false
        getgenv().Settings["Auto Saber"] = false
       -- getgenv().Settings["Auto Farm Observation"] = false
end
----------------------------------------------------------------------------
if World3 then
Auto4:AddToggle("Auto Musketeer Hat",_G.AutoMusketeerHat,function(value)
        _G.AutoMusketeerHat = value
        StopTween(_G.AutoMusketeerHat)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoMusketeerHat then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Forest Pirate [Lv. 1825]" then
                                        repeat task.wait()
                                            pcall(function()
                                                EquipWeapon(getgenv().Settings["Select Weapon"])
                                                AutoHaki()
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                v.HumanoidRootPart.CanCollide = false
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                MusketeerHatMon = v.HumanoidRootPart.CFrame
                                                StartMagnetMusketeerhat = true
                                            end)
                                        until _G.AutoMusketeerHat == false or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        StartMagnetMusketeerhat = false
                                    end
                                end
                            else
                                StartMagnetMusketeerhat = false
                                topos(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                            end
                        else
                            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                            if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
                                        OldCFrameElephant = v.HumanoidRootPart.CFrame
                                        repeat task.wait()
                                            pcall(function()
                                                EquipWeapon(getgenv().Settings["Select Weapon"])
                                                AutoHaki()
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.CFrame = OldCFrameElephant
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            end)
                                        until _G.AutoMusketeerHat == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    end
                                end
                            else
                                topos(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                            end
                        else
                            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                            if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
                        topos(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
                    end
                end
            end
        end)
    end)
    
    Auto4:AddToggle("Unlock Advance Dungeon",_G.AutoAdvanceDungeon,function(value)
        _G.AutoAdvanceDungeon = value
        StopTween(_G.AutoAdvanceDungeon)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoAdvanceDungeon then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird-Bird: Phoenix") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400 then
                                topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                                if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Check")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Heal")
                                end
                            end
                        elseif game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                            if game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400 then
                                topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                                if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Check")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist","Heal")
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
    Auto4:AddToggle("Auto Rainbow Haki",_G.Auto_Rainbow_Haki,function(value)
        _G.Auto_Rainbow_Haki = value
        StopTween(_G.Auto_Rainbow_Haki)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_Rainbow_Haki then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Stone [Lv. 1550] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Island Empress [Lv. 1675] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, -0, -0.994878292, -0, 1, -0, 0.994878292, 0, -0.101080291))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08, 0.714521289))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
                        end
                    else
                        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    end
                end
            end
        end)
    end)
    
    Auto4:AddToggle("Auto Observation Haki v2",getgenv().Settings["Auto Farm Observation V2"],function(value)
        getgenv().Settings["Auto Farm Observation V2"] = value
        StopTween(getgenv().Settings["Auto Farm Observation V2"])
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Farm Observation V2"] then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 3 then
                        _G.AutoMusketeerHat = false
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and  game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
                            repeat 
                                topos(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
                                wait() 
                            until not getgenv().Settings["Auto Farm Observation V2"] or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                            repeat 
                                topos(CFrame.new(-10920.125, 624.20275878906, -10266.995117188)) 
                                wait() 
                            until not getgenv().Settings["Auto Farm Observation V2"] or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
                        else
                            for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                                if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
                                    v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10)
                                    wait()
                                    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
                                    wait()
                                end
                            end   
                        end
                    else
                        _G.AutoMusketeerHat = true
                    end
                end
            end)
        end
    end)
    
    Auto4:AddToggle("Auto Yama",_G.AutoYama,function(value)
        _G.AutoYama = value
        StopTween(_G.AutoYama)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoYama then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                    repeat wait(.1)
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
                end
            end
        end
    end)
    
    Auto4:AddToggle("Auto Tushita Torch Puzzle",_G.AutoHolyTorch,function(value)
        _G.AutoHolyTorch = value
        StopTween(_G.AutoHolyTorch)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoHolyTorch then
                pcall(function()
                    wait(1)
                    TP(CFrame.new(-10752, 417, -9366))
                    wait(1)
                    TP(CFrame.new(-11672, 334, -9474))
                    wait(1)
                    TP(CFrame.new(-12132, 521, -10655))
                    wait(1)
                    TP(CFrame.new(-13336, 486, -6985))
                    wait(1)
                    TP(CFrame.new(-13489, 332, -7925))
                end)
            end
        end
    end)
elseif World2 then
    Auto4:AddToggle("Auto Bartlio Quest",_G.AutoBartilo,function(value)
        _G.AutoBartilo = value
        StopTween(_G.AutoBartilo)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoBartilo then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                            if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                                Ms = "Swan Pirate [Lv. 775]"
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then
                                        pcall(function()
                                            repeat task.wait()
                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                                EquipWeapon(getgenv().Settings["Select Weapon"])
                                                AutoHaki()
                                                v.HumanoidRootPart.Transparency = 1
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))													
                                                PosMonBarto =  v.HumanoidRootPart.CFrame
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                AutoBartiloBring = true
                                            until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            AutoBartiloBring = false
                                        end)
                                    end
                                end
                            else
                                repeat topos(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)).Magnitude <= 10
                            end
                        else
                            repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                        end 
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            Ms = "Jeremy [Lv. 850] [Boss]"
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Ms then
                                    OldCFrameBartlio = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        EquipWeapon(getgenv().Settings["Select Weapon"])
                                        AutoHaki()
                                        v.HumanoidRootPart.Transparency = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.HumanoidRootPart.CFrame = OldCFrameBartlio
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                            wait(1)
                            repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                            wait(2)
                        else
                            repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                        repeat topos(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
                        wait(1)
                        repeat topos(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
                    end
                end 
            end
        end)
    end)
    
    Auto4:AddToggle("Auto Rengoku",_G.AutoRengoku,function(value)
        _G.AutoRengoku = value
        StopTween(_G.AutoRengoku)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoRengoku then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                        EquipWeapon("Hidden Key")
                        topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    EquipWeapon(getgenv().Settings["Select Weapon"])
                                    AutoHaki()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    RengokuMon = v.HumanoidRootPart.CFrame
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    StartRengokuMagnet = true
                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
                                StartRengokuMagnet = false
                            end
                        end
                    else
                        StartRengokuMagnet = false
                        topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                    end
                end
            end
        end)
    end)
    
    Auto4:AddToggle("Auto Evo Race",_G.Auto_EvoRace,function(value)
        _G.Auto_EvoRace = value
        StopTween(_G.Auto_EvoRace)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_EvoRace then
                    if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                            topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                            if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.3)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                            pcall(function()
                                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                    topos(game:GetService("Workspace").Flower1.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                    topos(game:GetService("Workspace").Flower2.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie [Lv. 950]") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Zombie [Lv. 950]" then
                                                repeat task.wait()
                                                    AutoHaki()
                                                    EquipWeapon(getgenv().Settings["Select Weapon"])
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                    PosMonEvo = v.HumanoidRootPart.CFrame
                                                    StartEvoMagnet = true
                                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_EvoRace == false
                                                StartEvoMagnet = false
                                            end
                                        end
                                    else
                                        StartEvoMagnet = false
                                        topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                    end
                                end
                            end)
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                        end
                    end
                end
            end
        end)
    end)
    
end
----------------------------------------------------------------------------
--// Players \\
local plyserv = Combat:AddLabel("Players")
    spawn(function()
        while wait() do
            pcall(function()
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if i == 12 then
                        plyserv:Set("Players :".." "..i.." ".."/".." ".."12".." ".."(Max)")
                    elseif i == 1 then
                        plyserv:Set("Player :".." "..i.." ".."/".." ".."12")
                    else
                        plyserv:Set("Players :".." "..i.." ".."/".." ".."12")
                    end
                end
            end)
        end
    end)
    
    Playerslist = {}
    
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(Playerslist,v.Name)
    end
    
    local SelectedPly = Combat:AddDropdown("Select Players",Playerslist,false,function(value)
        _G.SelectPly = value
    end)
    
    Combat:AddButton("Refresh Player",function()
        Playerslist = {}
        SelectedPly:Refresh()
        for i,v in pairs(game:GetService("Players"):GetChildren()) do  
            SelectedPly:Add(v.Name)
        end
    end)
    
    Combat:AddToggle("Spectate Selected Player",false,function(value)
        SpectatePlys = value
        local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
        local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
        repeat wait(.1)
            game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
        until SpectatePlys == false 
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
    end)
    
    Combat:AddToggle("Teleport Selected Player",false,function(value)
        _G.TeleportPly = value
        pcall(function()
            if _G.TeleportPly then
                repeat topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame) wait() until _G.TeleportPly == false
            end
            StopTween(_G.TeleportPly)
        end)
    end)
    
    Combat:AddToggle("Kill Selected Player",false,function(value)
        _G.Auto_Kill_Ply = value
        StopTween(_G.Auto_Kill_Ply)
    end)
    
    spawn(function()
        while wait() do
            if _G.Auto_Kill_Ply then
                pcall(function()
                    if _G.SelectPly ~= nil then 
                        if game.Players:FindFirstChild(_G.SelectPly) then
                            if game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                                repeat task.wait()
                                   -- EquipWeapon(getgenv().Settings["Select Weapon"])
                                    AutoHaki()
                                    game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CanCollide = false
                                    Usefastattack = false
                                    topos(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0,getgenv().Settings["Distance Player"],0))
                                    if _G.SkillPlayer then
                                    UseTot = true
                                    topos(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0,getgenv().Settings["Distance Player"],0) * CFrame.Angles(math.rad(-90), 0, 0))
                                    v.Head.CanCollide = false
											--game:GetService("VirtualUser"):CaptureController(Vector2.new(1280, 672))
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(5,5,4)
                                    end
                                    spawn(function()
                                        pcall(function()
                                            if getgenv().Settings["Select Weapon"] == SelectWeaponGun then
                                                local args = {
                                                    [1] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position,
                                                    [2] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart
                                                }
                                                game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                            else
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                            end
                                        end)
                                    end)
                                until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not game.Players:FindFirstChild(_G.SelectPly) or not _G.Auto_Kill_Ply
                                UseTot = false
                            end
                        end
                    end
                end)
            end
        end
    end)
    Combat:AddSeperator("/ Setting Combat \\")
    Combat:AddSlider("Distance to Player",1,getgenv().Settings["Distance Player"],60,false,function(value)
        getgenv().Settings["Distance Player"] = value
    end)
    
Combat:AddToggle("Auto Skill to Player" , false, function(value)
    _G.SkillPlayer = value
end)
Combat:AddToggle("Skill Z" , false , function(value)
    _G.PlayerZ = value
end)
Combat:AddToggle("Skill X" , false , function(value)
    _G.PlayerX = value
end)
Combat:AddToggle("Skill C" , false , function(value)
    _G.PlayerC = value
end)
Combat:AddToggle("Skill V" , false, function(value)
    _G.PlayerV = value
end)


   
	
spawn(function()
	while wait(.1) do
			pcall(function()
			    if UseTot then
                if _G.SkillPlayer == true then
					if _G.PlayerZ then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.PlayerX then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.PlayerC then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                    if _G.PlayerV then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
                    if _G.PlayerZ then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.PlayerX then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.PlayerC then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                    if _G.PlayerZ then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(0.3)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.PlayerX then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.PlayerC then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(0.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                    if _G.PlayerV then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough-Dough") then
                   if _G.PlayerZ then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.PlayerX then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.PlayerC then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                    if _G.PlayerV then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                        wait(2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                    end 
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") then
                    if _G.PlayerZ then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.PlayerX then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.PlayerC then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then
                    if _G.PlayerZ then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
						game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
						wait(1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.PlayerX then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        wait(0.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.PlayerC then
						local args = {
							[1] = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position
						}
						game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                end
			end
		end)
	end
end)
   
                    
    
    
    
    Combat:AddSeperator("/ Aimbot \\")
    spawn(function()
        while wait() do
            pcall(function()
                local MaxDistance = math.huge
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                        local Distance = v:DistanceFromCharacter(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)
                        if Distance < MaxDistance then
                            MaxDistance = Distance
                            PlayerSelectAimbot = v.Name
                        end
                    end
                end
            end)
        end
    end)
    
    Combat:AddToggle("Aimbot Gun",getgenv().Settings["Aimbot Skill"],function(value)
        getgenv().Settings["Aimbot Skill"] = value
        Save()
    end)
    
    spawn(function()
        while task.wait() do
            if getgenv().Settings["Aimbot Gun"] and game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponGun) then
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].Cooldown.Value = 0
                    local args = {
                        [1] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart.Position,
                        [2] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart
                    }
                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                    game:GetService'VirtualUser':CaptureController()
                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                end)
            end
        end
    end)
    
    Combat:AddToggle("Aimbot Skill",getgenv().Settings["Aimbot Skill"],function(value)
        getgenv().Settings["Aimbot Skill"] = value
        Save()
    end)
    
    spawn(function()
        pcall(function()
            while task.wait() do
                if getgenv().Settings["Aimbot Skill"] and PlayerSelectAimbot ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
                    local args = {
                        [1] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart.Position
                    }
                    
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name).RemoteEvent:FireServer(unpack(args))
                end
            end
        end)
    end)
    Combat:AddSeperator("/ PvP \\")
    Combat:AddToggle("Enabled PvP",false,function(value)
        _G.EnabledPvP = value
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.EnabledPvP then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)
    
    Combat:AddToggle("Safe Mode",false,function(value)
        _G.Safe_Mode = value
        StopTween(_G.Safe_Mode)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Safe_Mode then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end)
    end)
    
    Combat:AddButton("Respawn",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
        wait()
    end)
    Bounti:AddSeperator("/ Bounty \\")
    local Current = Bounti:AddLabel("Current Bounties :")
    
    local Bounty = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
    local sub = string.sub 
    local len = string.len
    spawn(function()
        while wait() do
            pcall(function()
                if len(Bounty) == 4 then
                    Bounty1 = sub(Bounty,1,1).."."..sub(Bounty,2,3).."K"
                elseif len(Bounty) == 5 then
                    Bounty1 = sub(Bounty,1,2).."."..sub(Bounty,3,4).."K"
                elseif len(Bounty) == 6 then
                    Bounty1 = sub(Bounty,1,3).."."..sub(Bounty,4,5).."K"
                elseif len(Bounty) == 7 then
                    Bounty1 = sub(Bounty,1,1).."."..sub(Bounty,2,3).."M"
                elseif len(Bounty) == 8 then
                    Bounty1 = sub(Bounty,1,2).."."..sub(Bounty,3,4).."M"
                elseif len(Bounty) <= 3 then
                    Bounty1 = Bounty
                end
                if tonumber(Bounty) == 25000000 then
                    Current:Set("Current Bounties : "..Bounty1.." [ Max ]")
                elseif tonumber(Bounty) < 25000000 then
                    Current:Set("Current Bounties : "..Bounty1)
                end
            end)
        end
    end)
    
    local Earn = Bounti:AddLabel("Earned")
    local OldBounty = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
    local Bounty = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
    local Earned = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value - OldBounty)
    local sub = string.sub 
    local len = string.len
    spawn(function()
        while wait() do
            pcall(function()
                if len(Earned) == 4 then
                    Earned1 = sub(Earned,1,1).."."..sub(Earned,2,3).."K"
                elseif len(Earned) == 5 then
                    Earned1 = sub(Earned,1,2).."."..sub(Earned,3,4).."K"
                elseif len(Earned) == 6 then
                    Earned1 = sub(Earned,1,3).."."..sub(Earned,4,5).."K"
                elseif len(Earned) == 7 then
                    Earned1 = sub(Earned,1,1).."."..sub(Earned,2,3).."M"
                elseif len(Earned) == 8 then
                    Earned1 = sub(Earned,1,2).."."..sub(Earned,3,4).."M"
                elseif len(Earned) <= 3 then
                    Earned1 = Earned
                end
                Earn:Set("Earned : "..tonumber(Earned1))
            end)
        end
    end)
    
    Bounti:AddToggle("Auto Farm Bounty",getgenv().Settings["Auto Farm Bounty"],function(value)
        getgenv().Settings["Auto Farm Bounty"] = value
        StopTween(getgenv().Settings["Auto Farm Bounty"])
        Save()
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Farm Bounty"] then
                    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Shirt") then
                            v:Destroy()
                        end
                        if v:IsA("Pants") then
                            v:Destroy()
                        end
                        if v:IsA("Accessory") then
                            v:Destroy()
                        end
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        pcall(function()
            if getgenv().Settings["Auto Farm Bounty"] then
                while wait() do
                    if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Farm Bounty"] then
                    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while task.wait() do
            pcall(function()
                if getgenv().Settings["Auto Farm Bounty"] then
                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].Cooldown.Value = 0
                    spawn(function()
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = false
                        game.Players.LocalPlayer.Character.Animate.Disabled = true
                    end)
                end
            end)
        end
    end)
    CastlePostoMansion = CFrame.new(-5084.8447265625, 316.48101806641, -3145.3752441406)
    MansiontoCastlePos = CFrame.new(-12464.596679688, 376.30590820312, -7567.2626953125)
    Castletophydra = CFrame.new(-5095.33984375, 316.48101806641, -3168.3134765625)
    HydratoCastle = CFrame.new(5741.869140625, 611.94750976562, -282.61154174805)
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Farm Bounty"] then
                    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                        if v.Name ~= game.Players.LocalPlayer.Name then
                            if v:WaitForChild("Humanoid").Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 17000 then
                                plyselecthunthelpold = v.Humanoid.Health
                                repeat task.wait()
                                    EquipWeapon(SelectWeaponGun)
                                    NameTarget = v.Name
                                    if tostring(game.Players.LocalPlayer.Team) == "Pirates" then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,60,-20))
                                    elseif tostring(game.Players.LocalPlayer.Team) == "Marines" then
                                        if game.Players[NameTarget].Team ~= game.Players.LocalPlayer.Team then
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,60,-20))
                                        end
                                    end
                                    spawn(function()
                                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
                                            StartCheckTarget = true
                                        end
                                    end)
                                    v.HumanoidRootPart.CanCollide = false
                                    spawn(function()
                                        pcall(function()
                                            local args = {
                                                [1] = v.HumanoidRootPart.Position,
                                                [2] = v.HumanoidRootPart
                                            }
                                            game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                        end)
                                    end)
                                    TargetSelectHunt = v.Humanoid
                                until getgenv().Settings["Auto Farm Bounty"] == false or v.Humanoid.Health == 0 or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or not v.Parent or NextplySelect == true
                                NextplySelect = false
                                StartCheckTarget = false
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        pcall(function()
            while task.wait() do
                if getgenv().Settings["Auto Farm Bounty"] then
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible = false
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.SafeZone.Visible = false
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if getgenv().Settings["Auto Farm Bounty"] then
                    if TargetSelectHunt ~= nil then
                        if StartCheckTarget then
                            wait(6.5)
                            if TargetSelectHunt.Health == TargetSelectHunt.MaxHealth or TargetSelectHunt.Health >= plyselecthunthelpold then
                                NextplySelect = true
                                TargetSelectHunt = nil
                            end
                        end
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if getgenv().Settings["Auto Farm Bounty"] then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)
    
    Bounti:AddToggle("Auto Farm Bounty Hop",getgenv().Settings["Auto Farm Bounty Hop"],function(value)
        getgenv().Settings["Auto Farm Bounty Hop"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            if getgenv().Settings["Auto Farm Bounty"] then
                if getgenv().Settings["Auto Farm Bounty Hop"] then
                    pcall(function()
                        wait(120)
                        Hop()
                    end)
                end
            end
        end
    end)
    Bounti:AddButton("Next Player",function()
        NextplySelect = true
        wait(.1)
        NextplySelect = false
    end)
    
    Bounti:AddSlider("Lock Bounty",1,getgenv().Settings["Lock Bounty"],25000000,getgenv().Settings["Lock Bounty"],function(value)
        getgenv().Settings["Lock Bounty"] = value
        Save()
    end)
    
    Bounti:AddToggle("Start Bounty Lock",_G.LockBountyToggle,function(value)
        _G.LockBountyToggle = value
        --Save()
    end)
    
    spawn(function()
        while wait() do
            if _G.LockBountyToggle then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value >= getgenv().Settings["Lock Bounty"] then
                        game:GetService("Players").LocalPlayer:Kick("Successfully! Bounty Farm")
                    end
                end)
            end
        end
    end)
----------------------------------------------------------------------------
--// Stats \\
    local Pointstat = Stats:AddLabel("Stat Points")
    
    spawn(function()
        while wait() do
            pcall(function()
                Pointstat:Set("Stat Points : "..tostring(game:GetService("Players")["LocalPlayer"].Data.Points.Value))
            end)
        end
    end)
    
    Stats:AddToggle("Auto Melee",getgenv().Settings["Auto Melee"],function(value)
        getgenv().Settings["Auto Melee"] = value
        Save()
    end)
    
    Stats:AddToggle("Auto Defense",getgenv().Settings["Auto Defense"],function(value)
        getgenv().Settings["Auto Defense"] = value
        Save()
    end)
    
    Stats:AddToggle("Auto Sword",getgenv().Settings["Auto Sword"],function(value)
       getgenv().Settings["Auto Sword"] = value
       Save()
    end)
    
    Stats:AddToggle("Auto Gun",getgenv().Settings["Auto Gun"],function(value)
        getgenv().Settings["Auto Gun"] = value
        Save()
    end)
    
    Stats:AddToggle("Auto Devil Fruits",getgenv().Settings["Auto Devil Fruits"],function(value)
        getgenv().Settings["Auto Devil Fruits"] = value
        Save()
    end)
    
    _G.PointStats = 1
    Stats:AddSlider("Select Point",1,1,100,false ,function(value)
        _G.PointStats = value
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Melee"] then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",_G.PointStats)
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Defense"] then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",_G.PointStats)
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Sword"] then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",_G.PointStats)
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Gun"] then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",_G.PointStats)
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Auto Devil Fruits"] then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",_G.PointStats)
                    end
                end
            end)
        end
    end)

----------------------------------------------------------------------------
--// Teleport \\
Teleport:AddSeperator("/ Islands \\")
 if World1 then
        Teleport:AddDropdown("Select Island",{
            "WindMill",
            "Marine",
            "Middle Town",
            "Jungle",
            "Pirate Village",
            "Desert",
            "Snow Island",
            "MarineFord",
            "Colosseum",
            "Sky Island 1",
            "Sky Island 2",
            "Sky Island 3",
            "Prison",
            "Magma Village",
            "Under Water Island",
            "Fountain City",
            "Shank Room",
            "Mob Island"
            },false,function(value)
            _G.SelectIsland = value
        end)
    end
    
    if World2 then
        Teleport:AddDropdown("Select Island",{
            "The Cafe",
            "Frist Spot",
            "Dark Area",
            "Flamingo Mansion",
            "Flamingo Room",
            "Green Zone",
            "Factory",
            "Colossuim",
            "Zombie Island",
            "Two Snow Mountain",
            "Punk Hazard",
            "Cursed Ship",
            "Ice Castle",
            "Forgotten Island",
            "Ussop Island",
            "Mini Sky Island"
            },false,function(value)
            _G.SelectIsland = value
        end)
    end
    
    if World3 then
        Teleport:AddDropdown("Select Island",{
            "Mansion",
            "Port Town",
            "Great Tree",
            "Castle On The Sea",
            "MiniSky", 
            "Hydra Island",
            "Floating Turtle",
            "Haunted Castle",
            "Ice Cream Island",
            "Peanut Island",
            "Cake Island",
            "Room Enma/Yama & Secret Temple",
            "CakeLoaf"
            },false,function(value)
            _G.SelectIsland = value
        end)
    end
    
    Teleport:AddToggle("Teleport to Island",false,function(value)
        _G.TeleportIsland = value
        if _G.TeleportIsland == true then
            repeat wait()
                if _G.SelectIsland == "WindMill" then
                    topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                elseif _G.SelectIsland == "Marine" then
                    topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                elseif _G.SelectIsland == "Middle Town" then
                    topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                elseif _G.SelectIsland == "Jungle" then
                    topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                elseif _G.SelectIsland == "Pirate Village" then
                    topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                elseif _G.SelectIsland == "Desert" then
                    topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                elseif _G.SelectIsland == "Snow Island" then
                    topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                elseif _G.SelectIsland == "MarineFord" then
                    topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                elseif _G.SelectIsland == "Colosseum" then
                    topos( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                elseif _G.SelectIsland == "Sky Island 1" then
                    topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                elseif _G.SelectIsland == "Sky Island 2" then  
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                elseif _G.SelectIsland == "Sky Island 3" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                elseif _G.SelectIsland == "Prison" then
                    topos( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                elseif _G.SelectIsland == "Magma Village" then
                    topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                elseif _G.SelectIsland == "Under Water Island" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif _G.SelectIsland == "Fountain City" then
                    topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                elseif _G.SelectIsland == "Shank Room" then
                    topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                elseif _G.SelectIsland == "Mob Island" then
                    topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                elseif _G.SelectIsland == "The Cafe" then
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                elseif _G.SelectIsland == "Frist Spot" then
                    topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                elseif _G.SelectIsland == "Dark Area" then
                    topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                elseif _G.SelectIsland == "Flamingo Mansion" then
                    topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                elseif _G.SelectIsland == "Flamingo Room" then
                    topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                elseif _G.SelectIsland == "Green Zone" then
                    topos( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                elseif _G.SelectIsland == "Factory" then
                    topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                elseif _G.SelectIsland == "Colossuim" then
                    topos( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                elseif _G.SelectIsland == "Zombie Island" then
                    topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                elseif _G.SelectIsland == "Two Snow Mountain" then
                    topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                elseif _G.SelectIsland == "Punk Hazard" then
                    topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                elseif _G.SelectIsland == "Cursed Ship" then
                    topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                elseif _G.SelectIsland == "Ice Castle" then
                    topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                elseif _G.SelectIsland == "Forgotten Island" then
                    topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                elseif _G.SelectIsland == "Ussop Island" then
                    topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                elseif _G.SelectIsland == "Mini Sky Island" then
                    topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                elseif _G.SelectIsland == "Great Tree" then
                    topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                elseif _G.SelectIsland == "Castle On The Sea" then
                    topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
                elseif _G.SelectIsland == "MiniSky" then
                    topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                elseif _G.SelectIsland == "Port Town" then
                    topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
                elseif _G.SelectIsland == "Hydra Island" then
                    topos(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
                elseif _G.SelectIsland == "Floating Turtle" then
                    topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                elseif _G.SelectIsland == "Mansion" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                elseif _G.SelectIsland == "Haunted Castle" then
                    topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
                elseif _G.SelectIsland == "Ice Cream Island" then
                    topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
                elseif _G.SelectIsland == "Peanut Island" then
                    topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                elseif _G.SelectIsland == "Cake Island" then
                    topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                elseif _G.SelectIsland == "CakeLoaf" then
                    topos(CFrame.new(-1762, 38, -11878))
                elseif _G.SelectIsland == "Room Enma/Yama & Secret Temple" then
                    topos(CFrame.new(5247, 7, 1097))
                end
            until not _G.TeleportIsland
        end
        StopTween(_G.TeleportIsland)
    end)

Teleport:AddSeperator("/ NPC \\")
-- NPC
if World1 then
    Teleport:AddDropdown("Select NPC",{
    "Random Devil Fruit",
    "Blox Fruits Dealer",
    "Remove Devil Fruit", 
    "Ability Teacher",
    "Dark Step",
    "Electro",
    "Fishman Karate"
},false,function(value)
        _G.SelectNPC = value
    end)
end

if World2 then
    Teleport:AddDropdown("Select NPC",{
        "Dargon Breath",
        "Mtsterious Man",
		"Mysterious Scientist",
		"Awakening Expert", 
		"Nerd",
		"Bar Manager",
		"Blox Fruits Dealer",
        "Trevor", 
		"Plokster",
		"Enhancement Editor", 
		"Pirate Recruiter",
		"Marines Recruiter",
		"Chemist", 
		"Cyborg", 
		"Ghoul Mark", 
		"Guashiem",
		"El Admin",
        "El Rodolfo", 
        "Arowe" },false,function(value)
            _G.SelectNPC = value
        end)
    end

    if World3 then
        Teleport:AddDropdown("Select NPC",{
            "Random Devil Fruit",
			"Blox Fruits Dealer",
			"Remove Devil Fruit",
			"Horned Man",
			"Hungey Man",
			"Previous Hero",
			"Butler",
			"Lunoven" ,
		    "Elite Hunter",
			"Player Hunter" ,
			"Uzoth", },false,function(value)
                _G.SelectNPC = value
            end)
        end
    
        Teleport:AddToggle("Teleport to NPC",false,function(value)
            _G.TeleportNPC = value
            if _G.TeleportNPC == true then
                repeat wait()
                   

                    if World1 and _G.SelectNPC == "Random Devil Fruit" then
                        topos(CFrame.new(-1436.19727, 61.8777695, 4.75247526, -0.557794094, 2.74216543e-08, 0.829979479, 5.83273234e-08, 1, 6.16037932e-09, -0.829979479, 5.18467118e-08, -0.557794094))
                    elseif _G.SelectNPC == "Blox Fruit Dealer" then
                        topos(CFrame.new(-923.255066, 7.67800522, 1608.61011, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Remove Devil Fruit" then
                        topos(CFrame.new(5664.80469, 64.677681, 867.85907, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Ability Teacher" then
                        topos(CFrame.new(-1057.67822, 9.65220833, 1799.49146, -0.865874112, -9.26330159e-08, 0.500262439, -7.33759435e-08, 1, 5.816689e-08, -0.500262439, 1.36579752e-08, -0.865874112))
                    elseif _G.SelectNPC == "Dark Step" then
                        topos(CFrame.new(-987.873047, 13.7778397, 3989.4978, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Electro" then
                        topos(CFrame.new(-5389.49561, 13.283, -2149.80151, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectPoints == "Fishman Karate" then
                        topos(CFrame.new(61581.8047, 18.8965912, 987.832703, 1, 0, 0, 0, 1, 0, 0, 0, 1))

                    
                    elseif World2 and _G.SelectNPC == "Dargon Breath" then
                        topos(CFrame.new(703.372986, 186.985519, 654.522034, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Mtsterious Man" then
                        topos(CFrame.new(-2574.43335, 1627.92371, -3739.35767, 0.378697902, -9.06400288e-09, 0.92552036, -8.95582009e-09, 1, 1.34578926e-08, -0.92552036, -1.33852689e-08, 0.378697902))
                    elseif _G.SelectNPC == "Mysterious Scientist" then
                        topos(CFrame.new(-6437.87793, 250.645355, -4498.92773, 0.502376854, -1.01223634e-08, -0.864648759, 2.34106086e-08, 1, 1.89508653e-09, 0.864648759, -2.11940012e-08, 0.502376854))
                    elseif _G.SelectNPC == "Awakening Expert" then
                        topos(CFrame.new(-408.098846, 16.0459061, 247.432846, 0.028394036, 6.17599138e-10, 0.999596894, -5.57905944e-09, 1, -4.59372484e-10, -0.999596894, -5.56376767e-09, 0.028394036))
                    elseif _G.SelectNPC == "Nerd" then
                        topos(CFrame.new(-401.783722, 73.0859299, 262.306702, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Bar Manager" then
                        topos(CFrame.new(-385.84726, 73.0458984, 316.088806, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Blox Fruits Dealer" then
                        topos(CFrame.new(-450.725464, 73.0458984, 355.636902, -0.780352175, -2.7266168e-08, 0.625340283, 9.78516468e-09, 1, 5.58128797e-08, -0.625340283, 4.96727601e-08, -0.780352175))
                    elseif _G.SelectNPC == "Trevor" then
                        topos(CFrame.new(-341.498322, 331.886444, 643.024963, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Plokster" then
                        toposCFrame.new(-1885.16016, 88.3838196, -1912.28723, -0.513468027, 0, 0.858108759, 0, 1, 0, -0.858108759, 0, -0.513468027)()
                    elseif _G.SelectNPC == "Enhancement Editor" then
                        topos(CFrame.new(-346.820221, 72.9856339, 1194.36218, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Pirate Recruiter" then
                        topos(CFrame.new(-428.072998, 72.9495239, 1445.32422, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Marines Recruiter" then
                        topos(CFrame.new(-1349.77295, 72.9853363, -1045.12964, 0.866493046, 0, -0.499189168, 0, 1, 0, 0.499189168, 0, 0.866493046))
                    elseif _G.SelectNPC == "Chemist" then
                        topos(CFrame.new(-2777.45288, 72.9919434, -3572.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Cyborg" then
                        topos(CFrame.new(629.146851, 312.307373, -531.624146, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Ghoul Mark" then
                        topos(CFrame.new(635.172546, 125.976357, 33219.832, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    elseif _G.SelectNPC == "Guashiem" then
                        topos(CFrame.new(937.953003, 181.083359, 33277.9297, 1, -8.60126406e-08, 3.81773896e-17, 8.60126406e-08, 1, -1.89969598e-16, -3.8177373e-17, 1.89969598e-16, 1))
                    elseif _G.SelectNPC == "El Admin" then
                        topos(CFrame.new(1322.80835, 126.345039, 33135.8789, 0.988783717, -8.69797603e-08, -0.149354503, 8.62223786e-08, 1, -1.15461916e-08, 0.149354503, -1.46101409e-09, 0.988783717))
                    elseif _G.SelectNPC == "El Rodolfo" then
                        topos(CFrame.new(941.228699, 40.4686775, 32778.9922, -0.818029106, -1.19524382e-08, 0.575176775, -1.28741648e-08, 1, 2.47053866e-09, -0.575176775, -5.38394795e-09, -0.818029106))
                    elseif _G.SelectNPC == "Arowe" then
                        topos(CFrame.new(-1994.51038, 125.519142, -72.2622986, -0.16715166, -6.55417338e-08, -0.985931218, -7.13315558e-08, 1, -5.43836585e-08, 0.985931218, 6.12376851e-08, -0.16715166))
                    

                        
                       
                   
                    elseif World3 and _G.SelectNPC == "Random Devil Fruit" then
                        topos(CFrame.new(-12491, 337, -7449))
                    elseif _G.SelectNPC == "Blox Fruits Dealer" then
                        topos(CFrame.new(-12511, 337, -7448))
                    elseif _G.SelectNPC == "Remove Devil Fruit" then
                        topos(CFrame.new(-5571, 1089, -2661))
                    elseif _G.SelectNPC == "Horned Man" then
                        topos(CFrame.new(-11890, 931, -8760))
                    elseif _G.SelectNPC == "Hungey Man" then
                        topos(CFrame.new(-10919, 624, -10268))
                    elseif _G.SelectNPC == "Previous Hero" then
                        topos(CFrame.new(-10368, 332, -10128))
                    elseif _G.SelectNPC == "Butler" then
                        topos(CFrame.new(-5125, 316, -3130))
                    elseif _G.SelectNPC == "Lunoven" then
                        topos(CFrame.new(-5117, 316, -3093))
                    elseif _G.SelectNPC == "Elite Hunter" then
                        topos(CFrame.new(-5420, 314, -2828))
                    elseif _G.SelectNPC == "Player Hunter" then
                        topos(CFrame.new(-5559, 314, -2840))
                    elseif _G.SelectNPC == "Uzoth" then
                        topos(CFrame.new(-9785, 852, 6667))

                    end
                until not _G.TeleportNPC
            end
            StopTween(_G.TeleportNPC)
        end)
        
        function TP(P1)
    Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 400
    elseif Distance < 1000 then
        Speed = 350
    elseif Distance >= 1000 then
        Speed = 200
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P1}
    ):Play()
end
Teleport2:AddButton("Teleport To Old World",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end)
    
    Teleport2:AddButton("Teleport To Second Sea",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end)
    
    Teleport2:AddButton("Teleport To Third Sea",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end)
    
    Teleport2:AddButton("Teleport to Seabeast",function()
        for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                topos(v.HumanoidRootPart.CFrame*CFrame.new(0,100,0))
            end
        end
    end)
----------------------------------------------------------------------------
if World1 then
    Dungeon:AddLabel("USE IN SECOND / THIRD SEA !")
    else
local TimeRaid = Dungeon:AddLabel("")
    
    spawn(function()
        pcall(function()
            while wait() do
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    TimeRaid:Set(game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Text)
                else
                    TimeRaid:Set("Wait For Dungeon")
                end
            end
        end)
    end)
    
    Dungeon:AddToggle("Manual Kill Aura",_G.Raids,function(value)
_G.Raids = value
end)
spawn(function()
    while wait() do 
        pcall(function()
            if _G.Raids then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.ClassName == "Model" and v.Humanoid.Health > 0 then
                        v.Humanoid.Health = Die
                    end
                end
            end
        end)
    end
end)

    Dungeon:AddButton("Next Island",function()
        pcall(function()
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,70,100))
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,70,100))
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,70,100))
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,70,100))
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0,70,100))
            end
        end)
    end)
end
if World1 then
    Dungeon2:AddLabel("USE IN SECOND / THIRD SEA !")
    else
    Dungeon2:AddLabel("Auto Farm Dungeon \nAlready Have Kill Aura!")
    Dungeon2:AddToggle("Auto Farm Dungeon",_G.Auto_Dungeon,function(value)
        _G.Auto_Dungeon = value
        StopTween(_G.Auto_Dungeon)
    end)
    
    spawn(function()
        pcall(function() 
            while wait() do
                if _G.Auto_Dungeon then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                pcall(function()
                                    repeat wait()
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                        v.Humanoid.Health = 0
                                        v.HumanoidRootPart.CanCollide = false
                                    until not _G.Auto_Dungeon or not v.Parent or v.Humanoid.Health <= 0
                                end)
                            end
                        end
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.Auto_Dungeon then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                        if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,80,100))
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,80,100))
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,80,100))
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,80,100))
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0,80,100))
                        end
                    end
                end
            end
        end)
    end)
    
    Dungeon2:AddToggle("Auto Awaken",_G.Auto_Awakener,function(value)
        _G.Auto_Awakener = value
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_Awakener then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
                end
            end
        end)
    end)
    
    --Dungeon:AddSeperator()
    
    Dungeon2:AddDropdown("Select Chips",{"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix"},false,function(value)
        _G.SelectChip = value
    end)
    
    Dungeon2:AddToggle("Auto Select Dungeon",_G.AutoSelectDungeon,function(value)
        _G.AutoSelectDungeon = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSelectDungeon then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame-Flame") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame-Flame") then
                        _G.SelectChip = "Flame"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice-Ice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice-Ice") then
                        _G.SelectChip = "Ice"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake-Quake") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake-Quake") then
                        _G.SelectChip = "Quake"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light-Light") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light-Light") then
                        _G.SelectChip = "Light"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark-Dark") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark-Dark") then
                        _G.SelectChip = "Dark"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("String-String") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String-String") then
                        _G.SelectChip = "String"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble-Rumble") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble-Rumble") then
                        _G.SelectChip = "Rumble"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma-Magma") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma-Magma") then
                        _G.SelectChip = "Magma"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                        _G.SelectChip = "Human: Buddha"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand-Sand") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand-Sand") then
                        _G.SelectChip = "Sand"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird-Bird: Phoenix") then
                        _G.SelectChip = "Bird: Phoenix"
                    end
                end)
            end
        end
    end)
    
    Dungeon2:AddToggle("Auto Buy Chip",_G.AutoBuyChip,function(value)
        _G.AutoBuyChip = value
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoBuyChip then
                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                        end
                    end
                end
            end
        end)
    end)
    
    Dungeon2:AddButton("Buy Chip Select",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)
    end)
    
    Dungeon2:AddToggle("Auto Start Raid",_G.Auto_StartRaid,function(value)
        _G.Auto_StartRaid = value
    end)
    
    spawn(function()
        while wait(.1) do
            pcall(function()
                if _G.Auto_StartRaid then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                            if World2 then
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                            elseif World3 then
                                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    Dungeon2:AddButton("Start Raid",function()
        if World2 then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        elseif World3 then
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
    end)
    
    if World2 then
        Dungeon:AddButton("Teleport to Lab",function()
            TP(CFrame.new(-6438.73535, 250.645355, -4501.50684))
            end)
    elseif World3 then
        Dungeon:AddButton("Teleport to Lab",function()
            TP(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
        end)
    end
    
    if World2 then
        Dungeon:AddButton("Awakening Room",function()
            TP(CFrame.new(266.227783, 1.39509034, 1857.00732))
        end)
    elseif World3 then
        Dungeon:AddButton("Awakening Room",function()
            TP(CFrame.new(-11571.440429688, 49.172668457031, -7574.7368164062))
        end)
    end
    end
    if World2 then
        LawRaid:AddToggle("Auto Law Raid", false , function(value)
	_G.AutoLawRaid = value
	StopTween(_G.AutoLawRaid)
end)

LawRaid:AddToggle("Auto Buy Chip Law Raid", false,function(value)
	AutoBuyChiplawraid = value
end)
LawRaid:AddButton("Buy Chip Law Raid" , function()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","1")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
				end
end)
			
			spawn(function()
	pcall(function()
		while wait(.1) do
			if _G.AutoLawRaid then
				if not game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
						fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					end
				end
				if game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
					if game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Order [Lv. 1250] [Raid Boss]" then
								repeat game:GetService("RunService").Heartbeat:wait()
									EquipWeapon(getgenv().Settings["Select Weapon"])
                                    --v.HumanoidRootPart.CFrame = LawMon
									topos(v.HumanoidRootPart.CFrame * CFrame.new(0,50,25))
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
									game:GetService'VirtualUser':CaptureController()
									game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									Usefastattack = true
								until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoLawRaid == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
								Usefastattack = false
							end
						end
					elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
						Usefastattack = false
						topos(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
					end
				end
			end
		end
	end)
end)
else
    LawRaid:AddLabel("USE IN SECOND SEA !")
			
    end
    

----------------------------------------------------------------------------
--// Devil Fruit \\

    
    FruitList = {
        "Bomb-Bomb",
        "Spike-Spike",
        "Chop-Chop",
        "Spring-Spring",
        "Kilo-Kilo",
        "Spin-Spin",
        "Bird: Falcon",
        "Smoke-Smoke",
        "Flame-Flame",
        "Ice-Ice",
        "Sand-Sand",
        "Dark-Dark",
        "Revive-Revive",
        "Diamond-Diamond",
        "Light-Light",
        "Love-Love",
        "Rubber-Rubber",
        "Barrier-Barrier",
        "Magma-Magma",
        "Door-Door",
        "Quake-Quake",
        "Human-Human: Buddha",
        "String-String",
        "Bird-Bird: Phoenix",
        "Rumble-Rumble",
        "Paw-Paw",
        "Gravity-Gravity",
        "Dough-Dough",
        "Venom-Venom",
        "Shadow-Shadow",
        "Control-Control",
        "Soul-Soul",
        "Dragon-Dragon"
    }
    
    _G.SelectFruit = ""
    DevilFruito:AddDropdown("Select Fruits Sniper",FruitList,false,function(value)
        _G.SelectFruit = value
    end)
    
    DevilFruito:AddToggle("Auto Buy Fruit Sniper",_G.AutoBuyFruitSniper,function(value)
        _G.AutoBuyFruitSniper = value
    end)
    DevilFruitoa:AddDropdown("Select Fruits Eat",FruitList,false,function(value)
        _G.SelectFruitEat = value
    end)
    
    DevilFruitoa:AddToggle("Auto Eat Fruit",_G.AutoEatFruit,function(value)
        _G.AutoEatFruit = value
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoEatFruit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer()
                end
            end
        end)
    end)
    
    DevilFruitoa:AddToggle("Auto Eat Fruit Hop",_G.AutoEatFruitHop,function(value)
        _G.AutoEatFruitHop = value
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do wait(10)
                if _G.AutoEatFruitHop and _G.SelectFruitEat ~= nil then
                    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat) or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(_G.SelectFruitEat) then
                        Hop()
                    else
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer()
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoBuyFruitSniper then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",_G.SelectFruit)
                end 
            end
        end)
    end)
    
    DevilFruitoa:AddToggle("Auto Buy Random Fruit",getgenv().Settings["Auto Buy Random Fruit"],function(value)
        getgenv().Settings["Auto Buy Random Fruit"] = value
        Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if getgenv().Settings["Auto Buy Random Fruit"] then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
                end 
            end
        end)
    end)
    
    DevilFruitoa:AddButton("Buy Random Fruit",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    end)
    
    
    DevilFruitoa:AddToggle("Auto Drop Fruit",_G.DropFruit,function(value)
        _G.DropFruit = value
    end)
        
    spawn(function()
        while wait() do
            if _G.DropFruit then
                pcall(function()
                    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name, "Fruit") then
                            EquipWeapon(v.Name)
                            wait(.1)
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
                            end
                            EquipWeapon(v.Name)
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
                        end
                    end
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                        if string.find(v.Name, "Fruit") then
                            EquipWeapon(v.Name)
                            wait(.1)
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
                            end
                            EquipWeapon(v.Name)
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
                        end
                    end
                end)
            end
        end
    end)
    
    DevilFruitoa:AddToggle("Auto Store Fruit",getgenv().Settings["Store Fruit"],function(value)
        getgenv().Settings["Store Fruit"] = value
        Save()
    end)
    
    spawn(function()
        pcall(function()
            while wait(.1) do
                if getgenv().Settings["Store Fruit"] then
                    for i,v in pairs(FruitList) do
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v)
                    end
                end
            end
        end)
    end)
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                if getgenv().Settings["Store Fruit"] then
                    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                        if v.Name == "NotificationTemplate" then
                            if string.find(v.Text,"You can only store 1 of each fruit.") then
                                v:Destroy()
                            end
                        end
                    end
                end
            end)
        end)
    end)
    
    DevilFruitoa:AddToggle("Grab Fruit",_G.BringFruit,function(value)
        _G.BringFruit = value
        pcall(function()
            while _G.BringFruit do wait(.1)
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:IsA("Tool") then
                        local OldCFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame				
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame * CFrame.new(0,0,8)
                        v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait(.1)
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = OldCFrame
                    end
                end
            end
        end)
    end)
----------------------------------------------------------------------------
--// Shop \\
Shop:AddButton("Random Race ₣3,000",function()
		local args = {
			[1] = "BlackbeardReward",
			[2] = "Reroll",
			[3] = "2"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Shop:AddButton("Reset Stats ₣2,500",function()
		local args = {
			[1] = "BlackbeardReward",
			[2] = "Refund",
			[3] = "2"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end) 
	Shop:AddSeperator("/ Races \\")
	Shop:AddButton("Race Ghoul",function()
		local args = {
			[1] = "Ectoplasm",
			[2] = "BuyCheck",
			[3] = 4
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "Ectoplasm",
			[2] = "Change",
			[3] = 4
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Shop:AddButton("Race Cyborg",function()
		local args = {
			[1] = "CyborgTrainer",
			[2] = "Buy"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	----------------------------------------------------------------------------
	Shop2:AddButton("Buy Dark Leg $150,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end)
    
    Shop2:AddButton("Buy Electro $500,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end)
    
    Shop2:AddButton("Buy Water Kung Fu $750,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end)
    
    Shop2:AddButton("Buy Dragon Breath ₣1,500",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end)
    
    Shop2:AddButton("Buy Superhuman $3,000,000" ,function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end)
    
    Shop2:AddButton("Buy Death Step $2,500,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end)
    
    Shop2:AddButton("Buy Sharkman Karate $2,500,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end)
    
    Shop2:AddButton("Buy Electric Claw $3,000,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end)
    
    Shop2:AddButton("Buy Dragon Talon $3,000,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end)
    ----------------------------------------------------------------------------
    Shop3:AddButton("Cutlass $1,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
    end)
    
    Shop3:AddButton("Katana $1,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
    end)
    
    Shop3:AddButton("Iron Mace $25,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
    end)
    
    Shop3:AddButton("Duel Katana $12,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
    end)
    
    Shop3:AddButton("Triple Katana $60,000", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
    end)
    
    Shop3:AddButton("Pipe $100,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
    end)
    
    Shop3:AddButton("Dual Headed Blade $400,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
    end)
    
    Shop3:AddButton("Bisento $1,000,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
    end)
    
    Shop3:AddButton("Soul Cane $750,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
    end)
    
    ----------------------------------------------------------------------------
    Shop4:AddButton("Slingshot $5,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
    end)
    
    Shop4:AddButton("Musket $8,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
    end)
    
    Shop4:AddButton("Flintlock $10,500",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
    end)
    
    Shop4:AddButton("Refined Flintlock $30,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
    end)
    
    Shop4:AddButton("Cannon $65,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
    end)
    
    Shop4:AddButton("Kabucha ₣1,500",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
    end)
    
    ----------------------------------------------------------------------------
    Shop5:AddButton("Buy Sky Jumps $10,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
    end)
    
    Shop5:AddButton("Buy Enchancement $25,000 ",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
    end)
    
    Shop5:AddButton("Buy Flash Step $100,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end)
    
    Shop5:AddButton("Buy Observation $750,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
    end)
    
    ----------------------------------------------------------------------------
    Shop6:AddButton("Tomoe Ring $500,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Tomoe Ring")
    end)
    
    Shop6:AddButton("Black Cape $50,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Black Cape")
    end)
    
    Shop6:AddButton("Swordsman Hat $150,000",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Swordsman Hat")
    end)
    ----------------------------------------------------------------------------
    --// Misc \\
    Misc:AddButton("Rejoin Server",function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end)
    
    Misc:AddButton("Server Hop",function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
        Icon = "rbxassetid://0";
        Title = "Message", 
        Text = "Server Hopping . . ."
        })
        Hop()
    end)
    
    Misc:AddButton("Hop To Lower Player",function()
        getgenv().AutoTeleport = true
        getgenv().DontTeleportTheSameNumber = true 
        getgenv().CopytoClipboard = false
        if not game:IsLoaded() then
            print("Game is loading waiting...")
        end
        local maxplayers = math.huge
        local serversmaxplayer;
        local goodserver;
        local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" 
        function serversearch()
            for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                    serversmaxplayer = v.maxPlayers
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end       
        end
        function getservers()
            serversearch()
            for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                if i == "nextPageCursor" then
                    if gamelink:find("&cursor=") then
                        local a = gamelink:find("&cursor=")
                        local b = gamelink:sub(a)
                        gamelink = gamelink:gsub(b, "")
                    end
                    gamelink = gamelink .. "&cursor=" ..v
                    getservers()
                end
            end
        end 
        getservers()
        if AutoTeleport then
            if DontTeleportTheSameNumber then 
                if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                    return warn("It has same number of players (except you)")
                elseif goodserver == game.JobId then
                    return warn("Your current server is the most empty server atm") 
                end
            end
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
        end
    end)
    Misc:AddSeperator("/ ESP \\")
    Misc:AddToggle("ESP Player",false,function(value)
        ESPPlayer = value
        while ESPPlayer do wait()
            UpdateEspPlayer()
        end
    end)
    
    Misc:AddToggle("ESP Chest",false,function(value)
        ChestESP = value
        while ChestESP do wait()
            UpdateChestEsp() 
        end
    end)
    
    Misc:AddToggle("ESP Fruit",false,function(value)
        DevilFruitESP = value
        while DevilFruitESP do wait()
            UpdateBfEsp() 
        end
    end)
    
    Misc:AddToggle("ESP Flower",false,function(value)
        FlowerESP = value
        while FlowerESP do wait()
            UpdateFlowerEsp() 
        end
    end)
    
    Misc:AddToggle("ESP Island",IslandESP,function(value)
        IslandESP = value
        while IslandESP do wait()
            UpdateIslandESP() 
        end
    end)
    ----------------------------------------------------------------------------
    Misc2:AddToggle("Dodge No Cooldown",_G.NoDodgeCD,function(value)
       _G.NoDodgeCD = value
        NoDodgeCool()
    end)
    
    Misc2:AddToggle("Infinite Energy",getgenv().Settings["Inf Energy"],function(value)
        getgenv().Settings["Inf Energy"] = value
        originalstam = LocalPlayer.Character.Energy.Value
        Save()
    end)
    
    Misc2:AddToggle("Auto Active Race",_G.AutoAgility,function(value)
        _G.AutoAgility = value
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoAgility then
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                end
            end
        end)
    end)
    
   Misc2:AddToggle("Inf Ability",true,function(inf)
        _G.InfAbility = inf
    end)

spawn(function()
	while wait() do
		if _G.InfAbility then
			InfAb()
		elseif _G.InfAbility == false then
		    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			 game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
		    end
	end
	end
end)

function InfAb()
	if _G.InfAbility then
		if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			local inf = Instance.new("ParticleEmitter")
        inf.Acceleration = Vector3.new(0,0,0)
        inf.Archivable = true
        inf.Drag = 20
        inf.EmissionDirection = Enum.NormalId.Top
        inf.Enabled = true
        inf.Lifetime = NumberRange.new(0.2,0.2)
        inf.LightInfluence = 0
        inf.LockedToPart = true
        inf.Name = "Agility"
        inf.Rate = 500
        inf.RotSpeed = NumberRange.new(999, 9999)
        inf.Rotation = NumberRange.new(0, 0)
        inf.Speed = NumberRange.new(30, 30)
        inf.SpreadAngle = Vector2.new(360,360)
        inf.Texture = "rbxassetid://243098098"
        inf.VelocityInheritance = 0
        inf.ZOffset = 2
        inf.Transparency = NumberSequence.new(0)
        inf.Color = ColorSequence.new(Color3.fromRGB(139,0,0),Color3.fromRGB(0, 0, 0))
        inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
		end
	else
		if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
		end
	end
end

    
    Misc2:AddToggle("Infinite Obversation Range", _G.InfiniteKenbun ,function(value)
        _G.InfiniteKenbun = value
        local VS = game:GetService("Players").LocalPlayer.VisionRadius.Value
        while _G.InfiniteKenbun do
            wait()
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local VisionRadius = player.VisionRadius
            if player then
                if char.Humanoid.Health <= 0 then 
                    wait(5) 
                end
                VisionRadius.Value = math.huge
            elseif _G.InfiniteKenbun == false and player then
                VisionRadius.Value = VS
            end
        end
        Save()
    end)
    
    Misc2:AddToggle("Infinite Geppo",getgenv().Settings["Inf Geppo"],function(value)
        getgenv().Settings["Inf Geppo"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Inf Geppo"] then
                    for i,v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Geppo then
                            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Geppo then
                                for i2,v2 in next, getupvalues(v) do
                                    if tostring(i2) == "9" then
                                        repeat wait(.1)
                                            setupvalue(v,i2,0)
                                        until not getgenv().Settings["Inf Geppo"] or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0 
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    Misc2:AddToggle("Infinite Soru",getgenv().Settings["Inf Soru"],function(value)
        getgenv().Settings["Inf Soru"] = value
        Save()
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().Settings["Inf Soru"] and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil  then
                    for i,v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Soru then
                            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Soru then
                                for i2,v2 in next, getupvalues(v) do
                                    if typeof(v2) == "table" then
                                        repeat wait(.1)
                                            v2.LastUse = 0
                                        until not getgenv().Settings["Inf Soru"] or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    Misc2:AddToggle("Walk on Water",_G.WalkWater,function(value)
        _G.WalkWater = value
    end)
    
   spawn(function()
        pcall(function()
            while wait() do
                if _G.WalkWater then
                    if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                        if not game:GetService("Workspace"):FindFirstChild("Water") then
                            local Water = Instance.new("Part", game:GetService("Workspace"))
                            Water.Name = "Water"
                            Water.Size = Vector3.new(15,0.5,15)
                            Water.Anchored = true
                            Water.Material = "Neon"
                            
                            game:GetService("Workspace").Water.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.X,game:GetService("Workspace").Camera["Water;"].CFrame.Y,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                        else
                            game:GetService("Workspace").Water.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.X,game:GetService("Workspace").Camera["Water;"].CFrame.Y,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y >= 1 and game:GetService("Workspace"):FindFirstChild("Water") then
                        game:GetService("Workspace"):FindFirstChild("Water"):Destroy()
                    end
                else
                    if game:GetService("Workspace"):FindFirstChild("Water") then
                        game:GetService("Workspace"):FindFirstChild("Water"):Destroy()
                    end
                end
            end
        end)
    end)
    
    Misc2:AddToggle("Fly",false,function(value)
        Fly = value
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if Fly then
                    fly()
                end
            end)
        end
    end)
    
    Misc2:AddToggle("NoClip",_G.NOCLIP,function(value)
        _G.NOCLIP = value
    end)
    ----------------------------------------------------------------------------
    Misc3:AddButton("Unlock Portal",function()
        _G.UnlockPortal = true
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.UnlockPortal == true then
                    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                        if v.Name == "NotificationTemplate" then
                            if string.find(v.Text,"cannot") then
                                v:Destroy()
                            end
                        end
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            pcall(function()
                if _G.UnlockPortal == true then
                    CastlePostoMansion = CFrame.new(-5084.8447265625, 316.48101806641, -3145.3752441406)
                    MansiontoCastlePos = CFrame.new(-12464.596679688, 376.30590820312, -7567.2626953125)
                    Castletophydra = CFrame.new(-5095.33984375, 316.48101806641, -3168.3134765625)
                    HydratoCastle = CFrame.new(5741.869140625, 611.94750976562, -282.61154174805)
                    if (CastlePostoMansion.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                    end
                    if (MansiontoCastlePos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
                    end
                    if (Castletophydra.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
                    end
                    if (HydratoCastle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
                    end
                end
            end)
        end
    end)
    
    Misc3:AddButton("Invisible",function()
        game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()
    end)
    
    Misc3:AddButton("Click TP Tool",function()
        local plr = game:GetService("Players").LocalPlayer
        local mouse = plr:GetMouse()
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Teleport Tool"
        tool.Activated:Connect(function()
        local root = plr.Character.HumanoidRootPart
        local pos = mouse.Hit.Position+Vector3.new(0,2.5,0)
        local offset = pos-root.Position
        root.CFrame = root.CFrame+offset
        end)
        tool.Parent = plr.Backpack
    end)
    
    Misc3:AddButton("Stop All Tween",function()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        _G.Clip = false
    end)
    Misc3:AddSeperator("/ Code \\")
    local x2Code = {
        "3BVISITS",
        "UPD16",
        "FUDD10",
        "BIGNEWS",
        "THEGREATACE",
        "SUB2GAMERROBOT_EXP1",
        "StrawHatMaine",
        "Sub2OfficialNoobie",
        "SUB2NOOBMASTER123",
        "Sub2Daigrock",
        "Axiore",
        "TantaiGaming",
        "STRAWHATMAINE"
    }
    
    Misc3:AddButton("Redeem All Codes",function()
        function RedeemCode(value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
        end
        for i,v in pairs(x2Code) do
            RedeemCode(v)
        end
    end)
    
    Misc3:AddDropdown("Selected Codes",{"1MLIKES_RESET","THIRDSEA","SUB2GAMERROBOT_RESET1","SUB2UNCLEKIZARU"},false,function(value)
        _G.CodeSelect = value
    end)
    
    Misc3:AddButton("Redeem Code",function()
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(_G.CodeSelect)
    end)
    ----------------------------------------------------------------------------
    Misc4:AddDropdown("Select Haki State",{"State 0","State 1","State 2","State 3","State 4","State 5"},false,function(value)
        _G.SelectStateHaki = value
    end)
    
    Misc4:AddButton("Change Buso Haki State",function()
        if _G.SelectStateHaki == "State 0" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",0)
        elseif _G.SelectStateHaki == "State 1" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",1)
        elseif _G.SelectStateHaki == "State 2" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",2)
        elseif _G.SelectStateHaki == "State 3" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",3)
        elseif _G.SelectStateHaki == "State 4" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",4)
        elseif _G.SelectStateHaki == "State 5" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",5)
        end
    end)
    ----------------------------------------------------------------------------
    Misc4:AddSeperator("/ Graphic \\")
    local a = game.Lighting
    local c = Instance.new("ColorCorrectionEffect", a)
    local e = Instance.new("ColorCorrectionEffect", a)
    OldAmbient = a.Ambient
    OldBrightness = a.Brightness
    OldColorShift_Top = a.ColorShift_Top
    OldBrightnessc = c.Brightness
    OldContrastc = c.Contrast
    OldTintColorc = c.TintColor
    OldTintColore = e.TintColor
    Misc4:AddToggle("RTX Mode",_G.RTXMode,function(value)
        _G.RTXMode = value
        if not _G.RTXMode then return end
        while _G.RTXMode do wait()
            a.Ambient = Color3.fromRGB(33, 33, 33)
            a.Brightness = 0.3
            c.Brightness = 0.176
            c.Contrast = 0.39
            c.TintColor = Color3.fromRGB(217, 145, 57)
            game.Lighting.FogEnd = 999
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight") then
                local a2 = Instance.new("PointLight")
                a2.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                a2.Range = 15
                a2.Color = Color3.fromRGB(217, 145, 57)
            end
            if not _G.RTXMode then
                a.Ambient = OldAmbient
                a.Brightness = OldBrightness
                a.ColorShift_Top = OldColorShift_Top
                c.Contrast = OldContrastc
                c.Brightness = OldBrightnessc
                c.TintColor = OldTintColorc
                e.TintColor = OldTintColore
                game.Lighting.FogEnd = 2500
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
            end
        end
    end)
    
    Misc4:AddToggle("Remove Fog",RemoveFog,function(value)
        RemoveFog = value
        if not RemoveFog then return end
        while RemoveFog do wait()
            game.Lighting.FogEnd = 9e9
            if not RemoveFog then
                game.Lighting.FogEnd = 2500
            end
        end
    end)
    
    Misc4:AddButton("FPS Boost",function()
        pcall(function()
            game:GetService("Lighting").FantasySky:Destroy()
            local g = game
            local w = g.Workspace
            local l = g.Lighting
            local t = w.Terrain
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
            l.GlobalShadows = false
            l.FogEnd = 9e9
            l.Brightness = 0
            settings().Rendering.QualityLevel = "Level01"
            for i, v in pairs(g:GetDescendants()) do
                if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
                    v.Material = "Plastic"
                    v.Reflectance = 0
                elseif v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
                elseif v:IsA("Explosion") then
                    v.BlastPressure = 1
                    v.BlastRadius = 1
                elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v.Enabled = false
                elseif v:IsA("MeshPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                    v.TextureID = 10385902758728957
                end
            end
            for i, e in pairs(l:GetChildren()) do
                if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                    e.Enabled = false
                end
            end
            for i, v in pairs(game:GetService("Workspace").Camera:GetDescendants()) do
                if v.Name == ("Water;") then
                    v.Transparency = 1
                    v.Material = "Plastic"
                end
            end
        end)
    end)
    
    
    Misc4:AddButton("Unlock 120 FPS",function()
        setfpscap(120)
    end)
    ----------------------------------------------------------------------------
    Misc5:AddButton("Open Devil Shop",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
    end)
    Misc5:AddButton("Open Inventory Fruit",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
    end)
    Misc5:AddButton("Open Inventory",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
        wait(1)
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Visible = true
    end)
    
    Misc5:AddButton("Open Color Haki",function()
		game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
	end)
	Misc5:AddButton("Open Title Name",function()
		local args = {
			[1] = "getTitles"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
	end)
    
    Misc5:AddToggle("Highlight Mode",false,function(value)
        if value == true then
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = false
        else
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = true
        end
    end)
    --Misc5:AddSeperator("/ Teams \\")
    Misc6:AddButton("Join Pirates Team",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
    end)
    
    Misc6:AddButton("Join Marines Team",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines") 
    end)
 
    ----------------------------------------------------------------------------
    --// Feature \\ 
    if World2 then
    Misc7:AddSeperator("/ Sea 1 \\")
    Misc7:AddLabel("[+] Auto Second Sea Quest")
    Misc7:AddLabel("[+] Auto Pole V1")
    Misc7:AddLabel("[+] Auto Saber")
    Misc7:AddSeperator("/ Sea 3 \\")
    Misc7:AddLabel("[+] Auto Bone Farm")
    Misc7:AddLabel("[+] Teleport Mirage Island")
    Misc7:AddLabel("[+] Auto Dought Boss")
    Misc7:AddLabel("[+] Auto Buddy Sword")
    Misc7:AddLabel("[+] Auto Elite Hunter")
    Misc7:AddLabel("[+] Auto Enchancement Color")
    Misc7:AddLabel("[+] Auto Musketeer Hat")
    Misc7:AddLabel("[+] Auto Rainbow Haki")
    Misc7:AddLabel("[+] Auto Yama")
    Misc7:AddLabel("[+] Auto Tushita Puzzle")
    Misc7:AddLabel("[+] Auto Dungeon")
    end
    
    if World1 then
    Misc7:AddSeperator("/ Sea 2 \\")
    Misc7:AddLabel("[+] Auto Third Sea Quest")
    Misc7:AddLabel("[+] Auto Factory")
    Misc7:AddLabel("[+] Auto Ectoplasm")
    Misc7:AddLabel("[+] Auto Swan Glasses")
    Misc7:AddLabel("[+] Auto Black Beard")
    Misc7:AddLabel("[+] Auto Bartilo Quest")
    Misc7:AddLabel("[+] Auto Buy Legendary Sword")
    Misc7:AddLabel("[+] Auto Rengoku")
    Misc7:AddLabel("[+] Auto Evo Race")
    Misc7:AddLabel("[+] Auto Enchancement Color")
    Misc7:AddLabel("[+] Auto Law Raid")
    Misc7:AddLabel("[+] Auto Dungeon")
    Misc7:AddSeperator("/ Sea 3 \\")  
    Misc7:AddLabel("[+] Auto Bone Farm")
    Misc7:AddLabel("[+] Teleport Mirage Island")
    Misc7:AddLabel("[+] Auto Dought Boss")
    Misc7:AddLabel("[+] Auto Buddy Sword")
    Misc7:AddLabel("[+] Auto Elite Hunter")
    Misc7:AddLabel("[+] Auto Enchancement Color")
    Misc7:AddLabel("[+] Auto Musketeer Hat")
    Misc7:AddLabel("[+] Auto Rainbow Haki")
    Misc7:AddLabel("[+] Auto Yama")
    Misc7:AddLabel("[+] Auto Tushita Puzzle")
    Misc7:AddLabel("[+] Auto Dungeon")
    end
    
    if World3 then
    Misc7:AddSeperator("/ Sea 1 \\")   
    Misc7:AddLabel("[+] Auto Second Sea Quest")
    Misc7:AddLabel("[+] Auto Pole V1")
    Misc7:AddLabel("[+] Auto Saber")
    Misc7:AddSeperator("/ Sea 2 \\")
    Misc7:AddLabel("[+] Auto Third Sea Quest")
    Misc7:AddLabel("[+] Auto Factory")
    Misc7:AddLabel("[+] Auto Ectoplasm")
    Misc7:AddLabel("[+] Auto Swan Glasses")
    Misc7:AddLabel("[+] Auto Black Beard")
    Misc7:AddLabel("[+] Auto Bartilo Quest")
    Misc7:AddLabel("[+] Auto Buy Legendary Sword")
    Misc7:AddLabel("[+] Auto Rengoku")
    Misc7:AddLabel("[+] Auto Evo Race")
    Misc7:AddLabel("[+] Auto Enchancement Color")
    Misc7:AddLabel("[+] Auto Law Raid")
    Misc7:AddLabel("[+] Auto Dungeon")
    end
    
return library

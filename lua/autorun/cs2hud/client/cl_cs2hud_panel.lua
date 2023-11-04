hook.Add("PopulateToolMenu", "AddColorPickerToMenu", function()
    spawnmenu.AddToolCategory("Utilities", "Props", "CS2HUD", "Color")
    
    spawnmenu.AddToolMenuOption("Utilities", "Props", "ColorPicker", "Color", "", "", function(panel)
        local colorPicker = vgui.Create("DColorMixer", panel)
        colorPicker:Dock(TOP)
        colorPicker:DockMargin(0, 0, 0, 5)
        colorPicker:SetPalette(true)

        colorPicker.ValueChanged = function(_, color)
            local r, g, b = color.r, color.g, color.b
            RunConsoleCommand("color_of_the_cs2_hud_r", r)
            RunConsoleCommand("color_of_the_cs2_hud_g", g)
            RunConsoleCommand("color_of_the_cs2_hud_b", b)
        end

        local buttonWhite = vgui.Create("DButton", panel)
        buttonWhite:Dock(TOP)
        buttonWhite:DockMargin(0, 5, 0, 5)
        buttonWhite:SetText("White")
        buttonWhite.DoClick = function()
            colorPicker:SetColor(Color(255, 255, 255))
        end

        local buttonRed = vgui.Create("DButton", panel)
        buttonRed:Dock(TOP)
        buttonRed:DockMargin(0, 5, 0, 5)
        buttonRed:SetText("Red")
        buttonRed.DoClick = function()
            colorPicker:SetColor(Color(255, 0, 0))
        end

        local buttonBlue = vgui.Create("DButton", panel)
        buttonBlue:Dock(TOP)
        buttonBlue:DockMargin(0, 5, 0, 5)
        buttonBlue:SetText("Blue")
        buttonBlue.DoClick = function()
            colorPicker:SetColor(Color(0, 0, 255))
        end
    end)
end)

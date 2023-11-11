surface.CreateFont("TEAMCOLOR_FONT", {
    font = "DermaDefaultBold",
    size = 13,
})

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

    spawnmenu.AddToolCategory("Utilities", "Props", "CS2HUD", "Settings")
    spawnmenu.AddToolMenuOption("Utilities", "Props", "CS2HUD", "Settings", "", "", function(panelsettings)
       local choicePanel = vgui.Create("DPanel", panelsettings)
        choicePanel:Dock(TOP)
        choicePanel:DockMargin(0, 5, 0, 5)

        local choiceLabel = vgui.Create("DLabel", choicePanel)
        choiceLabel:SetText("JOB-COLOR:")
        choiceLabel:Dock(LEFT)
        choiceLabel:DockMargin(0, 0, 5, 0)
        choiceLabel:SetDark(true)
        choiceLabel:SetFont("TEAMCOLOR_FONT")

        local choiceCheckBox = vgui.Create("DCheckBoxLabel", choicePanel)
        choiceCheckBox:SetText("")
        choiceCheckBox:Dock(FILL)
        choiceCheckBox:SetValue(true)

        choiceCheckBox.OnChange = function(_, isChecked)
            if isChecked then
                RunConsoleCommand("cs2hud_TeamColor", 0)
            else
                RunConsoleCommand("cs2hud_TeamColor", 1)
            end
        end
        local choicePanel = vgui.Create("DPanel", panelsettings)
        choicePanel:Dock(TOP)
        choicePanel:DockMargin(0, 5, 0, 5)

        local choiceLabel = vgui.Create("DLabel", choicePanel)
        choiceLabel:SetText("HEALTH:")
        choiceLabel:Dock(LEFT)
        choiceLabel:DockMargin(0, 0, 5, 0)
        choiceLabel:SetDark(true)
        choiceLabel:SetFont("TEAMCOLOR_FONT")

        local choiceCheckBox = vgui.Create("DCheckBoxLabel", choicePanel)
        choiceCheckBox:SetText("")
        choiceCheckBox:Dock(FILL)
        choiceCheckBox:SetValue(true)

        choiceCheckBox.OnChange = function(_, isChecked)
            if isChecked then
                RunConsoleCommand("cs2hud_DisableHealth", 0)
            else
                RunConsoleCommand("cs2hud_DisableHealth", 1)
            end
        end
        local choicePanel = vgui.Create("DPanel", panelsettings)
        choicePanel:Dock(TOP)
        choicePanel:DockMargin(0, 5, 0, 5)

        local choiceLabel = vgui.Create("DLabel", choicePanel)
        choiceLabel:SetText("ARMOR:")
        choiceLabel:Dock(LEFT)
        choiceLabel:DockMargin(0, 0, 5, 0)
        choiceLabel:SetDark(true)
        choiceLabel:SetFont("TEAMCOLOR_FONT")

        local choiceCheckBox = vgui.Create("DCheckBoxLabel", choicePanel)
        choiceCheckBox:SetText("")
        choiceCheckBox:Dock(FILL)
        choiceCheckBox:SetValue(true)

        choiceCheckBox.OnChange = function(_, isChecked)
            if isChecked then
                RunConsoleCommand("cs2hud_DisableArmor", 0)
            else
                RunConsoleCommand("cs2hud_DisableArmor", 1)
            end
        end
        local choicePanel = vgui.Create("DPanel", panelsettings)
        choicePanel:Dock(TOP)
        choicePanel:DockMargin(0, 5, 0, 5)

        local choiceLabel = vgui.Create("DLabel", choicePanel)
        choiceLabel:SetText("MONEY:")
        choiceLabel:Dock(LEFT)
        choiceLabel:DockMargin(0, 0, 5, 0)
        choiceLabel:SetDark(true)
        choiceLabel:SetFont("TEAMCOLOR_FONT")

        local choiceCheckBox = vgui.Create("DCheckBoxLabel", choicePanel)
        choiceCheckBox:SetText("")
        choiceCheckBox:Dock(FILL)
        choiceCheckBox:SetValue(true)

        choiceCheckBox.OnChange = function(_, isChecked)
            if isChecked then
                RunConsoleCommand("cs2hud_DisableMoney", 0)
            else
                RunConsoleCommand("cs2hud_DisableMoney", 1)
            end
        end
        local choicePanel = vgui.Create("DPanel", panelsettings)
        choicePanel:Dock(TOP)
        choicePanel:DockMargin(0, 5, 0, 5)

        local choiceLabel = vgui.Create("DLabel", choicePanel)
        choiceLabel:SetText("AVATAR:")
        choiceLabel:Dock(LEFT)
        choiceLabel:DockMargin(0, 0, 5, 0)
        choiceLabel:SetDark(true)
        choiceLabel:SetFont("TEAMCOLOR_FONT")

        local choiceCheckBox = vgui.Create("DCheckBoxLabel", choicePanel)
        choiceCheckBox:SetText("")
        choiceCheckBox:Dock(FILL)
        choiceCheckBox:SetValue(true)

        choiceCheckBox.OnChange = function(_, isChecked)
            if isChecked then
                RunConsoleCommand("cs2hud_DisableAvatarCircleLines", 0)
            else
                RunConsoleCommand("cs2hud_DisableAvatarCircleLines", 1)
            end
        end
        local choicePanel = vgui.Create("DPanel", panelsettings)
        choicePanel:Dock(TOP)
        choicePanel:DockMargin(0, 5, 0, 5)

        local choiceLabel = vgui.Create("DLabel", choicePanel)
        choiceLabel:SetText("AMMO:")
        choiceLabel:Dock(LEFT)
        choiceLabel:DockMargin(0, 0, 5, 0)
        choiceLabel:SetDark(true)
        choiceLabel:SetFont("TEAMCOLOR_FONT")

        local choiceCheckBox = vgui.Create("DCheckBoxLabel", choicePanel)
        choiceCheckBox:SetText("")
        choiceCheckBox:Dock(FILL)
        choiceCheckBox:SetValue(true)

        choiceCheckBox.OnChange = function(_, isChecked)
            if isChecked then
                RunConsoleCommand("cs2hud_DisableAmmoCounter", 0)
            else
                RunConsoleCommand("cs2hud_DisableAmmoCounter", 1)
            end
        end
    end)
end)

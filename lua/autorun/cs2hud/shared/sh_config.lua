------------------ GENERAL CONFIGURATION -------------------------------
-- COLOR --
local white = Color( 255, 255, 255 )
local red = Color( 255, 0, 0 )
local blue = Color( 0, 26, 255 )

-- CONFIG --
cs2hud.CircleJobColor = true -- False : ColorHUD, True : Color TEAM
cs2hud.ColorArmorBar = blue

-- BLACKLIST WEAPONS (AMMO) --
cs2hud.Blacklist = {
	["weapon_physgun"] = true,
	["weapon_physcannon"] = true,
	["keys"] = true,
	["pocket"] = true,
	["weapon_bugbait"] = true,
	["weapon_stunstick"] = true,
	["weapon_crowbar"] = true,
	["arrest_stick"] = true,
	["door_ram"] = true,
	["weapon_keypadchecker"] = true,
	["lockpick"] = true,
	["med_kit"] = true,
	["stunstick"] = true,
	["unarrest_stick"] = true,
	["weaponchecker"] = true,
	["weapon_fists"] = true,
	["gmod_tool"] = true,
}

-- HIDE DEFAULT THINGS -- 
cs2hud.Hide = {
	["DarkRP_HUD"] = true,
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_Hungermod"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudHealth"] = true,
    ["CHudBattery"] = true
}
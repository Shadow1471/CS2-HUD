local hide = cs2hud.Hide
local blacklist = cs2hud.Blacklist

local bulletmat = Material("materials/bullet.png")

local sh = ScrH()
local sw = ScrW()

local Avatar = vgui.Create( "CircularAvatar", Avatar)

surface.CreateFont( "MyHudFont", {
	font = "Goodland SemiBold",
	extended = false,
	size = sw / 40,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Ammo1", {
	font = "Goodland SemiBold",
	extended = false,
	size = sw / 30,
	weight = 500,
} )

surface.CreateFont( "Ammo2", {
	font = "Goodland SemiBold",
	extended = false,
	size = sw / 58,
	weight = 500,
} )

function CS2HUD()

local ply = LocalPlayer()

if not (ply:Alive()) then return end
if not (IsValid(ply:GetActiveWeapon())) then return end

local jobcolor = team.GetColor(ply:Team())
local health = ply:Health()
local armor = ply:Armor()
local weapon = ply:GetActiveWeapon()
local ammo1 = ply:GetActiveWeapon():Clip1()
local ammo2 = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())
local DARKRP = engine.ActiveGamemode() == "darkrp"

--LOCAL CONVAR
local cs2_r, cs2_g, cs2_b = GetConVar( "color_of_the_cs2_hud_r" ):GetFloat(), GetConVar( "color_of_the_cs2_hud_g" ):GetFloat(), GetConVar( "color_of_the_cs2_hud_b" ):GetFloat()
local ColorJob = GetConVar( "cs2hud_TeamColor" ):GetFloat()
local DisableMoney = GetConVar( "cs2hud_DisableMoney" ):GetFloat()
local DisableArmor = GetConVar( "cs2hud_DisableArmor" ):GetFloat()
local DisableHealth = GetConVar( "cs2hud_DisableHealth" ):GetFloat()
local DisableACL = GetConVar( "cs2hud_DisableAvatarCircleLines" ):GetFloat()
local DisableAmmoCounter = GetConVar( "cs2hud_DisableAmmoCounter" ):GetFloat()

 -- >CIRCLE --
if (DisableACL == 0) then 
local circleX = sw * 0.500
local circleY = sh - (sh * 0.0630)
local circleRadius = sh * 0.0379

if (ColorJob == 0) then
    surface.DrawCircle(circleX, circleY, circleRadius, jobcolor)
else
    surface.DrawCircle(circleX, circleY, circleRadius, cs2_r, cs2_g, cs2_b)
end

-- >LINE --
local lineLength = sw * 0.20
local lineThickness = 2
local lineY = sh - (sh * 0.063)

surface.SetDrawColor(Color(cs2_r, cs2_g, cs2_b))
surface.SetTexture(surface.GetTextureID("gui/gradient"))
surface.DrawTexturedRectRotated(sw * 0.380, lineY, lineLength, lineThickness, 180)
surface.DrawTexturedRectRotated(sw * 0.621, lineY, lineLength, lineThickness, 0)

-- >STEAM AVATAR --
if (IsValid(Avatar)) then
local avatarX = sw * 0.4795
local avatarY = sh - (sh * 0.10)

Avatar:SetPos(avatarX, avatarY)
Avatar:SetSize(sw / 24, sh / 13.8)
Avatar:SetPlayer(ply, 64)
end
end

-- >HEALTH --
if (DisableHealth == 0) then
local healthBarWidth = ScrW() * 0.03
local healthBarHeight = ScrW() * 0.003
local healthBarX = ScrW() * 0.25
local healthBarY = ScrH() - (ScrH() * 0.04)

draw.RoundedBox(0, healthBarX, healthBarY, healthBarWidth, healthBarHeight, Color(255, 51, 51, 140))
draw.RoundedBox(0, healthBarX, healthBarY, math.Clamp(healthBarWidth * (health / 100), 0, healthBarWidth), healthBarHeight, Color(cs2_r, cs2_g, cs2_b))
draw.SimpleText(health, "MyHudFont", healthBarX + healthBarWidth * 0.5, healthBarY - ScrH() * 0.02, Color(cs2_r, cs2_g, cs2_b), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

if health < 30 then
    surface.SetDrawColor(255, 64, 64, 50)
    surface.DrawTexturedRectRotated(healthBarX + healthBarWidth * 0.5, healthBarY - ScrH() * 0.022, ScrW() * 0.03, ScrH() * 0.05, 90)
end
end

-- >MONEY --
if (DisableMoney == 0) then
if (DARKRP) then
    local money = ply:getDarkRPVar("money")
    draw.SimpleText("$"..money, "MyHudFont", sw * 0.02, sh - (sh * 0.06), Color(cs2_r, cs2_g, cs2_b), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end
end

-- >ARMOR --
if (DisableArmor == 0) then
if armor > 0 then
    local armorBarWidth = sw * 0.03
    local armorBarHeight = sw * 0.003
    local armorBarX = sw * 0.20
    local armorBarY = sh - (sh * 0.04)

    draw.SimpleText(armor, "MyHudFont", armorBarX + armorBarWidth * 0.5, armorBarY - ScrH() * 0.02, Color(cs2_r, cs2_g, cs2_b), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.RoundedBox(0, armorBarX, armorBarY, armorBarWidth, armorBarHeight, Color(160, 160, 160, 140))
    draw.RoundedBox(0, armorBarX, armorBarY, math.Clamp(armorBarWidth * (armor / 100), 0, armorBarWidth), armorBarHeight, cs2hud.ColorArmorBar)
end
end

-- >AMMO --
if (DisableAmmoCounter == 0) then
if not (blacklist[weapon:GetClass()]) then
    surface.SetMaterial(bulletmat)
    surface.SetDrawColor(cs2_r, cs2_g, cs2_b)
    surface.DrawTexturedRectRotated(sw * 0.790, sh - (sh * 0.07), 32, 32, -1)
    draw.SimpleText(" | "..ammo2, "Ammo2", sw * 0.774, sh - (sh * 0.067), Color(cs2_r, cs2_g, cs2_b), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

    if ammo1 > 4 then 
    draw.SimpleText(ammo1, "Ammo1", sw * 0.746, sh - (sh * 0.067), Color(cs2_r, cs2_g, cs2_b), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	else
	draw.SimpleText(ammo1, "Ammo1", sw * 0.746, sh - (sh * 0.067), Color(255, 0, 0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end
end
end

end

hook.Add("HUDPaint", "CS2_HUD", CS2HUD)

hook.Add("HUDShouldDraw", "DisableDefaultHUD", function (name)
if hide[name] then 
   	return false 
end
end)	
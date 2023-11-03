local hide = cs2hud.Hide
local blacklist = cs2hud.Blacklist

local bulletmat = Material("materials/bullet.png")

local sh = ScrH()
local sw = ScrW()

local Avatar = vgui.Create( "CircularAvatar", Avatar)

surface.CreateFont( "MyHudFont", {
	font = "Goodland SemiBold",
	extended = false,
	size = 46,
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
	size = 58,
	weight = 500,
} )

surface.CreateFont( "Ammo2", {
	font = "Goodland SemiBold",
	extended = false,
	size = 34,
	weight = 500,
} )

function CS2HUD()

local ply = LocalPlayer()

if not ply:Alive() then return end
if not IsValid(ply:GetActiveWeapon()) then return end

local jobcolor = team.GetColor(ply:Team())
local money = ply:getDarkRPVar("money")
local health = ply:Health()
local armor = ply:Armor()
local weapon = ply:GetActiveWeapon()
local ammo1 = ply:GetActiveWeapon():Clip1()
local ammo2 = ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType())

  -- >CIRCLE --
  if (cs2hud.CircleJobColor == true) then
  surface.DrawCircle(919, sh - 60, 40, jobcolor)
  else
	surface.DrawCircle(919, sh - 60, 40, cs2hud.ColorHUD)
  end

  -- >LINE --
	surface.SetDrawColor( cs2hud.ColorHUD )
	surface.SetTexture( surface.GetTextureID( "gui/gradient" ) ) 
  surface.DrawTexturedRectRotated( sw - 1185, sh - 60, sw * 0.15, sw - 1919, 180 )
  surface.DrawTexturedRectRotated( sw - 815, sh - 60, sw * 0.15, sw - 1919, 0 )

  -- >HEALTH --
  draw.RoundedBox(0, 470, sh - 40, 100 * 0.6, 5.5, Color(255, 51, 51, 140))
  draw.RoundedBox(0, 470, sh - 40, health * 0.6, 5.5, cs2hud.ColorHUD)
	draw.SimpleText(health, "MyHudFont", 500, sh - 60, cs2hud.ColorHUD, 1, 1)

	if (health < 30) then
	surface.SetDrawColor( 255,64,64,50 )
  surface.DrawTexturedRectRotated(500, sh - 62, 40, 50, 90)
    end
  
  -- >MONEY --
   draw.SimpleText("$"..money, "MyHudFont", 90, sh - 50, cs2hud.ColorHUD, 1, 1)

	-- >ARMOR --
	if (armor > 0) then
	draw.SimpleText(armor, "MyHudFont", 420, sh - 60, cs2hud.ColorHUD, 1, 1)
	draw.RoundedBox(0, 390, sh - 40, 60, 5.5, Color(160, 160, 160, 140))
	draw.RoundedBox(0, 390, sh - 40, math.Clamp(60 * (armor / 100),0,60), 5.5, cs2hud.ColorArmorBar)
  end

  -- >AMMO --
  if not (blacklist[ weapon:GetClass() ]) then 
  surface.SetMaterial(bulletmat)
  surface.SetDrawColor(255, 255, 255, 255)
  surface.DrawTexturedRectRotated(1370, sh - 70, 32, 32, -1)
  draw.SimpleText(ammo1, "Ammo1", 1260, sh - 65, cs2hud.ColorHUD, 1, 1)
	draw.SimpleText(" | "..ammo2, "Ammo2", 1310, sh - 62, cs2hud.ColorHUD, 1, 1)
  end
  
  -- >STEAM AVATAR --
  if not (IsValid(Avatar)) then return end
  Avatar:SetPos(sw - 1039, sh - 99)
  Avatar:SetSize(77, 77	)
  Avatar:SetPlayer( ply, 64 )

end

hook.Add("HUDPaint", "CS2_HUD", CS2HUD)

hook.Add("HUDShouldDraw", "DisableDefaultHUD", function (name)
if hide[name] then 
   	return false 
end
end)	
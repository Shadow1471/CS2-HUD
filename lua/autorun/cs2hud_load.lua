cs2hud = cs2hud or {}

resource.AddFile("resource/fonts/Goodland_SemiBold.ttf")
print("CS2 HUD - 1.0 Loaded")
-- Include shared
include("cs2hud/shared/sh_config.lua")

if SERVER then
-- AddCSLuaFile shared
AddCSLuaFile("cs2hud/shared/sh_config.lua")

-- AddCSLuaFile Client
AddCSLuaFile("cs2hud/client/vgui/avatar.lua")
AddCSLuaFile("cs2hud/client/hud.lua")

elseif CLIENT then 
-- include client
include("cs2hud/client/vgui/avatar.lua")
include("cs2hud/client/hud.lua")
end

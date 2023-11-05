cs2hud = cs2hud or {}

print("CS2 HUD - 1.1 Loaded")

-- Font
resource.AddFile("resource/fonts/Goodland_SemiBold.ttf")

-- Include shared
include("cs2hud/shared/sh_config.lua")

if SERVER then
-- AddCSLuaFile shared
AddCSLuaFile("cs2hud/shared/sh_config.lua")

-- Server File
include("cs2hud/server/sv_cs2hud.lua")

-- AddCSLuaFile Client
AddCSLuaFile("cs2hud/client/vgui/avatar.lua")
AddCSLuaFile("cs2hud/client/cl_cs2hud.lua")
AddCSLuaFile("cs2hud/client/cl_cs2hud_panel.lua")

elseif CLIENT then 
-- include client
include("cs2hud/client/vgui/avatar.lua")
include("cs2hud/client/cl_cs2hud.lua")
include("cs2hud/client/cl_cs2hud_panel.lua")
end

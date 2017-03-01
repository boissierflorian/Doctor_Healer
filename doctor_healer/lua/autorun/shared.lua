/*---------------------------------------------------------------------------
	
	Creator: k3ddan - codneutro@gmail.com
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
	
---------------------------------------------------------------------------*/

--[[---------------------------------------------------------
	Main table
-----------------------------------------------------------]]
DHeal = {}

--[[---------------------------------------------------------
	Properties
-----------------------------------------------------------]]
DHeal.mdl = "models/player/kleiner.mdl"
DHeal.heal = 100
DHeal.price = 1000

--[[---------------------------------------------------------
	Spawns
-----------------------------------------------------------]]
DHeal.Spawns = {
	["gm_flatgrass"] = {
		{
			pos = Vector(-681.946716, 525.831055, -12223.968750),
			ang = Angle(0, 30, 0)
		}
	}
}
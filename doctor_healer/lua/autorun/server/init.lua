/*---------------------------------------------------------------------------
	
	Creator: k3ddan - codneutro@gmail.com
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
	
---------------------------------------------------------------------------*/

--[[---------------------------------------------------------
	Network
-----------------------------------------------------------]]
util.AddNetworkString("DHealMenu")
util.AddNetworkString("DHealBuy")

--[[---------------------------------------------------------
	SpawnHealers
-----------------------------------------------------------]]
function DHeal.SpawnHealers()
	local map = game.GetMap()

	--> Map check
 	if not DHeal.Spawns[map] then
 		print("[WARNING] Missing doctors healers..")
 		return
 	end

 	local offset = Vector(0, 0, 10)

 	--> Spawning doctors
	for k, v in pairs(DHeal.Spawns[map]) do
		local doctor = ents.Create("base_ai")
		doctor:SetPos(v.pos + offset)
		doctor:SetAngles(v.ang)
		doctor:SetModel(DHeal.mdl)
		doctor:SetHullType(HULL_HUMAN)
		doctor:SetHullSizeNormal()
		doctor:SetNPCState(NPC_STATE_SCRIPT)
		doctor:SetSolid(SOLID_BBOX)
		doctor:CapabilitiesAdd(bit.bor(CAP_ANIMATEDFACE, CAP_TURN_HEAD))
		doctor:SetUseType(SIMPLE_USE)
		doctor:Spawn()
		doctor:DropToFloor()

		--> Input 
		function doctor:AcceptInput(name, activator, caller) 
			if name == "Use" and IsValid(caller) then
				--> Network
				net.Start("DHealMenu")
				net.Send(caller)
			end
		end
	end
end
hook.Add("InitPostEntity", "dheal_spawn", DHeal.SpawnHealers)

--[[---------------------------------------------------------
	buyHealth
-----------------------------------------------------------]]
function DHeal.buyHealth(length, ply)
	local price = DHeal.price

	--> Money
	if not ply:canAfford(price) then
		DarkRP.notify(ply, 1, 4, "Vous n'avez pas assez d'argent.") 
		return
	end

	ply:addMoney(-price)
	ply:SetHealth(100)

	--> Notify
	DarkRP.notify(ply, 3, 4, "Vous avez acheté " .. 
		DHeal.heal .. "HP pour " .. price .. "$")
end
net.Receive("DHealBuy", DHeal.buyHealth)
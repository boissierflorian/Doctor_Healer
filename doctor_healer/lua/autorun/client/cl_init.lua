/*---------------------------------------------------------------------------
	
	Creator: k3ddan - codneutro@gmail.com
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
	
---------------------------------------------------------------------------*/

--[[---------------------------------------------------------
	doctorMenu
-----------------------------------------------------------]]
local function doctorMenu()
	--> Dimensions
	local framew = 300
	local frameh = 200
	local screenh = ScrH()
	local screenw = ScrW()

	--> Frame
	local frame = vgui.Create("DFrame")
	frame:SetTitle("Docteur")
	frame:SetSize(framew, frameh)
	frame:SetPos(screenw * 0.5 - framew * 0.5, screenh * 0.5 - frameh * 0.5)
	frame:SetDraggable(false)
	frame:ShowCloseButton(true)
	frame:MakePopup()

	--> Painting
	frame.Paint = function(panel, width, height)
		--> black alpha background 
		surface.SetDrawColor(Color(10, 10, 10, 200))
		surface.DrawRect(0, 0, width, height)

		--> white outline
		surface.SetDrawColor(Color(245, 245, 245))
		surface.DrawOutlinedRect(0, 0, width, height)
	end

	--> Heal dimensions
	local healw = 150
	local healh = 50

	--> Heal button
	local heal = vgui.Create("DButton", frame)
	heal:SetPos(framew * 0.5 - healw * 0.5, frameh * 0.5 - healh * 0.5)
	heal:SetSize(healw, healh)
	heal:SetText("Se soigner ($" .. DHeal.price .. ")")

	heal.DoClick = function()
		net.Start("DHealBuy")
		net.SendToServer(LocalPlayer())
		frame:Remove()
	end
end
net.Receive("DHealMenu", doctorMenu)
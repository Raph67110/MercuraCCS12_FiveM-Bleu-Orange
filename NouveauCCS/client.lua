local sirene = 0
local sirenenuit = 0
local temoingyr = 0										--0 c'est Off, 1 c'est On
local auxi = 0
local defg = 1
local defm = 1
local defd = 1

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)
        local playerped = GetPlayerPed(-1)		
		if IsPedInAnyVehicle(playerped, false) then	
			-- Check si le joueurs est conducteur
			local veh = GetVehiclePedIsUsing(playerped)	
			local NetId = NetworkGetNetworkIdFromEntity(veh)
			SetVehicleExtra(veh, 1, false)
			SetVehicleExtra(veh, 2, false)
			SetVehicleExtra(veh, 3, false)
			if GetPedInVehicleSeat(veh, -1) == playerped then
				-- Check si il est dans un véhicule de police / EMS

                    if not HasStreamedTextureDictLoaded("ccs") then
					RequestStreamedTextureDict("ccs", true) -- unload it
					while not HasStreamedTextureDictLoaded("ccs") do
						Wait(0)
					end
                    else
                        if GetVehicleClass(veh) == 18 then
                    DrawSprite("ccs", "panel", 0.898,0.752,0.20,0.245, 0.0, 255, 255, 255, 255)     --panel																			FAIT
                    DrawSprite("ccs", "sirene", 0.858,0.695,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton SIRENE /!\													FAIT
                    DrawSprite("ccs", "gyros", 0.885,0.695,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton GYRO /!\														FAIT
                    DrawSprite("ccs", "auxi", 0.939,0.695,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton /!\				écart de 27 en X entre les touches			
                    DrawSprite("ccs", "auxi1", 0.940,0.744,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton /!\
                    DrawSprite("ccs", "auxi2", 0.885,0.793,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton /!\
					DrawSprite("ccs", "auxi3", 0.918,0.793,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton /!\					étage haut : 752 || milieu : 744 || bas : 793
					DrawSprite("ccs", "defilg", 0.858,0.744,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton /!\
                    DrawSprite("ccs", "defilmid", 0.885,0.744,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton /!\
					DrawSprite("ccs", "defild", 0.916,0.744,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton /!\
					DrawSprite("ccs", "nuit", 0.858,0.793,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton /!\
--------------------------------------------------------------------------------------------------------------------------------------
if IsDisabledControlJustReleased(0, 19) then
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)

	if sirene == 1 then
		-- on
		TriggerServerEvent("siren:sync", sirene, NetId)
		sirene = 0
	else
		-- off
		TriggerServerEvent("siren:sync", sirene, NetId)
		sirene = 1
	end

end
	if sirene == 1 then
	DrawSprite("ccs", "sirene_on", 0.858,0.695,0.03,0.05, 0.0, 255, 255, 255, 255)    --référence bouton SIRENE Allumée /!\
end
					------------------------SIRENE NUIT--------------------------------
					if IsDisabledControlJustReleased(0, 21) then
						if sirenenuit == 1 then
							sirenenuit = 0
							TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)
						else
							TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)
							sirenenuit = 1
						end
					
					end
					if sirenenuit == 1 then
                        DrawSprite("ccs", "nuit_on", 0.858,0.793,0.03,0.05, 0.0, 255, 255, 255, 255)    --référence bouton SIRENE Allumée /!\
					end
----------------------------------------------------------------------------------------------------------------------------------------

						if IsDisabledControlJustReleased(0, 46) then
							if temoingyr == 0 then
						--on
						temoingyr = 1 
					else 
						--off
						temoingyr = 0
					end
				end
-----------------------------------------------------------------------------------------------------------------------------------------
					if IsDisabledControlJustReleased(0, 47) then
						DrawSprite("ccs", "auxi_on", 0.939,0.695,0.03,0.05, 0.0, 255, 255, 255, 255)	--référence bouton 	AUXILIAIRE Allumé (sert à rien)
						TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)
						SoundVehicleHornThisFrame(veh)
					end
			------------------------------------------------------------------------
			if IsDisabledControlJustReleased(0, 47) then
				DrawSprite("ccs", "auxi1_on", 0.939,0.744,0.03,0.05, 0.0, 255, 255, 255, 255)	--référence bouton 	AUXILIAIRE 1 Allumé (sert à rien)
				SoundVehicleHornThisFrame(veh)
			end
			------------------------------------------------------------------------	
			if IsDisabledControlJustReleased(0, 47) then
				DrawSprite("ccs", "auxi2_on", 0.885,0.793,0.03,0.05, 0.0, 255, 255, 255, 255)	--référence bouton 	AUXILIAIRE 2 Allumé (sert à rien)
				SoundVehicleHornThisFrame(veh)
			end
			--------------------------------------------------------------------------
			if IsDisabledControlJustReleased(0, 47) then
				DrawSprite("ccs", "auxi3_on", 0.918,0.793,0.03,0.05, 0.0, 255, 255, 255, 255)	--référence bouton 	AUXILIAIRE 3 Allumé (sert à rien)
				SoundVehicleHornThisFrame(veh)
			end
			---------------------------------------------------------------------------
					if temoingyr == 1 then
						DrawSprite("ccs", "gyros_on", 0.885,0.695,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton GYRO Allumé /!\
					end
--------------------------------------------------------------------------------------------------------------------------------------------
if IsDisabledControlJustReleased(0, 246) then
	if defg == 1 then
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)
--off
defg = 0
else 
--on
defg = 1
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)

end
end
-----
if defg == 1 then
	SetVehicleExtra(veh, 1, true)
else
	DrawSprite("ccs", "defilg_on", 0.858,0.744,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton GYRO Allumé /!\

end
---------------------------------------------------------------
if IsDisabledControlJustReleased(0, 29) then
	if defm == 1 then
--off
defm = 0
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)

else 
--on
defm = 1
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)

end
end
-----
if defm == 1 then
	SetVehicleExtra(veh, 2, true)
else
	DrawSprite("ccs", "defilmid_on", 0.885,0.744,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton GYRO Allumé /!\

end

----------------------------------------------------------------
if IsDisabledControlJustReleased(0, 249) then
	if defd == 1 then
--off
defd = 0
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)

else 
--on
defd = 1
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'ccs', 1.0)

end
end
-----
if defd == 1 then
	SetVehicleExtra(veh, 3, true)
else
	DrawSprite("ccs", "defild_on", 0.916,0.744,0.03,0.05, 0.0, 255, 255, 255, 255)     --référence bouton GYRO Allumé /!\

end

				end
				end
			end
		end
	end
end)

RegisterNetEvent("siren:ClientSync")
AddEventHandler("siren:ClientSync", function(sync, NetId)
	local veh = NetworkGetEntityFromNetworkId(NetId)
	if sync == 0 then
		DisableVehicleImpactExplosionActivation(veh, 0)
	elseif sync == 1 then
		DisableVehicleImpactExplosionActivation(veh, 1)
	end
end)
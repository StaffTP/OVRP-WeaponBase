 # --
 # -- Project: OVRP-WeaponBase
 # -- Created: 11/28/2020 at 3:42 PM
 # -- --------------------------------------
 # -- Copyright © 2020 | Trixtxn | All rights reserved.
 # --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
			local ped = PlayerPedId()
			local wep = GetSelectedPedWeapon(ped)
			SetPedDropsWeaponsWhenDead(ped, true)
			RequestAnimDict("mp_weapon_drop")
			if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) and not IsPauseMenuActive() and IsPedArmed(ped, 7) and IsControlJustPressed(1, 56) then -- f9
			TaskPlayAnim(ped, "mp_weapon_drop", "drop_bh", 8.0, 2.0, -1, 0, 2.0, 0, 0, 0 )
			SetPedDropsInventoryWeapon(ped, wep, 0, 2.0, 0, -1)
			SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			ShowNotification("~r~Your have dropped your weapon")
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
            	if IsPedArmed(ped, 6) then
	    	DisableControlAction(1, 140, true)
            	DisableControlAction(1, 141, true)
            	DisableControlAction(1, 142, true)
        end
    end
end)

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

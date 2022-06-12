local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

RegisterNetEvent('hud:client:UpdateNeeds')
AddEventHandler('hud:client:UpdateNeeds', function(newHunger, newThirst)
    hunger = newHunger
    thirst = newThirst
end)

Citizen.CreateThread(function()
    while true do 
        local s = 1000
        local ped = GetPlayerPed(-1)
        local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
        local EstaEnElAgua = IsEntityInWater(ped)
        local EstaEnElAguaNadando = IsPedSwimming(ped)
        
        -- Rdarar
        if IsPedSittingInAnyVehicle(ped) and not IsPlayerDead(ped) then

            DisplayRadar(true)

        elseif not IsPedSittingInAnyVehicle(ped) then

            DisplayRadar(false)

        end
        SendNUIMessage({
            pauseMenu = IsPauseMenuActive();
            armour = GetPedArmour(PlayerPedId());
            health = GetEntityHealth(PlayerPedId())-100;
            food = hunger;
            thirst = thirst;
            stress = stress;
            estoyencoche = IsPedSittingInAnyVehicle(ped);
            id = GetPlayerServerId(PlayerId());
            EstaEnElAgua = IsEntityInWater(ped);
            EstaEnElAguaNadando = IsPedSwimming(ped);
            oxigenoagua = GetPlayerUnderwaterTimeRemaining(PlayerId())*10;
            oxigeno = 100-GetPlayerSprintStaminaRemaining(PlayerId());
        })

        RegisterCommand('ocultarhud',function()
            SendNUIMessage({
                quitarhud = true
            })
        end)

        RegisterCommand('mostrarhud',function()
            SendNUIMessage({
                ponerhud = true
            })
        end)

        RegisterCommand('mostrarbarras',function()
            DisplayHud(false)
            SendNUIMessage({
                ponerbarras = true
            })
        end)

        RegisterCommand('ocultarbarras',function()
            SendNUIMessage({
                quitarbarras = true
            })
        end)

        Citizen.Wait(110000000)
        
	end
	
end)
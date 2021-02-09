ESX = nil
local currentGarage = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = sourcePlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

-- GET GARAGES / PUBLIC
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        Citizen.Wait(5)
        local playerPed = GetPlayerPed(-1)
        local playerPosition = GetEntityCoords(playerPed)

        -- PUBLIC GARAGES
        for k, v in pairs (Config.Garages) do 
            if GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 15 then
                DrawMarker(2, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 222, false, false, false, true, false, false, false)
                if GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 1.5 then
                    if not IsPedInAnyVehicle(playerPed) then
                        DrawText3D(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z + 0.25, '~g~E~w~ - Abrir Garagem')
                        if IsControlJustReleased(0, 38) then
                            openGarageMenu(k)
                            currentGarage = v
                        end
                    end
                elseif GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 5 then
                    DrawText3D(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z + 0.25, v.garageName)
                end
            end

            if IsPedInAnyVehicle(playerPed) then
                if GetDistanceBetweenCoords(playerPosition, v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z) <= 15 then
                    DrawMarker(1, v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.9, 1.0, 200, 0, 0, 222, false, false, false, true, false, false, false)
                    if GetDistanceBetweenCoords(playerPosition, v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z) <= 2.5 then
                        DrawText3D(v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z + 0.25, '~g~E~w~ - Guardar Veículo')
                        if IsControlJustReleased(0, 38) then
                            storeVehicle(k)
                            currentGarage = v
                        end
                    elseif GetDistanceBetweenCoords(playerPosition, v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z) <= 5 then
                        DrawText3D(v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z + 0.25, 'Estacionar veículo...')
                    end
                end
            end
        end

        -- POLICE IMPOUND
        for k, v in pairs (Config.PoliceImpounds) do 
            if ESX.PlayerData.job.name == 'police' then
                if GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 15 then
                    DrawMarker(2, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 222, false, false, false, true, false, false, false)
                    if GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 1.5 then
                        if not IsPedInAnyVehicle(playerPed) then
                            DrawText3D(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z + 0.25, '~g~E~w~ -  Abrir apreendidos da PSP)')
                            if IsControlJustReleased(0, 38) then
                                openPoliceImpoundMenu()
                                currentGarage = v
                            end
                        end
                    elseif GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 5 then
                        DrawText3D(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z + 0.25, v.garageName)
                    end
                end
            end
        end

        -- PUBLIC IMPOUND
        for k, v in pairs (Config.PublicImpounds) do 
            if GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 15 then
                DrawMarker(2, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 222, false, false, false, true, false, false, false)
                if GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 1.5 then
                    if not IsPedInAnyVehicle(playerPed) then
                        DrawText3D(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z + 0.25, '~g~E~w~ -  Abrir apreendidos público')
                        if IsControlJustReleased(0, 38) then
                            openImpoundMenu()
                            currentGarage = v
                        end
                    end
                elseif GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 5 then
                    DrawText3D(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z + 0.25, v.garageName)
                end
            end
        end
	
	-- Garagens Privadas (para trabalhadores psp inem mecanico etc)
        --criacao de blip por trabalho para garagem privada
		--apenas quando estiverem de servico vao ter acesso a garagem
		for k, v in pairs (Config.GaragemPrivadas) do 
            if ESX.PlayerData.job.name == v.trabalho or ESX.PlayerData.job.name == v.offtrabalho then
                if GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 15 then
                    DrawMarker(2, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 0, 0, 222, false, false, false, true, false, false, false)
                    if GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 1.5 then
                        if not IsPedInAnyVehicle(playerPed) then
                            DrawText3D(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z + 0.25, '~g~E~w~ -  Abrir Garagem')
                            if IsControlJustReleased(0, 38) then
                                openGarageMenu(k)
								currentGarage = v
                            end
                        end
                    elseif GetDistanceBetweenCoords(playerPosition, v.getVehicle.x, v.getVehicle.y, v.getVehicle.z) <= 5 then
                        DrawText3D(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z + 0.25, v.garageName)
                    end
                end
            
  
			-- criacao de blip para levantar o carro!
				if IsPedInAnyVehicle(playerPed) then
					if GetDistanceBetweenCoords(playerPosition, v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z) <= 15 then
						DrawMarker(1, v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.9, 1.0, 200, 0, 0, 222, false, false, false, true, false, false, false)
						if GetDistanceBetweenCoords(playerPosition, v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z) <= 2.5 then
							DrawText3D(v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z + 0.25, '~g~E~w~ - Guardar Veículo')
							if IsControlJustReleased(0, 38) then
								storeVehicle(k)
								currentGarage = v
							end
						elseif GetDistanceBetweenCoords(playerPosition, v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z) <= 5 then
							DrawText3D(v.storeVehicle.x, v.storeVehicle.y, v.storeVehicle.z + 0.25, 'Estacionar veículo...')
						end
					end
				end
			end
		end
	end
end)

openGarageMenu = function(garage)
    local elements = {}

    ESX.TriggerServerCallback("esx_simplegarages:callback:GetUserVehicles", function(myCars)
        for k, v in pairs(myCars) do
            local aheadVehName = GetDisplayNameFromVehicleModel(v.vehicle.model)
            local vehicleName = GetLabelText(aheadVehName)
            local labelvehicle
            local labelvehicle2 = ('%s (%s) - '):format(vehicleName, v.plate)
            local labelvehicle3 = ('%s (%s) - '):format(vehicleName, v.plate)
			if v.stored == 1 then
                labelvehicle = labelvehicle2 .. ('<span style="color:#2ecc71;">%s</span>'):format('Na garagem')
            elseif v.stored == 2 then
                labelvehicle = labelvehicle2 .. ('<span style="color:#c0392b;">%s</span>'):format('Apreendidos PSP')
            else
                labelvehicle = labelvehicle2 .. ('<span style="color:#e67e22;">%s</span>'):format('Apreendidos da Cidade')
            end

            table.insert(elements, {label = labelvehicle, value = v})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
			title = garage,
			align = left,
			elements = elements
		}, function(data, menu)
			if data.current.value == nil then
				exports['mythic_notify']:SendAlert('error', ('Não tem veículos estacionados nesta garagem.'))
			else
				if data.current.value.stored == 1  then
                    menu.close()
					spawnVehicle(data.current.value.vehicle, data.current.value.fuel, data.current.value.engine, data.current.value.plate)
				else
					--ESX.ShowNotification("This vehicle isn't parked, its probably in the impound.")
					exports['mythic_notify']:SendAlert('error', ('Veículo não encontrado, verifique os apreendidos.'))
				end
			end
		end, function(data, menu)
			menu.close()
		end)
    end, garage)
end

openPoliceImpoundMenu = function()
    local elements = {}
	ESX.TriggerServerCallback("esx_simplegarages:callback:GetOfficerName", function(cb)
    ESX.TriggerServerCallback("esx_simplegarages:callback:GetPoliceImpoundedVehicles", function(PoliceImpoundCars)
        for k, v in pairs(PoliceImpoundCars) do
			local aheadVehName = GetDisplayNameFromVehicleModel(v.vehicle.model)
            local vehicleName = GetLabelText(aheadVehName)
            local labelvehicle
            local labelvehicle = ('%s (%s) %s'):format(v.owner, vehicleName, v.plate)
            table.insert(elements, {label = labelvehicle, value = v})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
			title = 'PSP - Apreendidos',
			align = left,
			elements = elements
		}, function(data, menu)
            menu.close()
			spawnVehicle(data.current.value.vehicle, data.current.value.fuel, data.current.value.engine, data.current.value.plate)
			exports['mythic_notify']:SendAlert('success', ('Carro devolvido. Dono: ' ..data.current.value.owner.. ' Matricula: ' ..data.current.value.plate))
			 
			local msg = ('Carro devolvido. Dono: ' ..data.current.value.owner.. ' Matricula: ' ..data.current.value.plate.. ' Agente: ' ..cb)
			TriggerServerEvent('discordimpound', msg)
		end, function(data, menu)
			menu.close()
		end)
    end)
	end)
end

openImpoundMenu = function()
    local elements = {}

    ESX.TriggerServerCallback("esx_simplegarages:callback:GetImpoundedVehicles", function(ImpoundedVehicles)
        for k, v in pairs(ImpoundedVehicles) do
            local aheadVehName = GetDisplayNameFromVehicleModel(v.vehicle.model)
            local vehicleName = GetLabelText(aheadVehName)
            local labelvehicle
            local labelvehicle = ('%s (%s) - <span style="color:#27ae60">€%s</span>'):format(vehicleName, v.plate, v.price)

            table.insert(elements, {label = labelvehicle, value = v})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
			title = 'Apreendidos - Cidade',
			align = left,
			elements = elements
		}, function(data, menu)
            menu.close()
			local gameVehicles = ESX.Game.GetVehicles()
			for i = 1, #gameVehicles do
				local vehicle = gameVehicles[i]
				if DoesEntityExist(vehicle) then
					if Config.Trim(GetVehicleNumberPlateText(vehicle)) == Config.Trim(data.current.value.plate) then
						exports['mythic_notify']:SendAlert('error', ('Este carro não se encontra apreendido.'))
						--ESX.ShowNotification("Este carro ainda está pela cidade")
					return
					end
				end
			end
			
            ESX.TriggerServerCallback("esx_simplegarages:callback:GetPlayerCashAmount", function(amount)
                if amount >= data.current.value.price then
                    TriggerServerEvent("esx_simplegarages:server:PayImpoundBill", data.current.value.price)
                    spawnVehicle(data.current.value.vehicle, data.current.value.fuel, data.current.value.engine, data.current.value.plate)
                else
                    menu.close()
                    --ESX.ShowNotification("You don't have enough cash money to pay the bill...")
					exports['mythic_notify']:SendAlert('error', ('Não tem dinheiro suficiente!'))
                end
            end)
		end, function(data, menu)
			menu.close()
		end)
    end)
end

spawnVehicle = function(vehicle, fuel, enginehealth, plate)
    if not ESX.Game.IsSpawnPointClear(currentGarage.spawnPoint.coords, 3.0) then 
		exports['mythic_notify']:SendAlert('error', 'Por favor espere até o lugar ficar disponível')
		return
	end
	ESX.Game.SpawnVehicle(vehicle.model, currentGarage.spawnPoint.coords, currentGarage.spawnPoint.heading, function(veh)
		ESX.Game.SetVehicleProperties(veh, vehicle)
        SetEntityAsMissionEntity(veh, true, true)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)

        SetVehicleEngineHealth(veh, enginehealth + 0.0)
        exports['LegacyFuel']:SetFuel(veh, fuel)
        SetVehicleEngineOn(veh, true, true)
    end)
    
    TriggerServerEvent('esx_simplegarages:server:updateCarStoredState', plate, 0)
end

storeVehicle = function(cgarage)
            local currentVehicle = GetVehiclePedIsIn(PlayerPedId())
            local plate = ESX.Math.Trim(GetVehicleNumberPlateText(currentVehicle))
            local currentFuel = exports['LegacyFuel']:GetFuel(currentVehicle)
            local engineHealth = GetVehicleEngineHealth(currentVehicle)
			--teste
			TaskLeaveVehicle(PlayerPedId(), currentVehicle, 0)
	
				while IsPedInVehicle(PlayerPedId(), currentVehicle, true) do
					Citizen.Wait(0)
				end
	
				Citizen.Wait(500)
	
				NetworkFadeOutEntity(currentVehicle, true, true)
	
				Citizen.Wait(100)
			--teste
            ESX.Game.DeleteVehicle(currentVehicle)
            TriggerServerEvent('esx_simplegarages:server:updateCarStoredState', plate, 1)
            TriggerServerEvent('esx_simplegarages:server:updateCarGarageLocation', plate, cgarage)
            TriggerServerEvent('esx_simplegarages:server:updateCarState', plate, currentFuel, engineHealth)
			exports['mythic_notify']:SendAlert('success', ('Veículo estacionado.'))
            --ESX.ShowNotification("You're vehicle is now stored ")
        
end

RegisterNetEvent('esx_simplegarages:client:takeVehicleToPoliceImpound')
AddEventHandler('esx_simplegarages:client:takeVehicleToPoliceImpound', function()
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId())
    local plate = GetVehicleNumberPlateText(currentVehicle)

    ESX.Game.DeleteVehicle(currentVehicle)
    TriggerServerEvent('esx_simplegarages:server:takeVehicleToPoliceImpound', plate)
end)

RegisterNetEvent('esx_simplegarages:client:takeVehicleToImpound')
AddEventHandler('esx_simplegarages:client:takeVehicleToImpound', function(price)
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId())
    local plate = GetVehicleNumberPlateText(currentVehicle)

    ESX.Game.DeleteVehicle(currentVehicle)
    TriggerServerEvent('esx_simplegarages:server:takeVehicleToImpound', plate, price)
end)

DrawText3D = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- CREATE BLIPS
Citizen.CreateThread(function()
    for k, v in pairs(Config.Garages) do
        Garage = AddBlipForCoord(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z)

        SetBlipSprite (Garage, 357)
        SetBlipDisplay(Garage, 4)
        SetBlipScale  (Garage, 0.65)
        SetBlipAsShortRange(Garage, true)
        SetBlipColour(Garage, 3)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v.garageName)
        EndTextCommandSetBlipName(Garage)
    end

    for k, v in pairs(Config.PoliceImpounds) do
        Depot = AddBlipForCoord(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z)

        SetBlipSprite (Depot, 357)
        SetBlipDisplay(Depot, 4)
        SetBlipScale  (Depot, 0.7)
        SetBlipAsShortRange(Depot, true)
        SetBlipColour(Depot, 1)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v.garageName)
        EndTextCommandSetBlipName(Depot)
    end

    for k, v in pairs(Config.PublicImpounds) do
        Depot = AddBlipForCoord(v.getVehicle.x, v.getVehicle.y, v.getVehicle.z)

        SetBlipSprite (Depot, 357)
        SetBlipDisplay(Depot, 4)
        SetBlipScale  (Depot, 0.7)
        SetBlipAsShortRange(Depot, true)
        SetBlipColour(Depot, 1)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v.garageName)
        EndTextCommandSetBlipName(Depot)
    end
end)

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local lancer = false
local count = nil 
local mainMenu = RageUI.CreateMenu('GoFast', 'interaction')
mainMenu.Closed = function()
	lancer = false
end

RegisterNetEvent("gofast:count")
AddEventHandler("gofast:count", function(_count)
	count = _count
end)

function gofastmenu()
    if lancer then 
        lancer = false
        RageUI.Visible(mainMenu, false)
        return
    else
        lancer = true 
        RageUI.Visible(mainMenu, true)
        CreateThread(function()
			while count == nil do 
				Wait(1000)
				count = 1	
			end
       		while lancer do 
           		RageUI.IsVisible(mainMenu,function() 
            		RageUI.Button("Launch the GoFast", "Number of Gofast available : ~b~"..count.."", {RightLabel = "→"}, true , {
              		 	onSelected = function()
                			if count > 0 then
                  				TriggerServerEvent("gofast:remove")
				            	SpawnDuVehicule()
				            	gofastvente()
                  				RageUI.CloseAll()
								lancer = false
				            	Citizen.Wait(10*2000)
			    	        	ESX.ShowAdvancedNotification("Partner", "~r~Message from the Partner", "Hurry up! A whore gave you up to the cops !", "CHAR_MP_ROBERTO", 7)
                			else
                  				ESX.ShowNotification("No car available come back later")
                			end
               			end
            		})			   
           		end)
         	Wait(0)
        	end
     	end)
  	end
end

local menugofast = {{x = 95.86, y = -2216.29, z = 5.17}}

Citizen.CreateThread(function()
    while true do
      	local wait = 900
        for k in pairs(menugofast) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, menugofast[k].x, menugofast[k].y, menugofast[k].z)
            if dist <= 2.0 then
               wait = 0
                Visual.Subtitle("Press [~r~E~w~] to launch a ~r~GoFast", 1)
                if IsControlJustPressed(1,51) then
					gofastmenu()
           		end
        	end
        end
    Citizen.Wait(wait)
	end
end)

local SpawnVehicule = {coords = vector3(90.41, -2217.37, 5.04)}

function SpawnDuVehicule()
	local ped = PlayerPedId()
	local spawn = ESX.Game.IsSpawnPointClear(SpawnVehicule.coords, 2.0)
	if spawn then
		ESX.Game.SpawnVehicle(0x6322B39A, SpawnVehicule.coords, 353.13, function(veh)
		SwitchInPlayer(PlayerPedId())
		RequestModel(0x6322B39A)
		SetVehicleNumberPlateText(veh, 'GOFAST')
		SetVehicleEnginePowerMultiplier(veh, 2.0 * 20.0)
		SetModelAsNoLongerNeeded(veh)
		SetVehicleAsNoLongerNeeded(veh)
		TaskEnterVehicle(PlayerPedId(), veh, 1000, -1, 1.0, 1, 0)
		TriggerServerEvent("pgofast:messagelspd")
		TriggerServerEvent("pgofast:messagebcso")
		end)
	else
		ESX.ShowNotification("There is already a vehicle")
	end
end

function gofastvente()
	SetNewWaypoint(-114.77, 6368.91, 31.52)
end

local vente = false 
local mainMenu2 = RageUI.CreateMenu('Garage', 'interaction')
mainMenu2.Closed = function()
	vente = false
end

function gofastventemenu()
    if vente then 
        vente = false
        RageUI.Visible(mainMenu2, false)
        return
    else
        vente = true 
        RageUI.Visible(mainMenu2, true)
        CreateThread(function()
        	while vente do 
           		RageUI.IsVisible(mainMenu2,function() 
            		RageUI.Button("Sell the Vehicle", nil, {RightLabel = "→"}, true , {
               			onSelected = function()	
							FinDeGoFast()
                			RageUI.CloseAll()
							vente = false
               			end
            		})  
           		end)
         	Wait(0)
        	end
    	end)
  	end
end

local vente = {{x = -114.77, y = 6368.91, z = 31.52}}

Citizen.CreateThread(function()
    while true do
      local wait = 900
        for k in pairs(vente) do	
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, vente[k].x, vente[k].y, vente[k].z)        
            if dist <= 2.0 then
               wait = 0			   
                Visual.Subtitle("Press [~r~E~w~] to Sell", 1) 
                if IsControlJustPressed(1,51) then
					gofastventemenu()
           		end
        	end
        end
    Citizen.Wait(wait)
	end
end)

function FinDeGoFast()
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn( ped, false )
	local plate = GetVehicleNumberPlateText(vehicle)
	if plate == ' GOFAST ' then
		
		ESX.Game.DeleteVehicle(vehicle)
		ESX.ShowAdvancedNotification("GoFast", "~r~Anonyme", "Vehicle received! You will soon receive the money !", "CHAR_MULTIPLAYER", 7)
		Citizen.Wait(10*1000)
		TriggerServerEvent("gofast:venteduvehicle")
		Wait(10)
		local playerPed = PlayerPedId()
	else
		ESX.ShowAdvancedNotification("GoFast", "~b~Anonyme", "You think you can get me like this? Hurry up before I call the cops !", "CHAR_MULTIPLAYER", 7)

	end
end
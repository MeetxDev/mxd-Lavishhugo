local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mxd-blackmarket:server:policecall', function()
    policechance = math.random(1, 100)
    if Config.PoliceCallChance >= policechance then
        local src = source
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)
        local players = QBCore.Functions.GetQBPlayers()
        if Config.pdnoti == 'ps' then
            TriggerClientEvent('mxd-blackmarket:client:pspdnoti', src)
        else
            for k,v in pairs(players) do
                if v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
                    local alertData = {title = 'New 911 Call', coords = {coords.x, coords.y, coords.z}, description = Config.PoliceMessage}
                    TriggerClientEvent("qb-phone:client:addPoliceAlert", v.PlayerData.source, alertData)
                    TriggerClientEvent('police:client:policeAlert', v.PlayerData.source, coords, Config.PoliceMessage)
                end
            end
        end
        if Config.TellAboutPolice then
            TriggerClientEvent('QBCore:Notify', src, Config.PedMessage, "error")
        end
        if Config.DisappearAfterPoliceAlert then
            TriggerClientEvent('mxd-blackmarket:client:deleteped', src)
        end
    end
end)

function SendMailTime()
	Citizen.CreateThread(function()
		while true do
            local RadPed = Config.Hints[math.random(1, #Config.Hints)] 
            local RadHint = RadPed['Hints'][math.random(1, #RadPed['Hints'])]
	        TriggerClientEvent('mxd-blackmarket:client:sendmail', -1, RadHint)
            TriggerClientEvent('mxd-blackmarket:client:spawnped', -1, RadPed)
			Citizen.Wait(Config.Interval * 3600000)
		end
	end)
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Citizen.Wait(Config.FirstMailAfter * 60000)
        SendMailTime()
	end
end)

QBCore.Functions.CreateCallback('mxd-blackmarket:server:GetCurrentPlayers', function(source, cb)
    local TotalPlayers = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        TotalPlayers = TotalPlayers + 1
    end
    cb(TotalPlayers)
end)
local QBCore = exports['qb-core']:GetCoreObject()
local started = false
local iscooldown = false
local CurrentCops = 0

local function GetCurrentCops()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    return amount
end

RegisterServerEvent('mxd-gunheist:server:additem', function(item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(item, amount)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[string.lower(item)], "add")
end)

RegisterServerEvent('mxd-gunheist:server:removeitem', function(item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(item, amount)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[string.lower(item)], "remove")
end)

RegisterServerEvent('mxd-gunheist:server:syncstart', function()
    local src = source
    CreateThread(function()
        while true do
            if Config.RemTime > 0 then
                started = true
                Config.RemTime = Config.RemTime - 1
                Wait(60000)
            else
                started = false
                Config.RemTime = Config.RemTime1
                TriggerClientEvent('mxd-gunheist:client:delcrate', src)
                TriggerClientEvent('mxd-gunheist:client:over', src)
                break
            end
        end
    end)
end)

RegisterServerEvent('mxd-gunheist:server:startcooldown', function()
    local src = source
    CreateThread(function()
        while true do
            if Config.Cooldowntime > 0 then
                iscooldown = true
                Config.Cooldowntime = Config.Cooldowntime - 1
                Wait(60000)
            else
                iscooldown = false
                Config.Cooldowntime = Config.Cooldowntime1
                break
            end
        end
    end)
end)

RegisterServerEvent('mxd-gunheist:server:syncstop', function()
    started = false
    Config.RemTime = -1
end)

RegisterServerEvent('mxd-gunheist:server:starthiest', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    CurrentCops = GetCurrentCops()
    if Player.PlayerData.money['cash'] >= Config.Amount then
        if CurrentCops >= Config.MinCops then
            if not iscooldown then
                if not started then
                    started = true
                    TriggerClientEvent('mxd-gunheist:client:syncstartusb', src)
                    TriggerClientEvent('mxd-gunheist:client:laptopblip', src)
                    TriggerClientEvent('QBCore:Notify', src, 'See Your GPS for Marker', 'success')
                    Player.Functions.RemoveMoney("cash", Config.Amount , "gunheist")
                    Config.RemTime = Config.RemTime1
                    Config.Cooldowntime = Config.Cooldowntime1
                else
                    TriggerClientEvent('QBCore:Notify', src, 'Someone is already doing a hiest', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'CoolDown is there come after ' ..Config.Cooldowntime.. ' Min', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Not Enough Police', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You Don't have " ..Config.Amount.. " as cash", 'error')
    end
end)

RegisterNetEvent('mxd-gunheist:server:policecall', function()
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
    if Config.pdalert == 'qb' then
        for k,v in pairs(players) do
            if v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
                local alertData = {title = 'New 911 Call', coords = {coords.x, coords.y, coords.z}, description = Config.PoliceMessage}
                TriggerClientEvent("qb-phone:client:addPoliceAlert", v.PlayerData.source, alertData)
                TriggerClientEvent('police:client:policeAlert', v.PlayerData.source, coords, Config.PoliceMessage)
            end
        end
    elseif Config.pdalert == 'ps' then
        TriggerClientEvent('mxd-gunheist:client:callpspolice', src)
    end
end)

RegisterServerEvent('mxd-gunheist:server:spawncrate', function()
    spawnedCrate = CreateObject(Config.crateProp, Config.Crate.x, Config.Crate.y, Config.Crate.z, true, false, false)
    SetEntityHeading(spawnedCrate,  Config.Crate.w)
    FreezeEntityPosition(spawnedCrate, true)
end)

RegisterServerEvent('mxd-gunheist:server:deletecrate', function()
    DeleteEntity(spawnedCrate)
end)
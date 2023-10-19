local QBCore = exports['qb-core']:GetCoreObject()
local started = false
local tstart1 = false
local tstart2 = false

Citizen.CreateThread(function()
    while true do
        if started then
            if Config.Team1Death == Config.MaxKill then
                TriggerClientEvent('mxd-gangwar:client:stop', -1)
            elseif Config.Team2Death == Config.MaxKill then
                TriggerClientEvent('mxd-gangwar:client:stop', -1)
            end
            if Config.WarRemTime < 0 then end
        end
        Citizen.Wait(1000)
    end
end)

local function AddAnnounce(message)

    local players = QBCore.Functions.GetQBPlayers()
    for k,v in pairs(players) do
		if v.PlayerData.job.name ~= 'police' then
			TriggerClientEvent('chat:addMessage', v.PlayerData.source, {
				color = { 255, 0, 0},
				multiline = true,
				args = {"Announcement", message}
			})
		end
    end

end

-- starting events
    
RegisterNetEvent('mxd-gangwar:server:menutotarget', function(playerid, amount)
    local src = source
    if not started then
        local player = QBCore.Functions.GetPlayer(src)
        local target = QBCore.Functions.GetPlayer(tonumber(playerid))


        if not target then
            TriggerClientEvent('QBCore:Notify', src, 'Invalid Player Id Supplied', 'error')
            return
        end
    
        if not amount then
            TriggerClientEvent('QBCore:Notify', src, 'Invalid Amount Supplied', 'error')
            return
        end

        if tonumber(exports['qb-management']:GetGangAccount(player.PlayerData.gang.name)) > tonumber(amount * 1000) then
            if #(GetEntityCoords(GetPlayerPed(src))-GetEntityCoords(GetPlayerPed(target.PlayerData.source)))<3 then
                if target.PlayerData.gang.name ~= nil and target.PlayerData.gang.isboss then
                    local data = {
                        ['player'] = player,
                        ['amount'] = amount * 1000,
                        ['target'] = target,
                    }
                    TriggerClientEvent('mxd-gangwar:client:openMenuother', target.PlayerData.source, data)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Other Person don't have authority to accept this", 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'This player is not close enough', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "Your Gang Bank doesn't have sufficient amount", 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Another War is going on now', 'error')
    end
end)

RegisterNetEvent('mxd-gangwar:server:accept', function(data)
    local src = source
    local player = data['player']
    local target = data['target']
    amount = data['amount']

    teamdata1 = {
        gang = player.PlayerData.gang.name,
        opgang = target.PlayerData.gang.name,
    }

    teamdata2 = {
        gang = target.PlayerData.gang.name,
        opgang = player.PlayerData.gang.name,
    }

    if tonumber(exports['qb-management']:GetGangAccount(target.PlayerData.gang.name)) > tonumber(amount) then
        TriggerClientEvent('mxd-gangwar:client:start1', -1, teamdata1)
        TriggerClientEvent('mxd-gangwar:client:start2', -1, teamdata2)

        Config.Team1 = player.PlayerData.gang.name
        Config.Team2 = target.PlayerData.gang.name
        started = true

        Config.Team1Death = 0
        Config.Team2Death = 0
        local messages = (" War Started Between " ..player.PlayerData.gang.name.. " and " ..target.PlayerData.gang.name.. "")
        AddAnnounce(messages)
        TriggerEvent('mxd-gangwar:server:CreateLog', 'mxd-gangwar', "War Started Between " ..player.PlayerData.gang.name.. " and " ..target.PlayerData.gang.name.. " started by " ..player.PlayerData.charinfo.firstname.. " and " ..target.PlayerData.charinfo.firstname.. "" )

    else
        TriggerClientEvent('QBCore:Notify', src, "Your Gang Bank doesn't have sufficient amount", 'error')
    end

end)

RegisterNetEvent('mxd-gangwar:server:addpoint', function(deadteam, killer)
    local killerped = QBCore.Functions.GetPlayer(killer)
    local killergang = killerped.PlayerData.gang.name

    if deadteam == Config.Team1 then
        if killergang == Config.Team2 then
            Config.Team1Death = Config.Team1Death + 1
        end
    elseif deadteam == Config.Team2 then
        if killergang == Config.Team1 then
            Config.Team2Death = Config.Team2Death + 1
        end
    end
end)

-- timer events

RegisterNetEvent('mxd-gangwar:server:synctimer', function(t1)
    Config.WarRemTime = t1
end)

RegisterNetEvent('mxd-gangwar:server:timer1', function(data)
    if not tstart1 then
        local Players = QBCore.Functions.GetPlayers()
        teamdata1 = {
            gang = data.gang,
            opgang = data.opgang,
        }
        tstart1 = true
        TriggerClientEvent('mxd-gangwar:client:resettimer', -1)
        TriggerClientEvent('mxd-gangwar:client:startPreptimer', -1, teamdata1)
        TriggerClientEvent('mxd-gangwar:client:displayPreptimer1', -1, teamdata1)
        Citizen.Wait(Config.PrepTime * 60000)
        Config.Team1Death = 0
        TriggerClientEvent('mxd-gangwar:client:displaytimer1', -1, teamdata1)
        TriggerClientEvent('mxd-gangwar:client:starttimer', -1, teamdata1)
    end
end)

RegisterNetEvent('mxd-gangwar:server:timer2', function(data)
    if not tstart2 then
        teamdata2 = {
            gang = data.gang,
            opgang = data.opgang,
        }
        tstart2 = true
        TriggerClientEvent('mxd-gangwar:client:resettimer', -1)
        TriggerClientEvent('mxd-gangwar:client:startPreptimer', -1, teamdata2)
        TriggerClientEvent('mxd-gangwar:client:displayPreptimer2', -1, teamdata2)
        Citizen.Wait(Config.PrepTime * 60000)
        Config.Team2Death = 0
        TriggerClientEvent('mxd-gangwar:client:displaytimer2', -1, teamdata2)
        TriggerClientEvent('mxd-gangwar:client:starttimer', -1, teamdata2)
    end
end)

--kill events

RegisterNetEvent('mxd-gangwar:server:checkdeath1', function(teamdata1, playerid)
    if teamdata1 ~= nil then
        local DeadPlayer = QBCore.Functions.GetPlayer(tonumber(playerid))
        TriggerEvent('mxd-gangwar:server:final')
    end
end)

RegisterNetEvent('mxd-gangwar:server:checkdeath2', function(teamdata2, playerid)

end)

RegisterNetEvent('mxd-gangwar:server:final', function()
    if Config.Team1Death > Config.Team2Death then
        exports['qb-management']:AddGangMoney(Config.Team2, tonumber(amount))
        exports['qb-management']:RemoveGangMoney(Config.Team1, tonumber(amount))
        local messagew = ("War Between " ..Config.Team1.. " and " ..Config.Team2.. " is won by " ..Config.Team2.. "" )
        AddAnnounce(messagew)
        TriggerEvent('mxd-gangwar:server:CreateLog', 'mxd-gangwar', "War Between " ..Config.Team1.. " and " ..Config.Team2.. " is won by " ..Config.Team2.. "" )
    elseif Config.Team2Death > Config.Team1Death then
        exports['qb-management']:AddGangMoney(Config.Team1, tonumber(amount))
        exports['qb-management']:RemoveGangMoney(Config.Team2, tonumber(amount))
        local messagew = ("War Between " ..Config.Team1.. " and " ..Config.Team2.. " is won by " ..Config.Team1.. "" )
        AddAnnounce(messagew)
        TriggerEvent('mxd-gangwar:server:CreateLog', 'mxd-gangwar', "War Between " ..Config.Team1.. " and " ..Config.Team2.. " is won by " ..Config.Team1.. "" )
    else
        local messagew = ("War Between " ..Config.Team1.. " and " ..Config.Team2.. " had a tie" )
        AddAnnounce(messagew)
        TriggerEvent('mxd-gangwar:server:CreateLog', 'mxd-gangwar', "War Between " ..Config.Team1.. " and " ..Config.Team2.. " had a tie ")
    end
    started = false
    teamdata1 = 'nil'
    Config.Team1 = nil
    Config.Team1Death = 0
    Config.WarRemTime = Config.WarTime
    tstart1 = false
    teamdata2 = 'nil'
    Config.Team2 = nil
    Config.Team2Death = 0
    Config.WarRemTime = Config.WarTime
    tstart2 = false
end)

-- cancelling events

RegisterNetEvent('mxd-gangwar:server:cancel', function(playerid)
    local target = QBCore.Functions.GetPlayer(tonumber(playerid))
    TriggerClientEvent('mxd-gangwar:client:openMenuCancel', target.PlayerData.source, teams)
end)

-- item

QBCore.Functions.CreateUseableItem(Config.Itemname, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("mxd-gangwar:client:openMenu", src)
end)

-- logs

RegisterNetEvent('mxd-gangwar:server:CreateLog', function(title, message)        
    local webHook = Config.Webhook 
    local embedData = {
        {
            ['title'] = title,
            ['color'] = 16744192,
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'mxd Logs',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/953614783482044428/1037325189790318622/MeetxDev_Fivem.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
end)


-- ui

QBCore.Functions.CreateCallback("mxd-gangwar:getStats", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = {Config.Team1, Config.Team2, Config.Team1Death, Config.Team2Death}
    cb(result)
end)
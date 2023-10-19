local QBCore = exports['qb-core']:GetCoreObject()
local isdone = false

QBCore.Commands.Add(Config.commandname, 'Kill player`s character',{{name = 'id', help = 'Player ID'}}, true, function(source, args)
    local src = source
    local playerId = args[1]
    local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
    if Player then
        local citizenid = Player.PlayerData.citizenid
        DropPlayer(playerId, 'Your character was killed (You may rejoin now!)')
        CreateThread(function()
            Wait(200)
            exports.oxmysql:execute('DELETE FROM players WHERE citizenid = ?', { citizenid })
            exports.oxmysql:execute('DELETE FROM player_vehicles WHERE citizenid = ?', { citizenid })
            exports.oxmysql:execute('DELETE FROM player_outfits WHERE citizenid = ?', { citizenid })
            exports.oxmysql:execute('DELETE FROM player_houses WHERE citizenid = ?', { citizenid })
            exports.oxmysql.execute('DELETE FROM player_contacts WHERE citizenid =?', { citizenid })
            exports.oxmysql.execute('DELETE FROM playerskins WHERE citizenid =?', { citizenid })
            TriggerClientEvent("QBCore:Notify",src, 'Character killed!')
            TriggerEvent('mxd-killchar:server:CreateLog', 'mxd-killchar', " " ..Player.PlayerData.charinfo.firstname.. " Character just got deleted "  )
        end)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Player not found', 'error')
    end
end, 'god')

RegisterServerEvent('mxd-killchar:server:killchar', function(playerid)
    Citizen.CreateThread(function()
		while true do
            local src = source
            local playerId = playerid
            local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
            if Player and Player.PlayerData.metadata["isdead"] then
                while isdone do
                    local citizenid = Player.PlayerData.citizenid
                    DropPlayer(playerId, 'Your character was killed (You may rejoin now!)')
                    exports.oxmysql:execute('DELETE FROM players WHERE citizenid = ?', { citizenid })
                    exports.oxmysql:execute('DELETE FROM player_vehicles WHERE citizenid = ?', { citizenid })
                    exports.oxmysql:execute('DELETE FROM player_outfits WHERE citizenid = ?', { citizenid })
                    exports.oxmysql:execute('DELETE FROM player_houses WHERE citizenid = ?', { citizenid })
                    exports.oxmysql.execute('DELETE FROM player_contacts WHERE citizenid =?', { citizenid })
                    exports.oxmysql.execute('DELETE FROM playerskins WHERE citizenid =?', { citizenid })
                    TriggerEvent('mxd-killchar:server:CreateLog', 'MxD-KillChar', " " ..Player.PlayerData.charinfo.firstname.. "Character just got deleted "  )
                    Wait(Config.Deltime * 1000)
                    DeleteEntity(CoffinProp)
                    isdone = false
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Player not found or is not dead', 'error')
            end
			Citizen.Wait(1000)
		end
	end)
end)

QBCore.Commands.Add(Config.FuneralCommand, 'Announce Funeral (Admin Only)', { { name = 'name', help = 'Player Name' } }, true, function(source, args)
    local msg = args[1]
    if msg == nil then 
        return
        TriggerClientEvent("QBCore:Notify", source, 'Enter Name of the person')
    end
    TriggerClientEvent('chat:addMessage', -1, {
        color = { 255, 0, 0},
        multiline = true,
        args = {"Announcement", 'There is a funeral goiing on of "' ..msg.. '" at graveyard. Your presence will be highly valued.'}
    })
end, 'admin')

RegisterNetEvent('mxd-killchar:server:CreateLog', function(title, message)        
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
                ['name'] = Config.WebhookName,
                ['icon_url'] = Config.WebhookIcon,
            },
        }
    }
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
end)

RegisterServerEvent('mxd-killchar:server:spawncoffin', function()
	CoffinProp = CreateObject(`prop_coffin_02b`, -1762.9, -262.5, 47.2, true, true, true)
    SetEntityHeading(CoffinProp, 333.62)
end)

RegisterServerEvent('mxd-killchar:server:killcharbag', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    isdone = true
    if Config.DisappearItem then
        Player.Functions.RemoveItem(Config.item, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[string.lower(Config.item)], "remove")
    end
end)

RegisterServerEvent('mxd-killchar:server:bbagcheck', function(player, playerid)
    local Player = QBCore.Functions.GetPlayer(tonumber(playerid))
    local src = source
    local User =  QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData.metadata["isdead"] then

        TriggerClientEvent("mxd-killchar:client:startanimbag", src, player, playerid)
        if Config.DisappearItem then
            User.Functions.RemoveItem(Config.itembag, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[string.lower(Config.itembag)], "remove")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Player not found or is not dead', 'error')
    end
end)

RegisterServerEvent('mxd-killchar:server:bbag', function(playerid)
    TriggerClientEvent("mxd-killchar:client:invisi", playerid)
end)


QBCore.Functions.CreateUseableItem(Config.itemcoffin, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.DisappearItem then
        Player.Functions.RemoveItem(Config.itemcoffin, 1)
	    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[string.lower(Config.itemcoffin)], "remove")
    end
    TriggerClientEvent("mxd-killchar:client:placecoffin", src)
    
end)
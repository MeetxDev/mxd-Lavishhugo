local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add(Config.GrantCommandName, 'Grant Food License', {{name = "id", help ='Player id'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.type == Config.GrantJobType then
        local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if not SearchedPlayer then return end
        local licenseTable = SearchedPlayer.PlayerData.metadata["licences"]
        if licenseTable['foodtruck'] then
            TriggerClientEvent('QBCore:Notify', src, "License is already granted", "error")
            return
        end
        licenseTable['foodtruck'] = true
        SearchedPlayer.Functions.SetMetaData("licences", licenseTable)
        TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, "License Granted", "success")
        TriggerClientEvent('QBCore:Notify', src, "License Granted", "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "You aren't authorized to this", "error")
    end
end)

QBCore.Commands.Add(Config.RevokeCommandName, 'Revoke Food License', {{name = "id", help ='Player id'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.type == Config.GrantJobType then
        local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if not SearchedPlayer then return end
        local licenseTable = SearchedPlayer.PlayerData.metadata["licences"]
        if not licenseTable['foodtruck'] then
            TriggerClientEvent('QBCore:Notify', src, "Person don't have food license", "error")
            return
        end
        licenseTable['foodtruck'] = false
        SearchedPlayer.Functions.SetMetaData("licences", licenseTable)
        TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, "License Revoked", "success")
        TriggerClientEvent('QBCore:Notify', src, "License Revoked", "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "You aren't authorized to this", "error")
    end
end)


CreateThread(function()
    if Config.CommandNPCFood ~= "false" then
        QBCore.Commands.Add(Config.CommandNPCFood, 'Sell Food Items', {}, true, function(source)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            TriggerClientEvent('mxd-foodtruck:client:radialstartfoodtruck', src)
        end)
    end
    
    if Config.CommandNPCCoffee ~= "false" then
        QBCore.Commands.Add(Config.CommandNPCCoffee, 'Revoke Food License', {}, true, function(source, args)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            TriggerClientEvent('mxd-foodtruck:client:radialstartcoffeecart', src)
        end)
    end
    
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then -- [ To Delete Temp stashes Created at Start ]
        CreateThread(function()
            if not Config.OwnableTruck then
                MySQL.query("DELETE FROM stashitems WHERE stash LIKE 'Truck Stash %'")
            end

            if Config.UseCoffeeTruck then
                MySQL.query("DELETE FROM stashitems WHERE stash LIKE 'Coffee Stash %'")
            end

            MySQL.query("DELETE FROM stashitems WHERE stash LIKE 'MxD Bills %'")
        end)
    end
end)
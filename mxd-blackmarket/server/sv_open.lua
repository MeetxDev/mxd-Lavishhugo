local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mxd-blackmarket:server:minus')
AddEventHandler('mxd-blackmarket:server:minus', function(Amount, item)
    if Config.Limit then
        for k, v in pairs(Config.Tier1Items.items) do
            if item == Config.Tier1Items.items[k].name then           
                Config.Tier1Items.items[k].amount =  Config.Tier1Items.items[k].amount - Amount
                TriggerClientEvent('mxd-blackmarket:client:sync:Tier', -1, Config.Tier1Items.items[k].amount, item)
            end
        end
        for k, v in pairs(Config.Tier2Items.items) do
            if item == Config.Tier2Items.items[k].name then
                Config.Tier2Items.items[k].amount =  Config.Tier2Items.items[k].amount - Amount
                TriggerClientEvent('mxd-blackmarket:client:sync:Tier', -1, Config.Tier2Items.items[k].amount, item)
            end
        end
        for k, v in pairs(Config.Tier3Items.items) do
            if item == Config.Tier3Items.items[k].name then
                Config.Tier3Items.items[k].amount =  Config.Tier3Items.items[k].amount - Amount
                TriggerClientEvent('mxd-blackmarket:client:sync:Tier', -1, Config.Tier3Items.items[k].amount, item)
            end
        end
    end
end)

RegisterNetEvent('mxd-blackmarket:server:reset')
AddEventHandler('mxd-blackmarket:server:reset', function()
    if Config.Limit then
        for k, v in pairs(Config.Tier1Items.items) do
            Config.Tier1Items.items[k].amount =  Config.Tier1Items.items[k].amount2 
            TriggerClientEvent('mxd-blackmarket:client:sync:Tier', -1, Config.Tier1Items.items[k].amount, Config.Tier1Items.items[k].name)
        end
        for k, v in pairs(Config.Tier2Items.items) do
            Config.Tier2Items.items[k].amount =  Config.Tier2Items.items[k].amount2
            TriggerClientEvent('mxd-blackmarket:client:sync:Tier', -1, Config.Tier2Items.items[k].amount, Config.Tier2Items.items[k].name)
        end
        for k, v in pairs(Config.Tier3Items.items) do
            Config.Tier3Items.items[k].amount =  Config.Tier3Items.items[k].amount2
            TriggerClientEvent('mxd-blackmarket:client:sync:Tier', -1, Config.Tier3Items.items[k].amount, Config.Tier3Items.items[k].name)

        end
    end
end)
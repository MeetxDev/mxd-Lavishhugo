local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mxd-foodtruck:server:sellnpcselling', function(item, amount, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local hasItem = Player.Functions.GetItemByName(item)
        local AvailableTea = {}
        if hasItem ~= nil and hasItem.amount >= amount then
            TriggerClientEvent('QBCore:Notify', src, "Offered Accepted", 'success')
            Player.Functions.RemoveItem(item, amount)
            Player.Functions.AddMoney('cash', price, "sold-npcselling")
            TriggerClientEvent(Config.InvRemoveEvent, src, QBCore.Shared.Items[item], "remove")
        else
            TriggerClientEvent('QBCore:Notify', src,"No Item Found", 'error')
        end
    end
end)
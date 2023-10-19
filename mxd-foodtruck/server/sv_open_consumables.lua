local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mxd-foodtruck:server:AddFood', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.SetMetaData('hunger', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', source, amount, Player.PlayerData.metadata.thirst)
end)

RegisterNetEvent('mxd-foodtruck:server:AddThirst', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.SetMetaData('thirst', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', source, Player.PlayerData.metadata.hunger, amount)
end)

-- Create Usable

QBCore.Functions.CreateUseableItem("beantaco", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:Eattaco", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cheesetaco", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:Eattaco", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("nakedtaco", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:Eattaco", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("grilledtaco", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:Eattaco", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("classicburrito", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:EatBurrito", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("layerburrito", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:EatBurrito", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burritobowl", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:EatBowl", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("beanbowl", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:EatBowl", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("saladbowl", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:EatBowl", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cheesenachos", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:EatNachos", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("classiclemonade", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:DrinkJuice", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("sodalemonade", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:DrinkJuice", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("applejuice", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:DrinkJuice", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("orangejuice", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:DrinkJuice", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cappuccino", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("frappuccino", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("latte", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:DrinkCoffee", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("coldcoffee", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("mxd-foodtruck:client:DrinkCoffee", src, item.name)
    end
end)
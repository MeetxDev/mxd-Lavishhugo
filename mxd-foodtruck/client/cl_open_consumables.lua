local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mxd-foodtruck:client:Eattaco', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eattaco"})
    QBCore.Functions.Progressbar("eat_taco", 'Eating Food', Config.EatTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent(Config.InvRemoveEvent, QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("mxd-foodtruck:server:AddFood", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.ConsumablesFood[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:EatBurrito', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eatburrito"})
    QBCore.Functions.Progressbar("eat_burrito", 'Eating Food', Config.EatTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent(Config.InvRemoveEvent, QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("mxd-foodtruck:server:AddFood", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.ConsumablesFood[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:EatBowl', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eatbowl"})
    QBCore.Functions.Progressbar("eat_bowl", 'Eating Food', Config.EatTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent(Config.InvRemoveEvent, QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("mxd-foodtruck:server:AddFood", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.ConsumablesFood[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:EatNachos', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eatnacho"})
    QBCore.Functions.Progressbar("eat_bowl", 'Eating Food', Config.EatTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent(Config.InvRemoveEvent, QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("mxd-foodtruck:server:AddFood", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.ConsumablesFood[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:DrinkJuice', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drinkjuice"})
    QBCore.Functions.Progressbar("eat_bowl", 'Drinking Item', Config.DrinkingTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent(Config.InvRemoveEvent, QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("mxd-foodtruck:server:AddThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.ConsumablesDrink[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:DrinkCoffee', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("eat_bowl", 'Drinking Item', Config.DrinkingTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent(Config.InvRemoveEvent, QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("mxd-foodtruck:server:AddThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.ConsumablesDrink[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)
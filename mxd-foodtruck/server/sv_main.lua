local QBCore = exports['qb-core']:GetCoreObject()

local function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

QBCore.Functions.CreateCallback('mxd-foodtruck:server:HasItemChop', function(source, cb, item)
    local retval = false
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.ChopVeg) do
        if item == Config.ChopVeg[i]['item'] then
            for m, n in pairs(Config.ChopVeg[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    retval = true
                else 
                    retval = false
                    break
                end
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('mxd-foodtruck:server:HasItemPrep', function(source, cb, item)
    local retval = false
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.PrepItem) do
        if item == Config.PrepItem[i]['item'] then
            for m, n in pairs(Config.PrepItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    retval = true
                else 
                    retval = false
                    break
                end
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('mxd-foodtruck:server:HasItemCook', function(source, cb, item)
    local retval = false
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.FoodItem) do
        if item == Config.FoodItem[i]['item'] then
            for m, n in pairs(Config.FoodItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    retval = true
                else 
                    retval = false
                    break
                end
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('mxd-foodtruck:server:HasItemDrink', function(source, cb, item)
    local retval = false
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.DrinkItem) do
        if item == Config.DrinkItem[i]['item'] then
            for m, n in pairs(Config.DrinkItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    retval = true
                else 
                    retval = false
                    break
                end
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('mxd-foodtruck:server:HasItemCoffeePrep', function(source, cb, item)
    local retval = false
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.CoffeePrepItem) do
        if item == Config.CoffeePrepItem[i]['item'] then
            for m, n in pairs(Config.CoffeePrepItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    retval = true
                else 
                    retval = false
                    break
                end
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('mxd-foodtruck:server:HasItemCoffeeCook', function(source, cb, item)
    local retval = false
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.CoffeeCookItem) do
        if item == Config.CoffeeCookItem[i]['item'] then
            for m, n in pairs(Config.CoffeeCookItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    retval = true
                else 
                    retval = false
                    break
                end
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('mxd-foodtruck:server:HasCoffeeMoney', function(source, cb)
    local retval = false
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveMoney("cash", Config.CoffeeDeposit, "CoffeeDeposit") then
        TriggerClientEvent('QBCore:Notify', src, "You paid "..Config.CurrencySymbol.. "" ..Config.CoffeeDeposit.. " as Deposit", 'success')
        retval = true
    else
        TriggerClientEvent('QBCore:Notify', src, "You need "..Config.CurrencySymbol.. "" ..Config.CoffeeDeposit.. " as Deposit", 'error')
        retval = false
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('mxd-foodtruck:server:HasTruckRentMoney', function(source, cb)
    local retval = false
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveMoney("cash", Config.TruckPrice, "RentTruck") then
        TriggerClientEvent('QBCore:Notify', src, "You paid "..Config.CurrencySymbol.. "" ..Config.TruckPrice.. " as Deposit", 'success')
        retval = true
    else
        TriggerClientEvent('QBCore:Notify', src, "You need "..Config.CurrencySymbol.. "" ..Config.TruckPrice.. " as Deposit", 'error')
        retval = false
    end
    cb(retval)
end)

RegisterServerEvent('mxd-foodtruck:server:additemcl', function(item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney("cash", Config.MaintainPrice, "CropMaintain") then
        TriggerClientEvent('QBCore:Notify', src, "You paid "..Config.CurrencySymbol.. "" ..Config.MaintainPrice.. " as maintenance cost", 'success')
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent(Config.InvRemoveEvent, src, QBCore.Shared.Items[string.lower(item)], "add")
    else
        TriggerClientEvent('QBCore:Notify', src, "You need "..Config.CurrencySymbol.. "" ..Config.MaintainPrice.. " as maintenance cost", 'error')
    end
end)

RegisterServerEvent('mxd-foodtruck:server:additem', function(source, item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(item, amount)
	TriggerClientEvent(Config.InvRemoveEvent, src, QBCore.Shared.Items[string.lower(item)], "add")
end)

RegisterServerEvent('mxd-foodtruck:server:removeitem', function(source, item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(item, amount)
	TriggerClientEvent(Config.InvRemoveEvent, src, QBCore.Shared.Items[string.lower(item)], "remove")
end)

RegisterServerEvent('mxd-foodtruck:server:adddepositmoney', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DepositMoney = (Config.CoffeeDepositReturn/100 * Config.CoffeeDeposit)
    Player.Functions.AddMoney("cash", DepositMoney, "DepositBack")
    TriggerClientEvent('QBCore:Notify', src, "You Got Your Deposit Back", 'success')
end)

RegisterServerEvent('mxd-foodtruck:server:addtruckdepositmoney', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DepositMoney = (Config.TruckDepositReturn/100 * Config.TruckPrice)
    Player.Functions.AddMoney("cash", DepositMoney, "DepositBack")
    TriggerClientEvent('QBCore:Notify', src, "You Got Your Deposit Back", 'success')
end)

RegisterNetEvent('mxd-foodtruck:server:buyVehicle', function()
    local src = source
    vehicle = Config.TruckModel
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local cash = pData.PlayerData.money['cash']
    local bank = pData.PlayerData.money['bank']
    local vehiclePrice = Config.TruckPrice
    local plate = GeneratePlate()
    if cash > tonumber(vehiclePrice) then
        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            pData.PlayerData.license,
            cid,
            vehicle,
            GetHashKey(vehicle),
            '{}',
            plate,
            'pillboxgarage',
            0
        })
        TriggerClientEvent('QBCore:Notify', src, 'Congratulations for you new truck', 'success')
        TriggerClientEvent('mxd-foodtruck:client:spawnveh', src, vehicle, plate)
        pData.Functions.RemoveMoney('cash', vehiclePrice, 'vehicle-bought-in-showroom')
    elseif bank > tonumber(vehiclePrice) then
        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            pData.PlayerData.license,
            cid,
            vehicle,
            GetHashKey(vehicle),
            '{}',
            plate,
            'pillboxgarage',
            0
        })
        TriggerClientEvent('QBCore:Notify', src, 'Congratulations for you new truck', 'success')
        TriggerClientEvent('mxd-foodtruck:client:spawnveh', src, vehicle, plate)
        pData.Functions.RemoveMoney('bank', vehiclePrice, 'vehicle-bought-in-showroom')
    else
        TriggerClientEvent('QBCore:Notify', src,'Not Enough Money', 'error')
    end
end)

RegisterServerEvent('mxd-foodtruck:server:chopveg', function(veg)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.ChopVeg) do
        if veg == Config.ChopVeg[i]['item'] then
            for m, n in pairs(Config.ChopVeg[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    TriggerEvent('mxd-foodtruck:server:removeitem', src, m, n)
                end
            end
            TriggerEvent('mxd-foodtruck:server:additem', src, Config.ChopVeg[i]['item'], Config.ChopVeg[i]['amount'])
        end
    end
end)

RegisterServerEvent('mxd-foodtruck:server:prepitem', function(prepitem)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.PrepItem) do
        if prepitem == Config.PrepItem[i]['item'] then
            for m, n in pairs(Config.PrepItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    TriggerEvent('mxd-foodtruck:server:removeitem', src, m, n)
                end
            end
            TriggerEvent('mxd-foodtruck:server:additem', src,Config.PrepItem[i]['item'], Config.PrepItem[i]['amount'])
        end
    end
end)

RegisterServerEvent('mxd-foodtruck:server:cookitem', function(cookitem)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.FoodItem) do
        if cookitem == Config.FoodItem[i]['item'] then
            for m, n in pairs(Config.FoodItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    TriggerEvent('mxd-foodtruck:server:removeitem', src, m, n)
                end
            end
            TriggerEvent('mxd-foodtruck:server:additem', src,Config.FoodItem[i]['item'], Config.FoodItem[i]['amount'])
        end
    end
end)

RegisterServerEvent('mxd-foodtruck:server:drinkitem', function(drinkitem)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.DrinkItem) do
        if drinkitem == Config.DrinkItem[i]['item'] then
            for m, n in pairs(Config.DrinkItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    TriggerEvent('mxd-foodtruck:server:removeitem', src, m, n)
                end
            end
            TriggerEvent('mxd-foodtruck:server:additem', src,Config.DrinkItem[i]['item'], Config.DrinkItem[i]['amount'])
        end
    end
end)

RegisterServerEvent('mxd-foodtruck:server:coffeeprepitem', function(cofprepitem)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.CoffeePrepItem) do
        if cofprepitem == Config.CoffeePrepItem[i]['item'] then
            for m, n in pairs(Config.CoffeePrepItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    TriggerEvent('mxd-foodtruck:server:removeitem', src, m, n)
                end
            end
            TriggerEvent('mxd-foodtruck:server:additem', src, Config.CoffeePrepItem[i]['item'], Config.CoffeePrepItem[i]['amount'])
        end
    end
end)

RegisterServerEvent('mxd-foodtruck:server:coffeecookitem', function(cofcookitem)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i in pairs(Config.CoffeeCookItem) do
        if cofcookitem == Config.CoffeeCookItem[i]['item'] then
            for m, n in pairs(Config.CoffeeCookItem[i]['required']) do
                if QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m) and QBCore.Functions.GetPlayer(source).Functions.GetItemByName(m).amount >= n then 
                    TriggerEvent('mxd-foodtruck:server:removeitem', src, m, n)
                end
            end
            TriggerEvent('mxd-foodtruck:server:additem', src, Config.CoffeeCookItem[i]['item'], Config.CoffeeCookItem[i]['amount'])
        end
    end
end)
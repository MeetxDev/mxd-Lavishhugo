local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local resulttruck
local resultped
local resultcoffee
local truckplatetaken
local hasrenttruck
istakentruck = false

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

function GetFoodTruck()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = GetVehiclePedIsIn(PlayerPedId())

    while vehicle == 0 do
        vehicle = QBCore.Functions.GetClosestVehicle()
        if #(pos - GetEntityCoords(vehicle)) > 5 then
        return end
    end

    if not IsEntityAVehicle(vehicle) then vehicle = nil end
    return vehicle
end

function IsOwned()
    local veh = GetFoodTruck()
    local plate = QBCore.Functions.GetPlate(veh)

    if Config.ShouldHaveKey then

        haskeys = exports[Config.VehicleKeysName]:HasKeys(plate)

        if Config.UseLicense and Config.useJob then
            
            if haskeys and PlayerData.metadata["licences"] and PlayerData.metadata["licences"].foodtruck and PlayerData.job.name == Config.Job then
                resulttruck = true
            else
                resulttruck = false
            end

        elseif not Config.UseLicense and Config.useJob then

            if PlayerData.job.name == Config.Job then
                resulttruck = true
            else
                resulttruck = false
            end

        elseif Config.UseLicense and not Config.useJob then

            if haskeys and PlayerData.metadata["licences"] and PlayerData.metadata["licences"].foodtruck then
                resulttruck = true
            else
                resulttruck = false
            end
            
        elseif haskeys and not Config.UseLicense and not Config.useJob then
            resulttruck = true
        end

    else

        if Config.UseLicense and Config.useJob then
            if PlayerData.metadata["licences"] and PlayerData.metadata["licences"].foodtruck and PlayerData.job.name == Config.Job then
                resulttruck = true
            else
                resulttruck = false
            end
        elseif not Config.UseLicense and Config.useJob then
            if PlayerData.job.name == Config.Job then
                resulttruck = true
            else
                resulttruck = false
            end
        elseif Config.UseLicense and not Config.useJob then
            if PlayerData.metadata["licences"] and PlayerData.metadata["licences"].foodtruck then
                resulttruck = true
            else
                resulttruck = false
            end
        elseif not Config.UseLicense and not Config.useJob then
            resulttruck = true
        end

    end

    return resulttruck
end

function CanTarget()

    if Config.UseLicense and Config.useJob then
        if PlayerData.metadata["licences"] and PlayerData.metadata["licences"].foodtruck and PlayerData.job.name == Config.Job then
            resultped = true
        else
            resultped = false
        end
    elseif not Config.UseLicense and Config.useJob then
        if PlayerData.job.name == Config.Job then
            resultped = true
        else
            resultped = false
        end
    elseif Config.UseLicense and not Config.useJob then
        if PlayerData.metadata["licences"] and PlayerData.metadata["licences"].foodtruck then
            resultped = true
        else
            resultped = false
        end
    elseif not Config.UseLicense and not Config.useJob then
        resultped = true
    end

    return resultped
end

function CanTargetCoffee()

    if Config.UseLicense and Config.useJob and Config.UseCoffeeTruck then
        if PlayerData.metadata["licences"] and PlayerData.metadata["licences"].foodtruck and PlayerData.job.name == Config.Job then
            resultcoffee = true
        else
            resultcoffee = false
        end
    elseif not Config.UseLicense and Config.useJob and Config.UseCoffeeTruck then
        if PlayerData.job.name == Config.Job then
            resultcoffee = true
        else
            resultcoffee = false
        end
    elseif Config.UseLicense and not Config.useJob and Config.UseCoffeeTruck then
        if PlayerData.metadata["licences"] and PlayerData.metadata["licences"].foodtruck then
            resultcoffee = true
        else
            resultcoffee = false
        end
    elseif not Config.UseLicense and not Config.useJob and Config.UseCoffeeTruck then
        resultcoffee = true
    end

    return resultcoffee
end

local function HasTruckMoney()
    local tm = promise.new()
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:HasTruckRentMoney', function(result)
        tm:resolve(result)
    end, item, amount)

    return Citizen.Await(tm)
end

local function CheckIfRentTruck()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    local plate = QBCore.Functions.GetPlate(vehicle)

    if #(pos - GetEntityCoords(vehicle)) < 15 then
        isnear = true
    end

    if plate == truckplatetaken and isnear then
        hasrenttruck = true
    else
        hasrenttruck = false
    end

    return hasrenttruck
    
end

local function MxDHasItemChop(item)
    local p = promise.new()
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:HasItemChop', function(result)
        p:resolve(result)
    end, item)
    return Citizen.Await(p)
end

local function MxDHasItemPrep(item)
    local m = promise.new()
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:HasItemPrep', function(result)
        m:resolve(result)
    end, item)
    return Citizen.Await(m)
end

local function MxDHasItemCook(item)
    local n = promise.new()
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:HasItemCook', function(result)
        n:resolve(result)
    end, item)
    return Citizen.Await(n)
end

local function MxDHasItemDrink(item)
    local o = promise.new()
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:HasItemDrink', function(result)
        o:resolve(result)
    end, item)
    return Citizen.Await(o)
end

RegisterNetEvent('mxd-foodtruck:client:spawnveh', function(vehicle, plate)
    local spid = math.random(1, #Config.TruckSpawn)
    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
        local veh = NetToVeh(netId)
        exports[Config.FuelScriptName]:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, Config.TruckSpawn[spid].w)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(veh))
    end, vehicle, Config.TruckSpawn[spid], true)
end)

RegisterNetEvent('mxd-foodtruck:client:openstash', function()
    local veh = GetFoodTruck()
    local plate = QBCore.Functions.GetPlate(veh)
    TriggerServerEvent(Config.InvShopEvent, "stash", "Truck Stash "..plate)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
    TriggerEvent(Config.InvStashEvent, "Truck Stash "..plate)
end)

RegisterNetEvent('mxd-foodtruck:client:openingshop', function()
    TriggerServerEvent(Config.InvShopEvent, "shop", "General Store", Config.IngShopItems)
end)

RegisterNetEvent('mxd-foodtruck:client:opencropshop', function()
    TriggerServerEvent(Config.InvShopEvent, "shop", "Crop Store", Config.CropShopItems)
end)

RegisterNetEvent('mxd-foodtruck:client:close', function()
    exports['qb-menu']:closeMenu()
end)

RegisterNetEvent('mxd-foodtruck:client:chopveg', function(vegname)
    local result = MxDHasItemChop(vegname)
    if result then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("chop_ing", "Chopping Veggies", Config.ChopTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('mxd-foodtruck:server:chopveg', vegname)
        end, function() 
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled', "error")
        end)
    else
        QBCore.Functions.Notify("You don't have desired Items", "error")
    end
end)

RegisterNetEvent('mxd-foodtruck:client:prepitem', function(itemname)
    local result = MxDHasItemPrep(itemname)
    if result then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("pep_ing", "Preparing Item", Config.PrepTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('mxd-foodtruck:server:prepitem', itemname)
        end, function() 
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled', "error")
        end)
    else
        QBCore.Functions.Notify("You don't have desired Items", "error")
    end
end)

RegisterNetEvent('mxd-foodtruck:client:cookitem', function(cokitemname)
    local result = MxDHasItemCook(cokitemname)
    if result then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("cook_ing", "Cooking Item", Config.CookTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('mxd-foodtruck:server:cookitem', cokitemname)
        end, function() 
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled', "error")
        end)
    else
        QBCore.Functions.Notify("You don't have desired Items", "error")
    end
end)

RegisterNetEvent('mxd-foodtruck:client:drinkitem', function(drinkitemname)
    local result = MxDHasItemDrink(drinkitemname)
    if result then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("drink_ing", "Preparing Drink", Config.DrinkTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('mxd-foodtruck:server:drinkitem', drinkitemname)
        end, function() 
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled', "error")
        end)
    else
        QBCore.Functions.Notify("You don't have desired Items", "error")
    end
end)

RegisterNetEvent('mxd-foodtruck:client:addtomato', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar("pick_ing", "Picking Tomatoes", Config.PickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('mxd-foodtruck:server:additemcl', 'tomato', 1)
    end, function() 
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Cancelled', "error")
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:addonion', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar("pick_ing", "Picking Tomatoes", Config.PickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('mxd-foodtruck:server:additemcl', 'onion', 1)
    end, function() 
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Cancelled', "error")
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:addcarrot', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar("pick_ing", "Picking Tomatoes", Config.PickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('mxd-foodtruck:server:additemcl', 'carrot', 1)
    end, function() 
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Cancelled', "error")
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:addcapsicum', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar("pick_ing", "Picking Capsicum", Config.PickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('mxd-foodtruck:server:additemcl', 'capsicum', 1)
    end, function() 
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Cancelled', "error")
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:addlemon', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar("pick_ing", "Picking Lemon", Config.PickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('mxd-foodtruck:server:additemcl', 'lemon', 1)
    end, function() 
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Cancelled', "error")
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:addgarlic', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar("pick_ing", "Picking Garlic", Config.PickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('mxd-foodtruck:server:additemcl', 'garlic', 1)
    end, function() 
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Cancelled', "error")
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:addapple', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar("pick_ing", "Picking Apples", Config.PickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('mxd-foodtruck:server:additemcl', 'apple', 1)
    end, function() 
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Cancelled', "error")
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:addorange', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar("pick_ing", "Picking Oranges", Config.PickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('mxd-foodtruck:server:additemcl', 'orange', 1)
    end, function() 
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Cancelled', "error")
    end)
end)

RegisterNetEvent('mxd-foodtruck:client:rentfoodtruck', function()
    local hasmontruck = HasTruckMoney()

    if hasmontruck then
        local spid = math.random(1, #Config.TruckSpawn)
            
        SetEntityCoords(PlayerPedId(), Config.TruckSpawn[spid].x, Config.TruckSpawn[spid].y, Config.TruckSpawn[spid].z, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), Config.TruckSpawn[spid].w)
        TriggerEvent('QBCore:Command:SpawnVehicle', Config.TruckModel)

        Wait(500)

        veh = GetVehiclePedIsIn(PlayerPedId(), false)
        exports[Config.FuelScriptName]:SetFuel(veh, 100)

        truckplatetaken = QBCore.Functions.GetPlate(veh)
        istakentruck = true
    end
end)

RegisterNetEvent('mxd-foodtruck:client:depositfoodtruck', function()
    if istakentruck then
        local result = CheckIfRentTruck()
        if result then
            DeleteEntity(veh)
            TriggerServerEvent('mxd-foodtruck:server:addtruckdepositmoney')
            QBCore.Functions.Notify('Your Food Truck is Deposited', "success")
            istakentruck = false
        else
            QBCore.Functions.Notify('No  Food Truck Found or This is not your Food Truck ', "error")
        end
    end
end)
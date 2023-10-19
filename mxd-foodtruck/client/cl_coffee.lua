local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local vehplate
local hascoffeemoney
istakencoffee = false

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

local function MxDHasItemCoffeePrep(item)
    local cp = promise.new()
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:HasItemCoffeePrep', function(result)
        cp:resolve(result)
    end, item)
    return Citizen.Await(cp)
end

local function MxDHasItemCoffeeCook(item)
    local cc = promise.new()
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:HasItemCoffeeCook', function(result)
        cc:resolve(result)
    end, item)
    return Citizen.Await(cc)
end

function CheckIfCoffeeCart()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    local plate = QBCore.Functions.GetPlate(vehicle)

    if #(pos - GetEntityCoords(vehicle)) < 15 then
        isnear = true
    end

    if plate == vehplate and DoesEntityExist(coffeecart) and isnear then
        hascart = true
    else
        hascart = false
    end

    return hascart
    
end

function HasCofffeeMoney()
    local mn = promise.new()
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:HasCoffeeMoney', function(result)
        mn:resolve(result)
    end, item, amount)

    return Citizen.Await(mn)
end

RegisterNetEvent('mxd-foodtruck:client:spawncoffee', function()
    local hasmoncof = HasCofffeeMoney()

    if not istakencoffee and hasmoncof then
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Wait(10)
        end

        local coid = math.random(1, #Config.CoffeeSpawn)
        
        SetEntityCoords(PlayerPedId(), Config.CoffeeSpawn[coid].x,Config.CoffeeSpawn[coid].y, Config.CoffeeSpawn[coid].z, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), Config.CoffeeSpawn[coid].w)
        TriggerEvent('QBCore:Command:SpawnVehicle', Config.CoffeeVeh)

        Wait(500)

        veh = GetVehiclePedIsIn(PlayerPedId(), false)
        exports[Config.FuelScriptName]:SetFuel(veh, 100)

        vehplate = QBCore.Functions.GetPlate(veh)

        local coords = GetEntityCoords(PlayerPedId())
        coffeecart = CreateObject(Config.CoffeeObject, coords.x, coords.y, coords.z, true, true, true)
        local boneIndexRear = GetEntityBoneIndexByName(veh, "boot")
        AttachEntityToEntity(coffeecart, veh, boneIndexRear, 0.0, -1.75, -0.21, 0.0, 0.0, -90.0, true, true, true, true, 0, true)
        
        Wait(500)
        DoScreenFadeIn(1000)
        Wait(1000)
        istakencoffee = true
    end
end)

RegisterNetEvent('mxd-foodtruck:client:depositcoffee', function()
    if istakencoffee then
        local result = CheckIfCoffeeCart()
        if result then
            DeleteEntity(veh)
            DeleteEntity(coffeecart)
            TriggerServerEvent('mxd-foodtruck:server:adddepositmoney')
            QBCore.Functions.Notify('Your Coffe Cart is Deposited', "success")
            istakencoffee = false
        else
            QBCore.Functions.Notify('No Coffee Cart Found or This is not your Coffee Cart ', "error")
        end
    end
end)

RegisterNetEvent('mxd-foodtruck:client:openstashcoffee', function()
    local veh = GetFoodTruck()
    local plate = QBCore.Functions.GetPlate(veh)
    TriggerServerEvent(Config.InvShopEvent, "stash", "Coffee Stash "..plate)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
    TriggerEvent(Config.InvStashEvent, "Coffee Stash "..plate)
end)

RegisterNetEvent('mxd-foodtruck:client:prepcoffee', function(prepcoffeeitem)
    local result = MxDHasItemCoffeePrep(prepcoffeeitem)
    if result then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("prep_ing", "Preparing Item", Config.CoffeePrepTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('mxd-foodtruck:server:coffeeprepitem', prepcoffeeitem)
        end, function() 
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled', "error")
        end)
    else
        QBCore.Functions.Notify("You don't have desired Items", "error")
    end
end)

RegisterNetEvent('mxd-foodtruck:client:cookcoffee', function(cookcoffeeitem)
    local result = MxDHasItemCoffeeCook(cookcoffeeitem)
    if result then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("cook_ing", "Cooking Item", Config.CoffeeCookTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('mxd-foodtruck:server:coffeecookitem', cookcoffeeitem)
        end, function() 
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify('Cancelled', "error")
        end)
    else
        QBCore.Functions.Notify("You don't have desired Items", "error")
    end
end)
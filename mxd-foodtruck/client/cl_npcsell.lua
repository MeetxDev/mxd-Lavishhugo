local QBCore = exports['qb-core']:GetCoreObject()

local npcselling = false
local hasTarget = false
local lastPed = {}
local itemnow
local startveh

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function loadAnimDict(dict)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

local function toFarAway()
    npcselling = false
    hasTarget = false
    itemnow = nil
    startveh = nil
    QBCore.Functions.Notify("You are too far from Your Food Truck/Coffee Cart", 'error')
end


local function SellToPed(ped)
    hasTarget = true
    for i = 1, #lastPed, 1 do
        if lastPed[i] == ped then
            hasTarget = false
            return
        end
    end

    local succesChance = math.random(1, 100)

    local scamChance = math.random(1, 5)

    if succesChance >= Config.SuccessChanceNPC then
        hasTarget = false
        return
    end

    if itemnow == 'foodtruck' then

        local ItemNo = math.random(1, #Config.FoodTruckSellingList)
        ItemAmount = math.random(1, 3)
        CurrrentItem = Config.FoodTruckSellingList[ItemNo].item
        ItemLabel = Config.FoodTruckSellingList[ItemNo].label
        randomPrice = math.random(Config.FoodTruckSellingList[ItemNo].min, Config.FoodTruckSellingList[ItemNo].max) * ItemAmount

    elseif itemnow == 'coffeecart' then
        
        local ItemNo = math.random(1, #Config.CoffeeCartSellingList)
        ItemAmount = math.random(1, 3)
        CurrrentItem = Config.CoffeeCartSellingList[ItemNo].item
        ItemLabel = Config.CoffeeCartSellingList[ItemNo].label
        randomPrice = math.random(Config.CoffeeCartSellingList[ItemNo].min, Config.CoffeeCartSellingList[ItemNo].max) * ItemAmount
    end

    if scamChance == 5 then
       randomPrice = math.random(3, 10) * ItemAmount
    end

    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)

    local coords = GetEntityCoords(PlayerPedId(), true)
    local pedCoords = GetEntityCoords(ped)
    local pedDist = #(coords - pedCoords)

    TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)


    while pedDist > 1.5 do
        coords = GetEntityCoords(PlayerPedId(), true)
        pedCoords = GetEntityCoords(ped)
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        pedDist = #(coords - pedCoords)

        Wait(100)
    end

    TaskLookAtEntity(ped, PlayerPedId(), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), 5500)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)

    if hasTarget then
        while pedDist < 1.5 do
            coords = GetEntityCoords(PlayerPedId(), true)
            pedCoords = GetEntityCoords(ped)
            pedDist = #(coords - pedCoords)
                if pedDist < 1.5 and npcselling then
                    DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z, "[~g~E~w~] " ..ItemAmount.. "x ~o~" ..ItemLabel.. "~w~ for "..Config.CurrencySymbol.."~b~" ..randomPrice.."~w~/ [~g~G~w~] Decline offer")
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('mxd-foodtruck:server:sellnpcselling', CurrrentItem, ItemAmount, randomPrice)
                        hasTarget = false

                        loadAnimDict("gestures@f@standing@casual")
                        TaskPlayAnim(PlayerPedId(), "gestures@f@standing@casual", "gesture_point", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                        Wait(650)
                        ClearPedTasks(PlayerPedId())

                        SetPedKeepTask(ped, false)
                        SetEntityAsNoLongerNeeded(ped)
                        ClearPedTasksImmediately(ped)
                        lastPed[#lastPed+1] = ped
                        break
                    end

                    if IsControlJustPressed(0, 47) then
                        QBCore.Functions.Notify('Offer Decined', 'error')
                        hasTarget = false
                        SetPedKeepTask(ped, false)
                        SetEntityAsNoLongerNeeded(ped)
                        ClearPedTasksImmediately(ped)
                        lastPed[#lastPed+1] = ped
                        break
                    end
                else
                    hasTarget = false
                    pedDist = 5
                    SetPedKeepTask(ped, false)
                    SetEntityAsNoLongerNeeded(ped)
                    ClearPedTasksImmediately(ped)
                    lastPed[#lastPed+1] = ped
                    npcselling = false
                end
            Wait(3)
        end
        Wait(math.random(2000, 4000))
    end
end

CreateThread(function()
    while true do
        sleep = 1000
        if npcselling then
            sleep = 0
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)
            local StartVehCoords = GetEntityCoords(startveh)
            local PlayerDis = #(coords - StartVehCoords)
            if PlayerDis > 15 then
                toFarAway()
            end
            if not hasTarget then
                local PlayerPeds = {}
                if next(PlayerPeds) == nil then
                    for _, player in ipairs(GetActivePlayers()) do
                        local ped = GetPlayerPed(player)
                        PlayerPeds[#PlayerPeds+1] = ped
                    end
                end
                local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
                if closestDistance < 15.0 and closestPed ~= 0 and not IsPedInAnyVehicle(closestPed) then
                    SellToPed(closestPed)
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('mxd-foodtruck:client:radialstartcoffeecart', function()
    local src = source
    local result = CanTarget()
    local veh = GetFoodTruck()
    local isnearcart = IsVehicleModel(veh, GetHashKey(Config.CoffeeVeh))

    if result and isnearcart then
        if not npcselling and itemnow == nil then
            QBCore.Functions.Notify("started Selling Coffee", 'success')
            itemnow = 'coffeecart'
            startveh = veh
            npcselling = true
        elseif npcselling and itemnow == 'foodtruck' then
            QBCore.Functions.Notify("You are already selling Food Truck Items", 'error')
        else
            QBCore.Functions.Notify("Stopped Selling Coffee", 'error')
            itemnow = nil
            startveh = nil
            npcselling = false
        end
    else
        QBCore.Functions.Notify("Coffee Cart Not Found", 'error')
    end
end)

RegisterNetEvent('mxd-foodtruck:client:radialstartfoodtruck', function()
    local src = source
    local result = CanTarget()
    local veh = GetFoodTruck()
    local isneartruck = IsVehicleModel(veh, GetHashKey(Config.TruckModel))

    if result and isneartruck then
        if not npcselling and itemnow == nil then
            QBCore.Functions.Notify("started Selling Food Items", 'success')
            itemnow = 'foodtruck'
            startveh = veh
            npcselling = true
        elseif npcselling and itemnow == 'coffeecart' then
            QBCore.Functions.Notify("You are already selling Food Truck Items", 'error')
        else
            QBCore.Functions.Notify("Stopped Selling Food Items", 'error')
            itemnow = nil
            startveh = nil
            npcselling = false
        end
    else
        QBCore.Functions.Notify("Food Truck Not Found", 'error')
    end
end)
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mxd-blackmarket:client:sendmail')
AddEventHandler('mxd-blackmarket:client:sendmail', function(hints)
    if Config.NeedItem then
        local hasItem = QBCore.Functions.HasItem(Config.ItemName)
        if hasItem then
            TriggerServerEvent(Config.MailEvent, {
                sender = Config.SenderName,
                subject = Config.MailSubject,
                message = hints,
                button = {}
            })
        end
    else
        TriggerServerEvent(Config.MailEvent, {
            sender = Config.SenderName,
            subject = Config.MailSubject,
            message = hints,
            button = {}
        })
    end
end)

RegisterNetEvent('mxd-blackmarket:client:spawnped')
AddEventHandler('mxd-blackmarket:client:spawnped', function(Data)
    TriggerServerEvent('mxd-blackmarket:server:reset', source)
    modelHash = GetHashKey(Config.Ped)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped = CreatePed(0, modelHash , Data['Coords'].x,Data['Coords'].y,Data['Coords'].z-1, Data['Coords'].w, false, false)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, Data['Anim'], 0, true)
    Wait(Config.PedDisappear * 60000)
    TriggerEvent('mxd-blackmarket:client:deleteped')
end)

RegisterNetEvent('mxd-blackmarket:client:deleteped')
AddEventHandler('mxd-blackmarket:client:deleteped', function()
    DeletePed(created_ped)
end)

RegisterNetEvent('mxd-blackmarket:client:pspdnoti')
AddEventHandler('mxd-blackmarket:client:pspdnoti', function()
    exports['ps-dispatch']:BlackMarket()
end)
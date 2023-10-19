local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mxd-injuredprop:setinjured', function()
    isinjured = true
end)

RegisterNetEvent('mxd-injuredprop:propstart', function()
    if isinjured then
        Wait(Config.Injurtime * 60000)
        if DoesEntityExist(vehicle) then
            if Config.DelWheelChair then
                DeleteEntity(vehicle)
            else
                SetVehicleDoorsLocked(vehicle, 1)
            end
        end
        if DoesEntityExist(WalkstickObject) then
            DeleteEntity(WalkstickObject)
        end
        if DoesEntityExist(crutchObject) then
            DeleteEntity(crutchObject)
        end
        ClearPedTasks(PlayerPedId())
        ResetPedMovementClipset(PlayerPedId())
        QBCore.Functions.Notify('You are fine now', "success")
        started =  false
        isinjured = false
    end
end)

RegisterNetEvent('mxd-injuredprop:propendcom', function()
    if DoesEntityExist(vehicle) then
        if Config.DelWheelChair then
            DeleteEntity(vehicle)
        else
            SetVehicleDoorsLocked(vehicle, 1)
        end
    end
    if DoesEntityExist(WalkstickObject) then
        DeleteEntity(WalkstickObject)
    end
    if DoesEntityExist(crutchObject) then
        DeleteEntity(crutchObject)
    end
    ClearPedTasks(PlayerPedId())
    ResetPedMovementClipset(PlayerPedId())
    QBCore.Functions.Notify('You are fine now', "success")
    started =  false
    isinjured = false
end)
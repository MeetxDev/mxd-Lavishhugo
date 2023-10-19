local QBCore = exports['qb-core']:GetCoreObject()
local IsHacking = false
local devMode = false

AddEventHandler('open:minigame', function(callback)
    Callbackk = callback
    openHack()
end)

function OpenHackingGame(puzzleDuration, puzzleLength, puzzleAmount, callback)
    Callbackk = callback
    openHack(puzzleDuration, puzzleLength, puzzleAmount)
end

RegisterNUICallback('callback', function(data, cb)
    closeHack()
    if devMode then 
        Callbackk(true)
    else
        Callbackk(data.success)
    end
    cb('ok')
end)

function openHack(puzzleDuration, puzzleLength, puzzleAmount)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        duration = puzzleDuration,
        length = puzzleLength,
        amount = puzzleAmount,
        dev = devMode
    })
    IsHacking = true
end

function closeHack()
    SetNuiFocus(false, false)
    IsHacking = false
end

function GetHackingStatus()
    return IsHacking
end

RegisterNetEvent('hacking:client:dev', function(job)
    devMode = not devMode
    print(devMode)
end)
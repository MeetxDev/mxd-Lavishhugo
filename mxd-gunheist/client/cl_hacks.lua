local QBCore = exports['qb-core']:GetCoreObject()

-- hacking device hack (Don't change event name)
RegisterNetEvent('mxd-gunheist:client:usehackingdevice', function()
    local ped = PlayerPedId()
    local player = PlayerId()

    if usbstarted then
        exports['hacking']:OpenHackingGame(20, 3, 1, function(Success)
            if Success then
                TriggerServerEvent('mxd-gunheist:server:syncstart')    
                TriggerEvent('mxd-gunheist:client:startkeys')
            else
                TriggerServerEvent('mxd-gunheist:server:syncstop')
                QBCore.Functions.Notify('You failed the job', "error")
                local randdis = math.random(1, 2)
                if randdis == 1 then
                    TriggerServerEvent('mxd-gunheist:server:removeitem', 'hackingdevice', 1)
                end
            end
            if Config.useqblogs then
                TriggerServerEvent("qb-log:server:CreateLog", "gunheist", "GUNHEIST", "green", " " ..GetPlayerName(player).. " started gun heist")
            end
            DeleteLapBlip()
            usbstarted = false
        end)
    end
end)

-- red key hack (Don't change event name)
RegisterNetEvent('mxd-gunheist:client:useredkey', function()
    local ped = PlayerPedId()
    local player = PlayerId()

    if redstarted then
        exports['ps-ui']:Scrambler(function(success)
            if success then
                TriggerEvent('mxd-gunheist:client:secondkey', 'red')
            else
                TriggerServerEvent('mxd-gunheist:server:syncstop')
                TriggerEvent('mxd-gunheist:client:over')
                QBCore.Functions.Notify('You failed the job', "error")
            end
        end, "numeric", 30, 0) 

        TriggerServerEvent('mxd-gunheist:server:removeitem', 'redkey', 1)

        if Config.useqblogs then
            TriggerServerEvent("qb-log:server:CreateLog", "gunheist", "GUNHEIST", "red", " " ..GetPlayerName(player).. " started red key hack")
        end
    end
end)

-- blue key hack (Don't change event name)
RegisterNetEvent('mxd-gunheist:client:usebluekey', function()
    local ped = PlayerPedId()
    local player = PlayerId()

    if bluestarted then
        exports['ps-ui']:VarHack(function(success)
            if success then
                TriggerEvent('mxd-gunheist:client:secondkey', 'blue')
            else
                TriggerServerEvent('mxd-gunheist:server:syncstop')
                TriggerEvent('mxd-gunheist:client:over')
                QBCore.Functions.Notify('You failed the job', "error")
            end
        end, 4, 3) 

        TriggerServerEvent('mxd-gunheist:server:removeitem', 'bluekey', 1)

        if Config.useqblogs then
            TriggerServerEvent("qb-log:server:CreateLog", "gunheist", "GUNHEIST", "blue", " " ..GetPlayerName(player).. " started blue key hack")
        end
    end
end)

-- green key hack (Don't change event name)
RegisterNetEvent('mxd-gunheist:client:usegreenkey', function()
    local ped = PlayerPedId()
    local player = PlayerId()

    if greenstarted then
        exports["memorygame_2"]:thermiteminigame(10, 3, 3, 10,
        function() -- success
            TriggerEvent('mxd-gunheist:client:secondkey', 'green')
        end,
        function() -- failure
            TriggerServerEvent('mxd-gunheist:server:syncstop')
            TriggerEvent('mxd-gunheist:client:over')
            QBCore.Functions.Notify('You failed the job', "error")
        end) 
        
        TriggerServerEvent('mxd-gunheist:server:removeitem', 'greenkey', 1)

        if Config.useqblogs then
            TriggerServerEvent("qb-log:server:CreateLog", "gunheist", "GUNHEIST", "green", " " ..GetPlayerName(player).. " started green key hack")
        end
    end
end)

-- crate opening hack (Don't change event name)
RegisterNetEvent('mxd-gunheist:client:cratehack', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    
    exports['hacking']:OpenHackingGame(20, 2, 1, function(Success)
        if Success then
            TriggerEvent('mxd-gunheist:client:opencrate')
            if Config.useqblogs then
                TriggerServerEvent("qb-log:server:CreateLog", "gunheist", "GUNHEIST", "green", " " ..GetPlayerName(player).. " passes crate hack ")
            end
        else
            TriggerServerEvent('mxd-gunheist:server:syncstop')
            TriggerEvent('mxd-gunheist:client:over')
            if Config.useqblogs then
                TriggerServerEvent("qb-log:server:CreateLog", "gunheist", "GUNHEIST", "red", " " ..GetPlayerName(player).. " failed gun hack")
            end
        end
    end)
end)

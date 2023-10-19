local QBCore = exports['qb-core']:GetCoreObject()

exports['qb-target']:AddTargetModel(Config.crateProp, {
    options = {
        {
            type = "client",
            event = "mxd-gunheist:client:cratehack",
            icon = "fas fa-box-archive",
            label = "Open Crate",
            item = 'drill',
            canInteract = function()
                if redstarted and bluestarted and greenstarted  then 
                    return true 
                else 
                    return false 
                end 
            end
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("laptophack", vector3(Config.LaptopLocation.x, Config.LaptopLocation.y, Config.LaptopLocation.z), 1, 0.5, {
    name = "Laptophack",
    heading = Config.LaptopLocation.w,
    debugPoly = false,
    minZ = Config.LaptopLocation.z - 0.5,
    maxZ = Config.LaptopLocation.z + 0.5,
}, {
    options = {
        {
            type = "client",
            event = "mxd-gunheist:client:usehackingdevice",
            icon = "fa-brands fa-usb",
            label = "Try Hacking",
            item = 'hackingdevice',
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("redkey", vector3(Config.RedKey.x, Config.RedKey.y, Config.RedKey.z), 1, 1.5, {
    name = "redkey",
    heading = Config.RedKey.w,
    debugPoly = false,
    minZ = Config.RedKey.z - 1,
    maxZ = Config.RedKey.z + 1,
}, {
    options = {
        {
            type = "client",
            event = "mxd-gunheist:client:useredkey",
            icon = "fas fa-key",
            label = "Use Red Key",
            item = 'redkey'
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("bluekey", vector3(Config.BlueKey.x, Config.BlueKey.y, Config.BlueKey.z), 1, 1.5, {
    name = "bluekey",
    heading = Config.BlueKey.w,
    debugPoly = false,
    minZ = Config.BlueKey.z - 1,
    maxZ = Config.BlueKey.z + 1,
}, {
    options = {
        {
            type = "client",
            event = "mxd-gunheist:client:usebluekey",
            icon = "fas fa-key",
            label = "Use Blue Key",
            item = 'bluekey'
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("greenkey", vector3(Config.GreenKey.x, Config.GreenKey.y, Config.GreenKey.z), 1, 1.5, {
    name = "greenkey",
    heading = Config.GreenKey.w,
    debugPoly = false,
    minZ = Config.GreenKey.z - 1,
    maxZ = Config.GreenKey.z + 1,
}, {
    options = {
        {
            type = "client",
            event = "mxd-gunheist:client:usegreenkey",
            icon = "fas fa-key",
            label = "Use Green Key",
            item = 'greenkey'
        },
    },
    distance = 2.5
})

CreateThread(function()
    local model = Config.Ped
    RequestModel(model)
    while not HasModelLoaded(model) do
      Wait(0)
    end
    local startped = CreatePed(0, model, Config.PedCoords.x, Config.PedCoords.y, Config.PedCoords.z, Config.PedCoords.w, false, false)
    FreezeEntityPosition(startped, true)
    SetEntityInvincible(startped ,true)
    SetBlockingOfNonTemporaryEvents(startped, true)
    exports['qb-target']:AddTargetEntity(startped, { -- The specified entity number
      options = { -- This is your options table, in this table all the options will be specified for the target to accept
        { -- This is the first table with options, you can make as many options inside the options table as you want
          type = "server", -- This specifies the type of event the target has to trigger on click, this can be "client", "server", "command" or "qbcommand", this is OPTIONAL and will only work if the event is also specified
          event = "mxd-gunheist:server:starthiest", -- This is the event it will trigger on click, this can be a client event, server event, command or qbcore registered command, NOTICE: Normal command can't have arguments passed through, QBCore registered ones can have arguments passed through
          icon = 'fas fa-user-secret', -- This is the icon that will display next to this trigger option
          label = 'Start Gun Hiest', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
        }
      },
      distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
    })
end)
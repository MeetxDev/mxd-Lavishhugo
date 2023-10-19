local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData() -- Just for resource restart (same as event handler)
local iscoffinplaced = false

local killcharbox = BoxZone:Create(vector3(-1763.44, -263.1, 48.72),6, 5, {
    name="killcharbox",
    heading = 327.13,
    useZ = true,
    debugPoly = false,
})

-- functions

loadAnimDict = function(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end 

function checkKillStatus()
    while true do
        local plyPed = PlayerPedId()
        local coord = GetEntityCoords(plyPed)
        atgrave = killcharbox:isPointInside(coord)
        if atgrave then
            return true
        else
            return false
        end
    end
end


-- events 

RegisterNetEvent('mxd-killchar:client:movebag', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    loadAnimDict("random@burial")
    TaskPlayAnim(ped, 'random@burial', 'a_burial' , 3.0, 3.0, -1, 1, 0, false, false, false)
    local Shovel = CreateObject(`prop_tool_shovel3`, pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(Shovel, ped, GetPedBoneIndex(ped, 57005), 0.5, 0.06, -0.9, 0.0, -25.0, 180.0, true, true, false, true, 1, true)
    QBCore.Functions.Progressbar("Digging Grave", "Digging Grave", '15000', false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        DeleteObject(BodyProp)
        TriggerServerEvent('mxd-killchar:server:killcharbag')
        DeleteObject(Shovel)
        iscoffinplaced = false
    end)
end)

RegisterNetEvent('mxd-killchar:client:checkevent', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    if not IsPedRagdoll(PlayerPedId()) then
        local player, distance = QBCore.Functions.GetClosestPlayer()
        if player ~= -1 and distance < 2.5 then
            local playerId = GetPlayerServerId(player)
            if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(PlayerPedId()) then
                TriggerServerEvent("mxd-killchar:server:killchar", playerId)
                TriggerServerEvent("mxd-killchar:server:bbagcheck",player, playerId)
            else
                QBCore.Functions.Notify('Person In Vehicle', "error")
            end
        else
            QBCore.Functions.Notify('No One Nearby', "error")
        end
    else
        Wait(2000)
    end
end)

RegisterNetEvent('mxd-killchar:client:startanimbag', function(player, playerId)
    local pedt = GetPlayerPed(player)
    local coords = GetEntityCoords(pedt)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar("Putting in Bag", "Putting in Bag", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent("mxd-killchar:server:bbag", playerId)
            BodyProp = CreateObject(`xm_prop_body_bag`, coords.x, coords.y, coords.z, true, true, true)
            PlaceObjectOnGroundProperly(BodyProp)
            isinbag = true

            exports['qb-target']:AddTargetEntity(BodyProp, { -- The specified entity number
                options = { -- This is your options table, in this table all the options will be specified for the target to accept
                    { -- This is the first table with options, you can make as many options inside the options table as you want
                    type = "client", -- This specifies the type of event the target has to trigger on click, this can be "client", "server", "command" or "qbcommand", this is OPTIONAL and will only work if the event is also specified
                    event = "mxd-killchar:client:movebag", -- This is the event it will trigger on click, this can be a client event, server event, command or qbcore registered command, NOTICE: Normal command can't have arguments passed through, QBCore registered ones can have arguments passed through
                    icon = 'fas fa-user-secret', -- This is the icon that will display next to this trigger option
                    label = 'Place Bag Inside Coffin', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
                    item = Config.item,
                    canInteract = function(entity)
                        if iscoffinplaced then
                            return true
                        else
                            return false
                        end
                    end,
                    }
                },
                distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
            })
    end)
end)


RegisterNetEvent('mxd-killchar:client:invisi', function()
    local ped = PlayerPedId()

    while true do
        Wait(0);
        FreezeEntityPosition(ped, true);
        SetEntityCollision(ped, false, false);
        SetEntityVisible(ped, false, false);
        SetLocalPlayerVisibleLocally(true);
        SetEntityAlpha(ped, 51, false)
        SetEveryoneIgnorePlayer(ped, true);
        SetPoliceIgnorePlayer(ped, true);
    end
end)

RegisterNetEvent('mxd-killchar:client:placecoffin', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local inside = checkKillStatus()

    if inside then
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Wait(10)
        end
        SetEntityCoords(PlayerPedId(), -1763.9, -264.14, 48.03, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 327.34)
        Wait(1000)
        DoScreenFadeIn(1000)
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
        QBCore.Functions.Progressbar("Placing Coffin", "Placing Coffin", 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()
            if not iscoffinplaced then
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('mxd-killchar:server:spawncoffin')
                iscoffinplaced = true
            end
        end)
    end
    
end)

exports['qb-target']:AddGlobalPlayer({
    options = {
      { 
        type = "client",
        event = "mxd-killchar:client:checkevent",
        icon = 'fas fa-skull',
        label = 'Put Body in Bag',
        item =  Config.itembag,
        canInteract = function(entity)
            local iscankill = checkKillStatus()
            if iscankill then
                return true
            else
                return false
            end
        end,
      },
    },
    distance = 1.5, 
})
local QBCore = exports['qb-core']:GetCoreObject()
usbstarted = false
redstarted =  false
bluestarted = false
greenstarted = false
CurrentCops = 0

-- function

loadAnimDict = function(dict) -- Globally used
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end 

function DeleteLapBlip()
	if DoesBlipExist(lapblip) then
		RemoveBlip(lapblip)
	end
end

function CreateLapBlip()
    DeleteLapBlip()
    lapblip = AddBlipForCoord(Config.LaptopLocation.x ,Config.LaptopLocation.y, Config.LaptopLocation.z)
    SetBlipSprite(lapblip, 521)
    SetBlipScale(lapblip, 1.0)
    SetBlipAsShortRange(lapblip, false)
    SetBlipColour(lapblip, 0)
    SetBlipRoute(lapblip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Laptop Hack")
    EndTextCommandSetBlipName(lapblip)
end

function DeleteRedBlip()
	if DoesBlipExist(redblip) then
		RemoveBlip(redblip)
	end
end

function CreateRedBlip()
    DeleteRedBlip()
    redblip = AddBlipForCoord(Config.RedKey.x ,Config.RedKey.y, Config.RedKey.z)
    SetBlipSprite(redblip, 1)
    SetBlipScale(redblip, 1.0)
    SetBlipAsShortRange(redblip, false)
    SetBlipColour(redblip, 1)
    SetBlipRoute(redblip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Red Key")
    EndTextCommandSetBlipName(redblip)
end

function DeleteBlueBlip()
	if DoesBlipExist(blueblip) then
		RemoveBlip(blueblip)
	end
end

function CreateBlueBlip()
    DeleteBlueBlip()
    blueblip = AddBlipForCoord(Config.BlueKey.x ,Config.BlueKey.y, Config.BlueKey.z)
    SetBlipSprite(blueblip, 1)
    SetBlipScale(blueblip, 1.0)
    SetBlipAsShortRange(blueblip, false)
    SetBlipColour(blueblip, 3)
    SetBlipRoute(blueblip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Blue Key")
    EndTextCommandSetBlipName(blueblip)
end

function DeleteGreenBlip()
	if DoesBlipExist(greenblip) then
		RemoveBlip(greenblip)
	end
end

function CreateGreenBlip()
    DeleteGreenBlip()
    greenblip = AddBlipForCoord(Config.GreenKey.x ,Config.GreenKey.y, Config.GreenKey.z)
    SetBlipSprite(greenblip, 1)
    SetBlipScale(greenblip, 1.0)
    SetBlipAsShortRange(greenblip, false)
    SetBlipColour(greenblip, 2)
    SetBlipRoute(greenblip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Green Key")
    EndTextCommandSetBlipName(greenblip)
end

function DeleteCrateBlip()
	if DoesBlipExist(Crateblip) then
		RemoveBlip(Crateblip)
	end
end

function CreateCrateBlip()
    DeleteCrateBlip()
    Crateblip = AddBlipForCoord(Config.Crate.x , Config.Crate.y, Config.Crate.z)
    SetBlipSprite(Crateblip, 1)
    SetBlipScale(Crateblip, 1.0)
    SetBlipAsShortRange(Crateblip, false)
    SetBlipColour(Crateblip, 5)
    SetBlipRoute(Crateblip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Gun Crate")
    EndTextCommandSetBlipName(Crateblip)
end

function SpawnCrate()
    spawnedCrate = CreateObject(Config.crateProp, Config.Crate.x, Config.Crate.y, Config.Crate.z, true, true, false)
    PlaceObjectOnGroundProperly(spawnedCrate)
    SetEntityHeading(spawnedCrate,  Config.Crate.w)
    FreezeEntityPosition(spawnedCrate, true)
end

function SpawnGoons()
    ClearAreaOfPeds(Config.Crate.x, Config.Crate.y, Config.Crate.z, 150, 1)
    local ped = PlayerPedId() 

    SetPedRelationshipGroupHash(ped, GetHashKey("PLAYER"))
    AddRelationshipGroup("Goons")

    for i = 1, #Config.Goons do 
        local goons = Config.Goons[i]
        RequestModel(GetHashKey(goons.ped))
        while not HasModelLoaded(GetHashKey(goons.ped)) do 
            Wait(1)
        end
        goons[i] = CreatePed(4, GetHashKey(goons.ped), goons.coords[1], goons.coords[2], goons.coords[3], goons.coords[4], true, false)  
        SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(goons[i]), true) 
        GiveWeaponToPed(goons[i], GetHashKey(goons.weapon), 255, false, false) 
        SetPedRelationshipGroupHash(goons[i], GetHashKey("Goons"))
        SetPedAccuracy(goons[i], goons.accuracy)
        SetPedArmour(goons[i], goons.armor)
        SetPedFleeAttributes(goons[i], 0, false)
        SetPedCanSwitchWeapon(goons[i], true)
        SetPedDropsWeaponsWhenDead(goons[i], false)
        SetPedAsEnemy(goons[i], true)
        SetPedCombatMovement(goons[i], goons.aggresiveness)
        SetPedAlertness(goons[i], goons.alertness)
        SetPedCombatRange(goons[i], goons.range)
        SetPedSeeingRange(goons[i], 150.0)
        SetPedHearingRange(goons[i], 150.0)
        SetPedCombatAttributes(goons[i], 5000, 1)
        SetPedCanRagdollFromPlayerImpact(goons[i], false)
        SetEntityAsMissionEntity(goons[i])
        SetEntityVisible(goons[i], true)
        SetEntityMaxHealth(goons[i], goons.health)
        SetEntityHealth(goons[i], goons.health) 
        TaskGuardCurrentPosition(goons[i], 5.0, 5.0, 1) 
    end

    SetRelationshipBetweenGroups(0, GetHashKey("Goons"), GetHashKey("Goons"))
    SetRelationshipBetweenGroups(5, GetHashKey("Goons"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("Goons"))	
end

function CheckCrateCoords()
	Citizen.CreateThread(function()
		while true do
            if redstarted and bluestarted and greenstarted then
                local player = GetEntityCoords(PlayerPedId())
                if GetDistanceBetweenCoords(player, Config.Crate, true) < 500 then
                    SpawnCrate()
                    SpawnGoons()
                    TriggerServerEvent('mxd-gunheist:server:policecall')
                    break
                end
                Wait(1 * 5000)
            else
                DeleteCrateBlip()
                break
            end
		end
	end)
end

-- event

RegisterNetEvent('mxd-gunheist:client:delcrate', function()
    DeleteObject(spawnedCrate)
end)

RegisterNetEvent('mxd-gunheist:client:callpspolice', function()
    exports['ps-dispatch']:GunHeist()
end)

RegisterNetEvent('mxd-gunheist:client:laptopblip', function()
    CreateLapBlip()
end)

RegisterNetEvent('mxd-gunheist:client:syncstartusb', function()
    usbstarted = true
end)

RegisterNetEvent('mxd-gunheist:client:startkeys', function()
    local randkey = math.random(1, 3)
    if randkey == 1 then
        redstarted = true
        CreateRedBlip()
    elseif randkey == 2 then
        bluestarted = true
        CreateBlueBlip()
    else
        greenstarted = true
        CreateGreenBlip()
    end
    QBCore.Functions.Notify('See Your GPS for Location', "success")
end)

RegisterNetEvent('mxd-gunheist:client:opencrate', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    loadAnimDict("anim@heists@fleeca_bank@drilling")
    TaskPlayAnim(ped, 'anim@heists@fleeca_bank@drilling', 'drill_straight_idle' , 3.0, 3.0, -1, 1, 0, false, false, false)
    local DrillObject = CreateObject(`hei_prop_heist_drill`, pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(DrillObject, ped, GetPedBoneIndex(ped, 57005), 0.14, 0, -0.01, 90.0, -90.0, 180.0, true, true, false, true, 1, true)
    QBCore.Functions.Progressbar("open_crate", "Opening Crate", Config.DrillTime , false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        DeleteObject(DrillObject)
        DeleteObject(spawnedCrate)
        TriggerServerEvent('mxd-gunheist:server:syncstop')
        TriggerEvent('mxd-gunheist:client:over')
        TriggerEvent('mxd-gunheist:client:giveguns')
    end, function() 
        DeleteObject(spawnedCrate)
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Cancelled', "error")
    end)
end)

RegisterNetEvent('mxd-gunheist:client:giveguns', function()
    local randgun = math.random(1, #Config.Guns)
    for k in pairs(Config.Guns[randgun]["Guns"]) do
        TriggerServerEvent('mxd-gunheist:server:additem', Config.Guns[randgun]["Guns"][k].name, Config.Guns[randgun]["Guns"][k].amount)
    end
    if Config.Cooldown then
        TriggerServerEvent('mxd-gunheist:server:startcooldown')
    end
end)

RegisterNetEvent('mxd-gunheist:client:over', function()
    DeleteRedBlip()
    DeleteBlueBlip()
    DeleteGreenBlip()
    DeleteCrateBlip()
    DeleteLapBlip()
    redstarted = false
    bluestarted =  false
    greenstarted = false
end)

RegisterNetEvent('mxd-gunheist:client:secondkey', function(kcolor)
    if kcolor == 'red' then
        if bluestarted and not greenstarted then
            greenstarted = true
            DeleteRedBlip()
            CreateGreenBlip()
        elseif greenstarted and not bluestarted then
            bluestarted = true
            DeleteRedBlip()
            CreateBlueBlip()
        elseif not bluestarted and not greenstarted then
            local rand2key = math.random(1, 2)
            if rand2key == 1 then
                bluestarted = true
                DeleteRedBlip()
                CreateBlueBlip()
            else 
                greenstarted = true
                DeleteRedBlip()
                CreateGreenBlip()
            end
        elseif bluestarted and greenstarted then
            DeleteRedBlip()
            CreateCrateBlip()
            CheckCrateCoords()
        end
    elseif kcolor == 'blue' then
        if redstarted and not greenstarted then
            greenstarted = true
            DeleteBlueBlip()
            CreateGreenBlip()
        elseif greenstarted and not redstarted then 
            redstarted = true
            DeleteBlueBlip()
            CreateRedBlip()
        elseif not redstarted and not greenstarted then
            local rand2key = math.random(1, 2)
            if rand2key == 1 then
                redstarted = true
                DeleteBlueBlip()
                CreateRedBlip()
            else 
                greenstarted = true
                DeleteBlueBlip()
                CreateGreenBlip()
            end
        elseif redstarted and greenstarted then
            DeleteBlueBlip()
            CreateCrateBlip()
            CheckCrateCoords()
        end
    else 
        if redstarted and not bluestarted then
            bluestarted = true
            DeleteGreenBlip()
            CreateBlueBlip()
        elseif bluestarted and not redstarted then
            redstarted = true
            DeleteGreenBlip()
            CreateRedBlip()
        elseif not redstarted and not bluestarted then
            local rand2key = math.random(1, 2)
            if rand2key == 1 then
                redstarted = true
                DeleteGreenBlip()
                CreateRedBlip()
            else 
                bluestarted = true
                DeleteGreenBlip()
                CreateBlueBlip()
            end
        elseif redstarted and bluestarted then
            DeleteGreenBlip()
            CreateCrateBlip()
            CheckCrateCoords()
        end
    end
    QBCore.Functions.Notify('See Your GPS for Location', "success")
end)
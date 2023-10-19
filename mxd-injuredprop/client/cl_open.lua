local QBCore = exports['qb-core']:GetCoreObject()
isinjured = false
started = false
local hospitalzone = BoxZone:Create(vector3(334.08, -593.18, 67.2), 50, 75, {
    name="hospitalzone",
    heading=340,
    debugPoly=false
})


Citizen.CreateThread(function()
	while true do 
		Wait(0)
        if isinjured then
            local randit = math.random(1,3)
            local ped = PlayerPedId()
		    local pos = GetEntityCoords(ped)
            local inzone = hospitalzone:isPointInside(pos)
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(1, 37, true)
            DisableControlAction(0, 47, true) 
            DisableControlAction(0, 58, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            
            if not Config.Allowgun then
                DisablePlayerFiring(PlayerId(), true)
            end

            if randit == 1 then
                DisableControlAction(0, 75, true)
                if not started then
                    if inzone then
                        BlackscreenI()
                    else
                        Blackscreen()
                    end
                    local ped = PlayerPedId()
                    local vehName = Config.WheelChairname
                    local hash = GetHashKey(vehName)
                    local veh = GetVehiclePedIsUsing(ped)
                    if not IsModelInCdimage(hash) then return end
                    RequestModel(hash)
                    while not HasModelLoaded(hash) do
                        Wait(0)
                    end
                        
                    if IsPedInAnyVehicle(ped) then 
                        DeleteVehicle(veh)
                    end
                        
                    if DoesEntityExist(vehicle) then
                        DeleteVehicle(vehicle)
                    end

                    vehicle = CreateVehicle(hash, GetEntityCoords(ped), GetEntityHeading(ped), true, false)
                    TaskWarpPedIntoVehicle(ped, vehicle, -1)
                    SetVehicleFuelLevel(vehicle, 100.0)
                    SetModelAsNoLongerNeeded(hash)
                    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
                    SetVehicleDoorsLocked(vehicle, 4)
                    TriggerEvent('mxd-injuredprop:propstart')
                    started = true
                end
            elseif randit == 2 then
                if not started then
                    if inzone then
                        BlackscreenI()
                    else
                        Blackscreen()
                    end
                    local ped = PlayerPedId()
                    RequestAnimSet('move_heist_lester')
                    while not HasAnimSetLoaded('move_heist_lester') do
                    Citizen.Wait(1)
                    end
                    SetPedMovementClipset(ped, 'move_heist_lester', 1.0) 
                    WalkstickObject = CreateObject(GetHashKey("prop_cs_walking_stick"), 0, 0, 0, true, true, true)
                    AttachEntityToEntity(WalkstickObject, ped, GetPedBoneIndex(ped, 57005), 0.16, 0.06, 0.0, 335.0, 300.0, 120.0, true, true, false, true, 5, true)
                    TriggerEvent('mxd-injuredprop:propstart')
                    started = true
                end
            elseif randit == 3 then
                if not started then
                    if inzone then
                        BlackscreenI()
                    else
                        Blackscreen()
                    end
                    local ped = PlayerPedId()
                    RequestAnimSet('move_lester_CaneUp')
                    while not HasAnimSetLoaded('move_lester_CaneUp') do
                    Citizen.Wait(1)
                    end
                    SetPedMovementClipset(ped, 'move_lester_CaneUp', 1.0) 
                    crutchObject = CreateObject(GetHashKey("v_med_crutch01"), 0, 0, 0, true, true, true)
                    AttachEntityToEntity(crutchObject, ped, 70, 1.18, -0.36, -0.20, -20.0, -87.0, -20.0, true, true, false, true, 1, true)
                    TriggerEvent('mxd-injuredprop:propstart')
                    started = true
                end
            end
        end
    end
end)

loadAnimDict = function(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end 

BlackscreenI = function()
    Wait(1500)
    QBCore.Functions.Notify('You are a bit Injured', "error")
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    SetEntityCoords(PlayerPedId(), 295.48, -584.14, 43.15, 0, 0, 0, false)
	SetEntityHeading(PlayerPedId(), 72.97)
    Wait(1000)
    DoScreenFadeIn(1000)
end 

Blackscreen = function()
    QBCore.Functions.Notify('You are a bit Injured', "error")
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    Wait(1000)
    DoScreenFadeIn(1000)
end 
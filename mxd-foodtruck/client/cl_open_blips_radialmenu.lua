local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

-- Radial Menu

local function AddRadialMenu()

    local result = CanTarget()

    if result and Config.UseRadialMenuNPC then
        local OutMenu = {
            id = 'jobinteractions',
            title = 'Work',
            icon = 'briefcase',
            items = {}
        }

        local InMenu = 
            {   {
                id = 'togglenpcfood',
                title = 'Toggle Food Truck Sell',
                icon = 'truck',
                type = 'client',
                event = 'mxd-foodtruck:client:radialstartfoodtruck',
                shouldClose = true
            },
            {
                id = 'togglenpccoffee',
                title = 'Toggle Coffee Cart Sell',
                icon = 'caravan',
                type = 'client',
                event = 'mxd-foodtruck:client:radialstartcoffeecart',
                shouldClose = true
            },
        }


        OutMenu.items = InMenu

        if #OutMenu.items >0 then
            MenuIndex = exports[Config.RadialMenuName]:AddOption(OutMenu, MenuIndex)
        end
    end

end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    AddRadialMenu()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)


CreateThread(function()
    
    if Config.ShowBlips then

        if Config.useJob and PlayerData.job ~= nil  then
            
            if PlayerData.job.name == Config.Job then
                local vehpedblip = AddBlipForCoord(Config.VehPedCoords.x, Config.VehPedCoords.y,Config.VehPedCoords.z)
                SetBlipSprite(vehpedblip, 616)
                SetBlipAsShortRange(vehpedblip, true)
                SetBlipScale(vehpedblip, 0.7)
                SetBlipColour(vehpedblip, 5)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('Buy Food Truck')
                EndTextCommandSetBlipName(vehpedblip)
    
                local ingpedblip = AddBlipForCoord(Config.IngShopPedCoords.x, Config.IngShopPedCoords.y, Config.IngShopPedCoords.z)
                SetBlipSprite(ingpedblip, 52)
                SetBlipAsShortRange(ingpedblip, true)
                SetBlipScale(ingpedblip, 0.7)
                SetBlipColour(ingpedblip, 17)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('General Store')
                EndTextCommandSetBlipName(ingpedblip)
    
                local croppedblip = AddBlipForCoord(Config.CropShopPedCoords.x, Config.CropShopPedCoords.y, Config.CropShopPedCoords.z)
                SetBlipSprite(croppedblip, 52)
                SetBlipAsShortRange(croppedblip, true)
                SetBlipScale(croppedblip, 0.7)
                SetBlipColour(croppedblip, 17)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('Crop Store/Crop Field')
                EndTextCommandSetBlipName(croppedblip)
            end
    
        else
    
            local vehpedblip = AddBlipForCoord(Config.VehPedCoords.x, Config.VehPedCoords.y,Config.VehPedCoords.z)
            SetBlipSprite(vehpedblip, 616)
            SetBlipAsShortRange(vehpedblip, true)
            SetBlipScale(vehpedblip, 0.7)
            SetBlipColour(vehpedblip, 5)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('Buy Food Truck')
            EndTextCommandSetBlipName(vehpedblip)
    
            local ingpedblip = AddBlipForCoord(Config.IngShopPedCoords.x, Config.IngShopPedCoords.y, Config.IngShopPedCoords.z)
            SetBlipSprite(ingpedblip, 52)
            SetBlipAsShortRange(ingpedblip, true)
            SetBlipScale(ingpedblip, 0.7)
            SetBlipColour(ingpedblip, 17)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('General Store')
            EndTextCommandSetBlipName(ingpedblip)
    
            local croppedblip = AddBlipForCoord(Config.CropShopPedCoords.x, Config.CropShopPedCoords.y, Config.CropShopPedCoords.z)
            SetBlipSprite(croppedblip, 52)
            SetBlipAsShortRange(croppedblip, true)
            SetBlipScale(croppedblip, 0.7)
            SetBlipColour(croppedblip, 17)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('Crop Store/Crop Field')
            EndTextCommandSetBlipName(croppedblip)
        end
    end
end)

    
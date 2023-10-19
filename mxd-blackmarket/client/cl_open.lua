local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mxd-blackmarket:client:sync:Tier')
AddEventHandler('mxd-blackmarket:client:sync:Tier', function(Amount1, item1)
    for k, v in pairs(Config.Tier1Items.items) do
        if item1 == Config.Tier1Items.items[k].name then       
            Config.Tier1Items.items[k].amount = Amount1
        end
    end
    for k, v in pairs(Config.Tier2Items.items) do
        if item1 == Config.Tier2Items.items[k].name then       
            Config.Tier2Items.items[k].amount = Amount1
        end
    end
    for k, v in pairs(Config.Tier3Items.items) do
        if item1 == Config.Tier3Items.items[k].name then       
            Config.Tier3Items.items[k].amount = Amount1
        end
    end
end)

RegisterNetEvent('mxd-blackmarket:client:openshop', function()
    QBCore.Functions.TriggerCallback("mxd-blackmarket:server:GetCurrentPlayers", function(Players)
        if Config.UseGame then
            exports["memorygame_2"]:thermiteminigame(8, 3, 2, 20,
            function() -- Success
                if Players > Config.Tier1Min and Players <= Config.Tier1Max then 
                    TriggerServerEvent(Config.InvShopEvent, "shop", "BlackMarket", Config.Tier1Items) -- Dont Change "BlackMarket" not even any caps (for every event)
                elseif Players > Config.Tier2Min and Players <= Config.Tier2Max then
                    TriggerServerEvent(Config.InvShopEvent, "shop", "BlackMarket", Config.Tier2Items)
                elseif Players > Config.Tier3Min and Players <= Config.Tier3Max then
                    TriggerServerEvent(Config.InvShopEvent, "shop", "BlackMarket", Config.Tier3Items)
                else
                    TriggerServerEvent(Config.InvShopEvent, "shop", "BlackMarket", Config.Tier3Items)
                end
            end,
            function() -- Fail thermite game
                TriggerServerEvent('mxd-blackmarket:server:policecall', source)
            end)
        else
            if Players > Config.Tier1Min and Players <= Config.Tier1Max then 
                TriggerServerEvent(Config.InvShopEvent, "shop", "BlackMarket", Config.Tier1Items)
            elseif Players > Config.Tier2Min and Players <= Config.Tier2Max then
                TriggerServerEvent(Config.InvShopEvent, "shop", "BlackMarket", Config.Tier2Items)
            elseif Players > Config.Tier3Min and Players <= Config.Tier3Max then
                TriggerServerEvent(Config.InvShopEvent, "shop", "BlackMarket", Config.Tier3Items)
            else
                TriggerServerEvent(Config.InvShopEvent, "shop", "BlackMarket", Config.Tier3Items)
            end
        end
    end)
end)

--target

local function checkPedCoords(entity)
    for k, coords in pairs(Config.Hints) do
		local pedcoords = GetEntityCoords(entity)
        if #(pedcoords - vector3(coords["Coords"])) < 3 then
            return true
        end
    end
end

if Config.NeedItem then
    exports['qb-target']:AddTargetModel(Config.Ped, {
        options = {
            {
                event = "mxd-blackmarket:client:openshop",
                icon = "fa-solid fa-shop-lock",
                label = "Open BlackMarket",
                item = Config.ItemName,
                canInteract = function(entity)
                    local isped = checkPedCoords(entity)
                    if isped then
                        return true
                    end
                end,
                
            },
        },
        distance = 2.5,
    })
else
    exports['qb-target']:AddTargetModel(Config.Ped, {
        options = {
            {
                event = "mxd-blackmarket:client:openshop",
                icon = "fa-solid fa-shop-lock",
                label = "Open BlackMarket",
                canInteract = function(entity)
                    local isped = checkPedCoords(entity)
                    if isped then
                        return true
                    end
                end,
            },
        },
        distance = 2.5,
    })
end
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

local function MxDBillCheck()
    local bi = promise.new()
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:BillCheck', function(result)
        bi:resolve(result)
    end)
    return Citizen.Await(bi)
end

local function GetItems(pid, shopname)
    local veh = GetFoodTruck()
    local plate = QBCore.Functions.GetPlate(veh)
    local name = "MxD Bills " ..shopname.. " " ..plate.. " " ..pid
    local desc1 = ""
    local it = promise.new()

    QBCore.Functions.TriggerCallback(Config.GetStashItems, function(StashItems)

        for k,v in pairs(StashItems) do
            desc1 = desc1.." " ..v.amount.. "x"  ..v.label.. ","
        end

        if desc1 == "" then
            desc1= "Empty"
        end

        it:resolve(desc1)
        
    end, name)

    return Citizen.Await(it)
end

function MxDBillCheckTarget(shopname)
    local bi = promise.new()
    local pid = PlayerData.citizenid

    
    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:BillCheck', function(result)

        if result[pid] ~= nil and result[pid]["shops"][shopname] ~= nil then
            if result[pid]["shops"][shopname]['cantarget'] then
                cantar = true
            else 
                cantar = false
            end
        else
            cantar = false
        end

        bi:resolve(cantar)
    end)

    return Citizen.Await(bi)
end

RegisterNetEvent('mxd-foodtruck:client:billplayerfood', function(shopname)
    local dialog = exports['qb-input']:ShowInput({
        header = 'Bill Player',
        submitText = "Submit",
        inputs = {
            {
                text = "Server ID (#)",
                name = "playerid",
                type = "number",
                isRequired = true
            },
            {
                text = "Amount ("..Config.CurrencySymbol.." , -1 to take items back)",
                name = "amount",
                type = "number",
                isRequired = true
            }
        }
    })
    if dialog then
        if not dialog.playerid and not dialog.amount then 
            QBCore.Functions.Notify("Fill all the details", "error")
            return 
        end

        if dialog.amount == '-1' then
            TriggerServerEvent('mxd-foodtruck:server:billplayerfoodtakeorder', dialog.playerid, dialog.amount, shopname)
        elseif dialog.amount >= '0' then
            TriggerServerEvent('mxd-foodtruck:server:billplayerfood', dialog.playerid, dialog.amount, shopname)
        elseif dialog.amount < '0' then
            QBCore.Functions.Notify("Amount can't be negative", "error")
        end
    end
end)

RegisterNetEvent('mxd-foodtruck:client:billplayerfoodaccept', function(sname)
    local result = MxDBillCheck()
    local pid = PlayerData.citizenid
    local shopname = result[pid]["shops"][sname]['shopname']
    local amountbill = result[pid]["shops"][sname]['amount']
    local desc = GetItems(pid, shopname)

    exports['qb-menu']:openMenu({
		{ header = "Bill", txt = "Your Bill is "..Config.CurrencySymbol.. "" ..amountbill, isMenuHeader = true },
		{ header = "Yes", txt = desc, params = { event = "mxd-foodtruck:client:targetacceptorder", args = { amount = amountbill, tarid = PlayerData.citizenid, shopname = shopname } } },
		{ header = "No",	txt = "Cancel Order",params = { event = "mxd-foodtruck:client:cancelorder", args = { amount = amountbill, tarid = PlayerData.citizenid, shopname = shopname }} },

    })
    
end)

RegisterNetEvent('mxd-foodtruck:client:openbillstash', function(tcid, shoname)
    local veh = GetFoodTruck()
    local plate = QBCore.Functions.GetPlate(veh)

    TriggerServerEvent(Config.InvShopEvent, "stash", "MxD Bills " ..shoname.. " " ..plate.. " " ..tcid,{
        maxweight = 100000,
        slots = 10,
    })
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
    TriggerEvent(Config.InvStashEvent, "MxD Bills " ..shoname.. " " ..plate.. " " ..tcid)
end)

RegisterNetEvent('mxd-foodtruck:client:targetacceptorder', function(data)

    QBCore.Functions.TriggerCallback('mxd-foodtruck:server:HasBillmoney', function(result)
        if result then
           TriggerEvent('mxd-foodtruck:client:openbillstash', data.tarid, data.shopname)
        end
    end, data, data.shopname)

end)

RegisterNetEvent('mxd-foodtruck:client:cancelorder', function(data)

    TriggerServerEvent('mxd-foodtruck:server:cancelorder', data)    

end)


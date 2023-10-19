local QBCore = exports['qb-core']:GetCoreObject()
local TargetArray = {}

QBCore.Functions.CreateCallback('mxd-foodtruck:server:BillCheck', function(source, cb)
    cb(TargetArray)
end)

QBCore.Functions.CreateCallback('mxd-foodtruck:server:HasBillmoney', function(source, cb, data, shop)
    local retval = false
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local receiversrc = TargetArray[Player.PlayerData.citizenid]["shops"][shop]['keepersrc']
    local Receiver = QBCore.Functions.GetPlayer(receiversrc)

	if Player.Functions.RemoveMoney("cash", data.amount, "Bill") then
        TriggerClientEvent('QBCore:Notify', src, "You paid "..Config.CurrencySymbol.. "" ..data.amount.. " for bill", 'success')
        Receiver.Functions.AddMoney("cash", data.amount, "Bill")
        TriggerClientEvent('QBCore:Notify', receiversrc, "You received "..Config.CurrencySymbol.. "" ..data.amount, 'success')
        TriggerEvent('mxd-foodtruck:server:orderdone',data, shop)
        retval = true
    elseif Player.Functions.RemoveMoney("bank", data.amount, "Bill") then
        TriggerClientEvent('QBCore:Notify', src, "You paid "..Config.CurrencySymbol.. "" ..data.amount.. " for bill", 'success')
        Receiver.Functions.AddMoney("bank", data.amount, "Bill")
        TriggerClientEvent('QBCore:Notify', receiversrc, "You received "..Config.CurrencySymbol.. "" ..data.amount, 'success')
        TriggerEvent('mxd-foodtruck:server:orderdone',data, shop)
        retval = true
    else
        TriggerClientEvent('QBCore:Notify', src, "You need "..Config.CurrencySymbol.. "" ..data.amount.. " to pay for bill", 'error')
        retval = false
    end
    cb(retval)
end)

RegisterServerEvent('mxd-foodtruck:server:billplayerfood', function(targetid, amount, shopname)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(tonumber(targetid))

    if Target then
        local Targetcid = Target.PlayerData.citizenid

        if TargetArray[Targetcid] == nil then
            TargetArray[Targetcid] = {}
            TargetArray[Targetcid]["shops"] = {}
        end

        values = {targetid = Targetcid, cantarget = true, amount = amount, targetsrc = tonumber(targetid), keepersrc = src, shopname= shopname}

        if TargetArray[Targetcid]["shops"][shopname] == nil then
            TargetArray[Targetcid]["shops"][shopname] = values
        else
            for k, v in pairs(values) do
                TargetArray[Targetcid]["shops"][shopname][k] = v
            end
        end


        TriggerClientEvent('mxd-foodtruck:client:openbillstash', src, Targetcid, shopname)


    else
        TriggerClientEvent('QBCore:Notify', src, "Person Not Found", 'error')
    end
end)

RegisterServerEvent('mxd-foodtruck:server:billplayerfoodtakeorder', function(targetid, amount, shopname)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(tonumber(targetid))
    local datatake = {tarid = targetid}

    if Target then
        local Targetcid = Target.PlayerData.citizenid
        TriggerClientEvent('mxd-foodtruck:client:openbillstash', src, Targetcid, shopname)
        TargetArray[Targetcid]["shops"][shopname]['targetid'] = nil
        TargetArray[Targetcid]["shops"][shopname]['cantarget'] = false
        TargetArray[Targetcid]["shops"][shopname]['amount'] = 0
        TargetArray[Targetcid]["shops"][shopname]['targetsrc'] = 0
        TargetArray[Targetcid]["shops"][shopname]['keepersrc'] = 0
        TargetArray[Targetcid]["shops"][shopname]['shopname'] = nil
    else
        TriggerClientEvent('QBCore:Notify', src, "Person Not Found", 'error')

    end
end)

RegisterServerEvent('mxd-foodtruck:server:cancelorder', function(data)

    TriggerClientEvent('QBCore:Notify',TargetArray[data.tarid]["shops"][data.shopname]['keepersrc'], "Order of id "..TargetArray[data.tarid]["shops"][data.shopname]['targetsrc'].." is cancelled. Please take your items from that Tray", 'error')
    TriggerEvent('mxd-foodtruck:server:orderdone', data, data.shopname)

end)


RegisterServerEvent('mxd-foodtruck:server:orderdone', function(data, shopname)

    TargetArray[data.tarid]["shops"][shopname]['targetid'] = nil
    TargetArray[data.tarid]["shops"][shopname]['cantarget'] = false
    TargetArray[data.tarid]["shops"][shopname]['amount'] = 0
    TargetArray[data.tarid]["shops"][shopname]['targetsrc'] = 0
    TargetArray[data.tarid]["shops"][shopname]['keepersrc'] = 0
    TargetArray[data.tarid]["shops"][shopname]['shopname'] = nil

end)
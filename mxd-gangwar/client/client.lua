local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData() -- Just for resource restart (same as event handler)
local PlayerGang = PlayerData.gang
local isstarted = false
local alreadydead = false
local bdopen = false
local chaing = false

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerGang = PlayerData.gang
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    PlayerGang = gang
end)

RegisterNetEvent('mxd-gangwar:client:chanegdeath', function()
    alreadydead = false
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	SendNUIMessage({
		action = "close",
	})
end)

local function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end

Citizen.CreateThread(function()
    while true do 
		Citizen.Wait(500)
        local myPed = PlayerPedId()
        if isstarted then
            if IsEntityDead(myPed) and not alreadydead then
                local killerPed = GetPedSourceOfDeath(myPed)
                alreadydead = true
                if IsEntityAPed(killerPed) and IsPedAPlayer(killerPed) then
                    local player = NetworkGetPlayerIndexFromPed(killerPed)
                    local sourceKiller = GetPlayerServerId(player)
                    if PlayerGang.name == Config.Team1C then
                        TriggerServerEvent('mxd-gangwar:server:addpoint', Config.Team1C, sourceKiller)
                    elseif PlayerGang.name == Config.Team2C then
                        TriggerServerEvent('mxd-gangwar:server:addpoint', Config.Team2C, sourceKiller)
                    end
                end
            end
        end
    end
end)


-- functions

local function DrawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

local function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- events

-- open menu events

RegisterNetEvent('mxd-gangwar:client:openMenu', function()
    if not isstarted then
        if PlayerGang.name ~= nil and PlayerGang.isboss then
            local dialog = exports['qb-input']:ShowInput({
                header = 'Gang War',
                submitText = "Submit",
                inputs = {
                    {
                        text = "Server ID (#)",
                        name = "playerid",
                        type = "number",
                        isRequired = true
                    },
                    {
                        text = "Amount (in thousands)",
                        name = "amount",
                        type = "number",
                        isRequired = true
                    }
                }
            })
            if dialog then
                if not dialog.playerid and not dialog.amount then return end
                TriggerServerEvent('mxd-gangwar:server:menutotarget', dialog.playerid, dialog.amount)
            end
        else
            QBCore.Functions.Notify("You don't have authority to use this", 'error')
        end
    else
        QBCore.Functions.Notify("Another War is going on now", 'error')
    end
end)

RegisterNetEvent('mxd-gangwar:client:openMenuother', function(data)
    exports['qb-menu']:openMenu({
        { header = "Gang War", txt = data['player'].PlayerData.charinfo.firstname .. ' Sent you Gang War offer. For Amount ' ..data['amount'].. 'k', isMenuHeader = true },
        { header = "Accept", txt = "Accept Gang War", params = { event = "mxd-gangwar:client:accept", args = {data = data} } },
        { header = "Decline", txt = "Decline Gang War", params = { event = "mxd-gangwar:client:close", args = {name = data['player'].PlayerData.charinfo.firstname} } },
    })
end)

RegisterNetEvent('mxd-gangwar:client:accept', function(data)
    TriggerServerEvent('mxd-gangwar:server:accept', data.data)
end)

RegisterNetEvent('mxd-gangwar:client:close')
AddEventHandler('mxd-gangwar:client:close', function(data)
    local src = source
    exports['qb-menu']:closeMenu()
    QBCore.Functions.Notify('You declined Gang War offer from ' ..data.name, 'error')
end)

-- starting timer events

RegisterNetEvent('mxd-gangwar:client:start1', function(teamd1)
    isstarted = true
    Config.Team1C = teamd1['gang']
    TriggerServerEvent('mxd-gangwar:server:timer1', teamd1)
end)

RegisterNetEvent('mxd-gangwar:client:start2', function(teamd2)
    isstarted = true
    Config.Team2C = teamd2['gang']
    TriggerServerEvent('mxd-gangwar:server:timer2', teamd2)
end)

-- reseting timer events

RegisterNetEvent('mxd-gangwar:client:resettimer', function()
    Config.WarRemTime = Config.WarTime
    Config.PrepRemTime = Config.PrepTime
end)

-- prep time timer events

RegisterNetEvent('mxd-gangwar:client:startPreptimer', function(teamdata)
    CreateThread(function()
        while true do
            if teamdata ~= nil then
                if Config.PrepRemTime > 0 then
                    Wait(60000)
                    Config.PrepRemTime = Config.PrepRemTime - 1
                else
                    break
                end
            end
        end
    end)
end)

RegisterNetEvent('mxd-gangwar:client:displayPreptimer1', function(teamdata1)
    if teamdata1 ~= nil then
        if PlayerGang.name == teamdata1['gang'] then
            chaing = true  
            CreateThread(function()
                while true do
                    DrawTxt(0.93, 1.4, 1.0,1.0,0.6, 'Time to Prepare : ~g~' ..math.ceil(Config.PrepRemTime).. '~w~ Minutes' , 255, 255, 255, 255)
                    Wait(5)
                    if Config.PrepRemTime == -200 then TriggerEvent('mxd-gangwar:client:displaytimer1', teamdata1) break end
                    if Config.PrepRemTime <= 0 and Config.PrepRemTime ~= -200 then break end
                end
            end)
        end
    end
end)

RegisterNetEvent('mxd-gangwar:client:displayPreptimer2', function(teamdata2)
    if teamdata2 ~= nil then
        if PlayerGang.name == teamdata2['gang'] then  
            chaing = true
            CreateThread(function()
                while true do
                    DrawTxt(0.93, 1.4, 1.0,1.0,0.6, 'Time to Prepare : ~g~' ..math.ceil(Config.PrepRemTime).. '~w~ Minutes' , 255, 255, 255, 255)
                    Wait(5)
                    if Config.PrepRemTime == -200 then TriggerEvent('mxd-gangwar:client:displaytimer2', teamdata2) break end
                    if Config.PrepRemTime <= 0 and Config.PrepRemTime ~= -200 then break end
                end
            end)
        end
    end
end)

-- war time timer events

RegisterNetEvent('mxd-gangwar:client:starttimer', function(teamdata)
    if teamdata ~= nil then
        if PlayerGang.name == teamdata['gang'] then  
            CreateThread(function()
                while true do
                    if Config.WarRemTime > 0 then
                        Wait(60000)
                        Config.WarRemTime = Config.WarRemTime - 1
                        TriggerServerEvent('mxd-gangwar:server:synctimer', Config.WarRemTime)
                    else
                        break
                    end
                end
            end)
        end
    end
end)

RegisterNetEvent('mxd-gangwar:client:displaytimer1', function(teamdataa1)
    if teamdataa1 ~= nil then
        if PlayerGang.name == teamdataa1['gang'] then  
            local playerid = GetPlayerServerId(PlayerId())
            bdopen = true
            CreateThread(function()
                while true do
                    DrawTxt(0.93, 1.4, 1.0,1.0,0.6, 'Remaining Time : ~r~' ..math.ceil(Config.WarRemTime).. '~w~ Minutes' , 255, 255, 255, 255)
                    Wait(5)
                    if Config.WarRemTime <= 0 then 
                        TriggerServerEvent('mxd-gangwar:server:checkdeath1', teamdataa1, playerid)
                        isstarted = false
                        bdopen = false
                        chaing = false
                        Wait(1000)
                        break 
                    end
                end
            end)
        end
    end
end)

RegisterNetEvent('mxd-gangwar:client:displaytimer2', function(teamdataa2)
    if teamdataa2 ~= nil then
        if PlayerGang.name == teamdataa2['gang'] then
            local playerid = GetPlayerServerId(PlayerId())
            bdopen = true
            CreateThread(function()
                while true do
                    DrawTxt(0.93, 1.4, 1.0,1.0,0.6, 'Remaining Time : ~r~' ..math.ceil(Config.WarRemTime).. '~w~ Minutes' , 255, 255, 255, 255)
                    Wait(5)
                    if Config.WarRemTime <= 0 then 
                        TriggerServerEvent('mxd-gangwar:server:checkdeath2', teamdataa2, playerid)
                        isstarted = false
                        bdopen = false
                        chaing = false
                        Wait(1000)
                        break 
                    end
                end
            end)
        end
    end
end)

-- stopping events

RegisterCommand('stopwar', function(source, args)
    if isstarted then
        if PlayerGang.name == Config.Team1C and PlayerGang.isboss then
            if args[1] ~= nil then
                TriggerServerEvent('mxd-gangwar:server:cancel', args[1])
            end
        end
    else
        QBCore.Functions.Notify("No War is going on", 'error')
    end
end)

RegisterNetEvent('mxd-gangwar:client:openMenuCancel', function()
    if PlayerGang.name == Config.Team2C and PlayerGang.isboss then
        exports['qb-menu']:openMenu({
            { header = "Gang War Cancel", txt = ' Cancel GangWar ', isMenuHeader = true },
            { header = "Cancel", txt = "Stop Gang War", params = { event = "mxd-gangwar:client:stop", args = {} } },
            { header = "Don't Cancel", txt = "Keep Gang War", params = { event = "", args = {name = data} } },
        })
    end
end)

RegisterNetEvent('mxd-gangwar:client:stop', function()
    if isstarted then
        isstarted = false
        Config.WarRemTime = -1
        Config.PrepRemTime = -200
    end
end)

--ui

RegisterCommand(Config.ScoreboardCommand, function(source, args, rawCommand)
    if isstarted then
        if PlayerGang.name == Config.Team1C or PlayerGang.name == Config.Team2C then
            if bdopen then
                SendNUIMessage({
                    action = "close",
                })
                bdopen = false
            else
                QBCore.Functions.TriggerCallback("mxd-gangwar:getStats", function(status)
                    SendNUIMessage({
                        action = "open",
                        t1 = status[1],
                        t1k = status[4],
                        t2 = status[2],
                        t2k = status[3],
                    })

                end)
                bdopen = true
            end   
        end
    end

end)

Citizen.CreateThread(function()
    while true do
        if bdopen then
            if PlayerGang.name == Config.Team1C or PlayerGang.name == Config.Team2C then
                QBCore.Functions.TriggerCallback("mxd-gangwar:getStats", function(status)
                    SendNUIMessage({
                        action = "open",
                        t1 = status[1],
                        t1k = status[4],
                        t2 = status[2],
                        t2k = status[3],
                    })

                end)
            end
        else
            SendNUIMessage({
                action = "close",
            })
        end
        if chaing then
            if PlayerGang.name == Config.Team1C or PlayerGang.name == Config.Team2C then
                for k, v in pairs(Config.GetChain) do
                    if PlayerGang.name == Config.GetChain[k].gname then
                        chain = Config.GetChain[k].prop
                        local pos = GetEntityCoords(PlayerPedId())
                        LoadPropDict(chain)
                        prop = CreateObject(GetHashKey(chain), pos.x, pos.y, pos.z,  true,  true, true)
                        AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 10706), -0.03, 0.0, -0.019, -366.0, 19.0, -163.0, 1, 1, 0, 0, 2, 1)
                        break
                    end
                end
            end
        else
            DeleteEntity(prop)
        end
        Citizen.Wait(500)
    end
end)
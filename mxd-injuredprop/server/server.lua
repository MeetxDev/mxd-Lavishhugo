QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add(Config.Commandname, 'Reset Injured Ped Prop', {{name = "id", help = 'Player ID'}}, false, function(source, args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == "ambulance" then
		if args[1] then
			local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
			if Player then
				TriggerClientEvent('mxd-injuredprop:propendcom', Player.PlayerData.source)
				TriggerClientEvent('mxd-injuredprop:propstart', Player.PlayerData.source)
			else
				TriggerClientEvent('QBCore:Notify', src, 'Player Not Online', "error")
			end
		else
			TriggerClientEvent('mxd-injuredprop:propendcom', src)
			TriggerClientEvent('mxd-injuredprop:propstart', src)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, 'You are not EMS or not signed in', "error")
	end
end)

QBCore.Commands.Add(Config.CommandnameAdmin, 'Reset Injured Ped Prop', {{name = "id", help = 'Player ID'}}, false, function(source, args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if args[1] then
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if Player then
			TriggerClientEvent('mxd-injuredprop:propendcom', Player.PlayerData.source)
			TriggerClientEvent('mxd-injuredprop:propstart', Player.PlayerData.source)
		else
			TriggerClientEvent('QBCore:Notify', src, 'Player Not Online', "error")
		end
	else
		TriggerClientEvent('mxd-injuredprop:propendcom', src)
		TriggerClientEvent('mxd-injuredprop:propstart', src)
	end
end, "admin")


RegisterNetEvent('mxd-injuredprop:server:setinjur', function(playerid)
	local Target = QBCore.Functions.GetPlayer(tonumber(playerId))

	TriggerClientEvent('mxd-injuredprop:setinjured', Target.PlayerData.source)
end)
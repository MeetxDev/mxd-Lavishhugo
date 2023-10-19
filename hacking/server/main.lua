local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('lhdev', 'Dev Mode for hacking', {}, false, function(source)
    local src = source
    TriggerClientEvent('hacking:client:dev', src)
end, 'god')
Created By : MeetxDev#0421
Support Discord : https://discord.gg/AquwCR3CQb

# Add in qb-core/shared/items.lua

````lua

	['hackingdevice'] 			 	= {['name'] = 'hackingdevice', 			  		['label'] = 'Hacking Device', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'hackingdevice.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Do you know how to use?'},
	['redkey'] 			 			= {['name'] = 'redkey', 			  			['label'] = 'Red Key', 					['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'redkey.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Key I Guess'},
	['bluekey'] 			 		= {['name'] = 'bluekey', 			  			['label'] = 'Blue Key', 				['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'bluekey.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Key I Guess'},
	['greenkey'] 			 		= {['name'] = 'greenkey', 			  			['label'] = 'Green Key', 				['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'greenkey.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Key I Guess'},

````

# For ps-dispatch (Optional)

1 ) Add this in ps-dispatch/client/cl_events.lua

````lua

local function GunHeist()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "gunheist", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = ('Gun Hiest'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end exports('GunHeist', GunHeist)

````

2 ) Add this is ps-dispatch/server/sv_dispatchcodes.lua

````lua

	["gunheist"] =  {displayCode = '10-90', description = "Gun Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 150, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "robberysound", offset = "false", blipflash = "false"},

````

# For qb logs

Add a gunheist category in qb-smallresources/server/logs.lua (local Webhooks)

````lua

    ['gunheist'] = '',

````

# Dependencies 

1) ps-ui - (https://github.com/Project-Sloth/ps-ui)
2) Memory Game - (https://github.com/NathanERP/memorygame_2)
3) qb-target - (https://github.com/qbcore-framework/qb-target)
4) hacking - (given with this file in zip)

Note : hacking script is not mine or do I take credit for it was given to me by my friend which he found on github can't find the link now so credit to its creator
Item Used now can change through config

	['warcontract'] 			 	 = {['name'] = 'warcontract', 			  		['label'] = 'War Contract', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'warcontract.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'You can Start a Gang War through this'},

Image : https://cdn.discordapp.com/attachments/953614783482044428/987825447352017026/warcontract.png


1) Go to qb-ambulancejob/client/job.lua add this to 'hospital:client:RevivePlayer' event

```lua

TriggerEvent('mxd-gangwar:client:chanegdeath')

```

2) Go to qb-ambulancejob/client/main.lua and this to 'hospital:client:Revive' event

````lua

TriggerEvent('mxd-gangwar:client:chanegdeath')

````



Created By : MeetxDev#0421
Support Discord : https://discord.gg/AquwCR3CQb
Created By : MeetxDev#0421
Support Discord : https://discord.gg/AquwCR3CQb

# Installation Guide

Find this in qb-inventory/server/main.lua (or server side of your inventory)

```lua
		else
			if Player.Functions.RemoveMoney("cash", price, "unkown-itemshop-bought-item") then
				Player.Functions.AddItem(itemData.name, fromAmount, toSlot, itemData.info)
				TriggerClientEvent('QBCore:Notify', src, itemInfo["label"] .. " bought!", "success")
				TriggerEvent("qb-log:server:CreateLog", "shops", "Shop item bought", "green", "**"..GetPlayerName(src) .. "** bought a " .. itemInfo["label"] .. " for $"..price)
			elseif bankBalance >= price then
				Player.Functions.RemoveMoney("bank", price, "unkown-itemshop-bought-item")
				Player.Functions.AddItem(itemData.name, fromAmount, toSlot, itemData.info)
				TriggerClientEvent('QBCore:Notify', src, itemInfo["label"] .. " bought!", "success")
				TriggerEvent("qb-log:server:CreateLog", "shops", "Shop item bought", "green", "**"..GetPlayerName(src) .. "** bought a " .. itemInfo["label"] .. " for $"..price)
			else
				TriggerClientEvent('QBCore:Notify', src, "You don\'t have enough cash..", "error")
			end
		end
```


And Replace with 

```lua
		else
			if Player.Functions.RemoveMoney("cash", price, "unkown-itemshop-bought-item") then
				Player.Functions.AddItem(itemData.name, fromAmount, toSlot, itemData.info)
				TriggerClientEvent('QBCore:Notify', src, itemInfo["label"] .. " bought!", "success")
				if QBCore.Shared.SplitStr(shopType, "_")[1] == 'BlackMarket' then
					TriggerEvent('mxd-blackmarket:server:minus', fromAmount, itemData.name)
				end
				TriggerEvent("qb-log:server:CreateLog", "shops", "Shop item bought", "green", "**"..GetPlayerName(src) .. "** bought a " .. itemInfo["label"] .. " for $"..price)
			elseif bankBalance >= price then
				Player.Functions.RemoveMoney("bank", price, "unkown-itemshop-bought-item")
				Player.Functions.AddItem(itemData.name, fromAmount, toSlot, itemData.info)
				TriggerClientEvent('QBCore:Notify', src, itemInfo["label"] .. " bought!", "success")
				if QBCore.Shared.SplitStr(shopType, "_")[1] == 'BlackMarket' then
					TriggerEvent('mxd-blackmarket:server:minus', fromAmount, itemData.name)
				end
				TriggerEvent("qb-log:server:CreateLog", "shops", "Shop item bought", "green", "**"..GetPlayerName(src) .. "** bought a " .. itemInfo["label"] .. " for $"..price)
			else
				TriggerClientEvent('QBCore:Notify', src, "You don\'t have enough cash..", "error")
			end
		end
```

# Adding Items Guide


Add in Config to whichever tier you want but don't forget to add amount2 too just same as amount

for eg I want to add 4th item to Tier1

```lua
	[4] = {
		name = "weapon_hatchet",
		price = 500,
		amount = 5,
		amount2 = 5, -- this is neccessary keep same as amount (for limit)
		info = {},
		type = "item", -- Don't change this too
		slot = 4,
	},
```

# Note - All this are Important


1) Don't Put Ped Disappear Time More than Mail Interval

2) Don't forget to add amount2 while adding/changing item

3) Don't Change Type in while adding item - This Goes for all Items
For eg :

```lua
	[1] = {
		name = "abc",
		price = x,
		amount = y,
		amount2 = y,
		info = {},
		type = "item", -- Don't change this
		slot = 1,
	},
```

4) In every TriggerServerEvent for shop don't change "BlackMarket" not event any caps (this name doesn't affect client) so just keep it that

```lua 
TriggerServerEvent(Config.InvShopEvent, "shop", "BlackMarket", Config.Tier1Items) -- This is the event its in cl_open.lua
```

If you want to add Tiers add with this name only just change Config.Tier1Items this with whatever items you want

# Optional

vpn as item 
put in qb-core/shared/items.lua

````lua
['vpn']                       = {['name'] = 'vpn',                         ['label'] = 'vpn',             ['weight'] = 1500,         ['type'] = 'item',         ['image'] = 'vpn.png',             ['unique'] = false,     ['useable'] = false,     ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = 'A VPN to protect your identity!'},
````

Image - https://cdn.discordapp.com/attachments/953614783482044428/979701376328278046/vpn.png

For ps-disptach

Add this in ps-dispatch/client/cl_events.lua

````lua

local function BlackMarket()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "blackmarket", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90", -- change this to your liking (change in the below one too)
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
        dispatchMessage = ('Some Illegal Sellinng Going on'), -- message
        job = { "police" } -- jobs that will get the alerts
    })
end exports('BlackMarket', BlackMarket)

````

Add this in ps-dispatch/server/sv_disptachcodes.lua.lua

````lua
	["blackmarket"] =  {displayCode = '10-90', description = "Some Illegal Sellinng Going on", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 2, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
````

# Dependencies


1) qb-target - https://github.com/qbcore-framework/qb-target

2) Memory Game - https://github.com/NathanERP/memorygame_2
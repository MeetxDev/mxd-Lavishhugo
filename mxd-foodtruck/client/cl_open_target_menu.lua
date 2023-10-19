local QBCore = exports['qb-core']:GetCoreObject()


-- Food Truck Menu

RegisterNetEvent('mxd-foodtruck:client:openchopmenu', function()
    exports['qb-menu']:openMenu({
		{ header = "Wanna Chop Vegetables", txt = "Waana Start Cooking Channel!..", isMenuHeader = true },
		{ header = "", txt = "✘ Close", params = { event = "mxd-foodtruck:client:close"} },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['choppedtomato'].image .. " width=35px> Chopped Tomato", txt = "1x Tomato", params = { event = "mxd-foodtruck:client:chopveg", args = 'choppedtomato' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['choppedonion'].image .. " width=35px> Chopped Onion", txt = "1x Onion", params = { event = "mxd-foodtruck:client:chopveg", args = 'choppedonion' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['choppedgarlic'].image .. " width=35px> Chopped Garlic", txt = "1x Garlic", params = { event = "mxd-foodtruck:client:chopveg", args = 'choppedgarlic' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['choppedcarrot'].image .. " width=35px> Chopped Carrot", txt = "1x Carrot", params = { event = "mxd-foodtruck:client:chopveg", args = 'choppedcarrot' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['choppedcapsicum'].image .. " width=35px> Chopped Capsicum", txt = "1x Capsicum", params = { event = "mxd-foodtruck:client:chopveg", args = 'choppedcapsicum' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['choppedlemon'].image .. " width=35px> Chopped Lemon", txt = "1x Lemon", params = { event = "mxd-foodtruck:client:chopveg", args = 'choppedlemon' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['choppedapple'].image .. " width=35px> Chopped Apple", txt = "1x Apple", params = { event = "mxd-foodtruck:client:chopveg", args = 'choppedapple' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['choppedorange'].image .. " width=35px> Chopped Orange", txt = "1x Lemon", params = { event = "mxd-foodtruck:client:chopveg", args = 'choppedorange'} },
    })
end)

RegisterNetEvent('mxd-foodtruck:client:openprepmenu', function()
    exports['qb-menu']:openMenu({
		{ header = "Wanna Cook Taco", txt = "Waana Start Cooking Channel!..", isMenuHeader = true },
		{ header = "", txt = "✘ Close", params = { event = "mxd-foodtruck:client:close"} },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['veggiesmix'].image .. " width=35px> 2x Veggies Mix", txt = "1x Chopped Tomato, 1x Chopped Onion, 1x Chopped Gralic, 1x Chopped Carrot, 1x Chopped Capsicum", params = { event = "mxd-foodtruck:client:prepitem", args = 'veggiesmix' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['steamrice'].image .. " width=35px> 2x Steamed Rice", txt = "1x Rice Packet, 1x Water Bottle", params = { event = "mxd-foodtruck:client:prepitem", args = 'steamrice' } },	
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['tacofilling'].image .. " width=35px> Taco Filling", txt = "1x Veggies Mix, 1x Spice Mix, 1x Mayo, 1x Mix Sauce", params = { event = "mxd-foodtruck:client:prepitem", args = 'tacofilling' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['tacoshell'].image .. " width=35px> 2x Taco Shell",	txt = "1x Wheat Flour, 1x Spice Mix, 1x Water Bottle", params = { event = "mxd-foodtruck:client:prepitem", args = 'tacoshell' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['burritofilling'].image .. " width=35px> Burrito Filling", txt = "1x Spice Mix, 1x Mayo, 1x Mix Sauce, 1x Steamed Rice", params = { event = "mxd-foodtruck:client:prepitem", args = 'burritofilling' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['tortilla'].image .. " width=35px> 2x Tortilla", txt = "1x Wheat Flour, 1x Water Bottle", params = { event = "mxd-foodtruck:client:prepitem", args = 'tortilla' } },	
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['ricefilling'].image .. " width=35px> Rice Filling", txt = "1x Veggies Mix, 1x Spice Mix, 1x Mayo, 1x Steamed Rice", params = { event = "mxd-foodtruck:client:prepitem", args = 'ricefilling' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['cheesesauce'].image .. " width=35px> Cheese Sauce", txt = "1x Spice Mix, 1x Mayo, 2x Cheese Cube", params = { event = "mxd-foodtruck:client:prepitem", args = 'cheesesauce' } },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['salsa'].image .. " width=35px> Salsa", txt = "1x Spice Mix, 2x Veggies Mix", params = { event = "mxd-foodtruck:client:prepitem", args = 'salsa' } },	

    })
end)

RegisterNetEvent('mxd-foodtruck:client:opencookmenu', function()
    exports['qb-menu']:openMenu({
		{ header = "Cook Taco", txt = "Waana Start Cooking Channel!..", isMenuHeader = true },
		{ header = "", txt = "✘ Close", params = { event = "mxd-foodtruck:client:close"} },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['beantaco'].image .. " width=35px> Bean Taco", txt = "1x Taco Shell, 1x Beans, 1x Taco Filling, 1x Veggies Mix", params = { event = "mxd-foodtruck:client:cookitem", args = 'beantaco' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['cheesetaco'].image .. " width=35px> Cheese Taco",	txt = "1x Taco Shell, 1x Taco Filling, 1x Veggies Mix, 1x Cheese sauce", params = { event = "mxd-foodtruck:client:cookitem", args = 'cheesetaco' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['nakedtaco'].image .. " width=35px> Naked Taco", txt = "1x Taco Shell, 1x Beans, 2x Taco Filling, 1x Veggies Mix, 1x Cheese sauce", params = { event = "mxd-foodtruck:client:cookitem", args = 'nakedtaco' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['grilledtaco'].image .. " width=35px> Grilled Taco", txt = "1x Taco Shell, 1x Taco Filling, 1x Veggies Mix", params = { event = "mxd-foodtruck:client:cookitem", args = 'grilledtaco' } },	
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['classicburrito'].image .. " width=35px> Classic Burrito", txt = "1x Tortilla, 1x Beans, 1x Burrito Filling, 1x Veggies Mix", params = { event = "mxd-foodtruck:client:cookitem", args = 'classicburrito' } },	
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['layerburrito'].image .. " width=35px> 7 Layer Burrito", txt = "1x Tortilla, 2x Beans, 2x Burrito Filling, 2x Veggies Mix, 2x Cheese Sauce", params = { event = "mxd-foodtruck:client:cookitem", args = 'layerburrito' } },	
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['burritobowl'].image .. " width=35px> Burrito Rice Bowl", txt = "1x Bowl, 1x Burrito Filling, 1x Rice Filling, 1x Veggies Mix", params = { event = "mxd-foodtruck:client:cookitem", args = 'burritobowl' } },	
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['beanbowl'].image .. " width=35px> Bean Rice Bowl", txt = "1x Bowl, 1x Cheese Sauce, 1x Rice Filling, 1x Veggies Mix, 1x Beans", params = { event = "mxd-foodtruck:client:cookitem", args = 'beanbowl' } },	
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['saladbowl'].image .. " width=35px> Salad Bowl", txt = "1x Bowl, 2x Veggies Mix, 1x Beans", params = { event = "mxd-foodtruck:client:cookitem", args = 'saladbowl' } },	
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['cheesenachos'].image .. " width=35px> Cheese Nachos", txt = "1x Nachos Packet, 1x Cheese Sauce, 1x Salsa", params = { event = "mxd-foodtruck:client:cookitem", args = 'cheesenachos' } },	
    })
end)

RegisterNetEvent('mxd-foodtruck:client:opendrinksmenu', function()
    exports['qb-menu']:openMenu({
		{ header = "Wanna Have a Drink", txt = "Waana Start Cooking Channel!..", isMenuHeader = true },
		{ header = "", txt = "✘ Close", params = { event = "mxd-foodtruck:client:close"} },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['classiclemonade'].image .. " width=35px> Classic Lemonade", txt = "1x Chopped Lemon, 1x Water Bottle, 1x Sugar Packet", params = { event = "mxd-foodtruck:client:drinkitem", args = 'classiclemonade' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['sodalemonade'].image .. " width=35px> Soda Lemonade",	txt = "1x Chopped Lemon, 1x Soda Bottle, 1x Sugar Packet", params = { event = "mxd-foodtruck:client:drinkitem", args = 'sodalemonade' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['applejuice'].image .. " width=35px> Apple Juice", txt = "2x Chopped Apple, 1x Soda Bottle, 2x Sugar Packet", params = { event = "mxd-foodtruck:client:drinkitem", args = 'applejuice' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['orangejuice'].image .. " width=35px> Orange Juice", txt = "2x Chopped Orange, 1x Water Bottle, 2x Sugar Packetx", params = { event = "mxd-foodtruck:client:drinkitem", args = 'orangejuice' } },	
    })
end)

RegisterNetEvent('mxd-foodtruck:client:opentruckcustomermenu', function()
    exports['qb-menu']:openMenu({
		{ header = "Feeling Hungry", txt = "Waana Order Something!..", isMenuHeader = true },
		{ header = "", txt = "✘ Close", params = { event = "mxd-foodtruck:client:close"} },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['beantaco'].image .. " width=35px> Bean Taco", txt = "Quench your hunger", params = { } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['cheesetaco'].image .. " width=35px> Cheese Taco",	txt = "Quench your hunger", params = { } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['nakedtaco'].image .. " width=35px> Naked Taco", txt = "Quench your hunger", params = { } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['grilledtaco'].image .. " width=35px> Grilled Taco", txt = "Quench your hunger", params = { } },	
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['classicburrito'].image .. " width=35px> Classic Burrito", txt = "Quench your hunger", params = { } },	
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['layerburrito'].image .. " width=35px> 7 Layer Burrito", txt = "Quench your hunger", params = { } },	
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['burritobowl'].image .. " width=35px> Burrito Rice Bowl", txt = "Quench your hunger", params = { } },	
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['beanbowl'].image .. " width=35px> Bean Rice Bowl", txt = "Quench your hunger", params = { } },	
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['saladbowl'].image .. " width=35px> Salad Bowl", txt = "Quench your hunger", params = { } },	
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['cheesenachos'].image .. " width=35px> Cheese Nachos", txt = "Quench your hunger", params = { } },	
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['classiclemonade'].image .. " width=35px> Classic Lemonade", txt = "Quench your hunger", params = { } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['sodalemonade'].image .. " width=35px> Soda Lemonade",	txt = "Quench your hunger", params = { } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['applejuice'].image .. " width=35px> Apple Juice", txt = "Quench your hunger", params = { } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['orangejuice'].image .. " width=35px> Orange Juice", txt = "Quench your hunger", params = { } },	
    })
end)

-- Coffee Menu

RegisterNetEvent('mxd-foodtruck:client:opencoffeeprepmenu', function()
    exports['qb-menu']:openMenu({
		{ header = "Wanna Prepare Something", txt = "Waana Start Cooking Channel!..", isMenuHeader = true },
		{ header = "", txt = "✘ Close", params = { event = "mxd-foodtruck:client:close"} },
        { header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['groundedcoffee'].image .. " width=35px> Grounded Coffee",	txt = "1x Coffee Beans", params = { event = "mxd-foodtruck:client:prepcoffee", args = 'groundedcoffee' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['espresso'].image .. " width=35px> Espresso", txt = "2x Grounded Coffee, 1x Water Bottle", params = { event = "mxd-foodtruck:client:prepcoffee", args = 'espresso' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['foam'].image .. " width=35px> Coffee Foam", txt = "1x Milk, 1x Sugar Packet", params = { event = "mxd-foodtruck:client:prepcoffee", args = 'foam' } },
    })
end)

RegisterNetEvent('mxd-foodtruck:client:opencoffeecookmenu', function()
    exports['qb-menu']:openMenu({
		{ header = "Wanna Prepare a Drink", txt = "Waana Start Cooking Channel!..", isMenuHeader = true },
		{ header = "", txt = "✘ Close", params = { event = "mxd-foodtruck:client:close"} },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['cappuccino'].image .. " width=35px> Cappuccino", txt = "2x Espresso, 1x Foam, 2x Milk, 2x Sugar Packet", params = { event = "mxd-foodtruck:client:cookcoffee", args = 'cappuccino' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['frappuccino'].image .. " width=35px> Frappuccino",	txt = "2x Espresso, 2x Foam, 1x Milk, 1x Sugar Packet", params = { event = "mxd-foodtruck:client:cookcoffee", args = 'frappuccino' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['latte'].image .. " width=35px> Latte", txt = "1x Espresso, 2x Foam, 1x Milk, 1x Sugar Packet", params = { event = "mxd-foodtruck:client:cookcoffee", args = 'latte' } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['coldcoffee'].image .. " width=35px> Cold Coffee", txt = "1x Grounded Coffee, 1x Foam, 1x Milk, 2x Sugar Packet", params = { event = "mxd-foodtruck:client:cookcoffee", args = 'coldcoffee' } },
    })
end)

RegisterNetEvent('mxd-foodtruck:client:opencoffeecustomermenu', function()
    exports['qb-menu']:openMenu({
		{ header = "Feeling Thirsty", txt = "Waana Order Something!..", isMenuHeader = true },
		{ header = "", txt = "✘ Close", params = { event = "mxd-foodtruck:client:close"} },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['cappuccino'].image .. " width=35px> Cappuccino", txt = "Quench your thirst", params = { } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['frappuccino'].image .. " width=35px> Frappuccino",	txt = "Quench your thirst", params = { } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['latte'].image .. " width=35px> Latte", txt = "Quench your thirst", params = { } },
		{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['coldcoffee'].image .. " width=35px> Cold Coffee", txt = "Quench your thirst", params = { } },
    })
end)

-- Ped Target

CreateThread(function()
    local modelveh = Config.VehPed
    RequestModel(modelveh)
    while not HasModelLoaded(modelveh) do
        Wait(0)
    end
    local vped = CreatePed(0, modelveh, Config.VehPedCoords.x, Config.VehPedCoords.y, Config.VehPedCoords.z, Config.VehPedCoords.w, false, false)
    FreezeEntityPosition(vped, true)
    SetEntityInvincible(vped, true)
    SetBlockingOfNonTemporaryEvents(vped, true)
    TaskStartScenarioInPlace(vped, Config.VehPedAnim, 0, true)

    local modelingshop = Config.IngShopPed
    RequestModel(modelingshop)
    while not HasModelLoaded(modelingshop) do
        Wait(0)
    end
    local ingshopped = CreatePed(0, modelingshop, Config.IngShopPedCoords.x, Config.IngShopPedCoords.y, Config.IngShopPedCoords.z,Config.IngShopPedCoords.w, false, false)
    FreezeEntityPosition(ingshopped, true)
    SetEntityInvincible(ingshopped, true)
    SetBlockingOfNonTemporaryEvents(ingshopped, true)
    TaskStartScenarioInPlace(ingshopped, Config.IngShopPedAnim, 0, true)

    local modelcropshop = Config.CropShopPed
    RequestModel(modelcropshop)
    while not HasModelLoaded(modelcropshop) do
        Wait(0)
    end
    local cropshopped = CreatePed(0, modelcropshop, Config.CropShopPedCoords.x, Config.CropShopPedCoords.y, Config.CropShopPedCoords.z,Config.CropShopPedCoords.w, false, false)
    FreezeEntityPosition(cropshopped, true)
    SetEntityInvincible(cropshopped, true)
    SetBlockingOfNonTemporaryEvents(cropshopped, true)
    TaskStartScenarioInPlace(cropshopped, Config.CropShopPedAnim, 0, true)

    exports['qb-target']:AddTargetEntity(vped, {
        options = {
            {
                num = 1,
                type = "server",
                event = "mxd-foodtruck:server:buyVehicle",
                icon = 'fas fa-truck-fast',
                label = 'Buy Your Food Truck '..Config.CurrencySymbol..""..Config.TruckPrice,
                canInteract = function()
                    local isOwnedT = CanTarget()
                    if isOwnedT and Config.OwnableTruck then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 1,
                type = "client",
                event = "mxd-foodtruck:client:rentfoodtruck",
                icon = 'fas fa-truck-fast',
                label = 'Rent Your Truck '..Config.CurrencySymbol..""..Config.TruckPrice,
                canInteract = function()
                    local isOwnedT = CanTarget()
                    if isOwnedT and not Config.OwnableTruck and not istakentruck then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 1,
                type = "client",
                event = "mxd-foodtruck:client:depositfoodtruck",
                icon = 'fas fa-truck-fast',
                label = 'Deposit Your Food Truck',
                canInteract = function()
                    local isOwnedT = CanTarget()
                    if isOwnedT and not Config.OwnableTruck and istakentruck then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 2,
                type = "client",
                event = "mxd-foodtruck:client:spawncoffee",
                icon = 'fas fa-caravan',
                label = 'Get Coffee Cart '..Config.CurrencySymbol..""..Config.CoffeeDeposit,
                canInteract = function()
                    local isOwnedT = CanTargetCoffee()
                    if isOwnedT and not istakencoffee then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 3,
                type = "client",
                event = "mxd-foodtruck:client:depositcoffee",
                icon = 'fas fa-caravan',
                label = 'Deposit Your Coffee Cart',
                canInteract = function()
                    local isOwnedT = CanTargetCoffee()
                    if isOwnedT and istakencoffee then
                        return true
                    else
                        return false
                    end
                end,
            },
        },
        distance = 2.5, 
    })

    exports['qb-target']:AddTargetEntity(ingshopped, {
        options = {
            {
                type = "client",
                event = "mxd-foodtruck:client:openingshop",
                icon = 'fas fa-shop',
                label = 'Buy Ingredients',
                canInteract = function()
                    local isOwnedT = CanTarget()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            }
        },
        distance = 2.5, 
    })

    exports['qb-target']:AddTargetEntity(cropshopped, {
        options = {
            {
                type = "client",
                event = "mxd-foodtruck:client:opencropshop",
                icon = 'fas fa-shop',
                label = 'Buy Crops',
                canInteract = function()
                    local isOwnedT = CanTarget()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            }
        },
        distance = 2.5, 
    })
end)

-- Food Truck Target

CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.TruckModel, {
        options = {
            {
                num = 1,
                type = "client",
                event = "mxd-foodtruck:client:openstash",
                icon = 'fas fa-box',
                label = 'Open Stash',
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 2,
                type = "client",
                event = "mxd-foodtruck:client:openchopmenu",
                icon = 'fas fa-utensils',
                label = 'Chop Veggies',
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 3,
                type = "client",
                event = "mxd-foodtruck:client:openprepmenu",
                icon = 'fas fa-blender',
                label = 'Prepare Items',
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 4,
                type = "client",
                event = "mxd-foodtruck:client:opencookmenu",
                icon = 'fas fa-fire-burner',
                label = 'Cook Tacos',
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 5,
                type = "client",
                event = "mxd-foodtruck:client:opendrinksmenu",
                icon = 'fas fa-martini-glass-citrus',
                label = 'Prepare Drinks',
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 6,
                type = "client",
                event = "mxd-foodtruck:client:billplayerfood",
                icon = 'fas fa-money-bill',
                label = 'Bill Player',
                action = function(entity)
                    if IsPedAPlayer(entity) then return false end
                    TriggerEvent('mxd-foodtruck:client:billplayerfood', 'Food Truck')
                end,
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 7,
                type = "client",
                event = "mxd-foodtruck:client:opentruckcustomermenu",
                icon = 'fas fa-bars',
                label = 'Open Menu',
            },
            {
                num = 8,
                type = "client",
                event = "mxd-foodtruck:client:billplayerfoodaccept",
                icon = 'fas fa-money-bill',
                label = 'Take Your Order',
                action = function(entity)
                    if IsPedAPlayer(entity) then return false end
                    TriggerEvent('mxd-foodtruck:client:billplayerfoodaccept', 'Food Truck')
                end,
                canInteract = function()
                    local isOwnedT = MxDBillCheckTarget('Food Truck')
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
        },
        distance = 2.5, 
    })
end)

-- Coffee Cart Target

CreateThread(function()

    exports['qb-target']:AddTargetModel(Config.CoffeeObject, {
        options = {
            {
                num = 1,
                type = "client",
                event = "mxd-foodtruck:client:openstashcoffee",
                icon = 'fas fa-box',
                label = 'Open Stash',
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 2,
                type = "client",
                event = "mxd-foodtruck:client:opencoffeeprepmenu",
                icon = 'fas fa-blender',
                label = 'Prepare Ingirdients',
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 3,
                type = "client",
                event = "mxd-foodtruck:client:opencoffeecookmenu",
                icon = 'fas fa-fire-burner',
                label = 'Prepare Coffee',
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 4,
                type = "client",
                event = "mxd-foodtruck:client:billplayerfood",
                icon = 'fas fa-money-bill',
                label = 'Bill Player',
                action = function(entity)
                    if IsPedAPlayer(entity) then return false end
                    TriggerEvent('mxd-foodtruck:client:billplayerfood', 'Coffee Cart')
                end,
                canInteract = function()
                    local isOwnedT = IsOwned()
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
            {
                num = 5,
                type = "client",
                event = "mxd-foodtruck:client:opencoffeecustomermenu",
                icon = 'fas fa-bars',
                label = 'Open Menu',
            },
            {
                num = 6,
                type = "client",
                event = "mxd-foodtruck:client:billplayerfoodaccept",
                icon = 'fas fa-money-bill',
                label = 'Take Your Order',
                action = function(entity)
                    if IsPedAPlayer(entity) then return false end
                    TriggerEvent('mxd-foodtruck:client:billplayerfoodaccept', 'Coffee Cart')
                end,
                canInteract = function()
                    local isOwnedT = MxDBillCheckTarget('Coffee Cart')
                    if isOwnedT then
                        return true
                    else
                        return false
                    end
                end,
            },
        },
        distance = 2.5, 
    })

end)

-- Farm Target

CreateThread(function()
    exports['qb-target']:AddBoxZone("tomatobox", vector3(2283.11, 4760.44, 38.74), 3, 5, {
    name = "tomatobox",
    heading = 84.73,
    debugPoly = false,
    minZ = 36.7,
    maxZ = 40.9,
    }, {
        options = {
            {
            num = 1,
            type = "client",
            event = "mxd-foodtruck:client:addtomato",
            icon = 'fas fa-seedling',
            label = 'Pick Tomatoes',
            }
        },
        distance = 2.5, 
    })

    exports['qb-target']:AddBoxZone("onionbox", vector3(2284.11, 4765.9, 38.74), 3, 5, {
    name = "onionbox",
    heading = 84.73,
    debugPoly = false,
    minZ = 36.7,
    maxZ = 40.9,
    }, {
        options = {
            {
            num = 1,
            type = "client",
            event = "mxd-foodtruck:client:addonion",
            icon = 'fas fa-seedling',
            label = 'Pick Onions',
            }
        },
        distance = 2.5, 
    })

    exports['qb-target']:AddBoxZone("carrotbox", vector3(2285.36, 4771.98, 38.79), 3, 5, {
    name = "carrotbox",
    heading = 84.73,
    debugPoly = false,
    minZ = 36.7,
    maxZ = 40.9,
    }, {
        options = {
            {
            num = 1,
            type = "client",
            event = "mxd-foodtruck:client:addcarrot",
            icon = 'fas fa-seedling',
            label = 'Pick Carrots',
            }
        },
        distance = 2.5, 
    })

    exports['qb-target']:AddBoxZone("capsicumbox", vector3(2289.93, 4757.29, 38.56), 3, 3, {
    name = "capsicumbox",
    heading = 84.73,
    debugPoly = false,
    minZ = 36.7,
    maxZ = 40.9,
    }, {
        options = {
            {
            num = 1,
            type = "client",
            event = "mxd-foodtruck:client:addcapsicum",
            icon = 'fas fa-seedling',
            label = 'Pick Capsicums',
            }
        },
        distance = 2.5, 
    })

    exports['qb-target']:AddBoxZone("lemonbox", vector3(2290.93, 4761.29, 38.56), 3, 3, {
    name = "lemonbox",
    heading = 84.73,
    debugPoly = false,
    minZ = 36.7,
    maxZ = 40.9,
    }, {
        options = {
            {
            num = 1,
            type = "client",
            event = "mxd-foodtruck:client:addlemon",
            icon = 'fas fa-seedling',
            label = 'Pick Lemons',
            }
        },
        distance = 2.5, 
    })

    exports['qb-target']:AddBoxZone("garlicbox", vector3(2291.93, 4765.29, 38.56), 2.5, 3, {
    name = "garlicbox",
    heading = 84.73,
    debugPoly = false,
    minZ = 36.7,
    maxZ = 40.9,
    }, {
        options = {
            {
            num = 1,
            type = "client",
            event = "mxd-foodtruck:client:addgarlic",
            icon = 'fas fa-seedling',
            label = 'Pick Garlics',
            }
        },
        distance = 2.5, 
    })
    
    exports['qb-target']:AddBoxZone("applebox", vector3(2220.6, 4754.54, 40.59), 40, 15, {
    name = "applebox",
    heading = 252.38,
    debugPoly = false,
    minZ = 36.7,
    maxZ = 55.9,
    }, {
        options = {
            {
            num = 1,
            type = "client",
            event = "mxd-foodtruck:client:addapple",
            icon = 'fas fa-seedling',
            label = 'Pick Apples',
            }
        },
        distance = 2.5, 
    })

    exports['qb-target']:AddBoxZone("orangebox", vector3(2268.5, 4742.54, 40.59), 50, 15, {
    name = "orangebox",
    heading = 252.38,
    debugPoly = false,
    minZ = 36.7,
    maxZ = 55.9,
    }, {
        options = {
            {
            num = 1,
            type = "client",
            event = "mxd-foodtruck:client:addorange",
            icon = 'fas fa-seedling',
            label = 'Pick Oranges',
            }
        },
        distance = 2.5, 
    })

end)

-- To Make Sure No NPC Vehicles Spawn Near Veh Ped

CreateThread(function()
    while (true) do
        ClearAreaOfVehicles(Config.VehPedCoords.x, Config.VehPedCoords.y, Config.VehPedCoords.z, 20.0, 1)
        Wait(500)
    end
end) 
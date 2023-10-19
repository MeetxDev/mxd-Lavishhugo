Config = {}

Config.GrantJobType = 'leo' --[ Job Type Which can Grant License ]
Config.GrantCommandName = 'grantfoodlicense' -- [ Command to Give Food License to a Player ]
Config.RevokeCommandName = 'revokefoodlicense'-- [ Command to Revoke Food License to a Player ]

Config.Job = 'foodtruck' -- [ Job Required by Players to do stuff if Config.useJob is true ]

--[ To Target and Do Stuff for Truck and Coffee Cart ]
Config.UseLicense = true  -- [ Should Check if Player has FoodLicense to Target]
Config.ShouldHaveKey = true -- [ Should Check if Player Should Have the Vehicle Keys to Target ]
Config.useJob = true -- [ Should Check if Player has Job to Target]

-- [ Some Optons ]
Config.ShowBlips = true -- [ Should Show Blips ]
Config.OwnableTruck = true -- [ Should Trucks be Ownable (can be bought and stored) ]
Config.UseCoffeeTruck = true -- [ Should Coffee Cart Target Come at Ped ]

Config.CurrencySymbol = '$' -- [ Currency Symbol of your server to display ]

-- [ Food Truck Options ]
Config.TruckModel = 'taco' -- [ Food Truck Model ]
Config.TruckPrice = 10000 -- [ Food Truck Price ]
Config.TruckDepositReturn = 75 --[ returns determined percentage of the Config.TruckPrice (if Config.OwnableTruck = false) value ]
Config.TruckSpawn = { -- [ Food Truck Spawn Locations ]
    vector4(-736.66, -1037.42, 11.61, 118.33),
    vector4(-740.93, -1030.13, 12.85, 118.24),
    vector4(-751.82, -1037.38, 12.8, 293.87),

}

-- [ Coffee Cart Options ]
Config.CoffeeObject = 'p_ld_coffee_vend_01' -- [ Coffee Cart Object (Only change if you know what you are doing) ]
Config.CoffeeVeh = 'faggio3' --[ Coffee Cart Vehicle Model ]
Config.CoffeeDeposit = 5000 -- [ Coffee Cart Price ]
Config.CoffeeDepositReturn = 75 --[ returns determined percentage of the Config.CoffeeDeposit value ]
Config.CoffeeSpawn = { -- [ Coffee Cart Spawn Locations ]
    vector4(-761.38, -1026.28, 13.1, 292.31),
    vector4(-761.7, -1021.57, 13.16, 293.88),

}

-- [ Ped Options ]
Config.VehPed = 'csb_tomcasino' -- [ Model of Ped which gives Vehicle ]
Config.VehPedCoords = vector4(-750.69, -1016.76, 12.15, 114.76) -- [ Coords of Ped which gives Vehicle ]
Config.VehPedAnim = 'WORLD_HUMAN_STAND_CLIPBOARD' -- [ Animation of Ped which gives Vehicle ]

Config.IngShopPed = 'ig_jay_norris' -- [ Model of Ped which gives Ingredients ]
Config.IngShopPedCoords = vector4(26.64, -169.32, 54.5, 346.15) -- [ Coords of Ped which gives Ingredients ]
Config.IngShopPedAnim = 'WORLD_HUMAN_STAND_MOBILE' -- [ Animation of Ped which gives Ingredients ]

Config.CropShopPed = 'cs_old_man2' -- [ Model of Ped which gives Vegetables ]
Config.CropShopPedCoords = vector4(2299.58, 4750.31, 36.03, 69.2) -- [ Coords of Ped which gives Vegetables ]
Config.CropShopPedAnim = 'WORLD_HUMAN_SMOKING' -- [ Animation of Ped which gives Vegetables ]

-- [ Outer Scripts Event ]
Config.InvShopEvent = 'inventory:server:OpenInventory' -- [ for opening inv (setting stash, shop) ]
Config.InvStashEvent = 'inventory:client:SetCurrentStash' -- [ to set Current stash ]
Config.InvRemoveEvent = 'inventory:client:ItemBox' -- [ for showing removed item to player ]
Config.GetStashItems = 'qb-inventory:server:GetStashItems'-- [ for getting items in a stash (it's a callback) ]
Config.ImageLoc = 'qb-inventory/html/images/'

Config.FuelScriptName = 'LegacyFuel' -- [ Fuel Script to set fuel of car (Should have `SetFuel` export) ]
Config.RadialMenuName = 'qb-radialmenu' -- [ RadialMenu Script to add RadiaMenu if Config.UseRadialMenuNPC = true (Should have `AddOption` export) ]
Config.VehicleKeysName = 'qb-vehiclekeys' -- [ VehicleKeys Script to check Keys if Config.ShouldHaveKey = true (Should have `HasKeys` export) ]

-- [ Time Options ]
Config.ChopTime = 2000 -- [ Time Taken to Chop Vegetables ]
Config.PrepTime = 3000 -- [ Time Taken to Prepare Items (Food Truck) ]
Config.CookTime = 5000 -- [ Time Taken to Cook Items (Food Truck) ]
Config.DrinkTime = 5000 -- [ Time Taken to Prepare Drinks (Food Truck) ]
Config.PickTime = 1500 -- [ Time Taken to Pick Vegetables ]
Config.CoffeePrepTime = 2000 -- [ Time Taken to Prepare Items (Coffee Cart) ]
Config.CoffeeCookTime = 5000 -- [ Time Taken to Cook Drinks (Coffee Cart) ]
Config.EatTime = 5000 -- [ Time Taken to Eat Food ]
Config.DrinkingTime = 4000 -- [ Time Taken Drink Item ]

-- [ Crop Options ]
Config.MaintainPrice = 5 -- [ Price to be taken for Crop Maintenance (When PLayer Pick Crops) ]

-- [ Sell to NPC's Options ] 
Config.SuccessChanceNPC = 75 -- [ Chance that NPC buys item ]
Config.UseRadialMenuNPC = true -- [ Should RadialMenu be used ]
Config.CommandNPCFood = 'sellfood' -- [ Command to Sell Food Truck Items to NPC's (false to disbale like Config.CommandNPCFood = 'false') inside strings ]
Config.CommandNPCCoffee = 'sellcoffee' -- [ Command to Sell Coffee Cart Items to NPC's  (false to disbale) ]

Config.FoodTruckSellingList = { -- [Items To Sell to NPC's for Food Truck ]
    [1] = {item = "beantaco", label = "Bean Taco", min = 175, max = 200}, -- [ item = Item's name (added in qb-core/shared/items.lua) ]
    [2] = {item = "cheesetaco", label = "Cheese Taco", min = 200, max = 250}, -- [ label = Label that NPC's show ]
    [3] = {item = "nakedtaco", label = "Naked Taco", min = 300, max = 350}, -- [ min = Minimun Price NPC's offer ]
    [4] = {item = "grilledtaco", label = "Grilled Taco", min = 150, max = 200}, -- [  max = Maximum Price NPC's offer ]
    [5] = {item = "classicburrito", label = "Classic Burrito", min = 180, max = 220},
    [6] = {item = "layerburrito ", label = "7 Layer Burrito", min = 450, max = 500},
    [7] = {item = "burritobowl", label = "Burrito Bowl", min = 200, max = 250},
    [8] = {item = "beanbowl", label = "Bean Bowl", min = 225, max = 265},
    [9] = {item = "saladbowl", label = "Salad Bowl", min = 75, max = 125},
    [10] = {item = "cheesenachos", label = "Cheese Nachos", min = 190, max = 235},
    [11] = {item = "classiclemonade", label = "Classic Lemonade", min = 55, max = 100},
    [12] = {item = "sodalemonade", label = "Soda Lemonade", min = 55, max = 100},
    [13] = {item = "applejuice", label = "Apple Juice", min = 75, max = 135},
    [14] = {item = "orangejuice", label = "Orange Juice", min = 75, max = 135},
}

Config.CoffeeCartSellingList = { -- [Items To Sell to NPC's for Coffee Cart ]
    [1] = {item = "cappuccino", label = "Cappuccino", min = 300, max = 350},
    [2] = {item = "frappuccino", label = "Frappuccino", min = 290, max = 340},
    [3] = {item = "latte", label = "Latte", min = 225, max = 275},
    [4] = {item = "coldcoffee", label = "Cold Coffee", min = 110, max = 150},
}

--[ Consumables Option ]
Config.ConsumablesFood = { -- [ Food Items ]

    ["beantaco"] = math.random(30, 40),
    ["cheesetaco"] = math.random(35, 45),
    ["nakedtaco"] = math.random(45, 55),
    ["grilledtaco"] = math.random(20, 30),
    ["classicburrito"] = math.random(20, 30),
    ["layerburrito"] = math.random(95, 100),
    ["burritobowl"] = math.random(35, 45),
    ["beanbowl"] = math.random(35, 45),
    ["saladbowl"] = math.random(20, 30),
    ["cheesenachos"] = math.random(35, 45),

}

Config.ConsumablesDrink = { -- [ Drink Items ]

    ["classiclemonade"] = math.random(35, 45),
    ["sodalemonade"] = math.random(35, 45),
    ["applejuice"] = math.random(35, 45),
    ["orangejuice"] = math.random(35, 45),
    ["cappuccino"] = math.random(75, 80),
    ["frappuccino"] = math.random(75, 80),
    ["latte"] = math.random(65, 75),
    ["coldcoffee"] = math.random(45, 55),

}

-- [ Shop Options ]
Config.IngShopItems = { -- [ Config.IngShopPed Open this shop]
    label = "General Store",
    slots = 30,
    items = {
        [1] = {
            name = "beans",
            price = 30,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "spicemix",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "mayo",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "mixsauce",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "wheatflour",
            price = 75,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "cheesecube",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
		[7] = {
            name = "ricepacket",
            price = 75,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
		[8] = {
            name = "bowl",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
		[9] = {
            name = "nachospacket",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
		[10] = {
            name = "sugarpacket",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
		[11] = {
            name = "soda_bottle",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
		[12] = {
            name = "water_bottle",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "milk",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "coffeebeans",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
        },
    },
}

Config.CropShopItems = { -- [ Config.CropShopPed Open this shop]
    label = "Crop Store",
    slots = 30,
    items = {
        [1] = {
            name = "tomato",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "onion",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "carrot",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "capsicum",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "lemon",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "garlic",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
		[7] = {
            name = "apple",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
		[8] = {
            name = "orange",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
    },
}

-- [ Crafting Oprions (Read readme.md to add items)]

-- [ Cutting Options ]
Config.ChopVeg = { -- [ Chop Menu Items ]

	[1] = { item = "choppedtomato" , required ={ ["tomato"] = 1, } , amount = 4  },
	[2] = { item = "choppedonion" , required ={ ["onion"] = 1, } , amount = 4  },
	[3] = { item = "choppedgarlic" , required ={ ["garlic"] = 1, } , amount = 4  },
	[4] = { item = "choppedcarrot" , required ={ ["carrot"] = 1, } , amount = 4  },
	[5] = { item = "choppedcapsicum" , required ={ ["capsicum"] = 1, } , amount = 4  },
	[6] = { item = "choppedlemon" , required ={ ["lemon"] = 1, } , amount = 2  },
	[7] = { item = "choppedapple" , required ={ ["apple"] = 1, } , amount = 4  },
	[8] = { item = "choppedorange" , required ={ ["orange"] = 1, } , amount = 4  },

}

-- [ Preparing Items Options ]
Config.PrepItem = { -- [ Preparing (Food Truck) Menu Items ]

	[1] = { item = "veggiesmix" , required ={ ["choppedtomato"] = 1, ["choppedonion"] = 1, ["choppedgarlic"] = 1, ["choppedcarrot"] = 1, ["choppedcapsicum"] = 1, } , amount = 2 },
	[2] = { item = "tacofilling" , required ={ ["veggiesmix"] = 1, ["spicemix"] = 1, ["mayo"] = 1, ["mixsauce"] = 1, } , amount = 1 },
	[3] = { item = "tacoshell" , required ={ ["wheatflour"] = 1, ["spicemix"] = 1, ["water_bottle"] = 1, } , amount = 2 },
	[4] = { item = "burritofilling" , required ={ ["spicemix"] = 1, ["mayo"] = 1, ["mixsauce"] = 1, ["steamrice"] = 1, } , amount = 1 },
	[5] = { item = "tortilla" , required ={ ["wheatflour"] = 1, ["water_bottle"] = 1, } , amount = 2 },
	[6] = { item = "ricefilling" , required ={ ["veggiesmix"] = 1, ["spicemix"] = 1, ["mayo"] = 1, ["steamrice"] = 1, } , amount = 1 },
	[7] = { item = "cheesesauce" , required ={ ["spicemix"] = 1, ["mayo"] = 1, ["cheesecube"] = 2, } , amount = 1 },
	[8] = { item = "salsa" , required ={ ["spicemix"] = 1, ["veggiesmix"] = 2, } , amount = 1 },
	[9] = { item = "steamrice" , required ={ ["ricepacket"] = 1, ["water_bottle"] = 1, } , amount = 2 },

}

-- [ Cooking Items Options ]
Config.FoodItem = { -- [ Cooking (Food Truck) Menu Items ]

	[1] = { item = "beantaco" , required ={ ["tacoshell"] = 1, ["beans"] = 1, ["tacofilling"] = 1, ["veggiesmix"] = 1, } , amount = 1 },
	[2] = { item = "cheesetaco" , required ={ ["tacoshell"] = 1, ["cheesesauce"] = 1, ["tacofilling"] = 1, ["veggiesmix"] = 1, } , amount = 1 },
	[3] = { item = "nakedtaco" , required ={ ["tacoshell"] = 1, ["beans"] = 1, ["cheesesauce"] = 1, ["tacofilling"] = 2, ["veggiesmix"] = 1, } , amount = 1 },
	[4] = { item = "grilledtaco" , required ={ ["tacoshell"] = 1, ["tacofilling"] = 1, ["veggiesmix"] = 1, } , amount = 1 },
	[5] = { item = "classicburrito" , required ={ ["tortilla"] = 1, ["beans"] = 1, ["burritofilling"] = 1, ["veggiesmix"] = 1, } , amount = 1  },
	[6] = { item = "layerburrito" , required ={ ["tortilla"] = 1, ["beans"] = 2, ["burritofilling"] = 2, ["cheesesauce"] = 2, ["veggiesmix"] = 2, } , amount = 1 },
	[7] = { item = "burritobowl" , required ={ ["bowl"] = 1, ["ricefilling"] = 1, ["burritofilling"] = 1, ["veggiesmix"] = 1, } , amount = 1 },
	[8] = { item = "beanbowl" , required ={ ["bowl"] = 1, ["ricefilling"] = 1, ["beans"] = 1, ["veggiesmix"] = 1, ["cheesesauce"] = 1, } , amount = 1 },
	[9] = { item = "saladbowl" , required ={  ["bowl"] = 1, ["beans"] = 1, ["veggiesmix"] = 2, } , amount = 1 },
	[10] = { item = "cheesenachos" , required ={ ["nachospacket"] = 1, ["cheesesauce"] = 1, ["salsa"] = 1, } , amount = 1 },

}

-- [ Cooking Items Options ]
Config.DrinkItem = { -- [ Drinking (Food Truck) Menu Items ]

	[1] = { item = "classiclemonade" , required ={ ["choppedlemon"] = 1, ["water_bottle"] = 1, ["sugarpacket"] = 1, } , amount = 1 },
	[2] = { item = "sodalemonade" , required ={ ["choppedlemon"] = 1, ["soda_bottle"] = 1, ["sugarpacket"] = 1, } , amount = 1 },
	[3] = { item = "applejuice" , required ={  ["choppedapple"] = 2, ["soda_bottle"] = 1, ["sugarpacket"] = 2, } , amount = 1 },
	[4] = { item = "orangejuice" , required ={  ["choppedorange"] = 2, ["water_bottle"] = 1, ["sugarpacket"] = 2, } , amount = 1 },

}

-- [ Preparing Items Options ]
Config.CoffeePrepItem = { -- [ Preparing (Coffee Cart) Menu Items ]

	[1] = { item = "espresso" , required ={ ["groundedcoffee"] = 2, ["water_bottle"] = 1, } , amount = 1 },
	[2] = { item = "groundedcoffee" , required ={ ["coffeebeans"] = 1, } , amount = 1 },
	[3] = { item = "foam" , required ={  ["milk"] = 1, ["sugarpacket"] = 1, } , amount = 1 },

}

-- [ Drinking Items Options ]
Config.CoffeeCookItem = { -- [ Drinking (Coffee Cart) Menu Items ]

	[1] = { item = "cappuccino" , required ={ ["espresso"] = 2, ["foam"] = 1, ["milk"] = 1, ["sugarpacket"] = 2, } , amount = 1 },
	[2] = { item = "frappuccino" , required ={ ["espresso"] = 2, ["foam"] = 2, ["milk"] = 1, ["sugarpacket"] = 1, } , amount = 1 },
	[3] = { item = "latte" , required ={  ["espresso"] = 1, ["foam"] = 2, ["milk"] = 1, ["sugarpacket"] = 1, } , amount = 1 },
	[4] = { item = "coldcoffee" , required ={  ["groundedcoffee"] = 1, ["foam"] = 1, ["milk"] = 1, ["sugarpacket"] = 2, } , amount = 1 },

}
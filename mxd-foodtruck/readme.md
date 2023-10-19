# Created By : MeetxDev#0421 
# Support Discord : https://discord.gg/AquwCR3CQb
# Store : https://meetxdev.tebex.io/
# Like my Work : https://ko-fi.com/meetxdev

# Preview : https://youtu.be/kMKygEu-I3M
# cfx post : https://forum.cfx.re/t/paid-qb-meetxdev-portable-food-truck-with-npc-selling-billing-system/5011461

# Description 

A Food Truck Script with 2 mobile carts - 1) Taco Truck 2) Coffee Cart. Easy to install and detailed making of food

# Features

1) 2 trucks - food and coffee
2) Food license, job, vehicle keys check (can be changed from config)
3) Crop picking field (takes maintenance fee) as well as ped shop (sells at higher price)
4) Ingredients ped, Vehicle Selling Ped (All locations can be changed from config)
5) Ownable as well as Rental truck (can be toggled from config)
6) Stash, Chop, Prepare, Cook Food, Prepare Drinks, Bill Menu for Seller
7) Items can be added detailed Guide Below
8) Item Menu for Customer
9) Bill Menu to customer only after being billed by biller
10 Unique Bill Stash for each and every Customer for every Shop
11) Bill Stash Gets Deleted after restart to avoid multiple unused stashes
13) NPC Selling (Both command and radialmenu both of which can be toggled from config)
14) Need to be near truck or coffee cart to sell to NPC 
15) Distance check from truck/coffee cart if selling to NPC (will stop automatically if player goes too far from truck/coffee cart)
16) Usable Items

# Requirements 

1) qb-core : https://github.com/qbcore-framework/qb-core
2) qb-target : https://github.com/qbcore-framework/qb-target
3) dpemotes : https://github.com/qbcore-framework/dpemotes

# Installation

*1) qb-core/server/player.lua*

```lua

--This 


    PlayerData.metadata['licences'] = PlayerData.metadata['licences'] or {
        ['driver'] = true,
        ['business'] = false,
        ['weapon'] = false
    }


--To

    PlayerData.metadata['licences'] = PlayerData.metadata['licences'] or {
        ['driver'] = true,
        ['business'] = false,
        ['weapon'] = false,
        ['foodtruck'] = false
    }

```

*2) qb-core/shared/items.lua*

```lua

	['tomato'] 				 	 = {['name'] = 'tomato', 			  	  	['label'] = 'Tomato', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tomato.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['onion'] 				 	 = {['name'] = 'onion', 			  	  	['label'] = 'Onion', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'onion.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['garlic'] 				 	 = {['name'] = 'garlic', 			  	  	['label'] = 'Garlic', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'garlic.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['carrot'] 				 	 = {['name'] = 'carrot', 			  	  	['label'] = 'Carrot', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'carrot.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['capsicum'] 				 = {['name'] = 'capsicum', 			  	  	['label'] = 'Capsicum', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'capsicum.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['lemon'] 				 	 = {['name'] = 'lemon', 			  	  	['label'] = 'Lemon', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'lemon.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['apple'] 				 	 = {['name'] = 'apple', 			  	  	['label'] = 'Apple', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'apple.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['orange'] 				 	 = {['name'] = 'orange', 			  	  	['label'] = 'Orange', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'orange.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},

	['choppedtomato'] 			 = {['name'] = 'choppedtomato', 			['label'] = 'Chopped Tomato', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'choppedtomato.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['choppedonion'] 			 = {['name'] = 'choppedonion', 			 	['label'] = 'Chopped Onion', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'choppedonion.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['choppedgarlic'] 			 = {['name'] = 'choppedgarlic', 			['label'] = 'Chopped Garlic', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'choppedgarlic.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['choppedcarrot'] 			 = {['name'] = 'choppedcarrot', 			['label'] = 'Chopped Carrot', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'choppedcarrot.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['choppedcapsicum'] 	     = {['name'] = 'choppedcapsicum', 			['label'] = 'Chopped Capsicum', 	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'choppedcapsicum.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['choppedlemon'] 			 = {['name'] = 'choppedlemon', 			 	['label'] = 'Chopped Lemon', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'choppedlemon.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['choppedapple'] 			 = {['name'] = 'choppedapple', 			 	['label'] = 'Chopped Apple', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'choppedapple.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['choppedorange'] 			 = {['name'] = 'choppedorange', 			['label'] = 'Chopped Orange', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'choppedorange.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},

	['beans'] 				 	 = {['name'] = 'beans', 			  	  	['label'] = 'Beans', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'beans.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['spicemix'] 				 = {['name'] = 'spicemix', 			  	  	['label'] = 'Spice Mix', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'spicemix.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['mayo'] 				 	 = {['name'] = 'mayo', 			  	  		['label'] = 'Mayo', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'mayo.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['mixsauce'] 				 = {['name'] = 'mixsauce', 			  	  	['label'] = 'Mix Sauce', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'mixsauce.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['wheatflour'] 				 = {['name'] = 'wheatflour', 			  	['label'] = 'Wheat Flour', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'wheatflour.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['cheesecube'] 				 = {['name'] = 'cheesecube', 			  	['label'] = 'Cheese Cube', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cheesecube.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['ricepacket'] 				 = {['name'] = 'ricepacket', 			  	['label'] = 'Rice Packet', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'ricepacket.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['bowl'] 				 	 = {['name'] = 'bowl', 			  	  		['label'] = 'Bowl', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'bowl.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['nachospacket'] 			 = {['name'] = 'nachospacket', 			  	['label'] = 'Nachos Packet', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'nachospacket.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['sugarpacket'] 			 = {['name'] = 'sugarpacket', 			  	['label'] = 'Sugar Packet', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'sugarpacket.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['soda_bottle'] 			 = {['name'] = 'soda_bottle', 			  	['label'] = 'Soda Bottle', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'soda_bottle.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},

	['veggiesmix'] 				 = {['name'] = 'veggiesmix', 			  	['label'] = 'Veggies Mix', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'veggiesmix.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['tacofilling'] 			 = {['name'] = 'tacofilling', 			  	['label'] = 'Taco Filling', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tacofilling.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['tacoshell'] 				 = {['name'] = 'tacoshell', 			  	['label'] = 'Taco Shell', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tacoshell.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['burritofilling'] 			 = {['name'] = 'burritofilling', 			['label'] = 'Burrito Flling', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'burritofilling.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['tortilla'] 				 = {['name'] = 'tortilla', 			  		['label'] = 'Tortilla', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tortilla.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['ricefilling'] 			 = {['name'] = 'ricefilling', 			  	['label'] = 'Rice Filling', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'ricefilling.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['cheesesauce'] 			 = {['name'] = 'cheesesauce', 			  	['label'] = 'Cheese Sauce', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cheesesauce.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['salsa'] 			 		 = {['name'] = 'salsa', 			  		['label'] = 'Salsa', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'salsa.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['steamrice'] 				 = {['name'] = 'steamrice', 			  	['label'] = 'Steam Rice', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'steamrice.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},

	['beantaco'] 				 = {['name'] = 'beantaco', 			  		['label'] = 'Bean Taco', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'beantaco.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['cheesetaco'] 				 = {['name'] = 'cheesetaco', 			  	['label'] = 'Cheese Taco', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'cheesetaco.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['nakedtaco'] 				 = {['name'] = 'nakedtaco', 			  	['label'] = 'Naked Taco', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'nakedtaco.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['grilledtaco'] 			 = {['name'] = 'grilledtaco', 				['label'] = 'Grilled Taco', 		['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'grilledtaco.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['classicburrito'] 			 = {['name'] = 'classicburrito', 			['label'] = 'Classic Burrito', 		['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'classicburrito.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['layerburrito'] 			 = {['name'] = 'layerburrito', 			  	['label'] = 'Layer Burrito', 		['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'layerburrito.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['burritobowl'] 			 = {['name'] = 'burritobowl', 			  	['label'] = 'Burrito Bowl', 		['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'burritobowl.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['beanbowl'] 			 	 = {['name'] = 'beanbowl', 			  		['label'] = 'Bean Burrito Bowl', 	['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'beanbowl.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['saladbowl'] 				 = {['name'] = 'saladbowl', 			  	['label'] = 'Salad Bowl', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'saladbowl.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['cheesenachos'] 			 = {['name'] = 'cheesenachos', 			  	['label'] = 'Cheese Nachos', 		['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'cheesenachos.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},

	['classiclemonade'] 		 = {['name'] = 'classiclemonade', 			['label'] = 'Classic Lemonade', 	['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'classiclemonade.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Drink!'},
	['sodalemonade'] 			 = {['name'] = 'sodalemonade', 			  	['label'] = 'Soda Lemonade', 		['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'sodalemonade.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Drink!'},
	['applejuice'] 				 = {['name'] = 'applejuice', 			  	['label'] = 'Apple Juice', 			['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'applejuice.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Drink!'},
	['orangejuice'] 			 = {['name'] = 'orangejuice', 			  	['label'] = 'Orange Juice', 		['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'orangejuice.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Drink!'},

	['coffeebeans'] 		 	 = {['name'] = 'coffeebeans', 				['label'] = 'Coffee Beans', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'coffeebeans.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['milk'] 					 = {['name'] = 'milk', 			  			['label'] = 'Milk', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'milk.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},

	['espresso'] 				 = {['name'] = 'espresso', 			  		['label'] = 'Espresso', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'espresso.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['groundedcoffee'] 			 = {['name'] = 'groundedcoffee', 			['label'] = 'Grounded Coffee', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'groundedcoffee.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	['foam'] 					 = {['name'] = 'foam', 			  			['label'] = 'Coffee Foam', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'foam.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},

	['cappuccino'] 				 = {['name'] = 'cappuccino', 			  	['label'] = 'Cappuccino', 			['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'cappuccino.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Drink!'},
	['frappuccino'] 			 = {['name'] = 'frappuccino', 			  	['label'] = 'Frappuccino', 			['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'frappuccino.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Drink!'},
	['latte'] 					 = {['name'] = 'latte', 			  		['label'] = 'Latte', 				['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'latte.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Drink!'},
	['coldcoffee'] 				 = {['name'] = 'coldcoffee', 			  	['label'] = 'Cold Coffee', 			['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'coldcoffee.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Drink!'},

```

*1) qb-core/shared/job.lua* -- [ To add Job ]


```lua

	['foodtruck'] = {
		label = 'Food Truck',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'CEO of My Truck',
				payment = 50
			},
		},
	},

```



*4) Inside DP.Emotes in dpemotes/client/AnimationList.lua*

```lua

	["eattaco"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Eat", AnimationOptions =
   {
        Prop = "prop_taco_01",
        PropBone = 18905,
        PropPlacement = {0.12, 0.06, 0.001, -90.0, 0.0},
        EmoteMoving = true,
        EmoteLoop = true,
   }},

   ["eatburrito"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Eat", AnimationOptions =
   {
        Prop = "prop_food_bs_burger2",
        PropBone = 18905,
        PropPlacement = {0.12, 0.028, 0.05, 0.0, 175.0},
        EmoteMoving = true,
        EmoteLoop = true,
   }},

   ["drinkjuice"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Juice", AnimationOptions =
   {
       Prop = 'prop_food_juice02',
       PropBone = 28422,
       PropPlacement = {0.01, 0.0, -0.1, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["eatbowl"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Eat", AnimationOptions =
   {
       Prop = 'prop_cs_bowl_01',
       PropBone = 28422,
       PropPlacement = {0.05, 0.0, 0.01, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["eatnacho"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Eat", AnimationOptions =
   {
       Prop = 'prop_food_chips',
       PropBone = 18905,
       PropPlacement = {0.12, 0.0, 0.03, -90.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},

```

# Adding Items to Script 

-- Example - I want to add Pizza in Food Truck

*1) Add Items in qb-core/shared/items.lua*

	In this case

	```lua
	
		['cheesepizza'] 				 = {['name'] = 'cheesepizza', 			  	['label'] = 'Cheese Pizza', 			['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'cheesepizza.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Something to Eat!'},
	
	```

*2) Add Items in mxd-foodtruck/client/cl_open_target_menu.lua*

	```lua

		'mxd-foodtruck:client:openchopmenu' -- [ for chopping vegetables menu ]
		'mxd-foodtruck:client:openprepmenu' -- [ For Preparing Items (Food Truck) ]
		'mxd-foodtruck:client:opencookmenu' -- [ For Cooking Items (Food Truck) ]
		'mxd-foodtruck:client:opendrinksmenu' -- [ For Preparing Drinks (Food Truck) ]
		'mxd-foodtruck:client:opencoffeeprepmenu' -- [ For Preparing Coffee Items (Coffee Cart) ]
		'mxd-foodtruck:client:opencoffeecookmenu' -- [ For Cooking Coffee Items (Coffee Cart) ]
	```

	Add Items in the event where you want to add

	In this case I want to add in cook menu of Food Truck so I will add in 'mxd-foodtruck:client:opencookmenu'

	```lua

		-- Add New item at the place you want. Eg I will add at last

		-- Before Adding
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

		-- After Adding

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

				-- Added New Here

				{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['cheesepizza'].image .. " width=35px> Cheese Pizza", txt = "1x Pizza Base, 1x Cheese Sauce, 1x Spice Mix", params = { event = "mxd-foodtruck:client:cookitem", args = 'cheesepizza' } },

				-- [ Here in txt you can add items you need to cook pizza items should be in qb-core/shared/items.lua ]
				-- [ Her in args add the item name you added in qb-core/shared/items.lua ]
			})
		end)

	```



*3) In mxd-foodtruck/config.lua --[ For Adding Cooking Recipe ]*

	```lua

		Config.ChopVeg -- [ for chopping vegetables menu ]
		Config.PrepItem -- [ For Preparing Items (Food Truck) ]
		Config.FoodItem -- [ For Cooking Items (Food Truck) ]
		Config.DrinkItem -- [ For Preparing Drinks (Food Truck) ]
		Config.CoffeePrepItem -- [ For Preparing Coffee Items (Coffee Cart) ]
		Config.CoffeeCookItem -- [ For Cooking Coffee Items (Coffee Cart) ]

	```

	In this case I want to add in Config.FoodItem

	```lua 

		-- [ Before Adding ]
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

		-- [ After Adding ]
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

			-- [ Added Here ] 
			[11] = { item = "cheesepizza" , required ={ ["pizzabase"] = 1, ["cheesesauce"] = 1, ["spicemix"] = 1, } , amount = 1 },

			-- [ item = item name same as one you added in qb-core/shared/items.lua ]
			-- [ required = items required and amount requied to cook ]
			-- [ amount = amount player should receive after cooking ]

		}


	```

*4) In mxd-foodtruck/config.lua --[ For Adding How much to add when consumed ]*

	```lua

		Config.ConsumablesFood -- [ For Food Items ]
		Config.ConsumablesDrink -- [ For Drink Items ]

	```

	Here, In this case we need to add in `Config.ConsumablesFood`

	```lua

		-- [ Before Adding ]
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

		-- [ After Adding ]
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

			-- [ Added Below ]

			["cheesepizza"] = math.random(35, 54),

		}

	```

*5) In mxd-foodtruck/config.lua --[ For Adding in NPC Sell ]*

	```lua

		Config.FoodTruckSellingList -- [ For Food Truck Items ]
		Config.CoffeeCartSellingList -- [ For Coffee Cart Items ]

	```

	Here, in this case we need to add in `Config.FoodTruckSellingList`

	```lua

		-- [ Before Adding ]
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

		-- [ After Adding ]
		Config.FoodTruckSellingList = { -- [Items To Sell to NPC's for Food Truck ]
			[1] = {item = "beantaco", label = "Bean Taco", min = 175, max = 200}, -- [ item = Item's name (added in qb-core/shareditems.lua) ]
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

			--[ Added Here ]
			[15] = {item = "cheesepizza", label = "Cheese Pizza", min = 10, max = 15},

		}

	```
*5) In mxd-foodtruck/client/cl_open_target_menu.lua --[ For Adding in Customer Menu ]*

	```lua
		'mxd-foodtruck:client:opentruckcustomermenu' -- [ For Customer Menu (Food Truck) ]
		'mxd-foodtruck:client:opencoffeecustomermenu' -- [ For Customer Menu (Coffee Cart) ]
	```

	Here in case we want to add in Food Truck, so will add in ''mxd-foodtruck:client:opentruckcustomermenu'

	```lua

		-- [ Before Adding ]
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


		-- [ After Adding ]
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

				-- [ Added Here ]

				{ header = "<img src=nui://" .. Config.ImageLoc .. QBCore.Shared.Items['cheesepizza'].image .. " width=35px> Cheese Pizza", txt = "Quench your hunger", params = { } },	

			})
		end)

	```
Config = {}

Config.Hints = {
    [1] = {
        ['Coords'] = vector4(-1105.76, 2696.59, 18.61, 217.91),
        ['Hints'] = {
          [1] = 'My Buissness is really going down!',
          [2] = "I don't see anyone here. Why is that?",
          [3] = 'I am having a huge loss',
        },
        ['Anim'] = 'WORLD_HUMAN_LEANING',
    },
    [2] = {
        ['Coords'] = vector4(3613.34, 5034.35, 9.68, 54.54),
        ['Hints'] = {
          [1] = "I see the City's first light from this house",
          [2] = "I can't sleep with all these lights round round....",
          [3] = 'Someone please repair my house',
        },
        ['Anim'] = 'WORLD_HUMAN_BINOCULARS',
    },
    [3] = {
        ['Coords'] = vector4(886.66, -1589.82, 30.29, 187.52),
        ['Hints'] = {
          [1] = 'My Brain just Freezed..',
          [2] = "It's too cold here!",
          [3] = "Fruity Ice. What's that?",
        },
        ['Anim'] = 'WORLD_HUMAN_STAND_MOBILE',
    },
    [4] = {
        ['Coords'] = vector4(-2175.64, 4294.85, 49.06, 244.7),
        ['Hints'] = {
          [1] = 'Wanna Hook?',
          [2] = 'I love Dolphins',
          [3] = "Let's eat with the sea?",
        },
        ['Anim'] = 'WORLD_HUMAN_JANITOR',
    },
    [5] = {
        ['Coords'] = vector4(2107.04, 2923.27, 57.43, 330.52),
        ['Hints'] = {
          [1] = 'Connecting to the satellite',
          [2] = 'Transmitting Signals!',
          [3] = 'No Signals',
        },
        ['Anim'] = 'WORLD_HUMAN_SMOKING',
    },
    [6] = {
        ['Coords'] = vector4(2514.29, 3778.21, 52.8, 73.91),
        ['Hints'] = {
          [1] = 'Somone please save universe....',
          [2] = 'HAPPINESS PLEASURE',
          [3] = '6EQUJ5',
        },
        ['Anim'] = 'WORLD_HUMAN_DRINKING',
    },
    [7] = {
        ['Coords'] = vector4(-2016.94, -363.38, 48.11, 201.25),
        ['Hints'] = {
          [1] = "Where's my car?",
          [2] = 'Jetty I hear!',
          [3] = 'Park it hear.',
        },
        ['Anim'] = 'WORLD_HUMAN_SMOKING',
    },
    [8] = {
        ['Coords'] = vector4(-1685.76, 139.1, 63.76, 41.08),
        ['Hints'] = {
          [1] = 'Health is Wealth!',
          [2] = "Let's start training...",
          [3] = 'Why I have to run?',
        },
        ['Anim'] = 'WORLD_HUMAN_JOG',
    },
}

Config.MailEvent = 'qb-phone:server:sendNewMail' --server event
Config.InvShopEvent = 'inventory:server:OpenInventory' --server event

Config.SenderName = 'Professor' -- Email Sender name
Config.MailSubject = 'Is Someone Coming?' --Email Subject
Config.NeedItem = true
Config.ItemName = 'vpn' -- name of needed item

Config.Interval = 1 -- in hours (interval between mails)
Config.Ped = 'g_m_m_chicold_01' -- ped that will spawn
Config.FirstMailAfter = 10 -- in minutes (time after first mail come after server/script starts/restarts)
Config.PedDisappear = 10 -- in minutes (time in which spawned ped disapppear should not be more than Config.Interval eg Config.Interval = 1 (hrs) than this should be max 59 (min))
Config.UseGame = true -- use Memory Game

Config.Limit = true -- To have limit in Shop

-- police call only if Memory Game fail

Config.PoliceCallChance = 100 -- From 0 to 100 (0 - no call and 100 - call everytime)
Config.pdnoti = 'qb' -- qb/ps (everything else will use deafult qb)
Config.TellAboutPolice = true -- ped tell the person that police have been notified
Config.DisappearAfterPoliceAlert = true -- Ped Disappear after telling about police

Config.PoliceMessage = 'Some Illegal Selling is Going On' -- message that will be sent to Police (for qb)
Config.PedMessage = 'Police Have been Notifed Run' -- message that will ped notify if Config.TellAboutPolice is true 

-- You can add items as well as add tiers just make sure to follow every instruction and change cl_open and sv_open accordingly

Config.Tier1Min = 0 -- Min Player for Tier 1 Items
Config.Tier1Max = 10
Config.Tier2Min = 10 -- Min Player for Tier 2 Items
Config.Tier2Max = 20
Config.Tier3Min = 20 -- Min Player for Tier 3 Items
Config.Tier3Max = 30

Config.Tier1Items = {
    label = "Black Market", -- Don't change this (Necessary) All Tiers
    slots = 30,
    items = {
        [1] = {
            name = "weapon_knife",
            price = 500,
            amount = 5,
            amount2 = 5, -- keep same as amount (Necessary) All Items
            info = {},
            type = "item", -- Don't change this (Necessary) All Items
            slot = 1,
        },
        [2] = {
            name = "weapon_dagger",
            price = 500,
            amount = 5,
            amount2 = 5,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_bat",
            price = 500,
            amount = 5,
            amount2 = 5,
            info = {},
            type = "item",
            slot = 3,
        },
    },
}

Config.Tier2Items = {
    label = "Black Market",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_pistol",
            price = 1500,
            amount = 2,
            amount2 = 2,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "pistol_ammo",
            price = 100,
            amount = 10,
            amount2 = 10,
            info = {},
            type = "item",
            slot = 2,
        },
    },
}

Config.Tier3Items = {
    label = "Black Market",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_heavypistol",
            price = 2500,
            amount = 2,
            amount2 = 2,
            info = {},
            type = "item",
            slot = 1,
        },
    },
}
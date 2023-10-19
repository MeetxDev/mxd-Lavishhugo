Config = {}

Config.MinCops = 2

Config.RemTime = 45 -- in min (time for person to finish the hiest)
Config.RemTime1 = 45 -- should be same as Config.RemTime

Config.LaptopLocation = vector4(-1055.85, -232.3, 44.02, 303.98) --Location where hacking device wor ( only change if you know how to do it)

Config.RedKey = vector4(-1366.3, -925.44, 10.7, 130.54)

Config.BlueKey = vector4(1203.19, -1670.69, 42.98, 28.48)

Config.GreenKey =  vector4(331.25, 362.24, 106.65, 157.09)

Config.Crate = vector4(1246.12, -3039.86, 13.3, 13.64)
Config.crateProp = 'prop_mil_crate_02'

Config.Ped = 'a_m_m_salton_03'
Config.PedCoords = vector4(738.34, -948.74, 24.63, 267.68)
Config.Amount = 5000 -- person should have this in cash (can keep 0 too)

Config.pdalert = 'qb' -- none / qb / ps
Config.PoliceMessage = 'Gun Hiest is going on' -- (For qb only)

Config.Cooldown = true
Config.Cooldowntime = 60 -- in min
Config.Cooldowntime1 = 60 -- should be same as Config.Cooldowntime

Config.useqblogs = false

Config.DrillTime = 10000 -- time take to dril crate (1000 = 1 second, So 10 sec = 10000)

Config.Guns = { -- gives guns of given quantity
    [1] = {
        ['Guns'] = {
            [1] = {name = '1037', amount = 1},
            [2] = {name = 'WEAPON_CARBINERIFLE', amount = 1},
        },
    },
    [2] = {
        ['Guns'] = {
            [1] = {name = 'WEAPON_CARBINERIFLE', amount = 1},
            [2] = {name = 'WEAPON_PISTOL', amount = 2},
        },
    },
    [3] = {
        ['Guns'] = {
            [1] = {name = 'WEAPON_PISTOL', amount = 1},
            [2] = {name = 'WEAPON_HEAVYPISTOL', amount = 3},
        },
    },
}

Config.Goons = {
    [1] = {
        coords = {1239.2, -3038.65, 14.3, 39.66}, -- ped coords
        ped = 'g_m_y_pologoon_01', -- ped hash
        weapon = 'WEAPON_CARBINERIFLE', -- ped weapon
        health = 1000, -- ped health
        range = 2, -- ped range
        accuracy = 50, -- ped accuracy
        aggresiveness = 3, -- ped aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 2, -- ped alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- ped armor 
    },  
    [2] = {
        coords = {1238.98, -3025.31, 16.61, 7.85}, -- ped coords
        ped = 'g_m_y_pologoon_01', -- ped hash
        weapon = 'WEAPON_SMG', -- ped weapon
        health = 1000, -- ped health
        range = 2, -- ped range
        accuracy = 50, -- ped accuracy
        aggresiveness = 3, -- ped aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 2, -- ped alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- ped armor 
    },  
    [3] = {
        coords = {1235.42, -3015.0, 13.74, 35.38}, -- ped coords
        ped = 'g_m_y_pologoon_01', -- ped hash
        weapon = 'WEAPON_ASSAULTRIFLE', -- ped weapon
        health = 1000, -- ped health
        range = 2, -- ped range
        accuracy = 50, -- ped accuracy
        aggresiveness = 3, -- ped aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 2, -- ped alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- ped armor 
    }, 
    [4] = {
        coords = {1235.16, -3010.01, 9.32, 75.7}, -- ped coords
        ped = 'g_m_y_pologoon_01', -- ped hash
        weapon = 'WEAPON_CARBINERIFLE', -- ped weapon
        health = 1000, -- ped health
        range = 2, -- ped range
        accuracy = 50, -- ped accuracy
        aggresiveness = 3, -- ped aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 2, -- ped alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- ped armor 
    }, 
    [5] = {
        coords = {1249.2, -3033.96, 9.37, 112.78}, -- ped coords
        ped = 'g_m_y_pologoon_01', -- ped hash
        weapon = 'WEAPON_SMG', -- ped weapon
        health = 1000, -- ped health
        range = 2, -- ped range
        accuracy = 50, -- ped accuracy
        aggresiveness = 3, -- ped aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 2, -- ped alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- ped armor 
    }, 
    [6] = {
        coords = {1234.8, -3005.64, 12.19, 84.37}, -- ped coords
        ped = 'g_m_y_pologoon_01', -- ped hash
        weapon = 'WEAPON_ASSAULTRIFLE', -- ped weapon
        health = 1000, -- ped health
        range = 2, -- ped range
        accuracy = 50, -- ped accuracy
        aggresiveness = 3, -- ped aggresiveness - 0 stand / 1 defensive / 2 offensive / 3 ultra offensive 
        alertness = 2, -- ped alertness 3 is the highest one - values from 0 to 3.
        armor = 50 -- ped armor  
    },
}

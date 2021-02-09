---------------------------------------
--   ESX_SIMPLEGARAGES by Dividerz   --
-- FOR SUPPORT: Arne#7777 on Discord --
---------------------------------------

Config = {}

--Webhooks
Config.ImpoundWebhook = "https://discordapp.com/api/webhooks/727524683196530820/FPxYFcef1q8bbqll6BVKohuwbuGkXs5mAbFH7p9dE8EALDHQTpemF80t9u4OaIN9R1Gk"
Config.ColourInfo = 65280


Config.Garages = {
	principal = {
        garageName = "Garagem Principal - 204",
        getVehicle = vector3(214.1, -809.2, 31),
        spawnPoint = {
            coords = vector3(231.48, -797.75, 30.56),
            heading = 159.29
        },
        storeVehicle = vector3(216.4, -788.8, 29.7)
    },
    sapcounsel = {
        garageName = "Pillbox - 381",
        getVehicle = vector3(-329.87, -780.40, 33.96),
        spawnPoint = {
            coords = vector3(-334.44, -780.75, 33.96),
            heading = 137.50
        },
        storeVehicle = vector3(-341.72, -767.43, 32.96)
    },
    court = {
        garageName = "Tribunal - 584",
        getVehicle = vector3(275.42, -345.27, 45.17),
        spawnPoint = {
            coords = vector3(273.07, -333.91, 44.92),
            heading = 160.15
        },
        storeVehicle = vector3(283.61, -342.54, 43.92)
    },
    canals = {
        garageName = "Vespucci - 341",
        getVehicle = vector3(-1159.14, -740.12, 19.89),
        spawnPoint = {
            coords = vector3(-1149.21, -739.36, 20.0),
            heading = 130.92
        },
        storeVehicle = vector3(-1146.47, -745.94, 18.62)
    },
    paleto = {
        garageName = "Paleto - 3024",
        getVehicle = vector3(111.2, 6371.8, 31.40),
        spawnPoint = {
            coords = vector3(107.9, 6379.6, 30.8),
            heading = 300.000
        },
        storeVehicle = vector3(90.1, 6364.2, 29.5)
    },
    buffs = {
        garageName = "Pacific Buffs - 613",
        getVehicle = vector3(-1877.31, -309.57, 49.24),
        spawnPoint = {
            coords = vector3(-1888.87, -306.40, 49.24),
            heading = 53.46
        },
        storeVehicle = vector3(-1894.07, -315.65, 48.24)
    },
    sandyfiredept = {
        garageName = "Sandy Shores - 1025",
        getVehicle = vector3(1694.53, 3612.20, 35.31),
        spawnPoint = {
            coords = vector3(1703.03, 3601.48, 35.43),
            heading = 209.88
        },
        storeVehicle = vector3(1692.04, 3605.32, 34.40)
    },
    centralpd = {
        garageName = "Parque PSP - 218",
        getVehicle = vector3(472.15, -1078.71, 29.20),
        spawnPoint = {
            coords = vector3(465.10, -1084.54, 29.20),
            heading = 174.99
        },
        storeVehicle = vector3(471.90, -1089.23, 28.10)
    },
    stadium = {
        garageName = "Estádio - 70",
        getVehicle = vector3(-169.08, -2144.39, 17.05),
        spawnPoint = {
            coords = vector3(-165.56, -2151.21, 16.70),
            heading = 106.33
        },
        storeVehicle = vector3(-174.06, -2148.14, 15.70)
    }
}

Config.PublicImpounds = {
    ["hayesdepot"] = {
        garageName = "Parque Apreendidos",
        getVehicle = vector3(491.0, -1314.69, 29.25),
        spawnPoint = {
            coords = vector3(491.0, -1314.69, 29.25),
            heading = 304.50
        }
    }
}

Config.PoliceImpounds = {
    ["policedepot"] = {
        garageName = "Parque apreendidos PSP",
        getVehicle = vector3(463.6, -1017, 28.1),
        spawnPoint = {
            coords = vector3(445.4, -1024.4, 27.9),
            heading = 1.441
        },
    }
}

Config.GaragemPrivadas = {
	policia = {
		trabalho = 'police',
		offtrabalho = 'offpolice',
		garageName = "Garagem Privada PSP",
		getVehicle = vector3(433.82, -1015.68, 28.89),
        spawnPoint = {
            coords = vector3(433.82, -1015.68, 28.29),
            heading = 228.84
        },
		storeVehicle = vector3(447.3, -1013.47, 27.49)
	},
	Inem = {
	trabalho = 'ambulance',
	offtrabalho = 'offambulance',
	garageName = "Garagem Privada Inem",
	getVehicle = vector3(399.198, -1429.301, 29.021),
        spawnPoint = {
            coords = vector3(399.198, -1429.301, 29.021),
            heading = 228.84
        },
		storeVehicle = vector3(410.789, -1424.756, 28.505)
	},
	Mafia = {
	trabalho = 'mafia',
	offtrabalho = 'offmafia',
	garageName = "Garagem Privada mafia",
	getVehicle = vector3(-2668.801, 1304.756, 146.649),
        spawnPoint = {
            coords = vector3(-2668.5600, 1309.676, 146.649),
            heading = 270.107
        },
		storeVehicle = vector3(-2660.715, 1307.238, 146.650)
	
	},
	Yakuza = {
	trabalho = 'yakuza',
	offtrabalho = 'offyakuza',
	garageName = "Garagem Privada yakuza",
	getVehicle = vector3(-1525.073, 83.029, 57.021),
        spawnPoint = {
            coords = vector3(-1525.073, 83.029, 57.021),
            heading = 228.84
        },
		storeVehicle = vector3(-1532.877, 81.890, 56.286)
	
	},
	Vinha = {
	trabalho = 'vigne',
	offtrabalho = 'offvigne',
	garageName = "Garagem Privada Vinha",
	getVehicle = vector3(-1894.062, 2051.828, 140.9604),
        spawnPoint = {
            coords = vector3(-1889.802, 2045.934, 140.8594),
            heading = 248.88
        },
		storeVehicle = vector3(-1918.84, 2056.8, 140.7244)
	},
	--[[Vinha = {
	trabalho = 'vigne',
	offtrabalho = 'offvigne',
	garageName = "Garagem Privada Vinha",
	getVehicle = vector3(355.674, 435.995, 146.352),
        spawnPoint = {
            coords = vector3(357.863, 442.417, 145.341),
            heading = 246.75
        },
		storeVehicle = vector3(355.674, 435.995, 146.352)
	
	},]]
	Mecanico = {
	trabalho = 'mechanic',
	offtrabalho = 'offmechanic',
	garageName = "Garagem Privada Mecânico",
	getVehicle = vector3(-164.3076, -1293.534, 31.20),
        spawnPoint = {
            coords = vector3(-151.2, -1297.964, 31.08276),
            heading = 90.217
        },
		storeVehicle = vector3(-157.5032, -1293.706, 30.15)
	}
}


Config.Trim = function(value)
    if value then
        return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
    else
        return nil
    end
end

Config = {}

-- crafting settings
Config.MinAmount = 1 -- minimum amount of copies
Config.Image = "qb-inventory/html/images/" -- image folder for your inventory
Config.CopyTime = 10000 -- time to copy blueprints in milliseconds
Config.CraftPartsTime = 10000 -- time to craft weapon in milliseconds
Config.CraftWeaponTime = 10000 -- time to craft weapon in milliseconds
Config.RemoveBunkerPass = 1 -- 0 = no / 1 = yes

-- cost to copy a blueprint original to blueprint copy
Config.PistolCost = 100
Config.PistolMk2Cost = 200
Config.HeavyPistolCost = 300
Config.MicroSMGCost = 500
Config.SawnoffShotgunCost = 500

-- weapon parts amounts (x1 weapon_part)
Config.PartsSteel = 10
Config.PartsAluminum = 5
Config.PartsPlastic = 5
Config.PartsRubber = 3

-- parts needed per weapon
Config.PistolPartsNeeded = 1
Config.PistolMk2PartsNeeded = 2
Config.HeavyPistolPartsNeeded = 3
Config.MicroSMGPartsNeeded = 5
Config.SawnoffShotgunPartsNeeded = 5

-- NPC Settings --
Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.CraftingPedList = {

	{
        model = `mp_m_shopkeep_01`, -- bpo shop
        coords = vector4(3530.6735, 3704.6252, 36.642601, 355.53567),
        gender = 'male',
        scenario = 'WORLD_HUMAN_CLIPBOARD'
    },
	{
        model = `mp_m_exarmy_01`, -- weapon bunker inside
        coords = vector4(895.54315, -3245.789, -98.25131, 85.007087),
        gender = 'male',
        scenario = 'WORLD_HUMAN_CLIPBOARD'
    },
	{
        model = `mp_m_exarmy_01`, -- desert weapon bunker inside
        coords = vector4(847.61083, 2982.7597, 42.959457, 176.34596),
        gender = 'male',
        scenario = 'WORLD_HUMAN_CLIPBOARD'
    },
	
}

-- Research Shop
Config.ResearchShop = {

	[1] = {
		name = 'bpo_pistol',
		price = 500000,
		amount = 5,
		info = {},
		type = 'item',
		slot = 1,
	},
	[2] = {
		name = 'bpo_pistol_mk2',
		price = 750000,
		amount = 5,
		info = {},
		type = 'item',
		slot = 2,
	},
	[3] = {
		name = 'bpo_heavypistol',
		price = 800000,
		amount = 5,
		info = {},
		type = 'item',
		slot = 3,
	},
	[4] = {
		name = 'bpo_microsmg',
		price = 1000000,
		amount = 5,
		info = {},
		type = 'item',
		slot = 4,
	},
	[5] = {
		name = 'bpo_sawnoffshotgun',
		price = 1000000,
		amount = 5,
		info = {},
		type = 'item',
		slot = 5,
	},
}
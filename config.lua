Config = {}

-- cost to copy a blueprint original to blueprint copy
Config.Pistol = 100
Config.PistolMk2 = 200
Config.MicroSMG = 500

-- Weapon Parts Amounts (x1 weapon_part)
Config.PartsSteel = 10
Config.PartsAluminum = 5
Config.PartsPlastic = 5
Config.PartsRubber = 3

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
		name = 'bpo_microsmg',
		price = 1000000,
		amount = 5,
		info = {},
		type = 'item',
		slot = 3,
	},
}
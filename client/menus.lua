local QBCore = exports["qb-core"]:GetCoreObject()

-- shop target
Citizen.CreateThread(function()

	exports['qb-target']:AddBoxZone("Research-Shop", vector3(3530.71, 3704.49, 36.64), 1, 1, {
		name = "Research Shop",
		heading = 350,
		debugpoly = false,
		minZ=35.64,
		maxZ=37.64,
	}, {
		options = {
			{  
				type = "client",
				event = "rsg_weaponcrafting:client:shop",
				icon = "fas fa-dolly",
				label = "Open Shop",
			},
		},
		distance = 2.5
	})
	
end)

-- parts crafting target
Citizen.CreateThread(function()

local partsstation = {
    `gr_prop_gr_cnc_01b`,
    }
    exports['qb-target']:AddTargetModel(partsstation, {
        options = {
            {
                type = "client",
				event = "rsg_weaponcrafting:client:parts",
                icon = "fas fa-hammer",
                label = "Weapon Parts Crafting",
            },
        },
        distance = 3.0
    })
end)

-- parts crafting
RegisterNetEvent('rsg_weaponcrafting:client:parts', function()
    exports['qb-menu']:openMenu({
        {
            header = "Weapon Parts Crafting",
            isMenuHeader = true,
        },
        {
            header = "Weapon Parts",
            txt = Config.PartsSteel.." x steel, "..Config.PartsAluminum.." x aluminum, "..Config.PartsPlastic.." x plastic amd "..Config.PartsRubber.." x rubber",
            params = {
                event = 'rsg_weaponcrafting:client:craftparts',
				isServer = false,
            }
        },
        {
            header = "Close Menu",
            txt = '',
            params = {
                event = 'qbr-menu:closeMenu',
            }
        },
    })
end)

-- crafting target
Citizen.CreateThread(function()

local craftingstation = {
    `gr_prop_gr_bench_01a`,
	`gr_prop_gr_bench_01b`,
	`gr_prop_gr_bench_02a`,
	`gr_prop_gr_bench_02b`,
	`gr_prop_gr_bench_03a`,
	`gr_prop_gr_bench_03b`,
	`gr_prop_gr_bench_04a`,
	`gr_prop_gr_bench_04b`,
    }
    exports['qb-target']:AddTargetModel(craftingstation, {
        options = {
            {
                type = "client",
				event = "rsg_weaponcrafting:client:pistols",
                icon = "fas fa-hammer",
                label = "Handgun Crafting",
            },
            {
                type = "client",
				event = "rsg_weaponcrafting:client:smg",
                icon = "fas fa-hammer",
                label = "SMG Crafting",
            },
            {
                type = "client",
				event = "rsg_weaponcrafting:client:shotgun",
                icon = "fas fa-hammer",
                label = "Shotgun Crafting",
            },
        },
        distance = 3.0
    })
end)

-- pistol crafting
RegisterNetEvent('rsg_weaponcrafting:client:pistols', function()
    exports['qb-menu']:openMenu({
        {
            header = "Pistol Crafting",
            isMenuHeader = true,
        },
        {
            header = "Pistol",
            txt = "Blueprint Copy and 1 x Weapon Parts",
            params = {
                event = 'rsg_weaponcrafting:client:craftpistol',
				isServer = false,
            }
        },
        {
            header = "Pistol Mk2",
            txt = "Blueprint Copy and 2 x Weapon Parts",
            params = {
                event = 'rsg_weaponcrafting:client:craftpistolmk2',
				isServer = false,
            }
        },
        {
            header = "Heavy Pistol",
            txt = "Blueprint Copy and 3 x Weapon Parts",
            params = {
                event = 'rsg_weaponcrafting:client:craftheavypistol',
				isServer = false,
            }
        },
        {
            header = "Close Menu",
            txt = '',
            params = {
                event = 'qbr-menu:closeMenu',
            }
        },
    })
end)

-- smg crafting
RegisterNetEvent('rsg_weaponcrafting:client:smg', function()
    exports['qb-menu']:openMenu({
        {
            header = "Submachine Gun Crafting",
            isMenuHeader = true,
        },
        {
            header = "Micro SMG",
            txt = "Blueprint Copy and 5 x Weapon Parts",
            params = {
                event = 'rsg_weaponcrafting:client:craftmicrosmg',
				isServer = false,
            }
        },
        {
            header = "Close Menu",
            txt = '',
            params = {
                event = 'qbr-menu:closeMenu',
            }
        },
    })
end)

-- shotgun crafting
RegisterNetEvent('rsg_weaponcrafting:client:shotgun', function()
    exports['qb-menu']:openMenu({
        {
            header = "Shotgun Crafting",
            isMenuHeader = true,
        },
        {
            header = "Sawnoff Shotgun",
            txt = "Blueprint Copy and 5 x Weapon Parts",
            params = {
                event = 'rsg_weaponcrafting:client:craftsawnoffshotgun',
				isServer = false,
            }
        },
        {
            header = "Close Menu",
            txt = '',
            params = {
                event = 'qbr-menu:closeMenu',
            }
        },
    })
end)

-- bunker outside (enter)
Citizen.CreateThread(function()

	exports['qb-target']:AddBoxZone("bunker-access", vector3(847.58, 2982.81, 43.15), 1, 1, {
		name = "bunker-access",
		heading = 355,
		debugpoly = false,
		minZ=41.95,
		maxZ=43.95
	}, {
		options = {
			{  
				type = "client",
				event = "rsg_weaponcrafting:client:bunkerenterance",
				icon = "fas fa-money-check",
				label = "Enter Bunker",
			},
		},
		distance = 2.5
	})
	
end)

-- bunker access

-- enter bunker
RegisterNetEvent('rsg_weaponcrafting:client:bunkerenterance')
AddEventHandler('rsg_weaponcrafting:client:bunkerenterance', function()
	local hasItem = QBCore.Functions.HasItem('bunkerpass', 1)
	local player = GetPlayerPed(-1)
	if hasItem then
		QBCore.Functions.Progressbar("enter-bunker", "Showing Access Pass..", 5000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done			
			DoScreenFadeOut(500)
			Wait(500)
			SetEntityCoords(player, 894.3067, -3245.629, -98.25923)
			SetEntityHeading(player, 75.83612)
			DoScreenFadeIn(500)
			if Config.RemoveBunkerPass == 1 then
				TriggerServerEvent("rsg_weaponcrafting:server:removebunkerpass", 'bunkerpass', 1)
			end
		end, function()
			QBCore.Functions.Notify("Cancelled..", "error")
		end)
	else
		QBCore.Functions.Notify("You do not have an access pass!", "error")
	end
end)

-- bunker inside (exit)
Citizen.CreateThread(function()

	exports['qb-target']:AddBoxZone("bunker-access-inside", vector3(895.57, -3245.77, -98.26), 1, 1, {
		name = "bunker-access-inside",
		heading = 0,
		debugpoly = false,
		minZ=-99.26,
		maxZ=-97.26
	}, {
		options = {
			{  
				type = "client",
				event = "rsg_weaponcrafting:client:bunkerexit",
				icon = "fas fa-money-check",
				label = "Exit Bunker",
			},
		},
		distance = 2.5
	})
	
end)

-- exit bunker
RegisterNetEvent('rsg_weaponcrafting:client:bunkerexit')
AddEventHandler('rsg_weaponcrafting:client:bunkerexit', function()
	local player = GetPlayerPed(-1)
	QBCore.Functions.Progressbar("exit-bunker", "Exiting Bunker..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		}, {
			animDict = "mp_common",
			anim = "givetake1_a",
			flags = 8,
		}, {}, {}, function() -- Done			
		DoScreenFadeOut(500)
		Wait(500)
		SetEntityCoords(player, 847.79479, 2980.8896, 43.132755)
		SetEntityHeading(player, 183.95863)
		DoScreenFadeIn(500)
	end, function()
		QBCore.Functions.Notify("Cancelled..", "error")
	end)
end)
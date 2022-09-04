local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('rsg_weaponcrafting:client:blueprintcopy')
AddEventHandler('rsg_weaponcrafting:client:blueprintcopy', function(original, copy)
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local hasItem = QBCore.Functions.HasItem(original, 1)
	if hasItem then
		QBCore.Functions.Progressbar("make-copy", "Making a copy..", 5000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				TriggerServerEvent('rsg_weaponcrafting:server:givecopy', copy)		
			end, function()
			QBCore.Functions.Notify("Cancelled..", "error")
		end)
	else
		QBCore.Functions.Notify("You do not have that blueprint original!", "error")
	end
end)

-- craft weapon parts
RegisterNetEvent('rsg_weaponcrafting:client:craftparts')
AddEventHandler('rsg_weaponcrafting:client:craftparts', function()
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local hasItem1 = QBCore.Functions.HasItem('steel', Config.PartsSteel)
	local hasItem2 = QBCore.Functions.HasItem('aluminum', Config.PartsAluminum)
	local hasItem3 = QBCore.Functions.HasItem('plastic', Config.PartsPlastic)
	local hasItem4 = QBCore.Functions.HasItem('rubber', Config.PartsRubber)
	if hasItem1 and hasItem2 and hasItem3 and hasItem4 then
		QBCore.Functions.Progressbar("craft-parts", "Crafting weapon parts..", 5000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				TriggerServerEvent('rsg_weaponcrafting:server:craftparts')		
			end, function()
			QBCore.Functions.Notify("Cancelled..", "error")
		end)
	else
		QBCore.Functions.Notify("You do not have the required items!", "error")
	end
end)

-- pistol
RegisterNetEvent('rsg_weaponcrafting:client:craftpistol')
AddEventHandler('rsg_weaponcrafting:client:craftpistol', function()
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local hasItem1 = QBCore.Functions.HasItem('bpc_pistol', 1)
	local hasItem2 = QBCore.Functions.HasItem('weapon_parts', 1)
	if hasItem1 and hasItem2 then
		QBCore.Functions.Progressbar("craft-pistol", "Crafting a Pistol..", 5000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				TriggerServerEvent('rsg_weaponcrafting:server:craftpistol')		
			end, function()
			QBCore.Functions.Notify("Cancelled..", "error")
		end)
	else
		QBCore.Functions.Notify("You do not have the required items!", "error")
	end
end)

-- pistol mk2
RegisterNetEvent('rsg_weaponcrafting:client:craftpistolmk2')
AddEventHandler('rsg_weaponcrafting:client:craftpistolmk2', function()
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local hasItem1 = QBCore.Functions.HasItem('bpc_pistol_mk2', 1)
	local hasItem2 = QBCore.Functions.HasItem('weapon_parts', 2)
	if hasItem1 and hasItem2 then
		QBCore.Functions.Progressbar("craft-pistolmk2", "Crafting a Pistol Mk2..", 5000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				TriggerServerEvent('rsg_weaponcrafting:server:craftpistolmk2')		
			end, function()
			QBCore.Functions.Notify("Cancelled..", "error")
		end)
	else
		QBCore.Functions.Notify("You do not have the required items!", "error")
	end
end)

-- microsmg
RegisterNetEvent('rsg_weaponcrafting:client:craftmicrosmg')
AddEventHandler('rsg_weaponcrafting:client:craftmicrosmg', function()
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local hasItem1 = QBCore.Functions.HasItem('bpc_microsmg', 1)
	local hasItem2 = QBCore.Functions.HasItem('weapon_parts', 5)
	if hasItem1 and hasItem2 then
		QBCore.Functions.Progressbar("craft-microsmg", "Crafting a Micro SMG..", 5000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				TriggerServerEvent('rsg_weaponcrafting:server:craftmicrosmg')		
			end, function()
			QBCore.Functions.Notify("Cancelled..", "error")
		end)
	else
		QBCore.Functions.Notify("You do not have the required items!", "error")
	end
end)

-- research shop
RegisterNetEvent('rsg_weaponcrafting:client:shop')
AddEventHandler('rsg_weaponcrafting:client:shop', function()
	local ShopItems = {}
	ShopItems.label = "Research Shop"
	ShopItems.items = Config.ResearchShop
	ShopItems.slots = #Config.ResearchShop
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "ResearchShop_"..math.random(1, 99), ShopItems)
end)

-- map blip
Citizen.CreateThread(function()
    reseachshop = AddBlipForCoord(3530.6735, 3704.6252, 36.642601)
    SetBlipSprite (reseachshop, 374)
    SetBlipDisplay(reseachshop, 4)
    SetBlipScale  (reseachshop, 0.55)
    SetBlipAsShortRange(reseachshop, true)
    SetBlipColour(reseachshop, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Research Shop")
    EndTextCommandSetBlipName(reseachshop)
end)
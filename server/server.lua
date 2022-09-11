local QBCore = exports['qb-core']:GetCoreObject()

-- use bpo_pistol
QBCore.Functions.CreateUseableItem("bpo_pistol", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('rsg_weaponcrafting:client:copies', src, 'bpo_pistol', 'bpc_pistol')
end)

-- use bpo_pistol_mk2
QBCore.Functions.CreateUseableItem("bpo_pistol_mk2", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('rsg_weaponcrafting:client:copies', src, 'bpo_pistol_mk2', 'bpc_pistol_mk2')
end)

-- use bpo_heavypistol
QBCore.Functions.CreateUseableItem("bpo_heavypistol", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('rsg_weaponcrafting:client:copies', src, 'bpo_heavypistol', 'bpc_heavypistol')
end)

-- use bpo_microsmg
QBCore.Functions.CreateUseableItem("bpo_microsmg", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('rsg_weaponcrafting:client:copies', src, 'bpo_microsmg', 'bpc_microsmg')
end)

-- use bpo_sawnoffshotgun
QBCore.Functions.CreateUseableItem("bpo_sawnoffshotgun", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('rsg_weaponcrafting:client:copies', src, 'bpo_sawnoffshotgun', 'bpc_sawnoffshotgun')
end)

-- attempt to make copies
RegisterServerEvent('rsg_weaponcrafting:server:attemptcopy')
AddEventHandler('rsg_weaponcrafting:server:attemptcopy', function(item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local cashBalance = Player.PlayerData.money["cash"]
	if item == 'bpc_pistol' then
		local totalcost = amount * Config.PistolCost
		if cashBalance > totalcost then
			Player.Functions.RemoveMoney('cash', totalcost)
			Player.Functions.AddItem('bpc_pistol', amount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_pistol'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'blueprint copies cost $'..totalcost, 'error')
		else
			TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash to do that!', 'error')
		end
	elseif item == 'bpc_pistol_mk2' then
		local totalcost = amount * Config.PistolMk2Cost
		if cashBalance > totalcost then
			Player.Functions.RemoveMoney('cash', totalcost)
			Player.Functions.AddItem('bpc_pistol_mk2', amount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_pistol_mk2'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'blueprint copies cost $'..totalcost, 'error')
		else
			TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash to do that!', 'error')
		end
	elseif item == 'bpc_heavypistol' then
		local totalcost = amount * Config.HeavyPistolCost
		if cashBalance > totalcost then
			Player.Functions.RemoveMoney('cash', totalcost)
			Player.Functions.AddItem('bpc_heavypistol', amount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_heavypistol'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'blueprint copies cost $'..totalcost, 'error')
		else
			TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash to do that!', 'error')
		end
	elseif item == 'bpc_microsmg' then
		local totalcost = amount * Config.MicroSMGCost
		if cashBalance > totalcost then
			Player.Functions.RemoveMoney('cash', totalcost)
			Player.Functions.AddItem('bpc_microsmg', amount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_microsmg'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'blueprint copies cost $'..totalcost, 'error')
		else
			TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash to do that!', 'error')
		end
	elseif item == 'bpc_sawnoffshotgun' then
		local totalcost = amount * Config.SawnoffShotgunCost
		if cashBalance > totalcost then
			Player.Functions.RemoveMoney('cash', totalcost)
			Player.Functions.AddItem('bpc_sawnoffshotgun', amount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_sawnoffshotgun'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'blueprint copies cost $'..totalcost, 'error')
		else
			TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash to do that!', 'error')
		end
	end
end)

-- craft weapon parts (adjust in config.lua)
RegisterServerEvent('rsg_weaponcrafting:server:craftparts')
AddEventHandler('rsg_weaponcrafting:server:craftparts', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	-- remove items
	Player.Functions.RemoveItem('steel', Config.PartsSteel)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['steel'], "remove")
	Player.Functions.RemoveItem('aluminum', Config.PartsAluminum)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['aluminum'], "remove")
	Player.Functions.RemoveItem('plastic', Config.PartsPlastic)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['plastic'], "remove")
	Player.Functions.RemoveItem('rubber', Config.PartsRubber)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rubber'], "remove")
	-- add items
	Player.Functions.AddItem('weapon_parts', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_parts'], "add")
end)

-- craft pistol
RegisterServerEvent('rsg_weaponcrafting:server:craftpistol')
AddEventHandler('rsg_weaponcrafting:server:craftpistol', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	-- remove items
	Player.Functions.RemoveItem('bpc_pistol', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_pistol'], "remove")
	Player.Functions.RemoveItem('weapon_parts', Config.PistolPartsNeeded)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_parts'], "remove")
	-- add items
	Player.Functions.AddItem('weapon_pistol', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_pistol'], "add")
end)

-- craft pistol mk2
RegisterServerEvent('rsg_weaponcrafting:server:craftpistolmk2')
AddEventHandler('rsg_weaponcrafting:server:craftpistolmk2', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	-- remove items
	Player.Functions.RemoveItem('bpc_pistol_mk2', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_pistol_mk2'], "remove")
	Player.Functions.RemoveItem('weapon_parts', Config.PistolMk2PartsNeeded)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_parts'], "remove")
	-- add items
	Player.Functions.AddItem('weapon_pistol_mk2', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_pistol_mk2'], "add")
end)

-- craft heavypistol
RegisterServerEvent('rsg_weaponcrafting:server:craftheavypistol')
AddEventHandler('rsg_weaponcrafting:server:craftheavypistol', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	-- remove items
	Player.Functions.RemoveItem('bpc_heavypistol', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_heavypistol'], "remove")
	Player.Functions.RemoveItem('weapon_parts', Config.HeavyPistolPartsNeeded)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_parts'], "remove")
	-- add items
	Player.Functions.AddItem('weapon_heavypistol', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_heavypistol'], "add")
end)

-- craft microsmg
RegisterServerEvent('rsg_weaponcrafting:server:craftmicrosmg')
AddEventHandler('rsg_weaponcrafting:server:craftmicrosmg', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	-- remove items
	Player.Functions.RemoveItem('bpc_microsmg', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_microsmg'], "remove")
	Player.Functions.RemoveItem('weapon_parts', Config.MicroSMGPartsNeeded)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_parts'], "remove")
	-- add items
	Player.Functions.AddItem('weapon_microsmg', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_microsmg'], "add")
end)

-- craft sawnoffshotgun
RegisterServerEvent('rsg_weaponcrafting:server:craftsawnoffshotgun')
AddEventHandler('rsg_weaponcrafting:server:craftsawnoffshotgun', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	-- remove items
	Player.Functions.RemoveItem('bpc_sawnoffshotgun', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpc_sawnoffshotgun'], "remove")
	Player.Functions.RemoveItem('weapon_parts', Config.SawnoffShotgunPartsNeeded)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_parts'], "remove")
	-- add items
	Player.Functions.AddItem('weapon_sawnoffshotgun', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_sawnoffshotgun'], "add")
end)

-- remove bunkerpass
RegisterServerEvent("rsg_weaponcrafting:server:removebunkerpass")
AddEventHandler("rsg_weaponcrafting:server:removebunkerpass", function(item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(item, amount)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)
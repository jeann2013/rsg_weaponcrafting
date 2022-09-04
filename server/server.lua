local QBCore = exports['qb-core']:GetCoreObject()

-- use pistol bpo
QBCore.Functions.CreateUseableItem("bpo_pistol", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local cashBalance = Player.PlayerData.money["cash"]
    if cashBalance > Config.Pistol then
		Player.Functions.RemoveMoney('cash', Config.Pistol)
		TriggerClientEvent('rsg_weaponcrafting:client:blueprintcopy', src, 'bpo_pistol', 'bpc_pistol')
	else
		TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash to do that!', 'error')
	end
end)

-- use pistol mk2 bpo
QBCore.Functions.CreateUseableItem("bpo_pistol_mk2", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local cashBalance = Player.PlayerData.money["cash"]
    if cashBalance > Config.PistolMk2 then
		Player.Functions.RemoveMoney('cash', Config.PistolMk2)
		TriggerClientEvent('rsg_weaponcrafting:client:blueprintcopy', src, 'bpo_pistol_mk2', 'bpc_pistol_mk2')
	else
		TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash to do that!', 'error')
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
	Player.Functions.RemoveItem('weapon_parts', 1)
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
	Player.Functions.RemoveItem('weapon_parts', 2)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_parts'], "remove")
	-- add items
	Player.Functions.AddItem('weapon_pistol_mk2', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weapon_pistol_mk2'], "add")
end)

-- give blueprint copy
RegisterServerEvent('rsg_weaponcrafting:server:givecopy')
AddEventHandler('rsg_weaponcrafting:server:givecopy', function(copy)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(copy, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[copy], "add")
end)


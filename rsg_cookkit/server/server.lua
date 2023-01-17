local RSGCore = exports['rsg-core']:GetCoreObject()
local xSound = exports.xsound
local isPlaying = false

RSGCore.Functions.CreateUseableItem("cookkit", function(source, item)
	local src = source
	local Player = RSGCore.Functions.GetPlayer(src)
	TriggerClientEvent('rsg_cookkit:client:placeDJEquipment', src)
	Player.Functions.RemoveItem('cookkit', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['cookkit'], "remove")
end)


RegisterNetEvent('rsg_cookkit:server:pickedup', function(entity)
    local src = source
    xSound:Destroy(-1, tostring(entity))
end)


RegisterNetEvent('rsg_cookkit:Server:RemoveItem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
end)

RegisterServerEvent('rsg_cookkit:server:pickeupdecks')
AddEventHandler('rsg_cookkit:server:pickeupdecks', function()
	local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
	Player.Functions.AddItem('cookkit', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['cookkit'], "add")
end)
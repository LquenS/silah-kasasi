local disc = 0 -- Disc varsa 1 yapın

-- Verdiği Silahlar
local silahlar = {
    [1] = {name = "WEAPON_PISTOL"},
    [2] = {name = "WEAPON_HEAVYREVOLVER"},
    [3] = {name = "WEAPON_SMG"},
    [4] = {name = "WEAPON_MICROSMG"},
    [5] = {name = "WEAPON_MINISMG"},
    [6] = {name = "WEAPON_ASSAULTRIFLE"},
}
--

--Eşya İsmi
ESX.RegisterUsableItem('silah-kasasi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local rastgelesilah = math.random(1,6)
	if xPlayer.hasWeapon(silahlar[rastgelesilah].name) then
		TriggerEvent('kasa:addWeapon', xPlayer)
	else
		if disc == 0 then
			local silah = silahlar[rastgelesilah].name
			xPlayer.removeInventoryItem("silah-kasasi",1)
			xPlayer.addWeapon(silah, 1)
		else
			local mermi = math.random(1,250)
			local silah = silahlar[rastgelesilah].name
			xPlayer.removeInventoryItem("silah-kasasi",1)
			xPlayer.addWeapon(silah, mermi)
		end
	end
end)
--

-- Silah zaten varsa olmayan silahı ekleme loop
RegisterNetEvent('kasa:addWeapon')
AddEventHandler('kasa:addWeapon', function(xPlayer)
	local rastgelesilah = math.random(1,6)
	if xPlayer.hasWeapon(silahlar[rastgelesilah].name) then
		TriggerEvent('kasa:addWeapon', xPlayer)
	else
		if disc == 0 then
			local silah = silahlar[rastgelesilah].name
			xPlayer.addWeapon(silah, 1)
			xPlayer.removeInventoryItem("silah-kasasi",1)
		else
			local mermi = math.random(1,250)
			local silah = silahlar[rastgelesilah].name
			xPlayer.addWeapon(silah, mermi)
			xPlayer.removeInventoryItem("silah-kasasi",1)
		end
	end
end)
--

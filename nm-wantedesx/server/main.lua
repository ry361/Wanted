ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local date = "14/01/2024"
local reason = "For Bank Robbery"
local description = "Lorem ipsum dolor sit, amet consectetur adipisicing elit."
local reward = "4000"
local image = "https://cdn.discordapp.com/attachments/991048319121911868/1196097275626266694/jtom-connerspng.png?ex=65b66364&is=65a3ee64&hm=f059f82409fb7179e35b06e77a758affcdedd3f5d00e9a47ee1125babdf17099&"

RegisterServerEvent('nm-wanted:openUI:server', function()
    TriggerClientEvent('nm-wanted:openUI:client', source, date, reason, description, reward, image)
end)

RegisterServerEvent('nm-wanted:dataYenile')
AddEventHandler('nm-wanted:dataYenile', function(dateData, reasonData, descData, rewardData, imageData)
    date = dateData
    reason = reasonData
    description = descData
    reward = rewardData
    image = imageData
end)

RegisterServerEvent('nm-wanted:buy:server')
AddEventHandler('nm-wanted:buy:server', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if NMConfig['General']['buyType'] == 'bank' then
        xPlayer.removeAccountMoney(NMConfig['General']['buyType'], NMConfig['General']['buyAmount'])
        xPlayer.addInventoryItem('wanted_paper', 1)
    else
        xPlayer.removeMoney(NMConfig['General']['buyAmount'])
        xPlayer.addInventoryItem('wanted_paper', 1)
    end
end)

ESX.RegisterUsableItem('wanted_paper', function(source, item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    TriggerClientEvent('nm-wanted:openUI', src)
end)
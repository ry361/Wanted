ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    -- Target
    if NMConfig['Target']['targetOptions'] then
        if NMConfig['Target']['targetType'] == 'qbcore' then
            exports['qb-target']:AddCircleZone("batuflex", NMConfig['Target']['targetCoords']['coords'], 0.47, {
                name = "batuflex",
                useZ=true,
                debugPoly = false,
                }, {
                options = {
                    {
                        event = "nm-wanted:openEditor",
                        icon = NMConfig['Target']['targetIcon']['editor'],
                        label = NMConfig['Target']['targetLabels']['editor'],
                        job = NMConfig['Target']['jobName'],
                    },
                    {
                        event = "nm-wanted:openUI",
                        icon = NMConfig['Target']['targetIcon']['preview'],
                        label = NMConfig['Target']['targetLabels']['preview'],
                        job = NMConfig['Target']['jobName'],
                    },
                },
                distance = 3
            })
            exports['qb-target']:AddTargetModel(1211559620, {
                options = {
                    {
                        event = "nm-wanted:openUI",
                        icon = NMConfig['Target']['targetIcon']['preview'],
                        label = NMConfig['Target']['targetLabels']['preview'],
                    },
                    {
                        event = "nm-wanted:buy",
                        icon = NMConfig['Target']['targetIcon']['preview'],
                        label = NMConfig['Target']['targetLabels']['buy'],
                    },
                },
                distance = 2.5
            })
        elseif NMConfig['Target']['targetType'] == 'ox' then
            exports.ox_target:addSphereZone({
                coords = NMConfig['Target']['targetCoords']['coords'],
                radius = 2.5,
                debug = false,
                drawSprite = false,
                options = {
                    {
                        name = 'lvbel2',
                        event = "nm-wanted:openEditor",
                        icon = NMConfig['Target']['targetIcon']['editor'],
                        label = NMConfig['Target']['targetLabels']['editor'],
                        groups = NMConfig['Target']['jobName'],
                    },
                    {
                        name = 'lvbel3',
                        icon = NMConfig['Target']['targetIcon']['preview'],
                        label = NMConfig['Target']['targetLabels']['preview'],
                        groups = NMConfig['Target']['jobName'],
                    },
                }
            })

            exports.ox_target:addModel(1211559620, {
                {
                    name = 'preview',
                    event = 'nm-wanted:openUI',
                    icon = NMConfig['Target']['targetIcon']['preview'],
                    label = NMConfig['Target']['targetLabels']['preview'],
                },
                {
                    name = 'preview',
                    event = 'nm-wanted:buy',
                    icon = NMConfig['Target']['targetIcon']['preview'],
                    label = NMConfig['Target']['targetLabels']['buy'],
                },
            })
        end
    end
end)

RegisterNetEvent('nm-wanted:buy', function()
    TriggerServerEvent('nm-wanted:buy:server')
end)

RegisterNetEvent('nm-wanted:openUI', function()
    TriggerServerEvent('nm-wanted:openUI:server')
end)

RegisterNetEvent('nm-wanted:openUI:client')
AddEventHandler('nm-wanted:openUI:client', function(date, reason, description, reward, image)
    SendNUIMessage({
        action = "openNormal",
        date = date,
        reason = reason,
        description = description,
        reward = reward,
        image = image,
    })
    SetNuiFocus(true,true)
end)

RegisterNetEvent('nm-wanted:openEditor')
AddEventHandler('nm-wanted:openEditor', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openNormalEditor',
    })
    SetNuiFocus(true, true)
end)


RegisterNUICallback('updateData', function(data)
    TriggerServerEvent('nm-wanted:dataYenile', data.dateData, data.reasonData, data.descData, data.rewardData, data.imageData)
end)

RegisterNUICallback('exit', function()
	SetNuiFocus(false, false)
end)
local packageCache = { [''] = {status = nil,
                        strain = nil}
                    }

--- Events

RegisterNetEvent('ps-weedplanting:server:CollectPackageGoods', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    if not packageCache[citizenid] then return end

    if packageCache[citizenid].status == 'waiting' then
        TriggerClientEvent('QBCore:Notify', src, _U('still_waiting'), 'error', 2500)
    elseif packageCache[citizenid].status == 'done' then
        TriggerClientEvent('ps-weedplanting:client:PackageGoodsReceived', src)
        if Player.Functions.AddItem(Shared.Strains[packageCache[citizenid].strain].weedrunitem, 1) then
            TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.Strains[packageCache[citizenid].strain].weedrunitem], 'add', 1)
        end
        packageCache[citizenid] = nil
    end
end)

RegisterNetEvent('ps-weedplanting:server:DestroyWaitForPackage', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    if not packageCache[citizenid] then return end
    
    packageCache[citizenid] = nil
    TriggerClientEvent('QBCore:Notify', src, _U('moved_too_far'), 'error', 2500)
end)

RegisterNetEvent('ps-weedplanting:server:WeedrunDelivery', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Shared.UseStrains then
        for k,v in pairs(Shared.Strains) do
            if Player.Functions.RemoveItem(Shared.Strains[k].weedrunitem, 1) then
                TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.Strains[k].weedrunitem], 'remove', 1)
                Wait(2000)
                local payout = math.random(Shared.Strains[k].PayOut[1], Shared.Strains[k].PayOut[2])
                --Player.Functions.AddMoney('cash', payout)

                local info = {worth = payout}
                Player.Functions.AddItem('markedbills', 1, false, info)
                local itemData = QBCore.Shared.Items['markedbills']
                TriggerClientEvent('ps-inventory:client:ItemBox', src, itemData, "add",1 )
                break
            end
        end
    else
        if Player.Functions.RemoveItem(Shared.SusPackageItem, 1) then
            TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.SusPackageItem], 'remove', 1)
            Wait(2000)
            local payout = math.random(Shared.PayOut[1], Shared.PayOut[2])
            Player.Functions.AddItem('markedbills', 1, false, info)
            local itemData = QBCore.Shared.Items['markedbills']
            TriggerClientEvent('ps-inventory:client:ItemBox', src, itemData, "add",1 )
        end
    end
end)

RegisterServerEvent('ps-weedplanting:server:PoliceAlert')
AddEventHandler('suspicioushandoff:server:PoliceAlert', function(coords, index)
    local Players = GetPlayersFunction()
	for i = 1, #Players do
        for ii=1, #Config.CopsJobs do
            if GetPlayerJobFunction(Players[i]) == Config.CopsJobs[ii] then
                TriggerClientEvent('ps-weedplanting:client:PoliceAlert', Players[i], coords, index)
             end
         end
	end
end)

--- Callbacks

QBCore.Functions.CreateCallback('ps-weedplanting:server:PackageGoods', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local cacheobject = { 
            strain = 0,
            status = 'fresh'
    }


    if packageCache[citizenid] then
        cb(false)
        return
    end
    packageCache[citizenid] = cacheobject
    --Shared.Strains[k].packaged
    if Shared.UseStrains then
        --print(json.encode(packageCache[citizenid]))
        for k,v in pairs(Shared.Strains) do
            --print(k)
            if Player.Functions.RemoveItem(Shared.Strains[k].packaged, 1) then
                TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.Strains[k].packaged], 'remove', 1)
                --print(json.encode(packageCache[citizenid]))
                packageCache[citizenid].strain = k
                break
            else
                cb(false)
                return
            end
        end
    else
        if Player.Functions.RemoveItem(Shared.PackedWeedItem, 1) then
            TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.PackedWeedItem], 'remove', 1)
        else
            cb(false)
            return
        end
    end
    packageCache[citizenid].status = 'waiting'
    cb(true)

    CreateThread(function()
        Wait(Shared.PackageTime * 60 * 1000)
        if packageCache[citizenid] then
            packageCache[citizenid].status = 'done'
        end
    end)
end)

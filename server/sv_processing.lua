--- Events

RegisterNetEvent('ps-weedplanting:server:ProcessBranch', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local item = Player.Functions.GetItemByName(Shared.BranchItem)
    if Shared.UseStrains then
        for k,v in pairs(Shared.Strains) do
            item = Player.Functions.GetItemByName(Shared.Strains[k].harvest)

            if item and item.info.health then
                if Player.Functions.RemoveItem(Shared.Strains[k].harvest, 1, item.slot) then
                    TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.Strains[k].harvest], 'remove', 1)
                    Player.Functions.AddItem(Shared.WeedItem, item.info.health, false)
                    TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.WeedItem], 'add', item.info.health)
                end
                break
            elseif item then -- fallback if item.info.health is nil
                if Player.Functions.RemoveItem(Shared.Strains[k].harvest, 1, item.slot) then
                    TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.Strains[k].harvest], 'remove', 1)
                    Player.Functions.AddItem(Shared.Strains[k].processed, Shared.ProcessingHealthFallback, false)
                    TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.Strains[k].processed], 'add', Shared.ProcessingHealthFallback)
                end
                break
            end
        end
    else   
        if item and item.info.health then
            if Player.Functions.RemoveItem(Shared.BranchItem, 1, item.slot) then
                TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.BranchItem], 'remove', 1)
                Player.Functions.AddItem(Shared.WeedItem, item.info.health, false)
                TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.WeedItem], 'add', item.info.health)
            end
        elseif item then -- fallback if item.info.health is nil
            if Player.Functions.RemoveItem(Shared.BranchItem, 1, item.slot) then
                TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.BranchItem], 'remove', 1)
                Player.Functions.AddItem(Shared.WeedItem, Shared.ProcessingHealthFallback, false)
                TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.WeedItem], 'add', Shared.ProcessingHealthFallback)
            end
        end
    end
end)

RegisterNetEvent('ps-weedplanting:server:PackageWeed', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local item = Player.Functions.GetItemByName(Shared.WeedItem)
    
    if Shared.UseStrains then  
        for k,v in pairs(Shared.Strains) do
            local item = Player.Functions.GetItemByName(Shared.Strains[k].processed)
            if item and item.amount >= Shared.PackageAmount then
                Player.Functions.RemoveItem(Shared.Strains[k].processed, Shared.PackageAmount, item.slot)
                TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.Strains[k].processed], 'remove', Shared.PackageAmount)
                Player.Functions.AddItem(Shared.Strains[k].packaged, 1, false)
                TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.Strains[k].packaged], 'add', 1)
                break
            else
                TriggerClientEvent('QBCore:Notify', src,_U('not_enough_dryweed'), 'error')
            end
        end
    else
        if item and item.amount >= Shared.PackageAmount then
            Player.Functions.RemoveItem(Shared.WeedItem, Shared.PackageAmount, item.slot)
            TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.WeedItem], 'remove', Shared.PackageAmount)
            Player.Functions.AddItem(Shared.PackedWeedItem, 1, false)
            TriggerClientEvent('ps-inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.PackedWeedItem], 'add', 1)
        else
            TriggerClientEvent('QBCore:Notify', src,_U('not_enough_dryweed'), 'error')
        end
    end
end)

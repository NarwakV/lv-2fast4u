local ItemList = {
    ["licensedrift"] = "licensedrift"
}

RegisterServerEvent('libertyv:server:driftlicense')
AddEventHandler('libertyv:server:driftlicense', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licensedrift = Player.Functions.GetItemByName('licensedrift')

    if Player.PlayerData.items ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if licensedrift ~= nil then
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    if Player.PlayerData.items[k].name == "licensedrift" then 
                        TriggerClientEvent('QBCore:Notify', src, "🚗 Selectionne ta voiture de drift 🚗")
                        TriggerClientEvent('libertyv-driftclub', src)
                    else
                 --       TriggerClientEvent('QBCore:Notify', src, "TEST 2 NO ITEM", 'error')
                        break
                    end
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "📄 Tu n'as pas de license 📄", 'error')
                break
            end
        end
    end
end)

--Ouverture Menu
RegisterNetEvent('libertyv-driftclub', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Menu Drift 2FAST4U",
            txt = ''
        },
        {
            id = 2,
            header = "Toyota Supra",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = 'a80',
                  
                }
            }
        },
        {
            id = 3,
            header = "Nissan S15",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = 's15',
                   
                }
            }
        },
        {
            id = 4,
            header = "Nissan 180sx",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = '180sx',
                   
                }
            }
        },
        {
            id = 4,
            header = "Nissan 240sx",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = '240sx',           
                }
            }
        },
        {
            id = 5,
            header = "Honda Civic",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = 'fk2',                    
                }
            }
        },
        {
            id = 6,
            header = "volkswagen Jetta",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = 'jetta',                 
                }
            }
        },
        {
            id = 7,
            header = "Toyota Chaser",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = 'jzx100',                   
                }
            }
        },
        {
            id = 8,
            header = "Mitsubishi Lancer EVO 9",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = 'cp9a',          
                }
            }
        },
        {
            id = 9,
            header = "Nissan Skyline GTR",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = 'skyline',
                  
                }
            }
        },
        {
            id = 10,
            header = "Nissan S13",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = 'nis13',
                }
            }
        },
        {
            id = 11,
            header = "Mazda rx7",
            txt = "INTERDIT EN VILLE",
            params = {
                event = "libertyv-donnerveh",
                args = {
                    model = 'fd',
                }
            }
        },
    })
end)

--item requis


--fonction draw text
DrawText3Ds = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

--spawn npc
Citizen.CreateThread(function()
    SpawnNPC()
end)

SpawnNPC = function()
    Citizen.CreateThread(function()
       
        RequestModel(GetHashKey('csb_hao'))
        while not HasModelLoaded(GetHashKey('csb_hao')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end

CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('csb_hao') , 124.75, -3051.27, 6.04, 354.59, false, true) 
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end

-- event spawn vehicule
RegisterNetEvent('libertyv-donnerveh')
AddEventHandler('libertyv-donnerveh', function(data)  
    local model = data.model
    local player = PlayerPedId()
    
     
    QBCore.Functions.SpawnVehicle(model, function(vehicle)
        SetEntityHeading(vehicle, 268.83)
        TaskWarpPedIntoVehicle(player, vehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        SetVehicleEngineOn(vehicle, true, true)
    end, vector4(124.94, -3047.45, 6.41, 268.83), true)
    Citizen.Wait(1000)
    local vehicle = GetVehiclePedIsIn(player, false)
    local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    vehicleLabel = GetLabelText(vehicleLabel)
    local plate = GetVehicleNumberPlateText(vehicle)  

end)

--event draw text , déclanche menu
Citizen.CreateThread(function() 
    
    while true do
        Citizen.Wait(0)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 124.75, -3051.27, 7.04, 354.59) < 2.0 then 
            DrawText3Ds(124.75, -3051.27, 6.54 + 0.5, '[~g~ E ~w~] - Parler à Chen')
            if IsControlJustPressed(0,38) then  
                TriggerServerEvent('libertyv:server:driftlicense')     
            end
        end
    
    end
end)

local blips = {


    {title="Drift 2FAST4U", colour=19, id=669, x = vector3(163.09, -3028.86, 6.58)}, -- colour=5 (couleur) , id=313 (id du blips)
   }
       
  Citizen.CreateThread(function()
  
     for _, info in pairs(blips) do
       info.blip = AddBlipForCoord(info.x)
       SetBlipSprite(info.blip, info.id)
       SetBlipDisplay(info.blip, 4)
       SetBlipScale(info.blip, 1.0) -- taille du blips
       SetBlipColour(info.blip, info.colour)
       SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
       AddTextComponentString(info.title)
       EndTextCommandSetBlipName(info.blip)
     end
  end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        DeleteEntity(created_ped)
        
    end
  end)
  
  

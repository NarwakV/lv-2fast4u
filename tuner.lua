local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
  while true do Citizen.Wait(500)
    ped = PlayerPedId()
    vehicle = GetVehiclePedIsIn(ped, false)
  end
end)

RegisterCommand("stance", function()
  if IsPedInAnyVehicle(ped, false) then
    SetReduceDriftVehicleSuspension(vehicle, true)
    QBCore.Functions.Notify("🚗 Les suspensions sont abaissées au max 🚗") 
else
  QBCore.Functions.Notify("⛔️ Vous n\'etes pas en voiture ⛔️")
end
end)


RegisterCommand("lowgrip", function()
  if IsPedInAnyVehicle(ped, false) then
    if GetDriftTyresEnabled(vehicle) == false then
    SetDriftTyresEnabled(vehicle, true)
    QBCore.Functions.Notify("🏴‍☠️ Le mécano t'as monté des pneus lisse 🏴‍☠️")
    else
    SetDriftTyresEnabled(vehicle, false)
    QBCore.Functions.Notify("❌ Le mécano t'as remonté tes pneus classic ❌")
    end
  else
    QBCore.Functions.Notify("⛔️ Vous n\'etes pas en voiture ⛔️")
  end
end) 

fx_version 'cerulean'
game 'gta5'

description 'QB-2FAST4U'
author 'Narwak'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
}

client_script 'client/main.lua'
client_script 'client/tuner.lua'

server_script 'server/main.lua'


--[[ --add item in shared.lua

["licensedrift"] = {["name"] = "licensedrift", ["label"] = "licensedrift", ["weight"] = 0, ["type"] = "item", ["image"] = "lawyerpass.png", ["unique"] = true, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = "Yea, this is my car i can proove it!"},


]]
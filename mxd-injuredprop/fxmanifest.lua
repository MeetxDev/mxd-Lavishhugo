fx_version 'cerulean'
game 'gta5'

description 'mxd-injuredprop'
version '1.0.0'

shared_script {
	'config.lua',
}

client_scripts { 
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	"client/*.lua",
}

server_scripts { 
	"server/*.lua",
}

escrow_ignore {
	'config.lua',
	'server/*.lua',
	'client/cl_open.lua',
}

lua54 'yes'
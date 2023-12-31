fx_version 'cerulean'
game 'gta5'

description 'mxd-killchar'
version '1.0.0'

shared_script {
	'config.lua',
}

client_scripts { 
    "@PolyZone/client.lua", 
	"@PolyZone/BoxZone.lua", 
	"@PolyZone/CircleZone.lua",
	"client/*.lua",
}

server_script {
	'server/*.lua',
}

escrow_ignore {
	'config.lua',
}

lua54 'yes'
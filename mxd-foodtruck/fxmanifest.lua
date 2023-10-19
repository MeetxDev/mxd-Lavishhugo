fx_version 'cerulean'
game 'gta5'

description 'mxd-foodtruck'
version '1.0.0'

shared_script {
	'config.lua',
}

client_scripts { 
	"client/*.lua",
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}

escrow_ignore {
	'client/*.lua',
	'server/*.lua',
	'config.lua',
}

lua54 'yes'

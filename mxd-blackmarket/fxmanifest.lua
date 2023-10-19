fx_version 'cerulean'
game 'gta5'

description 'MXD Black Market'
version '1.0.0'

shared_script {
	'config.lua',
}

client_scripts { 
	'client/*.lua',
}

server_script {
	'server/*.lua',
}

escrow_ignore {
	'client/cl_open.lua',
	'server/sv_open.lua',
	'config.lua',
}

lua54 'yes'
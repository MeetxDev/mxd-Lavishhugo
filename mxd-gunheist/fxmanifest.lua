fx_version 'cerulean'
game 'gta5'

description 'mxd-gunheist'
version '1.0.0'

shared_script {
	'config.lua',
}

client_scripts { 
	"client/*.lua",
}

server_script {
	'server/*.lua',
}

escrow_ignore {
	'client/cl_hacks.lua',
	'client/cl_target.lua',
	'config.lua',
}

lua54 'yes'
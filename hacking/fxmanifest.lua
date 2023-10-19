fx_version 'cerulean'
game 'gta5'

ui_page 'html/index.html'

client_scripts {
    'client/main.lua',
}

server_script {
    'server/main.lua',
}

files {
    'html/index.html',
    'html/*.css',
    'html/src/*.js',
    'html/assets/*.png',
    'html/assets/*.mp3'
}

exports {
    'OpenHackingGame',
    'GetHackingStatus',
}

escrow_ignore {
	'client/*.lua',
	'server/*.lua',
	'html/index.html',
    'html/*.css',
    'html/src/*.js',
    'html/assets/*.png',
    'html/assets/*.mp3',
}

lua54 'yes'
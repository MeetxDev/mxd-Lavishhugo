fx_version 'cerulean'
game 'gta5'

description 'MXD Gang War'
version '1.0.0'

ui_page "html/index.html"
files {
  "html/index.html",
  "html/utils/fonts/proxima-bold.otf",
  "html/utils/fonts/proxima-regular.otf",
  "html/utils/fonts/proxima-thin.otf",
  "html/hud.js",
  "html/style.css",
  "html/utils/toastr.js",
  "html/utils/fontawesome.js",
  "html/utils/toastr.min.css",
  "html/utils/mdb/css/bootstrap.css",
  "html/utils/mdb/css/bootstrap.min.css",
  "html/utils/mdb/css/mdb.css",
  "html/utils/mdb/css/mdb.lite.css",
  "html/utils/mdb/css/mdb.lite.min.css",
  "html/utils/mdb/css/mdb.min.css",

}

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
	'client/client.lua',
	'config.lua',
}

lua54 'yes'
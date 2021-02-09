fx_version 'cerulean'

game 'gta5'

description 'RedLine RP Garagem com sistema de garagem privadas'
author 'Pride1922 for RedLineRP'

version '1.0.0'

server_scripts {
    '@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua'
}

dependencies {
    'es_extended',
    'esx_vehicleshop',
    'LegacyFuel'
}

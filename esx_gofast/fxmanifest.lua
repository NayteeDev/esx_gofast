fx_version 'adamant'

game 'gta5'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}

client_scripts {
    "@es_extended/locale.lua",
	'client/main.lua'
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server/common.lua',
    'server/main.lua'
}

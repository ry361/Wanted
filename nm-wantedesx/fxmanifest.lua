fx_version 'adamant'
game 'gta5'
lua54 'yes'

name 'nm-wanted'
author 'NProbleM'
version '1.0'

ui_page "nui/index.html"
files {
    "nui/index.html",
    "nui/script.js",
    "nui/style.css",
    "nui/*.png",
}

client_scripts {
    "locales/tr.lua",
    "config.lua",
    "client/main.lua",
    "client/functions.lua"
}

server_scripts {
    "locales/tr.lua",
    "config.lua",
    "server/main.lua"
}

escrow_ignore {
    "config.lua",
    "client/main.lua",
    "client/functions.lua",
    "server/main.lua",
}
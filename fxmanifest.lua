fx_version 'adamant'
games { 'gta5' };

name 'QBCore clean hud'
description 'A simple clean interface hud for QBCore. Made by miquelmq20 for the FiveM community.'
version '2.0.0'

ui_page 'html/ui.html'

files {
    'html/*.png',
    'html/img/**.png',
    'html/fonts/**.ttf',
    'html/ui.html',
    'html/script.js',
    'html/main.css'
}

client_scripts {
    'hud.lua'
}

shared_scripts {
    'config.lua'
}

server_scripts {
    'server.lua'
}
-- Resource Metadata
fx_version 'bodacious'
games { 'gta5' }

author 'Raph pour MasterMods'
description 'Can Control System de Mercura pour FiveM'
version '1.0.0'
name 'MercuraCCSFiveM'
url 'https://git.friendsincode.com/friendsincode-public/elsplus'

client_scripts {
    'client.lua',
    'client/main.lua'
}

files({
    'client/html/index.html',
    'client/html/sounds/ccs.ogg'
})

ui_page('client/html/index.html')

server_scripts {
    'serveur.lua',
}
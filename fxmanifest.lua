fx_version "cerulean"
games { "gta5" }

author "Freht"
description "Fivem basic anticheat"
version "0.0.1"

client_scripts {
    "config/client_config.lua"
}

server_scripts {
    "config/server_config.lua",
    "server/bansystem.lua"
}
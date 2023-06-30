RegisterServerEvent("kgxkgV1DBvrJahxXUhEaYBvuM6dlqIxDYgxBdoANoo9J3ap2Ir")

AddEventHandler("kgxkgV1DBvrJahxXUhEaYBvuM6dlqIxDYgxBdoANoo9J3ap2Ir", function(reason)
    local src = source
    saveBan(GetPlayerName(src), reason, GetPlayerEndpoint(src), GetPlayerIdentifierByType(src, "steam"))
    DropPlayer(src, "You have been banned by the anticheat. Reason: " reason)
end)

function saveBan(playerName, reason, ip, steam)
    local file = LoadResourceFile(GetCurrenResourceName(), Server_Config.Ban.BanlistFile)
    if (file ~= nil) then
        local content = json.decode(file)
        table.insert(content, {
            name = playerName,
            reason = reason,
            date = os.date("%x %X %p"),
            identifier = steam,
            ip = ip
        })
        SaveResourceFile(GetCurrenResourceName(), Server_Config.Ban.BanlistFile, json.encode(content, {indent = true}), -1)
    else
        print("[ERROR] " .. Server_Config.Ban.BanlistFile .. " doesn't exist!")
    end
end
local CMinecraft = require("sdk1710.client.CMinecraft")

function main()
    local minecraft = CMinecraft:new()

    local player = minecraft:getPlayers()
    local x, y, z = table.unpack(player:getPosition())
    cout(tostring(x))
    cout(tostring(y))
    cout(tostring(z))

    local world = minecraft:getWorld()
    local playerList = world:getPlayers()

    for idx, ply in pairs(playerList) do
        local plyX, plyY, plyZ = table.unpack(ply:getPosition())
        cout(tostring(plyX))
        cout(tostring(plyY))
        cout(tostring(plyZ))
    end
end
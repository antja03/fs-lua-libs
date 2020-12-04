package.path = package.path .. ";D:\\Development\\fs-lua-libs\\?.lua"
local CMinecraft = require("sdk1710.client.CMinecraft")

function subtract(src, dst)
    src.x = src.x - dst.x
    src.y = src.y - dst.y
    src.z = src.z - dst.z
    return src
end

function calc_angle(src, dst)
    local diff = subtract(dst, src)
    local dist = math.sqrt(diff.x * diff.x + diff.z * diff.z)
    local yaw = (math.atan2(diff.z, diff.x) * 180.0 / math.pi) - 90.0
    local pitch = -(math.atan2(diff.y, dist) * 180.0 / math.pi)

    return yaw, pitch
end

function main()
    ---@type CMinecraft
    local game = CMinecraft:new()

    ---@type CEntityClientPlayerMP
    local player = game:getPlayer()

    ---@type CWorldClient
    local world = game:getWorld()

    ---@type table<number, CEntityPlayer>
    local players = world:getPlayers()

    ---@type CEntityPlayer
    local closestPlayer = nil

    ---@type number
    local closestDistance = 3.2

    for _, ply in pairs(players) do
        ---@type number
        local distance = player:getDistanceToEntity(ply)
        cout(tostring(distance))

        if closestPlayer == nil or distance < closestDistance then
            closestPlayer = ply
            closestDistance = distance
        end
    end

    if closestPlayer == nil then
        cout("no player found")
        return
    end

    ---@type number
    local plyX, plyY, plyZ = player:getPosition()

    ---@type number
    local targetX, targetY, targetZ = closestPlayer:getPosition()
    targetY = targetY + closestPlayer:getEyeHeight()

    local yaw, pitch = calc_angle({
        x = plyX, y = plyY, z = plyZ
    },{
        x = targetX, y = targetY, z = targetZ
    })

    cout(tostring(yaw))
    cout(tostring(pitch))

    player:setAngles(yaw, pitch)
end
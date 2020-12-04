local CEntity = require("sdk1710.entity.CEntity")

local CWorld = {}
CWorld.__index = CWorld

function CWorld:new(obj)
    local inst = {}
    setmetatable(inst, self)
    inst.obj = obj
    return inst
end

function CWorld:getPlayers()
    local players = {}

    local playerEntityList = self.obj:get_object("h", "Ljava/util/List;")
    if playerEntityList == nil then
        return players end

    for i = 0, playerEntityList:call_int("size", "()I", nil) - 1, 1 do
        local params = jvm.c_params()
        params:push_int(i)

        local player = playerEntityList:call_object("get", "(I)Ljava/lang/Object;", params)
        if not player == nil then
            table.insert(players, CEntity:new(player))
        end
    end

    return players
end

return CWorld
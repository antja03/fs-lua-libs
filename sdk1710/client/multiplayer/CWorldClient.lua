local CWorld = require("sdk1710.world.CWorld")

local CWorldClient = CWorld:new()
CWorldClient.__index = CWorldClient

function CWorldClient:new(obj)
    local inst = CWorld:new(obj)
    setmetatable(inst, self)
    return inst
end

return CWorldClient
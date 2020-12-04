local CWorld = require("sdk1710.world.CWorld")

---@class CWorldClient
local CWorldClient = CWorld:new()
CWorldClient.__index = CWorldClient

---@return CWorldClient
function CWorldClient:new(obj)
    local inst = CWorld:new(obj)
    setmetatable(inst, self)
    return inst
end

return CWorldClient
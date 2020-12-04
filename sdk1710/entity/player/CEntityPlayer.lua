local CEntityLivingBase = require("sdk1710.entity.CEntityLivingBase")

---@class CEntityPlayer: CEntityLivingBase
local CEntityPlayer = CEntityLivingBase:new()
CEntityPlayer.__index = CEntityPlayer

---@return CEntityPlayer
function CEntityPlayer:new(obj)
    local inst = CEntityLivingBase:new(obj)
    setmetatable(inst, self)
    inst.obj = obj
    return inst
end

return CEntityPlayer
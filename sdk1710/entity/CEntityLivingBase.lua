local CEntity = require("sdk1710.entity.CEntity")

---@class CEntityLivingBase: CEntity
local CEntityLivingBase = CEntity:new()
CEntityLivingBase.__index = CEntityLivingBase

---@return CEntityLivingBase
function CEntityLivingBase:new(obj)
    local inst = CEntity:new(obj)
    setmetatable(inst, self)
    inst.obj = obj
    return inst
end

--@return number
function CEntityLivingBase:getEyeHeight()
    return self.obj:call_float("g", "()F", nil)
end

return CEntityLivingBase
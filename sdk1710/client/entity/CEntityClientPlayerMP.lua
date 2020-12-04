local CEntity = require("sdk1710.entity.CEntity")

local CEntityClientPlayerMP = CEntity:new()
CEntityClientPlayerMP.__index = CEntityClientPlayerMP

function CEntityClientPlayerMP:new(obj)
    local inst = CEntity:new(obj)
    setmetatable(inst, self)
    return inst
end

function CEntityClientPlayerMP:getOldPosition()
    local position = {}
    table.insert(position, self.obj:get_double("bP"))
    table.insert(position, self.obj:get_double("bR"))
    table.insert(position, self.obj:get_double("bS"))
    return position
end

return CEntityClientPlayerMP
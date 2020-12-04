---@type CEntityPlayer
local CEntityPlayer = require("sdk1710.entity.player.CEntityPlayer")

---@class CEntityClientPlayerMP: CEntityPlayer
local CEntityClientPlayerMP = CEntityPlayer:new()
CEntityClientPlayerMP.__index = CEntityClientPlayerMP

---@return CEntityClientPlayerMP
function CEntityClientPlayerMP:new(obj)
    local inst = CEntityPlayer:new(obj)
    setmetatable(inst, self)
    return inst
end

---@param entity CEntity
---@return number
function CEntityClientPlayerMP:getDistanceToEntity(entity)
    local x, y, z = self:getPosition()
    local entX, entY, entZ = entity:getPosition()
    return math.sqrt(
        math.pow(entX - x, 2) + 
        math.pow(entY - y, 2) + 
        math.pow(entZ - z, 2))
end

---@return table<string, number>
function CEntityClientPlayerMP:getOldPosition()
    local position = {}
    table.insert(position, self.obj:get_double("bP"))
    table.insert(position, self.obj:get_double("bR"))
    table.insert(position, self.obj:get_double("bS"))
    return position
end

return CEntityClientPlayerMP
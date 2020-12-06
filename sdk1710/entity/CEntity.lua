---@class CEntity
local CEntity = {}
CEntity.__index = CEntity

---@return CEntity
function CEntity:new(obj)
    local inst = {}
    setmetatable(inst, self)
    inst.obj = obj
    return inst
end

---@return integer
function CEntity:getId()
    return self.obj:call_int("y", "()I", nil)
end

---@return table<string, number>
function CEntity:getPosition()
    return self.obj:get_double("s"),
           self.obj:get_double("t"),
           self.obj:get_double("u")
end

---@return table<string, number>
function CEntity:getLastPosition()
    return self.obj:get_double("S"),
           self.obj:get_double("T"),
           self.obj:get_double("U")
end

---@return table<string, number>
function CEntity:getMotion()
    return self.obj:get_double("v"),
           self.obj:get_double("w"),
           self.obj:get_double("x")
end

---@return boolean
function CEntity:isDead()
    return self.obj:get_int("K")
end

---@return table<string, number>
function CEntity:getAngles()
    return self.obj:get_float("y"),
           self.obj:get_float("z")
end

---@return table<string, number>
function CEntity:setAngles(yaw, pitch)
    self.obj:set_float("y", yaw)
    self.obj:set_float("z", pitch)
end

return CEntity
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

function CEntity:getAngles()
    return self.obj:get_float("y"),
           self.obj:get_float("z ")
end

function CEntity:setAngles(yaw, pitch)
    local params = jvm.c_params()
    params:push_float(yaw)
    params:push_float(pitch)
    self.obj:call_void("c", "(FF)V", params)
end

return CEntity
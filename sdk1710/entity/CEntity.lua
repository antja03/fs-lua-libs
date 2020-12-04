local CEntity = {}
CEntity.__index = CEntity

function CEntity:new(obj)
    local inst = {}
    setmetatable(inst, self)
    inst.obj = obj
    return inst
end

function CEntity:getId()
    return self.obj:call_int("y", "()I", nil)
end

function CEntity:getPosition()
    local position = {}
    table.insert(position, self.obj:get_double("s"))
    table.insert(position, self.obj:get_double("t"))
    table.insert(position, self.obj:get_double("u"))
    return position
end

return CEntity
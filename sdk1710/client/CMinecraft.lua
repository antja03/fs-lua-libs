local CEntityClientPlayerMP = require("sdk1710.client.entity.CEntityClientPlayerMP")
local CWorldClient = require("sdk1710.client.multiplayer.CWorldClient")

local CMinecraft = {}
CMinecraft.__index = CMinecraft

function CMinecraft:new()
    local inst = {}
    setmetatable(inst, self)
    inst.class = jvm.find_class("bao")
    inst.obj = inst.class:call_static_object("B", "bao")
    return inst
end

function CMinecraft:getPlayer()
    return CEntityClientPlayerMP:new(
        self.obj:get_object("h", "Lbjk;")
    )
end

function CMinecraft:getWorld()
    return CWorldClient:new(
        self.obj:get_object("f", "Lbjf;")
    )
end

return CMinecraft
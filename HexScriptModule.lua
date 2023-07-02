

local function rwmem(Address, SizeOrBuffer)
    assert(Address ~= nil, "[rwmem]: error, given address is null.")
    _rw = {}
    if type(SizeOrBuffer) == "number" then
        _ = ""
        do
            do
                for SRD1_5_ = 1, SizeOrBuffer do
                    _rw[SRD1_5_] = {
                        address = Address - 1 + SRD1_5_,
                        flags = gg.TYPE_BYTE
                    }
                end
            end
        end
        do
            do
                for SRD1_5_, SRD1_6_ in ipairs(gg.getValues(_rw)) do
                    if SRD1_6_.value == 0 and limit == true then
                        return _
                    end
                    _ = _ .. string.format("%02X", SRD1_6_.value & 255)
                end
            end
        end
        return _
    end
    Byte = {}
    SizeOrBuffer:gsub("..", function(x)
        Byte[#Byte + 1] = x
        _rw[#Byte] = {
            address = Address - 1 + #Byte,
            flags = gg.TYPE_BYTE,
            value = x .. "h"
        }
    end)
    gg.setValues(_rw)
end

return { 
    rwmem = rwmem,

}
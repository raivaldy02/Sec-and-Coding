function jsonum()

    targetInfo = gg.getTargetInfo()
    app = targetInfo.packageName

    local utf8 = {}

    local bit = {
        data32 = {}
    }

    do
        do
            for SRD1_5_ = 1, 32 do
                bit.data32[SRD1_5_] = 2 ^ (32 - SRD1_5_)
            end
        end
    end

    local toby = string.byte
    function utf8.charbytes(s, i)
        i = i or 1
        local c = string.byte(s, i)
        if c > 0 and c <= 127 then
            do
                return 1
            end
            return
        end
        if c >= 194 and c <= 223 then
            do
                return 2
            end
            return
        end
        if c >= 224 and c <= 239 then
            do
                return 3
            end
            return
        end
        if c >= 240 and c <= 244 then
            return 4
        end
        return 1
    end

    local ded
    function bit:d2b(arg)
        if arg == nil then
            return
        end
        local tr, c = {}, arg < 0
        if c then
            arg = 0 - arg
        end
        do
            do
                for SRD1_7_ = 1, 32 do
                    if arg >= self.data32[SRD1_7_] then
                        tr[SRD1_7_] = 1
                        arg = arg - self.data32[SRD1_7_]
                    else
                        tr[SRD1_7_] = 0
                    end
                end
            end
        end
        if c then
            tr = self:_bnot(tr)
            tr = self:b2d(tr) + 1
            tr = self:d2b(tr)
        end
        return tr
    end

    function bit:b2d(arg, neg)
        local nr = 0
        if arg[1] == 1 and neg == true then
            arg = self:_bnot(arg)
            nr = self:b2d(arg) + 1
            nr = 0 - nr
        else
            do
                for SRD1_7_ = 1, 32 do
                    if arg[SRD1_7_] == 1 then
                        nr = nr + 2 ^ (32 - SRD1_7_)
                    end
                end
            end
        end
        return nr
    end

    function bit:_and(a, b)
        local op1 = self:d2b(a)
        local op2 = self:d2b(b)
        local r = {}
        do
            do
                for SRD1_9_ = 1, 32 do
                    if op1[SRD1_9_] == 1 and op2[SRD1_9_] == 1 then
                        r[SRD1_9_] = 1
                    else
                        r[SRD1_9_] = 0
                    end
                end
            end
        end
        return self:b2d(r, true)
    end

    function bit:_or(a, b)
        local op1 = self:d2b(a)
        local op2 = self:d2b(b)
        local r = {}
        do
            do
                for SRD1_9_ = 1, 32 do
                    if op1[SRD1_9_] == 1 or op2[SRD1_9_] == 1 then
                        r[SRD1_9_] = 1
                    else
                        r[SRD1_9_] = 0
                    end
                end
            end
        end
        return self:b2d(r, true)
    end

    function bit:_xor(a, b)
        local op1 = self:d2b(a)
        if op1 == nil then
            return nil
        end
        local op2 = self:d2b(b)
        if op2 == nil then
            return nil
        end
        local r = {}
        do
            do
                for SRD1_9_ = 1, 32 do
                    if op1[SRD1_9_] == op2[SRD1_9_] then
                        r[SRD1_9_] = 0
                    else
                        r[SRD1_9_] = 1
                    end
                end
            end
        end
        return self:b2d(r, true)
    end

    local switch = {
        [1] = function(s, pos)
            local c1 = toby(s, pos)
            return c1
        end,
        [2] = function(s, pos)
            local c1 = toby(s, pos)
            local c2 = toby(s, pos + 1)
            local int1 = bit:_and(31, c1)
            local int2 = bit:_and(63, c2)
            return bit:_or(bit:_lshift(int1, 6), int2)
        end,
        [3] = function(s, pos)
            local c1 = toby(s, pos)
            local c2 = toby(s, pos + 1)
            local c3 = toby(s, pos + 2)
            local int1 = bit:_and(15, c1)
            local int2 = bit:_and(63, c2)
            local int3 = bit:_and(63, c3)
            local o2 = bit:_or(bit:_lshift(int1, 12), bit:_lshift(int2, 6))
            local dt = bit:_or(o2, int3)
            return dt
        end,
        [4] = function(s, pos)
            local c1 = toby(s, pos)
            local c2 = toby(s, pos + 1)
            local c3 = toby(s, pos + 2)
            local c4 = toby(s, pos + 3)
            local int1 = bit:_and(15, c1)
            local int2 = bit:_and(63, c2)
            local int3 = bit:_and(63, c3)
            local int4 = bit:_and(63, c4)
            local o2 = bit:_or(bit:_lshift(int1, 18), bit:_lshift(int2, 12))
            local o3 = bit:_or(o2, bit:_lshift(int3, 6))
            local o4 = bit:_or(o3, int4)
            return o4
        end
    }

    function bit:_bnot(op1)
        local r = {}
        do
            do
                for SRD1_6_ = 1, 32 do
                    if op1[SRD1_6_] == 1 then
                        r[SRD1_6_] = 0
                    else
                        r[SRD1_6_] = 1
                    end
                end
            end
        end
        return r
    end

    function bit:_not(a)
        local op1 = self:d2b(a)
        local r = self:_bnot(op1)
        return self:b2d(r, true)
    end

    function bit:charCodeAt(s)
        local pos, int, H, L = 1, 0, 0, 0
        local slen = string.len(s)
        local allByte = {}
        while pos <= slen do
            local tLen = utf8.charbytes(s, pos)
            if tLen >= 1 and tLen <= 4 then
                if tLen == 4 then
                    int = switch[4](s, pos)
                    H = math.floor((int - 65536) / 1024) + 55296
                    L = (int - 65536) % 1024 + 56320
                    table.insert(allByte, H)
                    table.insert(allByte, L)
                else
                    int = switch[tLen](s, pos)
                    table.insert(allByte, int)
                end
            end
            pos = pos + tLen
        end
        return allByte
    end

    function bit:_rshift(a, n)
        local r = 0
        if a < 0 then
            r = 0 - self:_frshift(0 - a, n)
        elseif a >= 0 then
            r = self:_frshift(a, n)
        end
        return r
    end

    function bit:_frshift(a, n)
        local op1 = self:d2b(a)
        local r = self:d2b(0)
        local left = 32 - n
        if n < 32 and n > 0 then
            do
                for SRD1_9_ = left, 1, -1 do
                    r[SRD1_9_ + n] = op1[SRD1_9_]
                end
            end
        end
        return self:b2d(r)
    end

    function bit:_lshift(a, n)
        local op1 = self:d2b(a)
        local r = self:d2b(0)
        if n < 32 and n > 0 then
            do
                for SRD1_8_ = n, 31 do
                    r[SRD1_8_ - n + 1] = op1[SRD1_8_ + 1]
                end
            end
        end
        return self:b2d(r, true)
    end

    function trim(s)
        return s:match("^%s*(.*)"):match("(.-)%s*$")
    end

    local json = {}
    local kind_of = function(obj)
        if type(obj) ~= "table" then
            return type(obj)
        end
        local i = 1
        do
            do
                for SRD1_5_ in pairs(obj) do
                    if obj[i] ~= nil then
                        i = i + 1
                    else
                        return "table"
                    end
                end
            end
        end
        if i == 1 then
            do
                return "table"
            end
            return
        end
        return "array"
    end

    local escape_str = function(s)
        local in_char = {"\\", "\"", "/", "\b", "\f", "\n", "\r", "\t"}
        local out_char = {"\\", "\"", "/", "b", "f", "n", "r", "t"}
        do
            do
                for SRD1_6_, SRD1_7_ in ipairs(in_char) do
                    s = s:gsub(SRD1_7_, "\\" .. out_char[SRD1_6_])
                end
            end
        end
        return s
    end

    local skip_delim = function(str, pos, delim, err_if_missing)
        pos = pos + #str:match("^%s*", pos)
        if str:sub(pos, pos) ~= delim then
            if err_if_missing then
                error("Expected " .. delim .. " close position " .. pos)
            end
            return pos, false
        end
        return pos + 1, true
    end

    local function parse_str_val(str, pos, val)
        val = val or ""
        local early_end_error = "End of input encountered during string parsing."
        if pos > #str then
            error(early_end_error)
        end
        local c = str:sub(pos, pos)
        if c == "\"" then
            return val, pos + 1
        end
        if c ~= "\\" then
            return parse_str_val(str, pos + 1, val .. c)
        end
        local esc_map = {
            b = "\b",
            f = "\f",
            n = "\n",
            r = "\r",
            t = "\t"
        }
        local nextc = str:sub(pos + 1, pos + 1)
        if not nextc then
            error(early_end_error)
        end
        return parse_str_val(str, pos + 2, val .. (esc_map[nextc] or nextc))
    end

    local parse_num_val = function(str, pos)
        local num_str = str:match("^-?%d+%.?%d*[eE]?[+-]?%d*", pos)
        local val = tonumber(num_str)
        if not val then
            error("Error parsing number at position " .. pos .. ".")
        end
        return val, pos + #num_str
    end

    function json.stringify(obj, as_key)
        local s = {}
        local kind = kind_of(obj)
        if kind == "array" then
            if as_key then
                error("Unable to encode array as key.")
            end
            s[#s + 1] = "["
            do
                do
                    for SRD1_7_, SRD1_8_ in ipairs(obj) do
                        if SRD1_7_ > 1 then
                            s[#s + 1] = ", "
                        end
                        s[#s + 1] = json.stringify(SRD1_8_)
                    end
                end
            end
            s[#s + 1] = "]"
        elseif kind == "table" then
            if as_key then
                error("Unable to key encode table.")
            end
            s[#s + 1] = "{"
            do
                do
                    for SRD1_7_, SRD1_8_ in pairs(obj) do
                        if #s > 1 then
                            s[#s + 1] = ", "
                        end
                        s[#s + 1] = json.stringify(SRD1_7_, true)
                        s[#s + 1] = ":"
                        s[#s + 1] = json.stringify(SRD1_8_)
                    end
                end
            end
            s[#s + 1] = "}"
        else
            if kind == "string" then
                do
                    return "\"" .. escape_str(obj) .. "\""
                end
                return
            end
            if kind == "number" then
                if as_key then
                    return "\"" .. tostring(obj) .. "\""
                end
                do
                    return tostring(obj)
                end
                return
            end
            if kind == "boolean" then
                do
                    return tostring(obj)
                end
                return
            end
            if kind == "nil" then
                do
                    return "null"
                end
                return
            end
            error("unjsonifiable type,: " .. kind .. ".")
        end
        return table.concat(s)
    end

    json.null = {}
    function json.parse(str, pos, end_delim)
        pos = pos or 1
        if pos > #str then
            error("Reached unexpected end of input ")
        end
        local pos = pos + #str:match("^%s*", pos)
        local first = str:sub(pos, pos)
        if first == "{" then
            do
                local obj, key, delim_found = {}, true, true
                pos = pos + 1
                while true do
                    key, pos = json.parse(str, pos, "}")
                    if key == nil then
                        return obj, pos
                    end
                    if not delim_found then
                        error("Missing comma between object items.")
                    end
                    pos = skip_delim(str, pos, ":", true)
                    obj[key], pos = json.parse(str, pos)
                    pos, delim_found = skip_delim(str, pos, ",")
                end
            end
            return
        end
        if first == "[" then
            do
                local arr, val, delim_found = {}, true, true
                pos = pos + 1
                while true do
                    val, pos = json.parse(str, pos, "]")
                    if val == nil then
                        return arr, pos
                    end
                    if not delim_found then
                        error("Missing comma between array items.")
                    end
                    arr[#arr + 1] = val
                    pos, delim_found = skip_delim(str, pos, ",")
                end
            end
            return
        end
        if first == "\"" then
            do
                return parse_str_val(str, pos + 1)
            end
            return
        end
        if first == "-" or first:match("%d") then
            do
                return parse_num_val(str, pos)
            end
            return
        end
        if first == end_delim then
            do
                return nil, pos + 1
            end
            return
        end
        do
            local literals = {
                ["true"] = true,
                ["false"] = false,
                null = json.null
            }
            do
                do
                    for SRD1_9_, SRD1_10_ in pairs(literals) do
                        local lit_end = pos + #SRD1_9_ - 1
                        if str:sub(pos, lit_end) == SRD1_9_ then
                            return SRD1_10_, lit_end + 1
                        end
                    end
                end
            end
            local pos_info_str = "position " .. pos .. ": " .. str:sub(pos, pos + 10)
            error("Invalid json syntax starting at " .. pos_info_str)
        end
    end

    function enc(data, b)
        return (data:gsub(".", function(x)
            local r, b = "", x:byte()
            do
                do
                    for SRD1_6_ = 8, 1, -1 do
                        r = r .. (b % 2 ^ SRD1_6_ - b % 2 ^ (SRD1_6_ - 1) > 0 and "1" or "0")
                    end
                end
            end
            return r
        end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
            if #x < 6 then
                return ""
            end
            local c = 0
            do
                do
                    for SRD1_5_ = 1, 6 do
                        c = c + (x:sub(SRD1_5_, SRD1_5_) == "1" and 2 ^ (6 - SRD1_5_) or 0)
                    end
                end
            end
            return b:sub(c + 1, c + 1)
        end) .. ({"", "??", "?"})[#data % 3 + 1]
    end

    function dec(data, b)
        data = string.gsub(data, "[^" .. b .. "=]", "")
        return (data:gsub(".", function(x)
            if x == "?" then
                return ""
            end
            local r, f = "", b:find(x) - 1
            do
                do
                    for SRD1_6_ = 6, 1, -1 do
                        r = r .. (f % 2 ^ SRD1_6_ - f % 2 ^ (SRD1_6_ - 1) > 0 and "1" or "0")
                    end
                end
            end
            return r
        end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(x)
            if #x ~= 8 then
                return ""
            end
            local c = 0
            do
                do
                    for SRD1_5_ = 1, 8 do
                        c = c + (x:sub(SRD1_5_, SRD1_5_) == "1" and 2 ^ (8 - SRD1_5_) or 0)
                    end
                end
            end
            return string.char(c)
        end))
    end

    function rwmem(Address, SizeOrBuffer)
        assert(Address ~= nil, "[rwmem]: error, given address is null.")
        _rw = {}
        if type(SizeOrBuffer) == "number" then
            _ = ""
            for _ = 1, SizeOrBuffer do
                _rw[_] = {
                    address = (Address - 1) + _,
                    flags = gg.TYPE_BYTE
                }
            end
            for v, __ in ipairs(gg.getValues(_rw)) do
                if __.value == 00 and limit == true then
                    return _
                end
                _ = _ .. string.format("%02X", __.value & 0xFF)
            end
            return _
        end
        Byte = {}
        SizeOrBuffer:gsub("..", function(x)
            Byte[#Byte + 1] = x
            _rw[#Byte] = {
                address = (Address - 1) + #Byte,
                flags = gg.TYPE_BYTE,
                value = x .. "h"
            }
        end)
        gg.setValues(_rw)
    end

    local function hexdecode(hex)
        return (hex:gsub("%x%x", function(digits)
            return string.char(tonumber(digits, 16))
        end))
    end
    local function hexencode(str)
        return (str:gsub(".", function(char)
            return string.format("%2x", char:byte())
        end))
    end
    function Dec2Hex(nValue)
        nHexVal = string.format("%X", nValue);
        sHexVal = nHexVal .. "";
        return sHexVal;
    end
    function ToInteger(number)
        return math.floor(tonumber(number) or
                              error("It was not possible transmitir '" .. tostring(number) .. "' enumerate.'"))
    end

    function save(data)
        io.open(gg.EXT_STORAGE .. "/decrypt.txt", "w"):write(data)
        gg.toast("I got you Lionel Richie!")
    end

    function save2(data)
        io.open(gg.EXT_STORAGE .. "/decrypt.txt", "w"):write(json.stringify(data))
        gg.toast("I got you Lionel Richie!")
    end

    function configjson(data)
        io.open(gg.EXT_STORAGE .. "/config.txt", "w"):write(data)
        gg.toast(data .. [[
        
        𝙘𝙤𝙥𝙞𝙤𝙪, 𝙛𝙖𝙧𝙞𝙣𝙝𝙖?]])
        print(data, false)
        gg.clearResults()

    end

    gg.clearResults()
    gg.setRanges(gg.REGION_JAVA_HEAP | gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_C_HEAP | gg.REGION_C_DATA)
    gg.setVisible(false)
    gg.searchNumber("h 7B 0A 20 22 56 65 72 73 69", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)

    if #r < 1 then
        gg.toast("File Not Found ❌")
        json_2 = true
    end

    if json_2 then
        gg.searchNumber("h 7B 0A 20 22 56 65 72 73", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
        local r = gg.getResults(1)
        if #r < 1 then
            gg.toast("File Not Found ❌")
            print([[

calma barboleta]])
            print("\nsink or swim?\n\n")
            os.exit()
        end
    end

    limit = true

    gg.searchNumber("h7B", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1000)
    readedMem = rwmem(r[1].address, 200000)
    configjson(hexdecode(readedMem))
    do
        do
            for SRD1_5_, SRD1_6_ in ipairs(r) do
                r[SRD1_5_].flags = gg.TYPE_FLOAT
                r[SRD1_5_].value = "1000"
            end
        end
    end
    gg.setValues(r)
    gg.clearResults()
    gg.toast("File Found ✓")
    print("I got you Lionel Richie!\n\nThe file is at: /sdcard/config.txt")
    gg.clearResults()
    os.exit()

end
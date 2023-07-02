local function hexdecode(hex)
    return (hex:gsub("%x%x", function(digits)
        return string.char(tonumber(digits, 16))
    end))
end

local function hexencode(str)
    return (str:gsub(".", function(char)
        return string.format("%02x ", char:byte())
    end))
end

local function hexencode2(str)
    return (str:gsub(".", function(char)
        return string.format("%2x ", char:byte())
    end))
end

local function checkMatch(key, str)
    result = nil

    for index, value in ipairs(key) do
        result = str:match(value)
        if result then
            break
        end
    end

    return result
end

local function strip(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function prosesData(data)

    local function findBeginIdx(tbl)

        local key = {"splitPsiphon"}
        local result = nil

        for index_tbl, value_tbl in ipairs(tbl) do

            for index_key, value_key in ipairs(key) do

                if value_tbl:match(value_key) then
                    result = index_tbl
                end

            end
        end
        return result

    end

    local function splitString(str, separator)
        local match_1, match_2 = str:match("(.-)" .. separator .. "(.*)")
        local tbl = {}

        no = 1
        while (match_2:match("(.-)" .. separator .. "(.*)")) do

            match_1, match_2 = match_2:match("(.-)" .. separator .. "(.*)")

            if hexdecode(match_1):match("[^\x20]+") then
                table.insert(tbl, strip(hexdecode(match_1):gsub("[^\x20-\x7e]+", "")))
            else
                table.insert(tbl, "kosong")
            end

            no = no + 1
        end

        return tbl
    end

    local function fixedConfig(index, tbl)
        local result_fixedConfig = {}
        local beginIndex = index - 24
        local lastIndex = beginIndex + 31

        for i = beginIndex, lastIndex do
            table.insert(result_fixedConfig, tbl[i])
        end


        return result_fixedConfig
    end

    data = hexencode(data)
    data = data:gsub("00", "20")
    data = data:gsub("20", "z")
    data = data:gsub("66 61 6c 73 65", "F A L S E")
    data = data:gsub("5c 72", "5b 63 72 6c 66 5d")
    data = data:gsub("\x20", "")

    local separator = data:match("FALSE[\x7a]+(.-)[\x7a]+")
    data = data:gsub(separator, "0a56616c647947616e74656e67")
    separator = "0a56616c647947616e74656e67"
    data = data:gsub("z", "20")
    data = data:gsub("FALSE", "66616c7365")

    local result = splitString(data, separator)
    local assemblyPointIndex = findBeginIdx(result)

    local getConfig = fixedConfig(assemblyPointIndex, result)
    
    local test = ""
    for i, v in ipairs(getConfig) do 
        test = test..i..":"..v.."\n"
    end

    io.open("/sdcard/decryptOutput.txt", "w"):write(test)
    os.exit()

    return print(result[assemblyPointIndex])

end

local data = io.open("/sdcard/decrypt.txt", "rb"):read("*all")

if data:match("66616C7365") then
    local ConfigTabel = prosesData(hexdecode(data))
else 
    local ConfigTabel = prosesData(data)
end
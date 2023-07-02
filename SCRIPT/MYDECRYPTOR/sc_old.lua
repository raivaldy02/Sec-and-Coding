-- HexFunc = require "HexScriptModule"
-- EXIT
local function EXIT()
    gg.clearResults()
    t = gg.getListItems()
    gg.removeListItems(t)
    gg.toast("Menu Berakhir!")
    os.exit()
end

-- HTTPCustomDecryptor
local function HTTPCustom()
    limit = false
    targetInfo = gg.getTargetInfo()
    app = targetInfo.packageName

    local function executeHTTPCustom()
        gg.clearResults()
        gg.setRanges(gg.REGION_JAVA_HEAP | gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_JAVA | gg.REGION_C_HEAP |
                         gg.REGION_C_DATA)
        gg.setVisible(false)
        gg.searchNumber("h 70 6f 6f 6c 2d 31 2d 74 68 72 65 61 64 2d", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
        local dataVal = gg.getResults(1)
    end

    if app == "xyz.easypro.httpcustom" then
        executeHTTPCustom()
    else
        gg.toast("Process Not Found")
    end
end

-- function Main()
--     while (true) do
--         function menus()
--             menu = gg.choice({
--                 "HTTP Custom",
--                 "Dump",
--                 "EXIT Program"
--             }, nil, (_G["os"]["date"]([[
-- Recoded By 모하마드 라이발디
-- %d/%m/%Y %H:%M:%S 
-- pick a Option:]])))

--             if menu == 1 then
--                 HTTPCustom()
--             end
--             if menu == 2 then
--                 Dump()
--             end
--             if menu == 3 then
--                 EXIT()
--             end
--         end

--         if gg.isVisible(true) then 
--             gg.clearResults()
--             gg.setVisible(false) 
--             menus()
--         end

--     end
-- end

-- BEGINNING EXECUTION
-- Main()
-- local berkas = io.popen("./decrypt.txt","r")

-- data = berkas:read("*a")
-- for line in berkas:lines() do
--     print(line)
-- end

-- io.close(berkas)

-- local exec_py_data_extractor = io.popen("python fuck.py")
-- data = exec_py_data_extractor:read("*a")
-- print(data)

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

-- local function prosesData(data, separator)

--     local function findExpDate(tbl)
--         local key = {
--             "%d%d%d%d[\45]%d%d[\45]%d%d[\32]%d%d[\58]%d%d",
--             "lifeTime"
--         } 
--         local result = nil

--         for index_tbl, value_tbl in ipairs(tbl) do

--             for index_key, value_key in ipairs(key) do

--                 if value_tbl:match(value_key) then
--                     result = index_tbl
--                 end

--             end
--         end
--         return result
--     end

--     local function splitString(str, separator)
--         local match_1, match_2 = str:match("(.-)"..separator.."(.*)")
--         local tbl = {}

--         no = 1
--         while (match_2:match("(.-)"..separator.."(.*)")) do

--             match_1, match_2 = match_2:match("(.-)"..separator.."(.*)")

--             if hexdecode(match_1):match("[^\x20]+") then
--                 -- print(no.." : "..strip(hexdecode(match_1):gsub("[^\x20-\x7e]+","")))
--                 table.insert(tbl, strip(hexdecode(match_1):gsub("[^\x20-\x7e]+","")))
--             else 
--                 -- print(no.." : KOSONG ANJING")
--                 table.insert(tbl,"𝗘𝗠𝗣𝗧𝗬")
--             end

--             -- print()
--             -- no = no + 1
--             -- print(hexdecode(match_1):gsub("[^\x20-\x7e]+",""))
--         end

--         return tbl
--     end

--     local function fixedConfig(index, tbl)
--         local result_fixedConfig = {}
--         local beginIndex = index - 4
--         local lastIndex = beginIndex + 31

--         for i = beginIndex, lastIndex do
--             table.insert(result_fixedConfig, tbl[i])
--         end

--         return result_fixedConfig
--     end

--     local result = splitString(data, separator)
--     local assemblyPointIndex = findExpDate(result)
--     local getConfig = fixedConfig(assemblyPointIndex, result)

--     for index, value in ipairs(getConfig) do
--         print(index.." : "..value)
--     end

--     return getConfig
-- end

local function prosesData(data)

    local function findBeginIdx(tbl)
        -- local key = {"%d%d%d%d[\45]%d%d[\45]%d%d[\32]%d%d[\58]%d%d", "lifeTime"}
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
                -- print(no..":"..strip(hexdecode(match_1):gsub("[^\x20-\x7e]+", "")))
                table.insert(tbl, strip(hexdecode(match_1):gsub("[^\x20-\x7e]+", "")))
            else
                -- print(no..":".."KOSONG")
                table.insert(tbl, "kosong")
            end

            no = no + 1
        end

        return tbl
    end

    local function fixedConfig(index, tbl)
        local result_fixedConfig = {}
        -- local beginIndex = index - 4
        -- local lastIndex = beginIndex + 31
        local beginIndex = index - 24
        local lastIndex = beginIndex + 31

        for i = beginIndex, lastIndex do
            table.insert(result_fixedConfig, tbl[i])
        end

        -- for index, value in ipairs(result_fixedConfig) then
        --     if (index1)
        -- end

        return result_fixedConfig
    end

    data = hexencode(data)
    data = data:gsub("00", "20")
    data = data:gsub("20", "z")
    data = data:gsub("66 61 6c 73 65", "F A L S E")
    data = data:gsub("5c 72", "5b 63 72 6c 66 5d")
    data = data:gsub("\x20", "")
    
    -- print(data)
    -- os.exit()
    -- data = data:gsub("0a", "5b 63 72 6c 66 5d")

    local separator = data:match("FALSE[\x7a]+(.-)[\x7a]+")
    data = data:gsub(separator, "0a56616c647947616e74656e67")
    separator = "0a56616c647947616e74656e67"
    data = data:gsub("z", "20")
    data = data:gsub("FALSE", "66616c7365")

    local result = splitString(data, separator)
    local assemblyPointIndex = findBeginIdx(result)
    -- print(assemblyPointIndex)

    local getConfig = fixedConfig(assemblyPointIndex, result)

    --Ubah dari lifeTime jadi Unlimited
    -- getConfig[5] = ( function() if getConfig[5] == "lifeTime" then return "Unlimited" else return getConfig[5] end end) ()

    -- print(result[assemblyPointIndex])

    
    local test = ""
    for i, v in ipairs(getConfig) do 
        test = test..i..":"..v.."\n"
        -- print(i..":"..v)
    end
    io.open("./decrypt.txt", "w"):write(test)
    os.exit()

    return print(result[assemblyPointIndex])

end

-- local function getOutput(tbl)
--     local cfgRegex = {
--       [1] = {
--           ["name"] = "𝗣𝗔𝗬𝗟𝗢𝗔𝗗",
--           ["regex"] = "[a-zA-Z]+[\x20]+.*[\x5bcrlf\x5d]+"
--       }, 
--       [5] = {
--           ["name"] = "𝗘𝘅𝗽",
--           ["regex"] = "(.*)"
--       },
--       [8] = {
--           ["name"] = "𝗦𝗦𝗛",
--           ["regex"] = "[0-9a-zA-Zx\x2e\x2d]+:[%d]+@[%w\x2e\x2d]+:[%w]+"
--       }, 
--       [2] = {
--           ["name"] = "𝗣𝗿𝗼𝘅𝘆",
--           ["regex"] = "[%w\x2e]+[\x3a][%d]+"
--       }, 
--       [13] = {
--           ["name"] = "𝗦𝗡𝗜",
--           ["regex"] = "[%w\x2e\x2d]+[\x2e]+[%w]+"
--       },
--       [27] = {
--           ["name"] = "𝗩𝟮𝗥𝗔𝗬",
--           ["regex"] = "(.*)"
--       },
--       [30] = {
--           ["name"] = "𝗡𝗮𝗺𝗲 𝗦𝗲𝗿𝘃𝗲𝗿",
--           ["regex"] = "[%w\x2e\x2d]+[\x2e]+[%w]+"
--       },
--       [31] = {
--           ["name"] = "𝗣𝘂𝗯𝗹𝗶𝗰 𝗞𝗲𝘆",
--           ["regex"] = "(.*)"
--       },
--       [32] = {
--           ["name"] = "𝗗𝗡𝗦 𝗛𝗼𝘀𝘁",
--           ["regex"] = "[%w\x2e\x2d]+[\x2e]+[%w]+"
--       }
--     }

--     local function notBlockedValue(checkValue)
--         local listBlockedWord = "P.5p\n"

--         for value in listBlockedWord:gmatch("[^\n]+") do
--             if checkValue == value then return false end
--         end

--         return true
--     end

--     local message = "🅺🅷🅾🅽🅶 🅶🆄🅰🅽🥨 🅳🅴🅲🆁🆈🅿🆃\n\n"

--     for index, value in ipairs(tbl) do

--         if cfgRegex[index] and value:match(cfgRegex[index]["regex"]) and notBlockedValue(value:match(cfgRegex[index]["regex"])) and value ~= "𝙆𝙊𝙎𝙊𝙉𝙂" then

--             local namaKonten = cfgRegex[index]["name"]
--             local valueRegexKonten = value:match(cfgRegex[index]["regex"])

--             message = message..namaKonten.." ➜🥨 "..valueRegexKonten.."\n━━━━━━━━━━━━━━━━━━━━━━\n"
--         end

--     end

--     message = message.."𝔻𝕖𝕔𝕣𝕪𝕡𝕥 ℍ𝕋𝕋ℙ ℂ𝕦𝕤𝕥𝕠𝕞 By➛:@KhongGuaa"
--     return message
-- end

local function getOutput(tbl)
    local cfgRegex = {
        [1] = {
            ["name"] = "𝗣𝗔𝗬𝗟𝗢𝗔𝗗",
            ["regex"] = "[a-zA-Z]+[\x20]+.*[\x5bcrlf\x5d]+"
        }, 
        [2] = {
          ["name"] = "𝗣𝗥𝗢𝗫𝗬",
          ["regex"] = "[%w\x2e]+[\x3a][%d]+"
        }, 
        [3] = {
          ["name"] = "𝗕𝗟𝗢𝗖𝗞𝗘𝗗 𝗥𝗢𝗢𝗧",
          ["regex"] = "(.*)"
        }, 
        [4] = {
          ["name"] = "𝗟𝗢𝗖𝗞 𝗣𝗔𝗬𝗟𝗢𝗔𝗗 𝗔𝗡𝗗 𝗦𝗘𝗥𝗩𝗘𝗥",
          ["regex"] = "(.*)"
        }, 
        [5] = {
            ["name"] = "𝗘𝗫𝗣𝗜𝗥𝗘 𝗧𝗜𝗠𝗘",
            ["regex"] = "(.*)"
        },
        [6] = {
          ["name"] = "𝗖𝗢𝗡𝗧𝗔𝗜𝗡𝗦 𝗡𝗢𝗧𝗘𝗦",
          ["regex"] = "(.*)"
        },
        [7] = {
            ["name"] = "𝗡𝗢𝗧𝗘𝗦",
            ["regex"] = "(.*)"
        },
        [8] = {
            ["name"] = "𝗔𝗞𝗨𝗡 𝗦𝗦𝗛",
            ["regex"] = "[0-9a-zA-Zx\x2e\x2d]+:[%d]+@[%w\x2e\x2d]+:[%w]+"
        }, 
        [9] = {
          ["name"] = "𝗟𝗢𝗖𝗞𝗘𝗗 𝗠𝗢𝗕𝗜𝗟𝗘 𝗗𝗔𝗧𝗔",
          ["regex"] = "(.*)"
        }, 
        [10] = {
          ["name"] = "𝗨𝗡𝗟𝗢𝗖𝗞 𝗣𝗥𝗢𝗫𝗬",
          ["regex"] = "(.*)"
        }, 
        [11] = {
          ["name"] = "𝗨𝗡𝗞𝗡𝗢𝗪𝗡",
          ["regex"] = "(.*)"
        }, 
        [12] = {
          ["name"] = "𝗩𝗣𝗡 𝗔𝗗𝗗𝗥𝗘𝗦𝗦",
          ["regex"] = "(.*)"
        }, 
        [13] = {
            ["name"] = "𝗦𝗡𝗜",
            ["regex"] = "[%w\x2e\x2d]+[\x2e]+[%w]+"
        },
        [14] = {
          ["name"] = "𝗖𝗢𝗡𝗡𝗘𝗖𝗧 𝗦𝗦𝗛",
          ["regex"] = "(.*)"
        },
        [15] = {
          ["name"] = "𝗨𝗗𝗣𝗚𝗪 𝗣𝗢𝗥𝗧",
          ["regex"] = "(.*)"
        },
        [16] = {
          ["name"] = "𝗟𝗢𝗖𝗞 𝗣𝗔𝗬𝗟𝗢𝗔𝗗",
          ["regex"] = "(.*)"
        },
        [17] = {
          ["name"] = "𝗛𝗪𝗜𝗗 𝗘𝗡𝗔𝗕𝗟𝗘𝗗",
          ["regex"] = "(.*)"
        },
        [18] = {
          ["name"] = "𝗛𝗪𝗜𝗗 𝗩𝗔𝗟𝗨𝗘",
          ["regex"] = "(.*)"
        },
        [19] = {
          ["name"] = "𝗡𝗢𝗧𝗘 𝟮",
          ["regex"] = "(.*)"
        },
        [20] = {
          ["name"] = "𝗨𝗡𝗟𝗢𝗖𝗞 𝗨𝗦𝗘𝗥 𝗔𝗡𝗗 𝗣𝗔𝗦𝗦𝗪𝗢𝗥𝗗",
          ["regex"] = "(.*)"
        },
        [21] = {
          ["name"] = "𝗦𝗦𝗟 𝗣𝗔𝗬𝗟𝗢𝗔𝗗 𝗠𝗢𝗗𝗘",
          ["regex"] = "(.*)"
        },
        [22] = {
          ["name"] = "𝗣𝗔𝗦𝗦𝗪𝗢𝗥𝗗 𝗣𝗥𝗢𝗧𝗘𝗖𝗧𝗘𝗗",
          ["regex"] = "(.*)"
        },
        [23] = {
          ["name"] = "𝗣𝗔𝗦𝗦𝗪𝗢𝗥𝗗 𝗩𝗔𝗟𝗨𝗘",
          ["regex"] = "(.*)"
        },
        [27] = {
            ["name"] = "𝗩𝟮𝗥𝗔𝗬",
            ["regex"] = "(.*)"
        },
        [30] = {
            ["name"] = "𝗡𝗮𝗺𝗲 𝗦𝗲𝗿𝘃𝗲𝗿",
            ["regex"] = "[%w\x2e\x2d]+[\x2e]+[%w]+"
        },
        [31] = {
            ["name"] = "𝗣𝘂𝗯𝗹𝗶𝗰 𝗞𝗲𝘆",
            ["regex"] = "^[a-fA-F0-9]+$"
        },
        [32] = {
            ["name"] = "𝗗𝗡𝗦 𝗛𝗼𝘀𝘁",
            ["regex"] = "[%w\x2e\x2d]+[\x2e]+[%w]+"
        }
    }

    local message = " <!> 𝗗𝗘𝗖𝗥𝗬𝗣𝗧 𝗕𝗬 𝗩𝗔𝗟𝗗𝗬 <!>\n <!> 𝗗𝗜𝗥𝗘𝗖𝗧𝗟𝗬 𝗙𝗥𝗢𝗠 𝗟𝗨𝗔 <!>\n"

    for index, value in ipairs(tbl) do

        if cfgRegex[index] and value:match(cfgRegex[index]["regex"]) then
            local namaKonten = cfgRegex[index]["name"]
            local valueRegexKonten = value:match(cfgRegex[index]["regex"])

            -- print(namaKonten.." ► "..valueRegexKonten.."\n\n")
            message = message..namaKonten.." ► ```"..valueRegexKonten.."```\n\n"
        end

    end

    message = message.."𝗗𝗘𝗖𝗥𝗬𝗣𝗧 𝗦𝗨𝗖𝗖𝗘𝗦𝗦 < ✔ >"
    return message
end

local data = io.open("./decrypt_15.txt", "rb"):read("*all")
-- local data = io.open("./decrypt_12.txt", "rb"):read("*all")
-- print(hexdecode)
-- data = hexencode(data)
-- data = data:gsub("00", "20")
-- data = data:gsub("20", "z")
-- data = data:gsub("66 61 6c 73 65", "F A L S E")
-- data = data:gsub("\x20", "")
-- data = data:gsub("\n", "")
-- local separator = data:match("FALSE[\x7a]+(.-)[\x7a]+")
-- data = data:gsub(separator, "0a56616c647947616e74656e67")
-- separator = "0a56616c647947616e74656e67"
-- data = data:gsub("z", "20")
-- data = data:gsub("FALSE", "66616c7365")

-- local ConfigTabel = prosesData(data, separator)
-- local ConfigTabel = prosesData(data)
-- local hasil = getOutput(ConfigTabel)

-- local hasil = hexdecode(data)
-- print(hexencode("\\r"))

-- print(data)

if data:match("66616C7365") then
    local ConfigTabel = prosesData(hexdecode(data))
else 
    local ConfigTabel = prosesData(data)
end

local hasil = getOutput(ConfigTabel)


io.open("./testluaDec.txt", "w"):write(hexdecode(data))
io.open("./testluaEnc.txt", "w"):write(data)

-- print(data)

-- value = data.gmatch("[^0a56616c647947616e74656e67]+")
-- print(splitString(data, "0a56616c647947616e74656e67"))

-- print("false : "..hexencode("false"))
-- print("true : "..hexencode("true"))
-- print("target : "..hexencode("!#$"))
-- print("target : "..hexdecode(hexencode("!#$")))
-- print("target : "..hexdecode("c2b0c2b1"))

-- expDate = checkMatch(cfgRegex["expDate"], hexdecode(data))

-- separator = hexdecode(separator):

-- print(data)
-- -- ganti spasi (00, 20) terenkode jadi teks spasi (s) 

-- -- ganti false (66616c7365) terenkode jadi teks false  !BUG DETECTED
-- -- FIXED WITH ubah jadi another teks yang gak mengandung tiap karakter diteks false
-- -- data = string.gsub(data, "66616c7365", "bool")

-- -- -- -- Cari Separator
-- separator = data:match("66616c7365[z]+(%x+)")
-- print(separator)

-- -- -- ubah spasi (s) jadi bentuk encode lagi (20)
-- data = string.gsub(data, "z", "20")

-- -- -- ubah false (66616c7365) jadi bentuk encode lagi (66616c7365)
-- -- data = string.gsub(data, "bool", "66616c7365")

-- -- -- -- Hapus Baris Baru
-- data = string.gsub(data, "0a", "") 

-- -- Hapus Koma
-- data = string.gsub(data, "2c", "")

-- separator = hexdecode(separator):gsub("[^\x20-\x7E]","")
-- data = hexdecode(data):gsub(separator,"")
-- -- -- Ubah separator jadi karakter koma (hexaencode)
-- data = string.gsub(data, separator, "658385")

-- fixedConfig = {}
-- print(separator)

-- for value in hexdecode(data):gmatch("[^%,]+") do
--     print(value)
-- end

-- print(data)



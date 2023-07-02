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
        return string.format("%02x", char:byte())
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

local function findSeparator(key, str)
    result = nil
    for value in str:gmatch(key) do
        result = value
    end
    return result
end

local function strip(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function tableToText(tbl)
    local result = ""

    for index, value in ipairs(tbl) do
        result = result..value
    end

    return result
end

local function fixedDataToTable(str, expdate)

    local function fixConfigTable(tbl) 
        local expdate = expdate:gsub("-", "[\45]")
        local beginindex = nil
        local lastindex = nil

        -- GetBeginIndex
        for index, value in ipairs(tbl) do

            if (value:match(expdate) and value:match("splitConfig") == nil and value:match("verCfg") == nil) then
                beginindex = index - 4
                lastindex = index + 40
            end

        end

        local fixedTable = {}

        -- Fix Table After Begin Index
        for index, value in ipairs(tbl) do

            if (index >= beginindex and index <= lastindex) then
                table.insert(fixedTable, value) 
            end
        end

        return fixedTable
    end
    
    result = {}
    for value in str:gmatch("[^%\n]+") do
        table.insert(result, value)
    end

    -- print(result[8])
    local fixedtable = fixConfigTable(result)
    return fixedtable
    -- return result2
end


cfgRegex = {
    [1] = { --ExpireTime
        "%d%d%d%d[\45]%d%d[\45]%d%d[\32]%d%d[\58]%d%d",
        "lifeTime"
    },
    [2] = {
        ["name"] = "Payload",
        ["regex"] = "[a-zA-Z]+[\x20]+.*[\x5bcrlf\x5d]+"
    }, 
    [3] = {
        ["name"] = "AkunSSH",
        ["regex"] = "[0-9a-zA-Zx\x2e\x2d]+:[%d]+@[%w\x2e\x2d]+:[%w]+"
    }, 
    [4] = {
        ["name"] = "Proxy",
        ["regex"] = "[%w\x2e]+[\x3a][%d]+"
    }, 
    [5] = {
        ["name"] = "SNI",
        ["regex"] = "[%w\x2e\x2d]+[\x2e]+[%w]+"
    }
}





-- for key,value in pairs(cfgRegex) do 
    -- print(key,value) 
-- end

local function getPrettyConfig(str)
    str = str:gsub("[\x00]+"," ")
    str = str:gsub("\n","")
    str = str:gsub("\\r\\n","[crlf]")
    str = str:gsub("\\r","[crlf]")
    str = str:gsub("\\n","[crlf]")
    str = str:gsub("[^\x00\x20-\x7E]","")
    local separator = " "..findSeparator("false[\x20]+([\x21-\x7E]+)[\x20]+",str).." "
    str = str:gsub(separator,"\n")
    local expDate = checkMatch(cfgRegex[1], str)
    local fixedConfig = fixedDataToTable(str, expDate)
    local fixedConfigString = tableToText(fixedConfig)

    io.open("./testluaEnc.txt", "w"):write(fixedConfigString)

    return fixedConfig
end

local function getOutput(tbl)
    local output = {
        ["Payload"] = nil, --tbl[1]
        ["AkunSSH"] = nil,  --tbl[7]
        ["Proxy"] = nil, --tbl[2]
        ["SNI"] = nil
    }

    -- / = (2f) : = (3a) . = (2e) - = (2d) [ = (5b) ] = (5d)

    -- ((?:[\w-]+\.)*[\w-]{1,63}(?:\.(?:\w{3}|\w{2})):(?:\d{2,})) [%w]+[\x2e][%w]+[\x2e][%w]+[\x2e][%w]+[\x3a][%d]+ Proxy
    -- ([\w\-\.]+:[\d]+@[\w\-\.]+:[\w]+)

    -- print(tbl[21])
    -- print(tbl[21]:match())

    -- for index, value in ipairs(tbl) do
    --     if value:match("[%w]+[\x2e][%w]+[\x2e][%w]+[\x2e][%w]+[\x3a]%d") then
    --         print(value)
    --         print(value:match("[%w]+[\x2e][%w]+[\x2e][%w]+[\x2e][%w]+[\x3a]%d"))
    --     end
    -- end

    local function indexExist(str, indexNum)
        for value in str:gmatch("[^\n]+") do
            if value:match(indexNum) then
                return true
            end
        end
        return nil
    end

    local filledIndex = "kosong\n"
    local filterSNI = ":\n"

    for indexRgx, valueRgx in ipairs(cfgRegex) do

        if indexRgx ~= 1 then

            for indexTbl, valueTbl in ipairs(tbl) do 

                    local findMatchRGX = cfgRegex[indexRgx]["regex"]
                    local nameMatchRGX = cfgRegex[indexRgx]["name"]

                if nameMatchRGX == "AkunSSH" and output["AkunSSH"] == nil and valueTbl:match(findMatchRGX) and indexExist(filledIndex, indexTbl) == nil then

                    output[nameMatchRGX] = valueTbl:match(findMatchRGX)
                    
                    local ketemu = false
                    for i = 1, 5 do

                        if tbl[indexTbl + i]:match(cfgRegex[5]["regex"]) then
                            -- print("HIGHLIGHT"..tbl[indexTbl + i]:match(cfgRegex[5]["regex"]))
                            output[cfgRegex[5]["name"]] = tbl[indexTbl + i]:match(cfgRegex[5]["regex"])
                            IndexSNI = indexTbl + i
                            filledIndex =  filledIndex..indexTbl..IndexSNI.."\n"
                            print(cfgRegex[5]["name"].." => "..output[cfgRegex[5]["name"]])
                            print(nameMatchRGX.." => "..output[nameMatchRGX])
                            ketemu = true
                            break
                        end
                    end
                    
                    if ketemu == false then
                        output[cfgRegex[5]["name"]] = "kosong"
                        filledIndex =  filledIndex..indexTbl.."\n"
                        print(nameMatchRGX.." => "..output[nameMatchRGX])
                    end
                    
                    
                    break
                elseif valueTbl:match(findMatchRGX) and indexExist(filledIndex, indexTbl) == nil and output[nameMatchRGX] == nil then
                    output[nameMatchRGX] = valueTbl:match(findMatchRGX)
                    filledIndex =  filledIndex..indexTbl.."\n"
                    print(nameMatchRGX.." => "..output[nameMatchRGX])
                end
            end
        end
    end
    --     if value:match(cfgRegex["AkunSSH"]) then

    --         matcha = value:match(cfgRegex["AkunSSH"])
    --         -- print(matcha)
    --         output["AkunSSH"] = matcha
    --     end
    -- end

    -- print(output["AkunSSH"])



    -- print(tbl[1]:match("GET[\x20]+.*[\x5bcrlf\x5d]+"))
    -- print(tbl[1])
    -- ((GET|HEAD|POST|PUT|DELETE)[\w\/\:\ \[\]\.\-]+\])

    -- GET[\x20]+[%w\x2f\x3a\x2e\x2d\x20\x5b\x5d]+\x5d
    
    -- for index, value in ipairs(tbl) do
    --     print(value)
    -- end
end

local data = io.open("./decrypt_3.txt", "rb"):read("*all")
data = getPrettyConfig(data)
getOutput(data)
-- print(str)
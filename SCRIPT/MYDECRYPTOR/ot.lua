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

local function prosesData(data)

    local function strip(s)
        return (s:gsub("^%s*(.-)%s*$", "%1"))
    end

    local function splitString(str)
        local startIdx = "3c 70 72 6f 70 65 72 74 69 65 73 3e"
        local endIdx = "3c 2f 70 72 6f 70 65 72 74 69 65 73 3e" 


        str = str:match(startIdx.."(.*)"..endIdx)
        str = str:gsub("\x20","")
        -- print(hexdecode(str))
        local tbl = {}

        local count = 1

        for value in str:gmatch("[^\n]+") do
            value = strip(hexdecode(value)):gsub("\""," doubleQuote ")
            
            local key_cfg = value:match("<entry key= doubleQuote (.*) doubleQuote >")
            local value_cfg = value:match("<entry key= doubleQuote .* doubleQuote >(.*)</entry>")

            if (key_cfg and value_cfg) then 
                table.insert(tbl, key_cfg.."batas"..value_cfg)
            elseif key_cfg then 
                table.insert(tbl, key_cfg.."batas".."kosong")
            end

            -- table.insert(tbl, nil)
            -- print("["..count.."] = \""..checkMatch1.."\",")
            count = count + 1

            
            -- print(:match("<entry key="(.*)">1</entry>"))
        --     -- print(hexdecode(value)) 
        --     while value:match(startIdx) or value:match(endIdx) then
        --         -- print(strip(hexdecode(value)):gsub("[^\x20-\x7e]+","")) 
        --         print(strip(hexdecode(value)):gsub("[^\x20-\x7e]+",""))
        --     end
        end

        return tbl
    end

    
    data = data:gsub("0a","\n")
    -- print(hexencode("\n"))
    data = splitString(data)

    -- for i, v in ipairs(data) do 
    --     print(i.." : "..v)
    -- end

    return data

end

local function prosesOutput(tbl)

    local cfgContent = {
        [1] = "loginHome",
        [2] = "checkRoot",
        [3] = "sshUser",
        [4] = "sshServer",
        [5] = "sshPass",
        [6] = "LockHost",
        [7] = "HWID",
        [8] = "file.askLogin",
        [9] = "dnspu",
        [10] = "dnsst",
        [11] = "dnsnameserver",
        [12] = "file.validate",
        [13] = "tunnelType",
        [14] = "dnsResolver",
        [15] = "sshPort",
        [16] = "udpResolver",
        [17] = "file.appVersionCode",
        [18] = "dnsForward",
        [19] = "userProxyAuthentication",
        [20] = "proxyPayload",
        [21] = "udpForward",
        [22] = "file.protection",
        [23] = "userDefaultPayload",
        [24] = "sshPortLocal",
    }
    
    msg = "DECRYPT BY RIKA WINDI\n"

    for i, v in ipairs(tbl) do 
        for indexCfgContent, valueCfgContent in ipairs(cfgContent) do

            local key_cfg = v:match("(.*)batas.*")
            local value_cfg = v:match(".*batas(.*)")

            if key_cfg == valueCfgContent then
                msg = msg..cfgContent[indexCfgContent].." =>\n"..value_cfg.."\n\n"
                break
            else
                msg = msg..key_cfg.." =>\n"..value_cfg.."\n\n"
                break
            end

        end
        -- if (v and cfgContent[i]) then 
        --     -- print(cfgContent[i].." =>\n"..v)
        --     msg = msg..cfgContent[i].." =>\n"..v.."\n\n"
        -- end
    end

    msg = msg.."✓ Decrypt Success..!!"

    return msg

end

local content = io.open("./Dec_OpenTunnel2.txt", "rb"):read("*a")
print(content)
content = hexencode(content)
content = prosesData(content)
local message =prosesOutput(content)

print(message)
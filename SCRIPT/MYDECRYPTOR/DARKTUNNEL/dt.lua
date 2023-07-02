-- FUNCTION DECLARATION
local function strip(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function hexencode(str)
    return (str:gsub(".", function(char)
        return string.format("%02x ", char:byte())
    end))
end

local function hexdecode(hex)
    return (hex:gsub("%x%x", function(digits)
        return string.char(tonumber(digits, 16))
    end))
end

local function splitString(str) 
    tblCfg = {
        [1] = "VersionCode",
		[2] = "VersionName",
		[3] = "Message",
		[4] = "ConnectedMessage",
		[5] = "ExpiredAtTimestamp",
		[6] = "TunnelType",
		[7] = "SshConfigLocked",
		[8] = "SshConfig",
		[9] = "Host",
		[10] = "Port",
		[11] = "Username",
        [12] = "Password",
		[13] = "DnsttConfig",
		[14] = "DnsHost",
		[15] = "DnsPort",
		[16] = "ServerName",
		[17] = "Pubkey",
		[18] = "InjectConfig",
		[19] = "Mode",
		[20] = "ProxyHost",
		[21] = "ProxyPort",
		[22] = "ServerNameIndication",
		[23] = "Payload",
		[24] = "V2RayConfig",
		[25] = "TargetHost",
		[26] = "TargetPort",
		[27] = "Config",
    }
    
    local firstValue, secondValue, checkMatch = "", str, ""

    local msg = ""

    -- print(str)
    -- os.exit()

    for index, value in ipairs(tblCfg) do

        if index < 27 then
            firstValue, secondValue = str:match(tblCfg[index].."(.-)"..tblCfg[index + 1].."(.*)")

            if index >= 3 and index <= 4 then
                goto continue
            end

            checkMatch = firstValue:gsub("[^\x20-\x7e]+","")

            firstValue = ( function() if checkMatch ~= "" then return checkMatch else return "" end end) ()

            print(index.." : "..firstValue)
	    print(index.." : "..checkMatch)

        else
            checkMatch = secondValue:gsub("[^\x20-\x7e]+",""):match("(.*[\x7d][\x7d])")
            firstValue = ( function() if checkMatch then return checkMatch else return "" end end) ()
            -- print(index.." : "..strip(firstValue)) 
        end

        if firstValue == "" or firstValue:len() == 1 then
            goto continue
        end

        msg = msg..value.." : "..strip(firstValue).."\n\n"
        ::continue::
    end

    print(msg)

end
-- END OF FUNCTION DECLARATION

local data = io.open("./darktunnel5.txt", "rb"):read("*a")
data = hexencode(data)
data = data:gsub("00", "")
data = data:gsub("0a", "")
data = data:gsub("[\x20]", "")
data = data:match("(56657273696f6e436f6465.*)")
data = hexdecode(data)

-- print(hexencode(data))
-- print(hexdecode(data))

-- local match1 = data:match("VersionCode(.*)VersionName"):gsub("[^\x20-\x7e]+","")
print(splitString(data))
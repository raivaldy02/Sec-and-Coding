limit = false
targetInfo = gg.getTargetInfo()
app = targetInfo.packageName

function rwmem(Address, SizeOrBuffer)
  assert(Address ~= nil, "[rwmem]: error, endereço fornecido é nulo.")
  _rw = {}
  if type(SizeOrBuffer) == "number" then
    _ = ""
    do
      do
        for _FORV_5_ = 1, SizeOrBuffer do
          _rw[_FORV_5_] = {
            address = Address - 1 + _FORV_5_,
            flags = gg.TYPE_BYTE
          }
        end
      end
    end
    do
      do
        for _FORV_5_, _FORV_6_ in ipairs(gg.getValues(_rw)) do
          if _FORV_6_.value == 0 and limit == true then
            return _
          end
          _ = _ .. string.format("%02X", _FORV_6_.value & 255)
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
  end
  )
  gg.setValues(_rw)
end

function hexdecode(hex)
  return (hex:gsub("%x%x", function(digits)
    return string.char(tonumber(digits, 16))
  end
  ))
end

function hexencode(str)
  return (str:gsub(".", function(char)
    return string.format("%2x", char:byte())
  end
  ))
end

function Dec2Hex(nValue)
  nHexVal = string.format("%X", nValue)
  sHexVal = nHexVal .. ""
  return sHexVal
end

function ToInteger(number)
  return math.floor(tonumber(number) or error("Não foi possível transmitir '" .. tostring(number) .. "' enumerar.'"))
end

function save(data)

  local function hexdecode_2(hex)
      return (hex:gsub("%x%x", function(digits)
          return string.char(tonumber(digits, 16))
      end))
  end

  local function hexencode_2(str)
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
        local tbl = {}

        for value in str:gmatch("[^\n]+") do
            value = strip(hexdecode(value)):gsub("\""," doubleQuote ")
            
            local key_cfg = value:match("<entry key= doubleQuote (.*) doubleQuote >")
            local value_cfg = value:match("<entry key= doubleQuote .* doubleQuote >(.*)</entry>")

            if (key_cfg and value_cfg) then 
                table.insert(tbl, key_cfg.."batas"..value_cfg)
            elseif key_cfg then 
                table.insert(tbl, key_cfg.."batas".."kosong")
            end
     
        end

        return tbl
    end

    
    data = data:gsub("0a","\n")
    data = splitString(data)

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
    
    local msg = "DECRYPT BY RIKA WINDI\n"

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
    end

    msg = msg.."✓ Decrypt Success..!!"

    return msg
  end

  io.open(gg.EXT_STORAGE .. "/decrypt.txt", "w"):write(data)
  gg.toast("✅ 𝐀𝐥𝐥 𝐌𝐞𝐭𝐨𝐝𝐞 𝐒𝐮𝐤𝐬𝐞𝐬")

  data = hexencode_2(data)
  data = prosesData(data)
  local message = prosesOutput(data)
  gg.copyText(message, false)
  gg.alert(message)

end

function pbinjection() 
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_JAVA_HEAP | gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_JAVA | gg.REGION_C_HEAP | gg.REGION_PPSSPP | gg.REGION_C_DATA | gg.REGION_C_BSS | gg.REGION_STACK | gg.REGION_ASHMEM | gg.REGION_BAD)
    gg.searchNumber("h 3C 2F 65 6E 74 72 79 3E 0A 3C 65 6E 74 72 79 20 6B 65 79 3D", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
  
    if #r < 1 then
        gg.toast("𝐌𝐞𝐭𝐨𝐝𝐞 𝐟𝐚𝐢𝐥𝐝")
        tnl_method2 = true
end
if tnl_method2 then


        gg.searchNumber("h 3C 2F 65 6E 74 72 79 3E 0A 3C 65 6E 74 72 79 20 6B 65 79 3D", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
        local r = gg.getResults(1)
        
        if #r < 1 then
            gg.toast("𝐌𝐞𝐭𝐨𝐝𝐞 𝐟𝐚𝐢𝐥𝐝")
            tnl_method3 = true
        end
    end
    
    if tnl_method3 then
        gg.toast("𝐀𝐥𝐥 𝐌𝐞𝐭𝐨𝐝𝐞 𝐅𝐚𝐢𝐥𝐝")
    print("𝐀𝐥𝐥 𝐌𝐞𝐭𝐨𝐝𝐞 𝐅𝐚𝐢𝐥𝐝")
        os.exit()
    end
    local r = gg.getResults(1000)
   if limit == true then
        r[1].address = r[1].address - 8192
    end
    
    readedMem = rwmem(r[1].address, 20000)
    save(hexdecode(readedMem))
    gg.toast("✅ 𝐀𝐥𝐥 𝐌𝐞𝐭𝐨𝐝𝐞 𝐒𝐮𝐤𝐬𝐞𝐬")
  print("✅ 𝐀𝐥𝐥 𝐌𝐞𝐭𝐨𝐝𝐞 𝐒𝐮𝐤𝐬𝐞𝐬")
    gg.clearResults()
    end  

if app == "com.sihiver.pbinjector" then
  pbinjection()
  
elseif app == "com.opentunnel.app" then
pbinjection()
  else

gg.toast("𝐀𝐩𝐩𝐥𝐢𝐜𝐚𝐭𝐢𝐨𝐧")
print("\n❌ 𝐀𝐩𝐥𝐢𝐤𝐚𝐬𝐭𝐢𝐨𝐧 𝐍𝐨 𝐬𝐮𝐩𝐨𝐫𝐭\n")
end

gg.clearResults()
os.exit()

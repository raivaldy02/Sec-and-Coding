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
    return string.format("%02x ", char:byte())
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

function strip(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function save(data)

  local function prosesOutput(str) 
    
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
    
    str = hexencode(str)
    str = str:gsub("00", "")
    str = str:gsub("0a", "")
    str = str:gsub("[\x20]", "")
    str = str:match("(56657273696f6e436f6465.*)")
    str = hexdecode(str)
    
    local firstValue, secondValue, checkMatch = "", str, ""
    local msg = "𝐃𝐄𝐂𝐑𝐘𝐏𝐓 𝐀𝐏𝐏 𝐃𝐀𝐑𝐊 𝐓𝐔𝐍𝐍𝐄𝐋\n━━━━━━━━━━━━━━━━━━━\n"

    for index, value in ipairs(tblCfg) do

      if index < 27 then
          firstValue, secondValue = str:match(tblCfg[index].."(.-)"..tblCfg[index + 1].."(.*)")

          if index >= 3 and index <= 4 then
              goto continue
          end

          checkMatch = firstValue:gsub("[^\x20-\x7e]+","")

          firstValue = ( function() if checkMatch ~= "" then return checkMatch else return "" end end) ()

      else
          checkMatch = secondValue:gsub("[^\x20-\x7e]+",""):match("(.*[\x7d][\x7d])")
          firstValue = ( function() if checkMatch then return checkMatch else return "" end end) ()
      end

      if firstValue == "" or firstValue:len() == 1 then
        goto continue
      end

      msg = msg..value.." : "..strip(firstValue).."\n\n"
      ::continue::
    end
    
    

    msg = msg.. "━━━━━━━━━━━━━━━━━━━\n"
    msg = msg.. "⎛ 𝐂𝐨𝐝𝐞 𝐛𝐲 ⎠ @Rikawindi\n"
    return msg
  end

  io.open(gg.EXT_STORAGE .. "/Dec_All_Method.txt", "w"):write(data)
  gg.toast("✅ 𝐀𝐥𝐥 𝐌𝐞𝐭𝐨𝐝𝐞 𝐒𝐮𝐤𝐬𝐞𝐬")
  output = prosesOutput(data)
  gg.copyText(output, false)
  gg.alert(output)

end


function RXS()
    gg.clearResults()
    gg.setRanges(gg.REGION_JAVA_HEAP | gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_JAVA | gg.REGION_C_HEAP | gg.REGION_PPSSPP | gg.REGION_C_DATA | gg.REGION_C_BSS | gg.REGION_STACK | gg.REGION_ASHMEM | gg.REGION_BAD)
  gg.setVisible(false)
  gg.searchNumber("h 7b 22 56 65 72 73 69 6f 6e 43 6f 64 65 22 3a", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
  local r = gg.getResults(1)
  if #r < 1 then
    gg.toast("𝐌𝐞𝐭𝐨𝐝𝐞 𝐟𝐚𝐥𝐢𝐝")
    dark_method2 = true
  end
  if dark_method2 then
    gg.searchNumber("h 53 73 68 43 6F 6E 66 69 67 4C 6F 63 6B 65 64 C3 A9 53 73 68 43 6F 6E 66 69 67", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("𝐌𝐞𝐭𝐨𝐝𝐞 𝐟𝐚𝐥𝐢𝐝") 
      dark_method3 = true
    end
    end
if dark_method3 then
    gg.searchNumber("h 4d 65 73 73 61 67 65 22 3a", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("𝐌𝐞𝐭𝐨𝐝𝐞 𝐟𝐚𝐥𝐢𝐝")
      dark_method4 = true
    end
  end
if dark_method4 then
    gg.searchNumber("h 55 70 67 72 61 64 65 3a", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("𝐌𝐞𝐭𝐨𝐝𝐞 𝐟𝐚𝐥𝐢𝐝")
      dark_method5 = true
    end
  end
if dark_method5 then
    gg.searchNumber("h 7b 22 48 6f 73 74 22 3a", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("𝐌𝐞𝐭𝐨𝐝𝐞 𝐟𝐚𝐥𝐢𝐝")
      dark_method6 = true
    end
end
if dark_method6 then
    gg.searchNumber("h 69 6e 62 6f 75 6e 64 73", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("𝐌𝐞𝐭𝐨𝐝𝐞 𝐟𝐚𝐥𝐢𝐝")
      dark_method7 = true
    end
  end
if dark_method7 then
  gg.toast("❌ Pai não encontrado")
        print("⚠ primeiro as primas.")
    os.exit()
  end
  local r = gg.getResults(1000)
  if limit == false then
    r[1].address = r[1].address - 8192
  end
  readedMem = rwmem(r[1].address, 20000)
  save(hexdecode(readedMem))
  gg.toast("🔑Script Ditemukan")
  print("Goat Lionel Messi!\n\n Script Berada Di: /sdcard/siu.txt")
  gg.clearResults()
end

if app == "net.darktunnel.app" then
  RXS()
  else  
gg.toast("𝐀𝐩𝐩𝐥𝐢𝐜𝐚𝐭𝐢𝐨𝐧")
print("\n❌ 𝐀𝐩𝐥𝐢𝐤𝐚𝐬𝐭𝐢𝐨𝐧 𝐍𝐨 𝐬𝐮𝐩𝐨𝐫𝐭 \n")
print("𝐒𝐞𝐜𝐫𝐢𝐩𝐭 𝐮𝐧𝐭𝐮𝐤 𝐩𝐬𝐢𝐩𝐡𝐨𝐧 𝐡𝐜") 
end

gg.clearResults()
os.exit()

--[[
Detector = gg.getFile():match("[^/]+$")
Name = "𝗜𝗘 • 𝗗𝗲𝗰𝗿𝘆𝗽𝘁𝗼𝗿.lua"
if Detector == Name then
  gg.alert("✓ 𝐒𝐜𝐫𝐢𝐩𝐭 𝐈𝐬 𝐧𝐨𝐭 𝐑𝐞𝐧𝐚𝐦𝐞𝐝 : \n")
else
  Error = "⚠ 𝐅𝐢𝐥𝐞 𝐑𝐞𝐧𝐚𝐦𝐞 𝐈𝐬 𝐃𝐞𝐭𝐞𝐜𝐭𝐞𝐝\n⚠ 𝐑𝐞𝐯𝐞𝐫𝐭 𝐓𝐨 𝐎𝐫𝐢𝐠𝐢𝐧𝐚𝐥 𝐍𝐚𝐦𝐞 𝐈𝐟 𝐘𝐨𝐮 𝐃𝐨𝐧𝐭 𝐖𝐚𝐧𝐭 𝐄𝐫𝐫𝐨𝐫"
  print(Error)
  return
end
]]
gg.toast("𝐒𝐜𝐫𝐢𝐩𝐭 𝐀𝐜𝐭𝐢𝐯𝐞𝐝")
gg.setVisible(true)
LuaLibraryTool = -1
gg.alert("༝ 𝐈𝐄 • 𝐃𝐞𝐜𝐫𝐲𝐩𝐭𝐨𝐫 𝐕𝟏.𝟏\n༝ 𝐂𝐨𝐝𝐞𝐝 𝐁𝐲 : 𝐈𝐫𝐞𝐧𝐞_𝐄𝐬𝐭𝐞𝐛𝐚𝐧 ✖ 𝐏𝐔𝐒𝐒𝐘𝐖𝐀𝐆𝐎𝐎𝐍\n༝ 𝐇𝐚𝐫𝐝 𝐄𝐧𝐜𝐫𝐲𝐩𝐭𝐞𝐝 𝐋𝐮𝐚 𝐁𝐲 : ⍟ 🄳🄸🄿🄻🄾 ⍟\n༝ 𝐂𝐨𝐩𝐲𝐫𝐢𝐠𝐡𝐭 (𝐂) 𝐈𝐄𝐓𝐨𝐨𝐥𝐬 𝐆𝐫𝐮𝐛 - 𝟐𝟎𝟐𝟑", "⍈ 𝐌𝐞𝐧𝐮")
function HOME()
  MENU = gg.choice({
    "〘 ■ 〙『 𝐇𝐓𝐓𝐏 𝐂𝐮𝐬𝐭𝐨𝐦 』",
    "〘 ≡ 〙『 𝐌𝐨𝐫𝐞 𝐕𝐏𝐍 』",
    "〘 ✘ 〙 『 𝐄𝐱𝐢𝐭 𝐒𝐜𝐫𝐢𝐩𝐭 』"
  }, nil, os.date("༝ 𝐈𝐄 • 𝐃𝐞𝐜𝐫𝐲𝐩𝐭𝐨𝐫 𝐕𝟏.𝟏\n༝ 𝐓𝐡𝐢𝐬 𝐒𝐜𝐫𝐢𝐩𝐭 𝐈𝐬 𝐒𝐭𝐢𝐥𝐥 𝐈𝐧 𝐁𝐞𝐭𝐚 𝐒𝐭𝐚𝐠𝐞\n༝ 𝐖𝐚𝐢𝐭 𝐅𝐨𝐫 𝐍𝐞𝐱𝐭 𝐔𝐩𝐝𝐚𝐭𝐞..!!"))
  if MENU == nil then
  else
    if MENU == 1 then
      HttpCustom()
    end
    if MENU == 2 then
      MoreVPN()
    end
    if MENU == 3 then
      LOBBY()
    end
  end
  LuaLibraryTool = -1
end

function HttpCustom()
  httpcustommenu = gg.choice({
    "〘 ■ 〙『 𝐍𝐨𝐭𝐞𝐬 / 𝐁𝐚𝐧𝐧𝐞𝐫 』",
    "〘 ■ 〙『 𝐒𝐥𝐨𝐰𝐃𝐍𝐒 / 𝐃𝐍𝐒𝐓𝐓 』",
    "〘 ■ 〙『 𝐃𝐮𝐦𝐩 𝐕𝟏 』",
    "〘 ■ 〙『 𝐃𝐮𝐦𝐩 𝐕𝟐 』",
    "〘 ✘ 〙『 𝐁𝐚𝐜𝐤 』"
  }, nil, os.date("༝ 𝐇𝐂 𝐃𝐞𝐜𝐫𝐲𝐩𝐭𝐨𝐫 𝐓𝐨𝐨𝐥𝐬\n༝ 𝐀𝐭𝐭𝐞𝐧𝐭𝐢𝐨𝐧 : ❝ 𝐓𝐨 𝐃𝐞𝐜𝐫𝐲𝐩𝐭 𝐍𝐨𝐭𝐞𝐬 𝐘𝐨𝐮 𝐌𝐮𝐬𝐭 𝐄𝐱𝐢𝐭 𝐇𝐂 𝐀𝐩𝐩 𝐅𝐨𝐫 𝟑 𝐒𝐞𝐜𝐨𝐧𝐝𝐬 𝐀𝐧𝐝 𝐑𝐞𝐨𝐩𝐞𝐧 𝐈𝐭 ❞"))
  if httpcustommenu == 1 then
    NotesDump()
  end
  if httpcustommenu == 2 then
    SlowDnsDump()
  end
  if httpcustommenu == 3 then
    ShortDump()
  end
  if httpcustommenu == 4 then
    LongDump()
  end
  if httpcustommenu == 5 then
  end
  HOME()
  GLWW = -1
end

function NotesDump()
  limit = false
  function rwmem(Address, SizeOrBuffer)
    assert(Address ~= nil, "[rwmem]: error, provided address is nil.")
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
    return math.floor(tonumber(number) or error("Could not cast '" .. tostring(number) .. "' to number.'"))
  end
  
  function save(data)
    io.open(gg.EXT_STORAGE .. "/decrypt_banner.txt", "w"):write(hexdecode(data))
    gg.toast("✓ Decrypt Success..!!")
  end
  
  gg.setRanges(gg.REGION_JAVA_HEAP)
  gg.searchNumber("h 3c 0 68 0 74 0 6d 0 6c 0 3e 0", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
  local r = gg.getResults(1)
  if #r < 1 then
    gg.toast("✖ Method 1 failed")
    hc_method2 = true
  end
  if hc_method2 then
    gg.searchNumber("h 3c 68 74 6d 6c 3e 3c 68 31 20 73 74 79 6c 65 3d 22", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 2 failed")
      hc_method3 = true
    end
  end
  if hc_method3 then
    gg.searchNumber("h 3c 62 69 67 3e 3c 73 74 72 6f 6e 67 3e", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 3 failed")
      hc_method4 = true
    end
  end
  if hc_method4 then
    gg.searchNumber("h 3c 73 70 61 6e 20 73 74 79 6c 65 3d 22 63 6f 6c 6f 72 3a", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 4 failed")
      hc_method5 = true
    end
  end
  if hc_method5 then
    gg.searchNumber("h 3c 68 31 20 73 74 79 6c 65 3d 22 74 65 78 74 2d 61 6c 69 67 6e 3a 63 65 6e 74 65 72 22 3e", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 5 failed")
      hc_method6 = true
    end
  end
  if hc_method6 then
    gg.searchNumber("h 3c 66 6f 6e 74 20 63 6f 6c 6f 72 3d 22", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 6 failed")
      hc_method7 = true
    end
  end
  if hc_method7 then
    gg.searchNumber("h 3c 2f 66 6f 6e 74 3e 3c 66 6f 6e 74 20 63 6f 6c 6f 72 3d 20", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 7 failed")
      hc_method8 = true
    end
  end
  if hc_method8 then
    gg.searchNumber("h 3c 70 20 73 74 79 6c 65 3d 22", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 8 failed")
      hc_method9 = true
    end
  end
  if hc_method9 then
    gg.searchNumber("h 3c 73 70 61 6e 3e", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 9 failed")
      hc_method10 = true
    end
  end
  if hc_method10 then
    gg.searchNumber("h 3c 0 68 0 65 0 61 0 64 0 3e 0", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 10 failed")
      hc_method11 = true
    end
  end
  if hc_method11 then
    gg.searchNumber("h 3c 0 62 0 6f 0 64 0 79 0 3e 0", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 11 failed")
      hc_method12 = true
    end
  end
  if hc_method12 then
    gg.searchNumber("h 3c 68 31 3e", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 12 failed")
      hc_method13 = true
    end
  end
  if hc_method13 then
    limit = true
    gg.searchNumber("h 3c 0 42 0 69 0 67 0 3e 0 3c 0 42 0 69 0 67 0 3e 0", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 13 failed")
      hc_method14 = true
    end
  end
  if hc_method14 then
    limit = true
    gg.searchNumber("h 3c 0 2f 0 66 0 6f 0 6e 0 74 0 3e 0 3c 0 68 0 31 0 3e 0", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 14 failed")
      hc_method15 = true
    end
  end
  if hc_method15 then
    limit = true
    gg.searchNumber("h 3c 2f 62 3e 3c 2f 66 6f 6e 74 3e", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 15 failed")
      hc_method16 = true
    end
  end
  if hc_method16 then
    limit = true
    gg.searchNumber("h 3c 2f 73 70 61 6e 3e 20", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 16 failed")
      hc_method17 = true
    end
  end
  if hc_method17 then
    limit = true
    gg.searchNumber("h5B 73 70 6C 69 74 43 6F 6E 66 69 67 5D 74 72 75 65 5B 73 70 6C 69 74 43 6F 6E 66 69 67 5D", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 17 failed")
      hc_method18 = true
    end
  end
  if hc_method18 then
    limit = true
    gg.searchNumber("h5B 73 70 6C 69 74 43 6F 6E 66 69 67 5D 74 72 75 65 5B 73 70 6C 69 74 43 6F 6E 66 69 67 5D", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 18 failed")
      hc_method19 = true
    end
  end
  if hc_method19 then
    print("✖ All methods failed")
    os.exit()
  end
  local r = gg.getResults(100)
  if limit == false then
    r[1].address = r[1].address - 20480
  end
  readedMem = rwmem(r[1].address, 50000)
  save(readedMem)
  gg.clearResults()
end

function SlowDnsDump()
  limit = false
  function rwmem(Address, SizeOrBuffer)
    assert(Address ~= nil, "[rwmem]: error, provided address is nil.")
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
    return math.floor(tonumber(number) or error("Could not cast '" .. tostring(number) .. "' to number.'"))
  end
  
  function save(data)
    io.open(gg.EXT_STORAGE .. "/decrypt.txt", "w"):write(hexdecode(data))
  end
  
  gg.clearResults()
  gg.setRanges(gg.REGION_JAVA_HEAP)
  gg.setVisible(false)
  gg.searchNumber("h 3a 32 32 32 32 40", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
  local r = gg.getResults(1)
  if #r < 1 then
    gg.toast("⚠ Method 1 failed")
    hc_method2 = true
  end
  if hc_method2 then
    gg.searchNumber("h 3a 32 32 40", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("⚠ Method 2 failed")
      hc_method3 = true
    end
  end
  if hc_method3 then
    gg.searchNumber("h 3a 35 33 40", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("⚠ Method 3 failed")
      hc_method4 = true
    end
  end
  if hc_method4 then
    gg.searchNumber("h 3a 38 30 40", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("⚠ Method 4 failed")
      hc_method5 = true
    end
  end
  if hc_method5 then
    gg.searchNumber("h 3a 34 34 33 40", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("⚠ Method 5 failed")
      hc_method6 = true
    end
  end
  if hc_method6 then
    gg.searchNumber("h 31 2e 31 2e 31 2e 31 3a", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("⚠ Method 6 failed")
      hc_method7 = true
    end
  end
  if hc_method7 then
    gg.searchNumber("h 38 2e 38 2e 38 2e 38 3a", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("⚠ Method 7 failed")
      hc_method8 = true
    end
  end
  if hc_method8 then
    print("❌ All methods failed")
    os.exit()
  end
  local r = gg.getResults(1000)
  if limit == false then
    r[1].address = r[1].address - 20480
  end
  readedMem = rwmem(r[1].address, 50000)
  save(readedMem)
  gg.clearResults()
end

function ShortDump()
  limit = false
  function rwmem(Address, SizeOrBuffer)
    assert(Address ~= nil, "[rwmem]: error, provided address is nil.")
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
    return math.floor(tonumber(number) or error("Could not cast '" .. tostring(number) .. "' to number.'"))
  end
  
  function save(data)
    contentToDecrypt = hexdecode(data)
    io.open(gg.EXT_STORAGE .. "/decrypt.txt", "w"):write(contentToDecrypt)
    io.popen(gg.EXT_STORAGE .. "/fuck.py | clip")
    gg.toast("✓ Decrypt Success And Result Copied To Clipboard..!!")
  end
  
  gg.setRanges(gg.REGION_JAVA_HEAP)
  gg.searchNumber(":GET / HTTP/", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
  local r = gg.getResults(1)
  if #r < 1 then
    gg.toast("✖ Method 1 failed")
    hc_method2 = true
  end
  if hc_method2 then
    gg.searchNumber("Host: ", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 2 failed")
      hc_method3 = true
    end
  end
  if hc_method3 then
    gg.searchNumber(":inbounds", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 3 failed")
      hc_method4 = true
    end
  end
  if hc_method4 then
    gg.searchNumber(":[crlf]", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 4 failed")
      hc_method5 = true
    end
  end
  if hc_method5 then
    gg.searchNumber("Upgrade: websocket", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 5 failed")
      hc_method6 = true
    end
  end
  if hc_method6 then
    gg.searchNumber(":GET wss:", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 6 failed")
      hc_method7 = true
    end
  end
  if hc_method7 then
    gg.searchNumber(":[splitPsiphon][splitPsiphon]", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 7 failed")
      hc_method8 = true
    end
  end
  if hc_method8 then
    print("✖ All methods failed")
    os.exit()
  end
  local r = gg.getResults(11)
  if limit == false then
    r[1].address = r[1].address - 5376
  end
  readedMem = rwmem(r[1].address, 10000)
  save(readedMem)
  gg.clearResults()
end

function LongDump()
  limit = false
  targetInfo = gg.getTargetInfo()
  app = targetInfo.packageName
  function rwmem(Address, SizeOrBuffer)
    assert(Address ~= nil, "[rwmem]: error, provided address is nil.")
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
    return math.floor(tonumber(number) or error("Could not cast '" .. tostring(number) .. "' to number.'"))
  end
  
  function save(data)
    io.open(gg.EXT_STORAGE .. "/decrypt.txt", "w"):write(hexdecode(data))
    gg.toast("✓ Decrypt Success..!!")
  end
  
  gg.clearResults()
  gg.setRanges(gg.REGION_JAVA_HEAP)
  gg.setVisible(false)
  gg.searchNumber(":GET / HTTP/", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
  local r = gg.getResults(1)
  if #r < 1 then
    gg.toast("✖ Method 1 failed")
    hc_method2 = true
  end
  if hc_method2 then
    gg.searchNumber("Host: ", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 2 failed")
      hc_method3 = true
    end
  end
  if hc_method3 then
    gg.searchNumber(":inbounds", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 3 failed")
      hc_method4 = true
    end
  end
  if hc_method4 then
    gg.searchNumber(":[crlf]", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 4 failed")
      hc_method5 = true
    end
  end
  if hc_method5 then
    gg.searchNumber("Upgrade: websocket", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 5 failed")
      hc_method6 = true
    end
  end
  if hc_method6 then
    gg.searchNumber(":GET wss:", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 6 failed")
      hc_method7 = true
    end
  end
  if hc_method7 then
    gg.searchNumber(":[splitPsiphon][splitPsiphon]", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 7 failed")
      hc_method8 = true
    end
  end
  if hc_method8 then
    print("✖ All methods failed")
    os.exit()
  end
  local r = gg.getResults(10)
  if limit == false then
    r[1].address = r[1].address - 13568
  end
  readedMem = rwmem(r[1].address, 50000)
  save(readedMem)
  gg.clearResults()
end

function MoreVPN()
  morevpnmenu = gg.choice({
    "〘 ■ 〙『 𝐓𝐋𝐒 𝐓𝐮𝐧𝐧𝐞𝐥 』",
    "〘 ■ 〙『 𝐍𝐚𝐩𝐬𝐭𝐞𝐫𝐧𝐞𝐭𝐕 』",
    "〘 ■ 〙『 𝐇𝐀 𝐓𝐮𝐧𝐧𝐞𝐥 𝐏𝐥𝐮𝐬 』",
    "〘 ✘ 〙『 𝐁𝐚𝐜𝐤 』"
  }, nil, os.date("༝ 𝐎𝐧𝐥𝐲 𝐃𝐮𝐦𝐩 𝐅𝐨𝐫 𝐌𝐨𝐫𝐞 𝐕𝐏𝐍 𝐌𝐞𝐧𝐮\n༝ 𝐀𝐭𝐭𝐞𝐧𝐭𝐢𝐨𝐧 : 𝐅𝐨𝐫 𝐭𝐡𝐞 𝐌𝐨𝐫𝐞 𝐕𝐏𝐍 𝐦𝐞𝐧𝐮, 𝐰𝐡𝐢𝐥𝐞 𝐭𝐡𝐞𝐫𝐞 𝐚𝐫𝐞 𝐨𝐧𝐥𝐲 𝟑 𝐜𝐡𝐨𝐢𝐜𝐞𝐬, 𝐢𝐧 𝐭𝐡𝐞 𝐧𝐞𝐱𝐭 𝐮𝐩𝐝𝐚𝐭𝐞 𝐈 𝐰𝐢𝐥𝐥 𝐚𝐝𝐝 𝐦𝐨𝐫𝐞"))
  if morevpnmenu == 1 then
    tlstunnel()
  end
  if morevpnmenu == 2 then
    napsternetv()
  end
  if morevpnmenu == 3 then
    hatunnelplus()
  end
  if morevpnmenu == 4 then
  end
  HOME()
  GLWW = -1
end

function tlstunnel()
  function rwmem(Address, SizeOrBuffer)
    assert(Address ~= nil, "[rwmem]: error, provided address is nil.")
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
    return math.floor(tonumber(number) or error("Could not cast '" .. tostring(number) .. "' to number.'"))
  end
  
  function save(data)
    io.open(gg.EXT_STORAGE .. "/decrypt.txt", "w"):write(data)
    gg.toast("✅ BERHASIL COEG!")
    gg.clearResults()
    gg.setRanges(gg.REGION_JAVA_HEAP)
    gg.setVisible(false)
    gg.processResume()
    gg.searchNumber("h 63 69 70 68 65 72 31 2E 64 6F 46 69 6E 61 6C 28 63 72 79 70 74 6F 29", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method failed")
      print("⊗ 𝐈𝐦𝐩𝐨𝐫 𝐟𝐢𝐥𝐞 𝐝𝐚𝐧 𝐂𝐨𝐛𝐚 𝐥𝐚𝐠𝐢 𝐓𝐚𝐧𝐩𝐚 𝐌𝐞𝐧𝐮𝐭𝐮𝐩 𝐓𝐋𝐒 𝐓𝐮𝐧𝐧𝐞𝐥\n")
      os.exit()
    end
    readedMem = rwmem(r[1].address, 50000)
    save(hexdecode(readedMem))
    gg.clearResults()
  end
  
  function napsternetv()
    gg.clearResults()
    gg.setRanges(gg.REGION_JAVA_HEAP)
    gg.setVisible(false)
    gg.processResume()
    gg.searchNumber("h 22 76 65 72 73 69 6F 6E 69 6E 67", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 7 failed")
      print("⊗ 𝐈𝐦𝐩𝐨𝐫 𝐟𝐢𝐥𝐞 𝐝𝐚𝐧 𝐂𝐨𝐛𝐚 𝐥𝐚𝐠𝐢 𝐓𝐚𝐧𝐩𝐚 𝐌𝐞𝐧𝐮𝐭𝐮𝐩 𝐍𝐚𝐩𝐬𝐭𝐞𝐫𝐧𝐞𝐭𝐕\n")
      os.exit()
    end
    readedMem = rwmem(r[1].address, 50000)
    save(hexdecode(readedMem))
    print("✓ Decrypt Success..!!")
    gg.clearResults()
  end
  
  function hatunnelplus()
    gg.clearResults()
    gg.setRanges(gg.REGION_JAVA_HEAP)
    gg.setVisible(true)
    gg.searchNumber("h 7b 22 75 73 65 72 5f 69 64 22", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local r = gg.getResults(1)
    if #r < 1 then
      gg.toast("✖ Method 7 failed")
      hat_2 = true
    end
    if hat_2 then
      gg.searchNumber("h 7b 5c 22 63 6f 6e 6e 65 63 74 69 6f 6e 5f 6d 6f 64 65 5c 22", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
      local r = gg.getResults(1)
      if #r < 1 then
        gg.toast("✖ Method 7 failed")
        hat_3 = true
      end
    end
    if hat_3 then
      limit = false
      gg.searchNumber("h7b22757365725f696422", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
      local r = gg.getResults(1)
      if #r < 1 then
        gg.toast("✖ Method 7 failed")
        hat_4 = true
      end
    end
    if hat_4 then
      limit = false
      gg.searchNumber("h 5c 22 6f 76 65 72 72 69 64 65 5f 70 72 69 6d 61 72 79 5f 68 6f 73 74 5c", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
      local r = gg.getResults(1)
      if #r < 1 then
        gg.toast("✖ Method 7 failed")
        hat_5 = true
      end
    end
    if hat_5 then
      limit = false
      gg.searchNumber("h 61 63 63 65 73 73 5f 63 6f 64 65 22 3a", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
      local r = gg.getResults(1)
      if #r < 1 then
        gg.toast("✖ Method 7 failed")
        hat_6 = true
      end
    end
    if hat_6 then
      print("✖ All methods failed")
      print("⊗ 𝐈𝐦𝐩𝐨𝐫 𝐟𝐢𝐥𝐞 𝐝𝐚𝐧 𝐂𝐨𝐛𝐚 𝐥𝐚𝐠𝐢 𝐓𝐚𝐧𝐩𝐚 𝐌𝐞𝐧𝐮𝐭𝐮𝐩 𝐇𝐀 𝐓𝐮𝐧𝐧𝐞𝐥 𝐏𝐥𝐮𝐬\n")
      os.exit()
    end
    local r = gg.getResults(1000)
    if limit == false then
      r[1].address = r[1].address - 8192
    end
    readedMem = rwmem(r[1].address, 50000)
    save(hexdecode(readedMem))
    gg.toast("Pai encontrado")
    print("✓ Decrypt Success..!!")
    gg.clearResults()
  end
  
end

function LOBBY()
  print("\n𝐓𝐡𝐚𝐧𝐤𝐬 𝐅𝐨𝐫 𝐔𝐬𝐞 𝐓𝐡𝐢𝐬 𝐒𝐜𝐫𝐢𝐩𝐭️️\n𝐂𝐫𝐞𝐝𝐢𝐭 𝐌𝐨𝐝𝐮𝐥𝐞 : @𝐈𝐫𝐞𝐧𝐞𝐄𝐬𝐭𝐛𝐧 - @𝐗𝟓𝐖𝐚𝐠𝐨𝐨𝐧")
  gg.skipRestoreState()
  gg.setVisible(true)
  os.exit()
end

while true do
  if gg.isVisible(true) then
    LuaLibraryTool = 1
    gg.setVisible(false)
  end
  if LuaLibraryTool == 1 then
    HOME()
  end
end

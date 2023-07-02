local g = {}
g.last = gg.getFile()
g.info = nil
g.config = gg.EXT_CACHE_DIR .. "/" .. gg.getFile():match("[^/]+$") .. "cfg"
DATA = loadfile(g.config)
if DATA ~= nil then g.info = DATA() DATA = nil end
if g.info == nil then g.info = {g.last, g.last:gsub("/[^/]+$", "")} end

while true do
g.info = gg.prompt({
'[📁] Sᴇʟᴇᴄᴛ Sᴄʀɪᴘᴛ Tᴏ Eɴᴄʀʏᴘᴛ :',
'[📁] Sᴇʟᴄᴛ Oᴜᴛᴘᴜᴛ Fɪʟᴇ :',
},g.info,{
"file",
"path",
"checkbox",
"checkbox",
})
if g.info == nil then
return
end
gg.saveVariable(g.info, g.config)
g.last = g.info[1]
if loadfile(g.last) == nil then
return gg.alert([[⚠️Script not Found! ⚠️]])
else
g.out = g.last:match("[^/]+$")
g.findn = g.out:match(".lua")
if g.findn == nil then 
g.out = g.out.."_enc.lua"
else
g.out = g.out:gsub("%.lua$","_enc.lua")
end
g.out = g.info[2] .. "/" .. g.out
local DATA = io.input(g.info[1]):read("*a")

DATA=[=[

]=]..DATA..[=[
]=]

local function toLuaHex(s)
local t = {string.byte(s, 1, -1)}
for i = 1, #t do t[i] = string.format('\\x%02X', t[i]) end
return table.concat(t)
end

DATA=string.dump(load(DATA),true)
gg.internal2(load(DATA), g.out)
DATA = io["input"](g.out,"w"):read("*a")
DATA = string.gsub(DATA, '\n\t*;[^\n]*', '')
DATA = string.gsub(DATA, '[^\n]+ ; garbage\n', '')
DATA = string.gsub(DATA, '%.maxstacksize %d+\n', '.maxstacksize 250\n')
local arg = {'"[^\n]-[^\\]"', '-?%d[%w%.]*'}
local OPLasm = {'ADD', 'SUB', 'MUL','DIV','MOD','POW','GETTABLE','SETTABLE','SELF','GETTABUP','SETTABUP','EQ','LT','LE'}
for i, const in pairs(arg) do
local A1 = 127 + (i % 3)
for k, zl in pairs(OPLasm) do
DATA = string.gsub(DATA, '(\n(\t*)(' .. zl .. ') %w+ )(' .. const .. ')( ' .. const .. ')', function(p1, tab, name, p2, p3)
local A2 = A1 + 1
return '\n' .. tab .. 'LOADK v' .. A1 .. ' ' .. p2 .. '\n\n' .. tab .. 'LOADK v' .. A2 .. ' ' .. p3 .. p1 .. 'v' .. A1 .. ' v' .. A2 .. '\n'
end)

DATA = string.gsub(DATA, '(\n(\t*)(' .. zl .. ') %w+ %w+ )(' .. const .. ')', function(p1, tab, name, p2)
return '\n' .. tab .. 'LOADK v' .. A1 .. ' ' .. p2 .. p1 .. 'v' .. A1 .. '\n'
end)

DATA = string.gsub(DATA, '(\n(\t*)(' .. zl .. ') %w+ )(' .. const .. ')( %w+)', function(p1, tab, name, p2, p3)
return '\n' .. tab .. 'LOADK v' .. A1 .. ' ' .. p2 .. '\n' .. p1 .. 'v' .. A1 .. p3
end)
end
end

local byte, char, concat = string.byte, string.char, table.concat
 
 local B64CHARS =  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
 
 local b64charmap = {};
 for i = 1, 64 do b64charmap[byte(B64CHARS, i)] = i - 1  end
 
 local function Encode(s, filename_safe)
  
  local b64chars = B64CHARS
  local rn = #s % 3
  local st = {}
  local c1, c2, c3
  local t4 = {}
  local lln, maxlln = 1, 72
  for i = 1, #s, 3 do
   c1 = byte(s,i)
   c2 = byte(s,i+1) or 0
   c3 = byte(s,i+2) or 0
   t4[1] = char(byte(b64chars, (c1 >> 2) + 1))
   t4[2] = char(byte(b64chars, (((c1 << 4)|(c2 >> 4)) & 0x3f) + 1))
   t4[3] = char(byte(b64chars, (((c2 << 2)|(c3 >> 6)) & 0x3f) + 1))
   t4[4] = char(byte(b64chars, (c3 & 0x3f) + 1))
   st[#st+1] = concat(t4)
  
   lln = lln + 4
   if lln > maxlln then st[#st+1] = "\n"; lln = 1 end
  end
 
  local llx = #st
  if st[llx] == "\n" then llx = llx - 1 end 
  if rn == 2 then
   st[llx] = string.gsub(st[llx], ".$", "=")
  elseif rn == 1 then
   st[llx] = string.gsub(st[llx], "..$", "==")
  end
  local b = concat(st)
  if filename_safe then
   
   b = string.gsub(b, "%+", "-")
   b = string.gsub(b, "/", "_")
   b = string.gsub(b, "[%s=]", "")
  end
  return b
 end


local function loadxor(s)
local f, e = load('return ' .. s)
if not f then return end
return Encode(f())
end

DATA = string.gsub(DATA, '(\n(\t*)LOADK (%w+)[ ]+)("[^\n]-")\n', function(p1, tab, p2, p3)
local s = loadxor(p3)
if not s then return end
return p1 .. '"' .. s .. '"' .. '\n\n' .. tab .. 'GETTABLE ' .. p2 .. ' ' .. p2 .. ' ' .. p2 .. '\n'
end)

Decode=[=[

 local byte, char, concat = string.byte, string.char, table.concat
 gg.Cutie = gg.alert
 local B64CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" 
 local b64charmap = {};
 for i = 1, 64 do b64charmap[byte(B64CHARS, i)] = i - 1 end
 local function decode(b)
 local cmap = b64charmap
 local e1, e2, e3, e4 
 local st = {}
 local t3 = {}
 b = string.gsub(b, "%-", "+")
 b = string.gsub(b, "_", "/")
 b = string.gsub(b, "[=%s]", "")
 if b:find("[^0-9A-Za-z/+=]")
 then
 return nil, "char?" end
 for i = 1, #b, 4 do
 e1 = cmap[byte(b, i)] e2 = cmap[byte(b, i+1)]
 if not e1 or not e2 then
 return nil, "or utf8?"
 end
 e3 = cmap[byte(b, i+2)]
 e4 = cmap[byte(b, i+3)]
 t3[1] = char((e1 << 2) |  (e2 >> 4))
 if not e3 then t3[2] = nil 
 t3[3] = nil st[#st + 1] = concat(t3)
 break end t3[2] = char(((e2 << 4) | (e3 >> 2)) & 0xff)
 if not e4 then 
 t3[3] = nil st[#st + 1] = concat(t3) break end
 t3[3] = char(((e3 << 6) | (e4)) & 0xff)
 st[#st + 1] = concat(t3) end
 return concat(st)  
 end

debug.setmetatable(string, {
    __index = function(a, b)
return decode(b)
    end
})

]=]

Decode = string.dump(load(Decode),true)

    DATA = string.gsub(DATA, '\n\t*%.line 0\n', function(p1)
return p1 .. '\nGETTABUP v0 u0 "load"\nLOADK v1 "' .. toLuaHex(Decode or '') .. '"\nCALL v0..v1 v0..v0\nCALL v0..v0\n'
    end)

DATA = string.dump(load(DATA), true)
io.open(g.out,"w"):write(DATA):close()
return
end 
end
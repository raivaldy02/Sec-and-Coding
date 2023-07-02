
function Auto()
local g = {}
g.last = gg.getFile()
g.info = nil
g.config = gg.EXT_CACHE_DIR .. "/" .. gg.getFile():match("[^/]+$") .. ".1.cfg"
g.KNTL = loadfile(g.config)
if g.KNTL ~= nil then g.info = g.KNTL() g.KNTL = nil end
if g.info == nil then g.info = {g.last, g.last:gsub("/[^/]+$", "")} end

while true do
g.info = gg.prompt({"Select File","Path Output"},g.info,{"file","path"})
if not g.info then 
  gg.setVisible(true)
  os.exit(print("Script Cancelled"))
end

gg.saveVariable(g.info, g.config)
g.last = g.info[1]
if io.open(g.last, "r") == nil then
  os.exit(gg.alert("⚠️Script not Found! ⚠️"))
else
  g.out = g.last:match("[^/]+$")
  g.out = g.out:gsub(".lua", ".Fix")
  g.out = g.info[2] .. "/" .. g.out .. ".lua"
end
DoneEX = "✅ Fixed 1-0 Done ✅\n\n📂 Output : "..g.out
local YOUKONTOL = io.input(g.last):read('*a')
io.output(g.out, "w")
io.write(YOUKONTOL) 
YOUKONTOL = string.dump(load(YOUKONTOL), true, true)
YOUKONTOL = gg.internal2(load(YOUKONTOL), g.out)
io.input(g.out, "r")
YOUKONTOL = io.read("*a")
YOUKONTOL = YOUKONTOL:gsub("	","")
YOUKONTOL = YOUKONTOL:gsub(".linedefined [^\n]*\n.lastlinedefined [^\n]*\n.numparams [^\n]*\n.is_vararg [^\n]*\n.maxstacksize [^\n]*\n.end ; F",".linedefined 21\n.lastlinedefined 21\n.numparams 21\n.is_vararg 21\n.maxstacksize 21\n\nLOADK v0 \"Tools AeroXCB\"\n\nRETURN\n.end ; F")
if not load(YOUKONTOL) then
  gg.alert("❗ Failed Fix 1-0❗\n\nMaybe This Script Have More Blocker Lasm","")
  os.exit()
end
YOUKONTOL = string.dump(load(YOUKONTOL),true)
io.open(g.out,"w"):write(YOUKONTOL)
print(DoneEX)
return gg.alert(DoneEX)
end
end

function GSubTool()
local g = {}
g.last = gg.getFile()
g.info = nil
g.config = gg.EXT_CACHE_DIR .. "/" .. gg.getFile():match("[^/]+$") .. ".2.cfg"
g.KNTL = loadfile(g.config)
if g.KNTL ~= nil then g.info = g.KNTL() g.KNTL = nil end
if g.info == nil then g.info = {g.last, g.last:gsub("/[^/]+$", "")} end

while true do
g.info = gg.prompt({"Select File .lasm","Path Output"},g.info,{"file","path"})
if not g.info then 
  gg.setVisible(true)
  os.exit(print("Script Cancelled"))
end
checkfi = g.info[1]:match(".-(.-).lasm")
if checkfi == nil then
  gg.alert("Please Select file .lasm","")
  os.exit()
else
gg.saveVariable(g.info, g.config)
g.last = g.info[1]
if io.open(g.last, "r") == nil then
  os.exit(gg.alert("⚠️Script not Found! ⚠️"))
else
  g.out = g.last:match("[^/]+$")
  g.out = g.out:gsub(".lua.-(.-).lasm", "")
  g.out = g.out:gsub(".lasm","")
  g.out = g.info[2] .. "/" .. g.out .. ".FixL.lasm"
  
end
DoneEX = "✅ Fixed 1-0 Done ✅\n\n📂 Output : "..g.out
DATA=io.open(g.last, "r"):read("*a")
DATA = string.gsub(DATA, ".source \"[^\n]*",".source \"AEROXCBTool\"")
DATA = string.gsub(DATA, "	","")
DATA=string.gsub(DATA, ".linedefined [^\n]*\n.lastlinedefined [^\n]*\n.numparams [^\n]*\n.is_vararg [^\n]*\n.maxstacksize [^\n]*\n.end ; F",".linedefined 21\n.lastlinedefined 21\n.numparams 21\n.is_vararg 21\n.maxstacksize 21\n\nLOADK v0 \"Tools AeroXCB\"\n\nRETURN\n.end ; F")
io.open(g.out, "w"):write(DATA):close()
gg.setVisible(true)
print(DoneEX)
return gg.alert(DoneEX)
end
end
end

function MainHome()
Charon = 0
AeXA = gg.choice({
	"Fix 1-0 Auto Lasm",
	"Fix 1-0 .lasm\n[Select file .lasm]",
	"Exit"
}, Charon,"")
if AeXA == nil then
else
if AeXA == 1 then Auto() end
if AeXA == 2 then GSubTool() end
if AeXA == 3 then os.exit(gg.setVisible(true)) end
end
ExaXCB = -1
end


while true do
if gg.isVisible(true) then
ExaXCB = 1
gg.setVisible(false)
end
if ExaXCB == 1 then
MainHome()
end
end
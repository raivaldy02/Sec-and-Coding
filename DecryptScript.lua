HexFunc = require "HexScriptModule"

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

    gg.toast(app)
end

function Main()
    while (true) do
        function menus()
            menu = gg.choice({
                "HTTP Custom",
                "Dump",
                "EXIT Program"
            }, nil, (_G["os"]["date"]([[
Recoded By 모하마드 라이발디
%d/%m/%Y %H:%M:%S 
pick a Option:]])))

            if menu == 1 then
                HTTPCustom()
            end
            if menu == 2 then
                Dump()
            end
            if menu == 3 then
                EXIT()
            end
        end
        
        if gg.isVisible(true) then 
            gg.clearResults()
            gg.setVisible(false) 
            menus()
        end
        
    end
end

-- BEGINNING EXECUTION
Main()
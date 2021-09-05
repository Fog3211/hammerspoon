--
-- Date: 2021-08-29 21:43:53
-- LastEditTime: 2021-08-29 21:46:01
-- Description: 自动热加载hs文件
--
local needReload = false
local reloadConfig = function(paths)
    needReload = false
    for _, file in pairs(paths) do
        if file:sub(-4) == '.lua' then
            print('A lua config file changed, reload')
            needReload = true
        end
    end
    if needReload then
        hs.reload()
    else
        print('No lua file changed, skipping reload')
        return
    end
end

local configFileWatcher = hs.pathwatcher.new(
                              os.getenv('HOME') .. '/.hammerspoon/',
                              reloadConfig)
configFileWatcher:start()


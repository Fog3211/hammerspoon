-- Date: 2021-08-24 13:46:01
-- LastEditTime: 2021-08-24 13:46:01
-- Description: wifi切换时自动控制ClashX的状态
--
-- wifi名称常量
local workWifi = 'HUPU.WORK.5G'
local appLists = {ClashX = 'ClashX.app'}

-- 判断指定 APP 是否运行，如果未运行，则运行
local launchApp = function()
    for app in pairs(appLists) do
        local getApp = hs.application(app)
        if not getApp then
            hs.application.launchOrFocus(app)
        end
    end
end

-- 判断指定 APP 是否运行，如果已运行，则退出
local killApp = function()
    for app in pairs(appLists) do
        local getApp = hs.application.get(app)
        if getApp then getApp:kill() end
    end
end

-- 依据当前网络情况启动或关闭应用
local wifiWatcher = hs.wifi.watcher.new(function()

    local currWifi = hs.wifi.currentNetwork()

    -- 连接 workWifi 时
    if currWifi == workWifi then
        killApp()
        -- 连接 其他Wifi 时
    elseif currWifi ~= nil then
        launchApp()
    end
end)

wifiWatcher:start()

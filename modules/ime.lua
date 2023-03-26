-- Description: 自动切换输入法
--
local Chinese = function()
    hs.keycodes.currentSourceID('com.sogou.inputmethod.sogou.pinyin')
end

local English = function() hs.keycodes
    .currentSourceID('com.apple.keylayout.ABC') end

local ImeConfig = {
    {'/Applications/Terminal.app', 'English'},
    {'/Applications/iTerm.app', 'English'},
    {'/Applications/Visual Studio Code.app', 'English'},
    {'/Applications/Google Chrome.app', 'English'},
    {'/Applications/Google Chrome Beta.app', 'English'},
    {'/Applications/GitHub Desktop.app', 'English'},
    {'/Applications/EasyConnect.app', 'English'},
    {'/Applications/Postman.app', 'English'},
    {'/Applications/Hammerspoon.app', 'English'},
    {'/Applications/Termius.app', 'English'},
    {'/Applications/SwitchHosts.app', 'English'},
    {'/Applications/Alfred.app', 'English'},
    {'/Applications/喜马拉雅.app', 'Chinese'},
    {'/Applications/TickTick.app', 'Chinese'},
    {'/Applications/DingTalk.app', 'Chinese'},
    {'/Applications/WeChat.app', 'Chinese'},
    {'/Applications/QQ.app', 'Chinese'}
}

local switchFocusAppIme = function()
    local focusAppPath = hs.window.frontmostWindow():application():path()
    for _, app in pairs(ImeConfig) do
        local appPath = app[1]
        local expectedIme = app[2]

        if focusAppPath == appPath then
            if expectedIme == 'English' then
                English()
            else
                Chinese()
            end
            break
        end
    end
end

local applicationWatcher = function(appName, eventType)
    if (eventType == hs.application.watcher.activated) then
        switchFocusAppIme()
    end
end

local appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
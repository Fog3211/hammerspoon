-- Date: 2021-09-06 00:20:53
-- LastEditTime: 2021-09-06 00:20:53
-- Description: 自动更新各种语言及工具库
--
local autoUpdate = function()
    for _, cmd in pairs(Auto_Update_Config) do
        print(cmd)
        os.execute(cmd)
    end
end

-- 每3天执行一次
Timer = hs.timer.doEvery(60 * 60 * 24 * 3, autoUpdate):fire()

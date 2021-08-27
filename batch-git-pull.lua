-- Date: 2021-08-25 22:29:34
-- LastEditTime: 2021-08-25 22:29:35
-- Description: 遍历目录执行批量 git pull 操作
--
-- Tips:需要提前安装lfs
-- brew install luarocks
-- luarocks install luafilesystem
--
local lfs = require 'lfs'

-- 只对'Code'和'Mine'目录操作
local targetGitDir = {'../Test'}
-- local targetGitDir = {'../Code', '../Mine'}

local runGitPullShell = function(filePath, fileName)
    -- local handle = io.popen('cd ' .. filePath .. '&& git pull --rebase')
    -- local result = handle:read("*a")
    -- handle:close()
    -- print(result)
    -- hs.alert.show(filePath)
    local a = os.execute('cd ' .. filePath .. '&& git pull --rebase --all')
    print(a)
end

local attrdir = function(rootPath)
    for file in lfs.dir(rootPath) do
        if file ~= '.' and file ~= '..' then
            -- 过滤'.'和'..'目录
            local filePath = rootPath .. '/' .. file
            local fileAttr = lfs.attributes(filePath)
            if fileAttr.mode == 'directory' then
                for subFile in lfs.dir(filePath) do
                    -- 先检查当前项目是否有.git，没有的话跳过
                    if subFile == '.git' then
                        runGitPullShell(filePath, file)
                    end
                end
            end
        end
    end
end

local batchGitPull = function()
    for index, dir in pairs(targetGitDir) do attrdir(dir) end
end

batchGitPull()

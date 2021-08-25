-- Date: 2021-08-25 22:29:34
-- LastEditTime: 2021-08-25 22:29:35
-- Description: 遍历目录执行 git pull 操作
--
-- Tips:需要提前安装lfs
-- brew install luarocks
-- luarocks install luafilesystem
--
local lfs = require 'lfs'

-- 只对'Code'和'Mine'目录操作
local targetGitDir = {'../Test'}
-- local targetGitDir = {'~/Code', '~/Mine'}

local attrdir = function(root)
    for file in lfs.dir(root) do
        if file ~= '.' and file ~= '..' then
            -- 过滤'.'和'..'目录
            local subFile = root .. '/' .. file
            local subFileAttr = lfs.attributes(subFile)
            if subFileAttr.mode == 'directory' then
                print(subFile .. '-->' .. subFileAttr.mode)
                -- attrdir(f)
            end
        end
    end
end

local gitPull = function()
    for index, dir in pairs(targetGitDir) do attrdir(dir) end
end

gitPull()

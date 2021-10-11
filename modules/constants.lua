-- Date: 2021-09-06 00:28:20
-- LastEditTime: 2021-09-06 00:28:20
-- Description: 常量配置
--
Auto_Update_Config = {
    -- 更新rust，包含 rustc 和 cargo
    rust_update = 'rustup update',
    -- 更新依赖库
    homebrew_update = 'brew upgrade',
    -- 移除旧版本依赖库
    homebrew_clean = 'brew cleanup',
    -- 更新on my zsh
    on_my_zsh_update = 'omz update'
}

-- 只对'Code'和'Mine'目录操作
Batch_Git_Pull_Config = {
    Code = {wifi = 'HUPU.WORK.5G', dir = os.getenv('HOME') .. '/Code'},
    Mine = {wifi = '*', dir = os.getenv('HOME') .. '/Mine'}
}

Switch_Clashx_By_Wifi_Config = {
    workWifi = 'HUPU.WORK.5G',
    appLists = {ClashX = 'ClashX.app'}
}

return {Auto_Update_Config, Batch_Git_Pull_Config, Switch_Clashx_By_Wifi_Config}

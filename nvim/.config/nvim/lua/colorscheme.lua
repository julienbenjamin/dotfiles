local colorscheme = 'monokai_pro'

local ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

--M.themes = {
--  "tokyonight",
--  "catppuccin",
--  "gruvbox",
--  "rose-pine",
--  "default",
--}

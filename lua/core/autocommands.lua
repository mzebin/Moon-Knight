vim.cmd([[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

    augroup _colorscheme
        autocmd!
        autocmd ColorScheme * source ~/.config/nvim/lua/colors/highlights.lua
    augroup end
]])

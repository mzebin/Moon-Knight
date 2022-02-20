vim.cmd([[
    augroup _alpha
        autocmd!
        autocmd User AlphaReady set showtabline=0
        autocmd BufUnload <buffer> set showtabline=2
    augroup end
]])

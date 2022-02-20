vim.cmd([[
    augroup _alpha
        autocmd!
        autocmd User AlphaReady set showtabline=0
        autocmd BufUnload <buffer> set showtabline=2
    augroup end

    augroup _nvim_colorizer
        autocmd!
        autocmd FileType * ColorizerAttachToBuffer
    augroup end
]])

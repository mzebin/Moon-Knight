local status_ok, mini_surround = pcall(require, "mini.surround")
if not status_ok then
    vim.notify("Error requiring mini.surround")
    return
end


mini_surround.setup({})

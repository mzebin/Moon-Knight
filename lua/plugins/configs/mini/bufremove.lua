local status_ok, mini_bufremove = pcall(require, "mini.bufremove")
if not status_ok then
    vim.notify("Error requiring mini.bufremove")
    return
end


mini_bufremove.setup({})

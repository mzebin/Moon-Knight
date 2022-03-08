local status_ok, mini_bufremove = pcall(require, "mini.bufremove")
if not status_ok then
    vim.notify("Unable to require mini.bufremove", "error", {title="Mini"})
    return
end


mini_bufremove.setup({})

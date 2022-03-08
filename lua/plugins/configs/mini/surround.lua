local status_ok, mini_surround = pcall(require, "mini.surround")
if not status_ok then
    vim.notify("Unable to require mini.surround", "error", {title="Mini"})
    return
end


mini_surround.setup({})

local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    vim.notify("Error requiring Comment")
    return
end

comment.setup({})

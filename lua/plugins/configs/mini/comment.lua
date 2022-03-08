local status_ok, mini_comment = pcall(require, "mini.comment")
if not status_ok then
    vim.notify("Unable to require mini.comment", "error", {title="Mini"})
    return
end


mini_comment.setup({})

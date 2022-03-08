local status_ok, mini_comment = pcall(require, "mini.comment")
if not status_ok then
    vim.notify("Error requiring mini.comment")
    return
end


mini_comment.setup({})

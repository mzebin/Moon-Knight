local status_ok, better_escape = pcall(require, "better_escape")
if not status_ok then
    vim.notify("Error requiring better_escape")
    return
end

better_escape.setup({
    mapping = {"jk", "jj", "kj", "kk"},
    timeout = 200,
})

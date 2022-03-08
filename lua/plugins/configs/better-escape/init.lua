local status_ok, better_escape = pcall(require, "better_escape")
if not status_ok then
    vim.notify("Unable to require better_escape", "error", {title="Better Escape"})
    return
end

better_escape.setup({
    mapping = {"jk", "jj", "kj", "kk"},
    timeout = 200,
})

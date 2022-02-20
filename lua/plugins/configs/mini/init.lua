local status_ok, mini_trailspace = pcall(require, "mini.trailspace")
if not status_ok then
    vim.notify("Error requiring mini.trailspace")
    return
end

mini_trailspace.setup({
    only_in_normal_buffers = true,
})

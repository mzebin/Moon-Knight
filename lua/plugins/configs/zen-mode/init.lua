local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
    vim.notify("Error requiring zen-mode")
    return
end

zen_mode.setup({
    window = {
        backdrop = 0.75,
        width = 140,
        height = 1,
        options = {
            relativenumber = false,
            cursorcolumn = false,
        },
    },
})

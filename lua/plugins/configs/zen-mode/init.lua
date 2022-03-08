local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
    vim.notify("Unable to require zen-mode", "error", {title="Zen Mode"})
    return
end

zen_mode.setup({
    window = {
        backdrop = 0.75,
        width = 0.9,
        height = 1,
        options = {
            relativenumber = false,
            cursorcolumn = false,
        },
    },
})

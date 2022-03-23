local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
    vim.notify("Unable to require zen-mode", "error", {title="Zen Mode"})
    return
end

zen_mode.setup({
    window = {
        backdrop = 0.9,
        width = 0.9,
        height = 0.9,
        options = {
            relativenumber = false,
            cursorcolumn = false,
        },
    },
    on_open = function ()
        vim.cmd("IndentBlanklineDisable")
        vim.cmd("set colorcolumn=")
    end,
    on_close = function ()
        vim.cmd("IndentBlanklineEnable")
        vim.cmd("set colorcolumn=80")
    end
})

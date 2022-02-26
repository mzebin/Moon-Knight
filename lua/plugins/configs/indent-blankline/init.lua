local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    vim.notify("Error requiring indent_blankline")
    return
end

indent_blankline.setup({
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
        "alpha",
        "help",
        "lspinfo",
        "lsp-installer",
        "NvimTree",
        "packer",
        "Telescope",
        "TelescopePrompt",
        "TelescopeResults",
        "terminal",
    },
    buftype_exclude = {"terminal"},
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
})

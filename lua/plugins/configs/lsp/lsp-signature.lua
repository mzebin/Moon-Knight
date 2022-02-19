local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
    vim.notify("Error requiring lsp_signature")
    return
end

lsp_signature.setup({
    transparency = 10,
    hint_prefix = " ",
    hint_enable = false,
})

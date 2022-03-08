local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
    vim.notify("Unable to require lsp_signature", "error", {title="LSP"})
    return
end

lsp_signature.setup({
    transparency = 10,
    hint_prefix = " ",
    hint_enable = false,
})

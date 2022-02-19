local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
    return
end

lsp_signature.setup({
    transparency = 10,
    hint_prefix = " ",
    hint_enable = false,
})

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    vim.notify("Error requiring null-ls")
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        -- Python
        diagnostics.pylint.with({
            extra_args = {"--errors-only"}
        }),
        formatting.black,

        -- Lua
        formatting.stylua,
    },
}

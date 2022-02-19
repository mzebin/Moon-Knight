local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("Error requiring lspconfig")
	return
end

require("plugins.configs.lsp.lsp-installer")
require("plugins.configs.lsp.handlers").setup()

-- Other Plugins
require("plugins.configs.lsp.lsp-signature")
require("plugins.configs.lsp.null-ls")

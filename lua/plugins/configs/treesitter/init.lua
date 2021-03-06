local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("Unable to require nvim-treesitter.configs", "error", {title="Treesitter"})
    return
end

configs.setup({
    ensure_installed = "maintained",
    sync_install = false,
    highlight = {
        additional_vim_regex_highlighting = true,
    },
    indent = true,

    rainbow = {
        enable = true,
        extended_mode = true,
    },
    autopairs = {
        enable = true,
    },
})

-- Colorscheme Settings
vim.g.vscode_style = "dark"
vim.g.vscode_italic_comment = 1

local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("Colorscheme not found: " .. colorscheme, "error", {title="Colorscheme"})
    return
end

local options = {
    -- :help options
    autoindent = true,
    background = "dark",
    clipboard = "unnamedplus",
    colorcolumn = "80",
    cursorline = true,
    encoding = "utf-8",
    expandtab = true,
    fileencoding = "utf-8",
    foldlevel = 99,
    foldmethod = "indent",
    guifont = "FiraCode Nerd Font:h14",
    hlsearch = false,
    ignorecase = true,
    incsearch = true,
    mouse = "a",
    number = true,
    pumblend = 10,
    pumheight = 10,
    relativenumber = true,
    scrolloff = 10,
    shell = "/usr/bin/bash",
    shiftwidth = 4,
    showmode = false,
    sidescrolloff = 10,
    signcolumn = "yes",
    smartcase = true,
    softtabstop = 4,
    splitbelow = true,
    splitright = true,
    statusline = " ",
    syntax = "enable",
    tabstop = 4,
    termguicolors = true,
    timeoutlen = 100,
    updatetime = 300,
    wrap = false,
}

-- Setting options
for key, value in pairs(options) do
    vim.opt[key] = value
end

-- Swapfile options
vim.opt.directory:prepend{"$HOME/.config/nvim/tmp//"}


-- Disabling Builtin Plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end


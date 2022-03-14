local options = {
    -- :help options
    autoindent = true,
    background = "dark",
    clipboard = "unnamedplus",
    colorcolumn = "80",
    cursorcolumn = true,
    cursorline = true,
    encoding = "utf-8",
    expandtab = true,
    fileencoding = "utf-8",
    foldlevel = 99,
    guifont = "FiraCode Nerd Font:h14",
    hlsearch = false,
    ignorecase = true,
    incsearch = true,
    mouse = "a",
    number = true,
    numberwidth = 4,
    pumblend = 10,
    pumheight = 10,
    relativenumber = true,
    scrolloff = 10,
    shiftwidth = 4,
    showmode = false,
    sidescrolloff = 10,
    signcolumn = "yes",
    smartcase = true,
    softtabstop = 4,
    splitbelow = true,
    splitright = true,
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

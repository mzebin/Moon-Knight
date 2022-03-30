-- Auto install packer
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

-- Auto install and sync plugins
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
    augroup end
]])

-- Requiring Packer
vim.cmd("packadd packer.nvim")
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Unable to require packer", "error", {title="Packer"})
    return
end

-- Packer Customization
packer.init{
    display = {
        open_fn = function()
            return require("packer.util").float{border="rounded"}
        end,
    },
}

-- Plugins
local plugins = {
    -- Packer
    {
        "wbthomason/packer.nvim",
        opt = true,
    },

    -- Improve startup time
    {"lewis6991/impatient.nvim"},

    -- Better way to escape
    {
        "max397574/better-escape.nvim",
        event = {"InsertEnter"},
        config = [[require("plugins.configs.better-escape")]],
    },

    -- Notifications
    {"rcarriga/nvim-notify"},

    -- Colorschemes
    {"LunarVim/onedarker.nvim"},
    {"Mofiqul/vscode.nvim"},
    {"catppuccin/nvim"},
    {"tiagovla/tokyodark.nvim"},

    -- Icons
    {"kyazdani42/nvim-web-devicons"},

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = "<CMD>TSUpdate",
        event = {"BufRead", "BufNewFile"},
        config = [[require("plugins.configs.treesitter")]],
    },

    -- Start Page
    {
        "goolord/alpha-nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = [[require("plugins.configs.alpha")]],
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        event = {"BufAdd", "BufReadPre", "FileReadPre"},
        config = [[require("plugins.configs.lualine")]],
    },
    {
        "SmiteshP/nvim-gps",
        requires = {"nvim-treesitter/nvim-treesitter"},
        event = {"BufAdd", "BufReadPre", "FileReadPre"},
        config = [[require("plugins.configs.nvim-gps")]],
    },

    -- Tabline
    {
        "akinsho/bufferline.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        event = {"BufAdd", "BufReadPre", "FileReadPre"},
        config = [[require("plugins.configs.bufferline")]],
    },

    -- Zen Mode
    {
        "folke/zen-mode.nvim",
        cmd = {"ZenMode"},
        config = [[require("plugins.configs.zen-mode")]],
    },

    -- Colorizer
    {
        "norcalli/nvim-colorizer.lua",
        event = {"BufAdd", "BufRead"},
        config = [[require("plugins.configs.nvim-colorizer")]],
    },

    -- Indent Lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = {"BufAdd", "BufRead"},
        config = [[require("plugins.configs.indent-blankline")]],
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = {"InsertEnter"},
        config = [[require("plugins.configs.autopairs")]],
    },

    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = [[require("plugins.configs.gitsigns")]],
    },

    -- File Tree
    {
        "kyazdani42/nvim-tree.lua",
        requires = {"kyazdani42/nvim-web-devicons"},
        cmd = {"NvimTreeToggle"},
        config = [[require("plugins.configs.nvim-tree")]],
    },

    -- Outline
    {
        "preservim/tagbar",
        cmd = {"TagbarToggle"},
        config = [[require("plugins.configs.tagbar")]],
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "ahmedkhalf/project.nvim",
        },
        cmd = {"Telescope"},
        config = [[require("plugins.configs.telescope")]],
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        cmd = {
            "ToggleTerm",
            "ToggleTermToggleAll",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualLines",
            "ToggleTermSendVisualSelection",
        },
        config = [[require("plugins.configs.toggleterm")]],
    },

    -- Keybindings
    {
        "folke/which-key.nvim",
        config = [[require("plugins.configs.which-key")]],
    },

    -- Minimal Plugins
    {
        "echasnovski/mini.nvim",
        branch = "stable",
        config = [[require("plugins.configs.mini")]],
    },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        ft = {"markdown"},
        cmd = "MarkdownPreview",
        config = [[require("plugins.configs.markdown-preview")]],
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        config = [[require("plugins.configs.cmp")]],
    },

    -- Sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    -- Snippets
    {"saadparwaiz1/cmp_luasnip"},
    {"L3MON4D3/LuaSnip"},
    {"rafamadriz/friendly-snippets"},

    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = [[require("plugins.configs.lsp")]],
    },
    "williamboman/nvim-lsp-installer",
    "ray-x/lsp_signature.nvim",

    -- Formatter
    "jose-elias-alvarez/null-ls.nvim",
}

return packer.startup(function(use)

    for _, plugin in pairs(plugins) do
        use(plugin)
    end

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

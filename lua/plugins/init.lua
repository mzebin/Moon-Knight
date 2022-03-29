-- Auto install packer
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
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
    "wbthomason/packer.nvim",

    -- Required
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",

    -- Improve startup time
    "lewis6991/impatient.nvim",

    -- Better way to escape
    {
        "max397574/better-escape.nvim",
        config = require("plugins.configs.better-escape"),
    },

    -- Notifications
    "rcarriga/nvim-notify",

    -- Icons
    "kyazdani42/nvim-web-devicons",

    -- Colorschemes
    "folke/tokyonight.nvim",
    "LunarVim/onedarker.nvim",
    "Mofiqul/vscode.nvim",
    "catppuccin/nvim",
    "shaunsingh/nord.nvim",
    "tiagovla/tokyodark.nvim",

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = "<CMD>TSUpdate",
        config = require("plugins.configs.treesitter"),
    },

    -- Start Page
    {
        "goolord/alpha-nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = require("plugins.configs.alpha"),
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = require("plugins.configs.lualine"),
    },
    {
        "SmiteshP/nvim-gps",
        requires = {"nvim-treesitter/nvim-treesitter"},
        config = require("plugins.configs.nvim-gps"),
    },

    -- Tabline
    {
        "akinsho/bufferline.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = require("plugins.configs.bufferline"),
    },

    -- Zen Mode
    {
        "folke/zen-mode.nvim",
        config = require("plugins.configs.zen-mode"),
    },

    -- Colorizer
    {
        "norcalli/nvim-colorizer.lua",
        config = require("plugins.configs.nvim-colorizer"),
    },

    -- Indent Lines
    {
        "lukas-reineke/indent-blankline.nvim",
        config = require("plugins.configs.indent-blankline"),
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = require("plugins.configs.autopairs"),
    },

    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = require("plugins.configs.gitsigns"),
    },

    -- File Tree
    {
        "kyazdani42/nvim-tree.lua",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = require("plugins.configs.nvim-tree"),
    },

    -- Outline
    {
        "preservim/tagbar",
        config = require("plugins.configs.tagbar"),
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = require("plugins.configs.telescope"),
    },
    "nvim-telescope/telescope-fzy-native.nvim",
    "ahmedkhalf/project.nvim",

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        config = require("plugins.configs.toggleterm"),
    },

    -- Keybindings
    {
        "folke/which-key.nvim",
        config = require("plugins.configs.which-key"),
    },

    -- Minimal Plugins
    {
        "echasnovski/mini.nvim",
        branch = "stable",
        config = require("plugins.configs.mini"),
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        config = require("plugins.configs.cmp"),
    },

    -- Sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    -- Snippets
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "rafamadriz/friendly-snippets",

    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = require("plugins.configs.lsp"),
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

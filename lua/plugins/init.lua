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

local plugins = {
    "wbthomason/packer.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "lewis6991/impatient.nvim",
    {"max397574/better-escape.nvim", config = require("plugins.configs.better-escape")},

    -- Colorschemes
    "folke/tokyonight.nvim",
    "LunarVim/onedarker.nvim",
    "Mofiqul/vscode.nvim",

    -- Completion
    {"hrsh7th/nvim-cmp", config = require("plugins.configs.cmp")},

    -- Sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    -- LSP
    {"neovim/nvim-lspconfig", config = require("plugins.configs.lsp")},
    "williamboman/nvim-lsp-installer",
    "ray-x/lsp_signature.nvim",

    -- Formatter
    "jose-elias-alvarez/null-ls.nvim",

    -- Telescope
    {"nvim-telescope/telescope.nvim", config = require("plugins.configs.telescope")},
    "ahmedkhalf/project.nvim",

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = "<CMD>TSUpdate",
        config = require("plugins.configs.treesitter"),
    },
    "p00f/nvim-ts-rainbow",

    -- Autopairs
    {"windwp/nvim-autopairs", config = require("plugins.configs.autopairs")},

    -- Gitsigns
    {"lewis6991/gitsigns.nvim", config = require("plugins.configs.gitsigns")},

    -- File Tree
    {"kyazdani42/nvim-tree.lua", config = require("plugins.configs.nvim-tree")},

    -- Tabline
    {"akinsho/bufferline.nvim", config = require("plugins.configs.bufferline")},

    -- Statusline
    {"nvim-lualine/lualine.nvim", config = require("plugins.configs.lualine")},
    {"SmiteshP/nvim-gps", config = require("plugins.configs.nvim-gps")},

    -- Terminal
    {"akinsho/toggleterm.nvim", config = require("plugins.configs.toggleterm")},

    -- Start Page
    {"goolord/alpha-nvim", config = require("plugins.configs.alpha")},

    -- Keybindings
    {"folke/which-key.nvim", config = require("plugins.configs.which-key")},

    -- Notifications
    "rcarriga/nvim-notify",

    -- Minimal Plugins
    {
        "echasnovski/mini.nvim",
        branch = "stable",
        config = require("plugins.configs.mini"),
    },

    -- Colorizer
    {"norcalli/nvim-colorizer.lua", config = require("plugins.configs.nvim-colorizer")},

    -- Zen Mode
    {"folke/zen-mode.nvim", config = require("plugins.configs.zen-mode")},

    -- Outline
    {"preservim/tagbar", config = require("plugins.configs.tagbar")},

    -- Indent Lines
    {"lukas-reineke/indent-blankline.nvim", config = require("plugins.configs.indent-blankline")},
}

return packer.startup(function(use)

    for _, plugin in pairs(plugins) do
        use(plugin)
    end

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

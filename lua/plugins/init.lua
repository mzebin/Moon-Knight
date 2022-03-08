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
        autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerSync
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

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "lewis6991/impatient.nvim"
    use {"max397574/better-escape.nvim", config = require("plugins.configs.better-escape")}

    -- Colorscheme
    use "folke/tokyonight.nvim"

    -- Completion
    use {"hrsh7th/nvim-cmp", config = require("plugins.configs.cmp")}

    -- Sources
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP
    use {"neovim/nvim-lspconfig", config = require("plugins.configs.lsp")}
    use "williamboman/nvim-lsp-installer"
    use "ray-x/lsp_signature.nvim"

    -- Formatter
    use "jose-elias-alvarez/null-ls.nvim"

    -- Telescope
    use {"nvim-telescope/telescope.nvim", config = require("plugins.configs.telescope")}
    use "ahmedkhalf/project.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = "<CMD>TSUpdate",
        config = require("plugins.configs.treesitter"),
    }
    use "p00f/nvim-ts-rainbow"

    -- Autopairs
    use {"windwp/nvim-autopairs", config = require("plugins.configs.autopairs")}

    -- Gitsigns
    use {"lewis6991/gitsigns.nvim", config = require("plugins.configs.gitsigns")}

    -- File Tree
    use {"kyazdani42/nvim-tree.lua", config = require("plugins.configs.nvim-tree")}

    -- Bufferline
    use {"akinsho/bufferline.nvim", config = require("plugins.configs.bufferline")}

    -- Lualine
    use {"nvim-lualine/lualine.nvim", config = require("plugins.configs.lualine")}

    -- Terminal
    use {"akinsho/toggleterm.nvim", config = require("plugins.configs.toggleterm")}

    -- Alpha
    use {"goolord/alpha-nvim", config = require("plugins.configs.alpha")}

    -- Keybindings
    use {"folke/which-key.nvim", config = require("plugins.configs.which-key")}

    -- Notifications
    use "rcarriga/nvim-notify"

    -- Minimal Plugins
    use {
        "echasnovski/mini.nvim",
        branch = "stable",
        config = require("plugins.configs.mini"),
    }

    -- Colorizer
    use {"norcalli/nvim-colorizer.lua", config = require("plugins.configs.nvim-colorizer")}

    -- Zen Mode
    use {"folke/zen-mode.nvim", config = require("plugins.configs.zen-mode")}

    -- Tagbar
    use {"preservim/tagbar", config = require("plugins.configs.tagbar")}

    -- Indent Lines
    use {"lukas-reineke/indent-blankline.nvim", config = require("plugins.configs.indent-blankline")}

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

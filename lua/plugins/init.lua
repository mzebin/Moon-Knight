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
    vim.notify("Error requiring packer")
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

    -- Colorscheme
    use "folke/tokyonight.nvim"

    -- Completion
    use "hrsh7th/nvim-cmp"

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
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "ray-x/lsp_signature.nvim"

    -- Formatter
    use "jose-elias-alvarez/null-ls.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "ahmedkhalf/project.nvim"

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = "<CMD>TSUpdate"}
    use "p00f/nvim-ts-rainbow"

    -- Autopairs
    use "windwp/nvim-autopairs"

    -- Comments
    use "numToStr/Comment.nvim"

    -- Gitsigns
    use "lewis6991/gitsigns.nvim"

    -- File Tree
    use "kyazdani42/nvim-tree.lua"

    -- Bufferline
    use "akinsho/bufferline.nvim"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

M = {}

-- Loading Telescope
local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
    vim.notify("Unable to require packer", "Error", {title = "Telescope"})
end

packer.loader("telescope.nvim")

-- Open File
M.open_files = function ()
    require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown({
            prompt_title = "Open Files",
            previewer = false,
        })
    )
end

-- Choose colorscheme
M.colorscheme = function ()
    require("telescope.builtin").colorscheme(
        require("telescope.themes").get_dropdown({
            prompt_title = "Colorscheme",

            attach_mappings = function(prompt_bufnr, map)
                local function set_colorscheme()
                    local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
                    vim.cmd("colorscheme " .. content.value)
                end

                map("i", "<C-CR>", set_colorscheme)

                -- Please continue mapping (attaching additional key maps):
                -- Ctrl+n/p to move up and down the list.
                return true
            end,
        })
    )
end

-- Search Neovim Configs
M.nvim_configs = function ()
    require("telescope.builtin").find_files(
        require('telescope.themes').get_dropdown({
            prompt_title = "Neovim Configs",
            cwd = "$HOME/.config/nvim/",
            previewer = false,
        })
    )
end

return M

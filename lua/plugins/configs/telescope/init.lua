local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("Unable to require telescope", "error", {title="Telescope"})
    return
end

local actions = require("telescope.actions")

-- Load Extensions
vim.cmd("packadd telescope-fzy-native.nvim")
telescope.load_extension("fzy_native")

telescope.load_extension("projects")
require("plugins.configs.telescope.projects")

telescope.setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        path_display = {"smart"},

        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                results_width = 0.4,
                preview_width = 0.6,
            },
            width = 0.85,
            height = 0.75,
            preview_cutoff = 125,
        },

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

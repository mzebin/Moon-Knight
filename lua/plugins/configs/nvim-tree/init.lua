local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
    },
}

nvim_tree.setup({
    ignore_ft_on_setup = {"alpha"},
    auto_close = true,
    hijack_cursor = true,
    update_cwd = true,
    update_to_buf_dir = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    view = {
        allow_resize = true,
        side = "left",
        width = 30,
        hide_root_folder = true,
    },
    quit_on_open = 0,
    git_hl = 1,
    show_icons = {
        git = 1,
        folders = 1,
        files = 1,
    },
})

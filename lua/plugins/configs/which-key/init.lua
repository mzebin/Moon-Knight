local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    vim.notify("Unable to require which-key", "error", {title="Which Key"})
    return
end

local opts = {
    mode = "n",
    prefix = "<Leader>",
    nowait = true,
}

local mappings = {
    A = {"<CMD>Alpha<CR>", "Alpha"},
    C = {"<CMD>Telescope find_files prompt_title=Neovim\\ Configs cwd=$HOME/.config/nvim/ theme=dropdown previewer=false<CR>", "Neovim Configs"},
    O = {"<CMD>TagbarToggle<CR>", "Tagbar"},
    Q = {"<CMD>q<CR>", "Quit"},
    T = {"<CMD>Telescope<CR>", "Telescope"},
    W = {"<CMD>w<CR>", "Save"},
    Z = {"<CMD>ZenMode<CR>", "Zen Mode"},

    b = {
        name = "Buffer",
        c = {"<CMD>lua MiniBufremove.delete()<CR>", "Close Buffer"},
        f = {"<CMD>Telescope buffers theme=dropdown previewer=false", "Find Buffers"},
        n = {"<CMD>bnext<CR>", "Next Buffer"},
        p = {"<CMD>bprevious<CR>", "Previous Buffer"},
    },

    f = {
        name = "File",
        e = {"<CMD>NvimTreeToggle<CR>", "Explorer"},
        f = {"<CMD>Telescope find_files<CR>", "Find Files"},
        g = {"<CMD>Telescope git_files<CR>", "Git Files"},
        n = {"<CMD>ene <BAR> startinsert<CR>", "New File"},
        o = {"<CMD>Telescope find_files theme=dropdown previewer=false prompt_title=Open\\ Files<CR>", "Open File"},
    },

    g = {
        name = "Git",
        b = {"<CMD>Telescope git_branches<CR>", "Checkout Branch"},
        c = {"<CMD>Telescope git_commits<CR>", "Checkout Commit"},
        d = {"<CMD>Gitsigns diffthis HEAD<CR>", "Diff"},
        g = {"<CMD>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit"},
        j = {"<CMD>Gitsigns next_hunk<CR>", "Next Hunk"},
        k = {"<CMD>Gitsigns prev_hunk<CR>", "Prev Hunk"},
        l = {"<CMD>Gitsigns blame_line<CR>", "Blame"},
        o = {"<CMD>Telescope git_status<CR>", "Open Changed File"},
        p = {"<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk"},
        r = {"<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk"},
        R = {"<CMD>Gitsigns reset_buffer<CR>", "Reset Buffer"},
        s = {"<CMD>Gitsigns stage_hunk<CR>", "Stage Hunk"},
        u = {"<CMD>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk"},
    },

    l = {
        name = "LSP",
        a = {"<CMD>lua vim.lsp.buf.code_action()<CR>", "Code Action"},
        d = {"<CMD>Telescope lsp_document_diagnostics<CR>", "Document Diagnostics"},
        f = {"<CMD>lua vim.lsp.buf.formatting()<CR>", "Format"},
        i = {"<CMD>LspInfo<CR>", "Info"},
        I = {"<CMD>LspInstallInfo<CR>", "Installer Info"},
        j = {"<CMD>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic"},
        k = {"<CMD>lua vim.diagnostic.goto_prev()<CR>", "Prev Diagnostic"},
        l = {"<CMD>lua vim.lsp.codelens.run()<CR>", "CodeLens Action"},
        q = {"<CMD>lua vim.diagnostic.setloclist()<CR>", "Quickfix"},
        r = {"<CMD>lua vim.lsp.buf.rename()<CR>", "Rename"},
        s = {"<CMD>Telescope lsp_document_symbols<CR>", "Document Symbols"},
        S = {"<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols"},
        w = {"<CMD>Telescope lsp_workspace_diagnostics<CR>", "Workspace Diagnostics"},
    },

    p = {
        name = "Packer",
        c = {"<CMD>PackerCompile<CR>", "Compile"},
        i = {"<CMD>PackerInstall<CR>", "Install"},
        s = {"<CMD>PackerSync<CR>", "Sync"},
        S = {"<CMD>PackerStatus<CR>", "Status"},
        u = {"<CMD>PackerUpdate<CR>", "Update"},
    },

    q = {
        name = "Quickfix",
        c = {"<CMD>cclose<CR>", "Close"},
        n = {"<CMD>cnext<CR>", "Next"},
        o = {"<CMD>copen<CR>", "Open"},
        p = {"<CMD>cprevious<CR>", "Open"},
    },

    s = {
        name = "Search",
        b = {"<CMD>Telescope git_branches<CR>", "Checkout branch"},
        c = {"<CMD>Telescope colorscheme theme=get_dropdown previewer=false<CR>", "Colorscheme"},
        C = {"<CMD>Telescope commands<CR>", "Commands"},
        h = {"<CMD>Telescope help_tags<CR>", "Find Help"},
        k = {"<CMD>Telescope keymaps<CR>", "Keymaps"},
        p = {"<CMD>Telescope projects<CR>", "Projects"},
        m = {"<CMD>Telescope man_pages<CR>", "Man Pages"},
        r = {"<CMD>Telescope oldfiles<CR>", "Open Recent File"},
        R = {"<CMD>Telescope registers<CR>", "Registers"},
        t = {"<CMD>Telescope live_grep theme=ivy<CR>", "Find Text"},
    },

    t = {
        name = "Terminal",
        f = {"<CMD>ToggleTerm direction=float<CR>", "Float"},
        h = {"<CMD>ToggleTerm size=15 direction=horizontal<CR>", "Horizontal"},
        P = {"<CMD>lua _PYTHON3_TOGGLE()<CR>", "Python3"},
        R = {"<CMD>lua _RUN_TOGGLE()<CR>", "Run File"},
        t = {"<CMD>ToggleTerm direction=tab<CR>", "Tab"},
        T = {"<CMD>lua _HTOP_TOGGLE()<CR>", "Htop"},
        v = {"<CMD>ToggleTerm size=80 direction=vertical<CR>", "Vertical"},
    },
}

which_key.setup({})
which_key.register(mappings, opts)

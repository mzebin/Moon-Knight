local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("Unable to require cmp", "error", {title="CMP"})
    return
end

-- Icons
local icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

cmp.setup({
    snippet = {
        expand = function (args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = {
        ["<CR>"] = cmp.mapping.confirm {select = true},
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
    },

    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = function(entry, vim_item)
            -- Icons
            vim_item.kind = string.format("%s", icons[vim_item.kind])
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[NvimLua]",
                vsnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },

    sources = {
        {name = "nvim_lsp"},
        {name = "nvim_lua"},
        {name = "vsnip"},
        {name = "buffer"},
        {name = "path"},
    },

    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },

    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },

    experimental = {
        ghost_text = false,
        native_menu = false,
    },
})

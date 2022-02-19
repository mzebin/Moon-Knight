local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    vim.notify("Error requiring nvim-autopairs")
    return
end

npairs.setup({
    check_ts = true,
    disable_filetype = {"TelescopePrompt"},
    fast_wrap = {
        keys = "0123456789",
    },
})

local cmp_npairs = require("nvim-autopairs.completion.cmp")

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("Error requiring cmp")
    return
end

cmp.event:on("confirm_done", cmp_npairs.on_confirm_done({map_char = {tex = ""}}))

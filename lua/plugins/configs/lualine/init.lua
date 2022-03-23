local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    vim.notify("Unable to require lualine", "error", {title="Lualine"})
    return
end

local gps_status_ok, gps = pcall(require, "nvim-gps")
if not gps_status_ok then
    vim.notify("Unable to require nvim-gps", "error", {title = "Nvim GPS"})
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = {"nvim_diagnostic"},
    sections = {"error", "warn"},
    symbols = {error = " ", warn = " "},
    colored = true,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = false,
    symbols = {added = " ", modified = " ", removed = " "},
    cond = hide_in_width
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
    "location",
    padding = {right = 1},
}

local spaces = function()
	return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        disabled_filetypes = {"alpha"},
        always_divide_middle = true,
        globalstatus = true,
    },
	sections = {
		lualine_a = {mode},
		lualine_b = {branch, diagnostics},
		lualine_c = {"filename", {gps.get_location, cond = gps.is_available}},

		lualine_x = {diff, spaces, "encoding"},
		lualine_y = {filetype},
		lualine_z = {location},
	},
    extensions = {"nvim-tree", "toggleterm"}
})

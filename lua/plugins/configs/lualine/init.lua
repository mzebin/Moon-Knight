local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    vim.notify("Unable to require lualine", "Error", {title = "Lualine"})
    return
end

-- Colors
local theme = "plugins.configs.lualine.themes.catppuccin"
local colors_status_ok, colors = pcall(require, theme)
if not colors_status_ok then
    vim.notify(
        "Lualine theme not found: " .. theme,
        "Error",
        {title = "Lualine"}
    )
    return
end

-- Mode Colors
local mode_colors = {
    n = colors.cyan,
    i = colors.magenta,
    v = colors.blue,
    [''] = colors.blue,
    V = colors.blue,
    c = colors.green,
    no = colors.cyan,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.violet,
    Rv = colors.violet,
    cv = colors.cyan,
    ce = colors.cyan,
    r = colors.red,
    rm = colors.red,
    ['r?'] = colors.red,
    ['!'] = colors.cyan,
    t = colors.cyan,
}

-- Config
local config = {
    options = {
        -- Disable component & section separators
        component_separators = {},
        section_separators = {},

        theme = {
            normal = {c = {fg = colors.fg, bg = colors.bg}},
            inactive = {c = {fg = colors.fg, bg = colors.bg}},
        },
    },

    sections = {
        -- Remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },

    inactive_sections = {
        -- Remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}

-- Conditions
local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
}

-- Helper Functions
local function get_mode_color()
    return {fg = mode_colors[vim.fn.mode()]}
end

local function insert_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function insert_right(component)
    table.insert(config.sections.lualine_x, component)
end

-- Inserting components to the left

-- Bar
insert_left({
    function()
        return "▊"
    end,
    color = get_mode_color,
    padding = {left = 0, right = 1},
})

-- Mode
insert_left({
    function ()
        return ""
    end,
    color = get_mode_color,
})

-- Git Branch
insert_left({
    "branch",
    icon = "",
    color = {fg = colors.violet, gui = 'bold'},
})

-- Diagnostics
insert_left({
    "diagnostics",
    sources = {"nvim_diagnostic"},
    sections = {"error", "warn", "info"},
    symbols = {error = " ", warn = " ", info = " "},
    diagnostics_color = {
        color_error = {fg = colors.red},
        color_warn = {fg = colors.yellow},
        color_info = {fg = colors.cyan},
    },
    update_in_insert = false,
    always_visible = true,
})

-- Inserting components to the right

-- Git Diff
insert_right({
    "diff",
    symbols = {added = " ", modified = "柳 ", removed = " "},
    diff_color = {
        added = {fg = colors.green},
        modified = {fg = colors.yellow},
        removed = {fg = colors.red},
    },
})

-- Spaces
insert_right({
    function ()
        return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end,
    cond = conditions.hide_in_width,
})

-- Encoding
insert_right({
    "o:encoding",
    fmt = string.upper,
    color = {fg = colors.green, gui = 'bold'},
    cond = conditions.hide_in_width,
})

-- File Format
insert_right({
    "fileformat",
    cond = conditions.hide_in_width,
})

-- Filesize
insert_right({
    "filesize",
    cond = conditions.buffer_not_empty and conditions.hide_in_width,
})

-- Filetype
insert_right({
    "filetype",
    icons_enabled = true,
})

-- Cursor Location
insert_right({
    "location",
    cond = conditions.hide_in_width,
    padding = {},
})

-- Bar
insert_right({
    function()
        return "▊"
    end,
    color = get_mode_color,
    padding = {right = 0, left = 1},
})

-- Initializing Lualine
lualine.setup(config)

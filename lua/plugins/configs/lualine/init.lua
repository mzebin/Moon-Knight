local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    vim.notify("Unable to require lualine", "Error", {title = "Lualine"})
    return
end

-- Config
local config = {
    options = {
        -- Disable component & section separators
        component_separators = {},
        section_separators = {},
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
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Helper Functions
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
    padding = {left = 0, right = 1},
})

-- Mode
insert_left({
    function ()
        return ""
    end,
})

-- Git Branch
insert_left({
    "branch",
    icon = "",
})

-- Diagnostics
insert_left({
    "diagnostics",
    sources = {"nvim_diagnostic"},
    sections = {"error", "warn", "info"},
    symbols = {error = " ", warn = " ", info = " "},
    colored = true,
    update_in_insert = false,
    always_visible = true,
})

-- Inserting components to the right

-- Git Diff
insert_right({
    "diff",
    symbols = {added = ' ', modified = '柳 ', removed = ' '},
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
  padding = {right = 0, left = 1},
})

-- Initializing Lualine
lualine.setup(config)

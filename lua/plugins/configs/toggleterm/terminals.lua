local M = {}

-- Loading Toggleterm
local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
    vim.notify("Unable to require packer", "Error", {title = "Telescope"})
end

packer.loader("toggleterm.nvim")

local Terminal = require("toggleterm.terminal").Terminal

-- Lazygit
M.lazygit = function ()
    local lazygit = Terminal:new({cmd = "lazygit", hidden = true})
    lazygit:toggle()
end

-- HTOP
M.htop = function ()
    local htop = Terminal:new({cmd = "htop", hidden = true})
    htop:toggle()
end

-- Python3
M.python3 = function ()
    local python3 = Terminal:new({cmd = "bpython", hidden = true})
	python3:toggle()
end

-- Run Files
M.run_files = function ()
    -- Get file path
    local file_name = vim.fn.expand('%')
    local file_type = vim.bo.filetype

    -- Python
    if file_type == "python" then
        local python3_run = Terminal:new({cmd = "python3 " .. file_name, hidden = true, close_on_exit = false})
        python3_run:toggle()
    end

    -- C++
    if file_type == "cpp" then
        local cpp_run = Terminal:new({cmd = "c++ " .. file_name .. " -o .temp.out; ./.temp.out;rm -rf .temp.out", hidden = true, close_on_exit = false})
        cpp_run:toggle()
    end

    -- Lua
    if file_type == "lua" then
        local lua_run = Terminal:new({cmd = "lua " .. file_name, hidden = true, close_on_exit = false})
        lua_run:toggle()
    end
end

return M

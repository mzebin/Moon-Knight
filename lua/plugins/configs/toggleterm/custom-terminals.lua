local Terminal = require("toggleterm.terminal").Terminal

-- Lazygit
function _LAZYGIT_TOGGLE()
    local lazygit = Terminal:new({cmd = "lazygit", hidden = true})
    lazygit:toggle()
end

-- HTOP
function _HTOP_TOGGLE()
    local htop = Terminal:new({cmd = "htop", hidden = true})
    htop:toggle()
end

-- Python3
function _PYTHON3_TOGGLE()
    local python3 = Terminal:new({cmd = "python3", hidden = true})
	python3:toggle()
end

-- Run Files
function _RUN_TOGGLE()
    -- Get file path
    local file_name = vim.fn.expand('%')
    local file_type = vim.bo.filetype

    -- Python
    if file_type == "python" then
        local python3_run = Terminal:new({cmd = "python3 " .. file_name, hidden = true, close_on_exit = false})
        python3_run:toggle()
    end
end

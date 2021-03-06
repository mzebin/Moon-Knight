local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    vim.notify("Unable to require alpha", "error", {title="Alpha"})
    return
end

local dashboard = require("alpha.themes.dashboard")

-- Header
dashboard.section.header.val = {
    [[]],
    [[               ,▄▓▀▀▀▀▀█▄▄            ]],
    [[             ╓█▀    ,▄▓▓███▄          ]],
    [[            ╓█     █▀      `          ]],
    [[            █▌    ▓▌                  ]],
    [[            █▌    ▀█                  ]],
    [[             █▄    ▀█▄    ▄▄          ]],
    [[              ▀█▄    ╙▀▀███'          ]],
    [[                "▀▀▀▓▓▀▀▀             ]],
    [[]],
    [[     ║█▓▄▄,                  ,▄▄██▌   ]],
    [[     "█. '▀▀█▄▄.        ╓▄▄█▀▀' ,█▀   ]],
    [[      `█▄.     ▀██    ██▌,    ,▄█^    ]],
    [[         ▀▀▀▀▀▀██`     ██▀▀▀▀▀▀`      ]],
    [[          ╓▄▄█▀'        ╙▀█▄▄▄        ]],
    [[]],
}

-- Footer
dashboard.section.footer.val = "Moon-Knight"

-- Buttons
dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", "<CMD>ene <BAR> startinsert<CR>"),
	dashboard.button("f", "  Find file", "<CMD>Telescope find_files<CR>"),
	dashboard.button("p", "  Find project", "<CMD>Telescope projects<CR>"),
	dashboard.button("t", "  Find text", "<CMD>Telescope live_grep<CR>"),
	dashboard.button("r", "  Recently used files", "<CMD>Telescope oldfiles<CR>"),
	dashboard.button("c", "  Configuration", "<CMD>e ~/.config/nvim/init.lua<CR>"),
	dashboard.button("q", "  Quit Neovim", "<CMD>qa<CR>"),
}

dashboard.section.header.opts.hl = "CustomDashboardHeader"
dashboard.section.footer.opts.hl = "CustomDashboardFooter"
dashboard.section.buttons.opts.hl = "CustomDashboardButtons"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

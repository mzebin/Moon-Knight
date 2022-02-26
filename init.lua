-- Faster Startup
_, impatient = pcall(require, "impatient")
impatient.enable_profile()

-- Better Notifications
_, vim.notify = pcall(require, "notify")

require("core")
require("colors")
require("plugins")

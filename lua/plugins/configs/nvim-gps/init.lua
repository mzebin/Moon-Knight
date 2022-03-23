local status_ok, nvim_gps = pcall(require, "nvim-gps")
if not status_ok then
    vim.notify("Unable to require nvim-gps", "error", {title = "Nvim GPS"})
    return
end

nvim_gps.setup({})

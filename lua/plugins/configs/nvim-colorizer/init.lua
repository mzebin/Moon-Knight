local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
    vim.notify("Unable to require colorizer", "error", {title="Nvim Colorizer"})
    return
end

colorizer.setup(
    {"*"},
    {
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
    }
)

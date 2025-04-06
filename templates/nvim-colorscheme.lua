{% if theme | is_equal: "dark" %}local palette = {
    dark0 = "#{{surface}}",
    dark1 = "#{{surface_container}}",
    dark2 = "#{{surface_container_highest}}",
}
{% else %} local palette = {
    light0 = "#{{surface}}",
    light1 = "#{{surface_container}}",
    light2 = "#{{surface_container_highest}}",
}
{% endif %}
require("gruvbox").setup({
    palette_overrides = palette,
    overrides = {
        StatusLine = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
        StatusLineNC = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
    },
})
vim.cmd.colorscheme("gruvbox")

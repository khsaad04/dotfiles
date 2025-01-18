return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        if "{{theme}}" == "dark" then
            require("gruvbox").setup({
                palette_overrides = {
                    dark0 = "#{{surface}}",
                    dark1 = "#{{surface_container_low}}",
                    dark2 = "#{{surface_container}}",
                },
            })
        else
            require("gruvbox").setup({
                palette_overrides = {
                    light0 = "#{{surface}}",
                    light1 = "#{{surface_container_low}}",
                    light2 = "#{{surface_container}}",
                },
            })
        end
        vim.opt.background = "{{theme}}"
        vim.cmd.colorscheme("gruvbox")
    end,
}

return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
			palette_overrides = {
				dark0_hard = "#{{surface}}",
				dark1 = "#{{surface_container_low}}",
				dark2 = "#{{surface_container}}",
			},
		})
		vim.opt.background = "dark"
		vim.cmd.colorscheme("gruvbox")
	end,
}

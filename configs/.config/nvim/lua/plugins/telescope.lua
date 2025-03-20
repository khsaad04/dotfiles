return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        },
    },
    keys = {
        {
            "<leader>sf",
            function()
                require("telescope.builtin").find_files()
            end,
            mode = "n",
            desc = "[S]earch [F]iles",
        },
        {
            "<leader>sh",
            function()
                require("telescope.builtin").help_tags()
            end,
            mode = "n",
            desc = "[S]earch [H]elp",
        },
        {
            "<leader>sg",
            function()
                require("telescope.builtin").live_grep()
            end,
            mode = "n",
            desc = "[S]earch by [G]rep",
        },
        {
            "<leader>q",
            function()
                require("telescope.builtin").diagnostics()
            end,
            mode = "n",
            desc = "[Q]uickfix",
        },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--glob",
                    "!**/.git/*",
                },
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })
        telescope.load_extension("fzf")
    end,
}

return {
    "folke/snacks.nvim",
    opts = {
        picker = {},
        explorer = {},
    },
    keys = {
        {
            "<leader>sf",
            function()
                Snacks.picker.files({
                    hidden = true
                })
            end,
            desc = "[S]earch [F]iles"
        },
        {
            "<leader>sg",
            function()
                Snacks.picker.grep({
                    hidden = true
                })
            end,
            desc = "[S]earch by [G]rep"
        },
        {
            "<C-e>",
            function()
                Snacks.explorer(
                    { hidden = true })
            end,
            desc = "File Explorer"
        },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp" },
    },
    config = function()
        vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "SnacksPickerFile" })
    end
}

return {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    keys = {
        {
            "<leader>vmm",
            "<Plug>(VM-Toggle-Mappings)",
            mode = "n",
            desc = "[V]isual-[M]ulti Toggle [M]appings",
        },
    },
    init = function()
        vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end,
}

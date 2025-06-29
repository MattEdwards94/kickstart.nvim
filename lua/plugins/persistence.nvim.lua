return {
    "folke/persistence.nvim",
    config = function()
        require("persistence").setup {}
        vim.keymap.set("n", "<leader>qs", "<cmd>SessionSave<cr>", { desc = "Session Save" })
        vim.keymap.set("n", "<leader>ql", "<cmd>SessionLoadLast<cr>", { desc = "Session Load Last" })
        vim.keymap.set("n", "<leader>qd", "<cmd>SessionDelete<cr>", { desc = "Session Delete" })
    end,
}

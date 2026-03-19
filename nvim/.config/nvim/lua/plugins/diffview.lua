return {
  "sindrets/diffview.nvim",
  name = "diffview",
  config = function()
    require("diffview").setup()

    -- Diffview menu prefix
    vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Diffview: Open" })
    vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { desc = "Diffview: Close" })
  end,
}

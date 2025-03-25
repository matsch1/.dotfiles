vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
end, { desc = "Toggle Neo-tree" })
